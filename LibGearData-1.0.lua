local MAJOR, MINOR = "LibGearData-1.0", 1
local lib = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then return end

local _, ns = ...
local L = ns.L

-- Simple data storage
lib.data = nil
lib.season = nil

-- Public API for registering season data
function lib:RegisterSeasonData(seasonKey, data)
    if type(seasonKey) ~= "string" or type(data) ~= "table" then
        error("Invalid season data registration", 2)
    end

    -- Transform the season data into the expected format
    local transformedData = {
        name = data.name,
        version = data.version,
        validFrom = data.validFrom,
        validTo = data.validTo,
        versionPrefix = data.versionPrefix,
        tracks = {},
        crests = {},
        itemLevels = {},
        tracksByIndex = {} -- For backwards compatibility with track indices
    }
    
    -- Transform tracks array to indexed array (preserve order)
    if data.tracks then
        for i, track in ipairs(data.tracks) do
            local trackName = track.name
            transformedData.tracks[i] = {
                name = trackName,
                maxRank = track.maxRank,
                itemLevels = {} -- Will be populated below
            }
            -- Store index to name mapping for convenience
            transformedData.tracksByIndex[i] = trackName
        end
    end
    
    -- Transform crests array to map with crest names as keys
    if data.crests then
        for i, crest in ipairs(data.crests) do
            transformedData.crests[crest.name] = {
                name = crest.name,
                currency = crest.currency
            }
        end
    end
    
    -- Transform the data mapping (ilvl -> track info) to itemLevels format
    -- and populate track itemLevels arrays
    if data.data then
        for ilvl, itemData in pairs(data.data) do
            local ilvlNum = tonumber(ilvl)
            if ilvlNum then
                -- Convert crest index to crest name
                local crestName = nil
                if itemData.crest and data.crests and data.crests[itemData.crest] then
                    crestName = data.crests[itemData.crest].name
                end
                
                -- Prepare track information with full details
                local trackDetails = {}
                if itemData.tracks then
                    for _, trackInfo in ipairs(itemData.tracks) do
                        local trackIndex, rank = trackInfo[1], trackInfo[2]
                        if data.tracks and data.tracks[trackIndex] then
                            local trackName = data.tracks[trackIndex].name
                            local maxRank = data.tracks[trackIndex].maxRank
                            table.insert(trackDetails, {
                                index = trackIndex,
                                name = trackName,
                                rank = rank,
                                maxRank = maxRank,
                                str = string.format("%s %d/%d", trackName, rank, maxRank)
                            })
                        end
                    end
                end
                
                -- Get highest track for convenience
                local highestTrack = nil
                if #trackDetails > 0 then
                    highestTrack = trackDetails[#trackDetails]
                end
                
                -- Store item level data with all pre-computed information
                transformedData.itemLevels[ilvlNum] = {
                    ilvl = ilvlNum,
                    tracks = itemData.tracks, -- Original track indices for backwards compatibility
                    trackDetails = trackDetails, -- Full track information
                    highestTrack = highestTrack, -- Highest track for convenience
                    crest = crestName, -- Upgrade currency name
                    upgradeCurrency = crestName -- Alias for upgrade currency
                }
                
                -- Populate track itemLevels arrays
                for i, trackDetail in ipairs(trackDetails) do
                    local trackIndex, rank = trackDetail.index, trackDetail.rank
                    if transformedData.tracks[trackIndex] then
                        transformedData.tracks[trackIndex].itemLevels[rank] = ilvlNum
                    end
                end
            end
        end
    end
    
    self.data = transformedData
end

function lib:SetSeason(season, expansion)
    if type(season) ~= "number" or season < 1 then
        error("Invalid season number", 2)
    end
    
    if expansion and (type(expansion) ~= "number" or expansion < 1) then
        error("Invalid expansion number", 2)
    end
    
    self.season = {
        season = season,
        expansion = expansion or math.floor(select(4, GetBuildInfo()) / 10000)
    }
    
    return self
end

function lib:getCurrentSeason()
    return self.season
end

-- Helper functions
local function validateItemLevel(ilvl)
    return type(ilvl) == "number" and ilvl > 0
end

local function validateTrackName(trackName)
    return type(trackName) == "string" and trackName ~= ""
end

-- Helper function to get track name by index (for backwards compatibility)
local function getTrackNameByIndex(self, index)
    if not self.data or not self.data.tracksByIndex then return nil end
    return self.data.tracksByIndex[index]
end

-- Public API Methods

function lib:GetTracksByItemLevel(ilvl)
    if not validateItemLevel(ilvl) then return nil end
    if not self.data then return nil end
    
    local itemData = self.data.itemLevels and self.data.itemLevels[ilvl]
    return itemData and itemData.tracks or nil
end

function lib:GetCrestByItemLevel(ilvl)
    if not validateItemLevel(ilvl) then return nil end
    if not self.data then return nil end
    
    local itemData = self.data.itemLevels and self.data.itemLevels[ilvl]
    return itemData and itemData.crest or nil
end

function lib:GetTracks()
    if not self.data then return {} end
    
    return self.data.tracks
end

function lib:GetTrack(trackIdentifier)
    if not self.data then return nil end
    
    -- Support both index (number) and name (string)
    if type(trackIdentifier) == "number" then
        return self.data.tracks and self.data.tracks[trackIdentifier] or nil
    elseif type(trackIdentifier) == "string" and trackIdentifier ~= "" then
        -- Find track by name
        for i, track in pairs(self.data.tracks or {}) do
            if track.name == trackIdentifier then
                return track
            end
        end
    end
    
    return nil
end

function lib:GetTrackNameByIndex(index)
    return getTrackNameByIndex(self, index)
end

function lib:GetUpgradeOptions(ilvl)
    if not validateItemLevel(ilvl) then return nil end
    
    local tracks = self:GetTracksByItemLevel(ilvl)
    if not tracks then return nil end
    
    local options = {}
    for _, trackInfo in ipairs(tracks) do
        local trackIndex, rank = trackInfo[1], trackInfo[2]
        local track = self:GetTrack(trackIndex)
        if track and rank < track.maxRank then
            local trackName = track.name
            local maxRank = track.maxRank
            table.insert(options, {
                track = trackName,
                rank = rank,
                max = maxRank,
                str = string.format("%s %d/%d", trackName, rank, maxRank),
                nextRank = rank + 1,
                nextItemLevel = track.itemLevels[rank + 1]
            })
        end
    end
    return #options > 0 and options or nil
end

function lib:GetNextUpgrade(ilvl)
    local options = self:GetUpgradeOptions(ilvl)
    if not options then return nil end
    
    -- Return the lowest next upgrade
    local nextUpgrade = nil
    for _, option in ipairs(options) do
        if not nextUpgrade or option.nextItemLevel < nextUpgrade.itemLevel then
            nextUpgrade = {
                track = option.track,
                rank = option.nextRank,
                max = option.max,
                str = string.format("%s %d/%d", option.track, option.nextRank, option.max),
                itemLevel = option.nextItemLevel
            }
        end
    end
    return nextUpgrade
end

function lib:GetMaxUpgrade(ilvl, trackName)
    if not validateItemLevel(ilvl) or not validateTrackName(trackName) then return nil end
    
    local track = self:GetTrack(trackName)
    if not track then return nil end
    
    local tracks = self:GetTracksByItemLevel(ilvl)
    if not tracks then return nil end
    
    -- Check if this item level exists in the specified track
    for _, trackInfo in ipairs(tracks) do
        local trackIndex = trackInfo[1]
        local trackAtIndex = self:GetTrack(trackIndex)
        if trackAtIndex and trackAtIndex.name == trackName then
            return track.itemLevels[track.maxRank]
        end
    end
    return nil
end

function lib:GetHighestTrack(ilvl)
    local tracks = self:GetTracksByItemLevel(ilvl)
    if not tracks or #tracks == 0 then return nil end
    
    -- Return the last (highest) track with full info
    local highest = tracks[#tracks]
    local trackIndex, rank = highest[1], highest[2]
    local track = self:GetTrack(trackIndex)
    local trackName = track and track.name or "unknown"
    local maxRank = track and track.maxRank or 0
    
    return {
        track = trackName,
        rank = rank,
        max = maxRank,
        str = string.format("%s %d/%d", trackName, rank, maxRank)
    }
end

function lib:GetHighestTrackString(ilvl)
    local tracks = self:GetTracksByItemLevel(ilvl)
    if not tracks or #tracks == 0 then return "unknown" end
    
    local highest = tracks[#tracks]
    local trackIndex, rank = highest[1], highest[2]
    local track = self:GetTrack(trackIndex)
    if not track then return "unknown" end
    
    local localizedName = self:GetTrackName(track.name)
    local maxRank = track.maxRank
    
    return string.format("%s %d/%d", localizedName, rank, maxRank)
end

function lib:GetCrests()
    if not self.data then return {} end
    
    local crests = {}
    for crestName, _ in pairs(self.data.crests or {}) do
        table.insert(crests, crestName)
    end
    table.sort(crests)
    return crests
end

function lib:GetCrest(crestName)
    if not crestName or type(crestName) ~= "string" then return nil end
    if not self.data then return nil end
    
    return self.data.crests and self.data.crests[crestName] or nil
end

function lib:GetRequiredCrest(fromIlvl, toIlvl)
    if not validateItemLevel(fromIlvl) or not validateItemLevel(toIlvl) then return nil end
    if toIlvl <= fromIlvl then return nil end
    
    return self:GetCrestByItemLevel(toIlvl)
end

function lib:GetTrackRank(ilvl)
    local tracks = self:GetTracksByItemLevel(ilvl)
    if not tracks or #tracks == 0 then return nil end
    
    local result = {}
    for _, trackInfo in ipairs(tracks) do
        local trackIndex = trackInfo[1]
        local rank = trackInfo[2]
        local track = self:GetTrack(trackIndex)
        local trackName = track and track.name or "unknown"
        local maxRank = track and track.maxRank or 0
        
        table.insert(result, {
            track = trackName,
            rank = rank,
            max = maxRank,
            str = string.format("%s %d/%d", trackName, rank, maxRank)
        })
    end
    return result
end

function lib:GetItemLevel(trackName, rank)
    if not validateTrackName(trackName) or not rank or type(rank) ~= "number" or rank < 1 then
        return nil
    end
    
    local track = self:GetTrack(trackName)
    if not track or not track.itemLevels or rank > track.maxRank then
        return nil
    end
    
    return track.itemLevels[rank]
end

-- Flexible data extraction function
function lib:GetItemLevelData(...)
    local columns = {...}
    if not self.data or not self.data.itemLevels then return {} end
    
    local result = {}
    
    for ilvl, itemData in pairs(self.data.itemLevels) do
        local row = {}
        
        for _, column in ipairs(columns) do
            if column == "ilvl" then
                row.ilvl = itemData.ilvl
            elseif column == "crest" or column == "upgradeCurrency" then
                row.crest = itemData.crest
                row.upgradeCurrency = itemData.upgradeCurrency
            elseif column == "track" then
                -- Return highest track for backwards compatibility
                row.track = itemData.highestTrack
            elseif column == "tracks" then
                -- Return all track details
                row.tracks = itemData.trackDetails
            elseif column == "highest_track" then
                -- Return highest track
                row.highest_track = itemData.highestTrack
            end
        end
        
        table.insert(result, row)
    end
    
    -- Sort by item level
    table.sort(result, function(a, b) return a.ilvl < b.ilvl end)
    
    return result
end

-- Get all item level data (pre-computed during RegisterSeasonData)
function lib:GetAllItemLevelData()
    if not self.data or not self.data.itemLevels then return {} end
    
    local result = {}
    for ilvl, itemData in pairs(self.data.itemLevels) do
        table.insert(result, itemData)
    end
    
    -- Sort by item level
    table.sort(result, function(a, b) return a.ilvl < b.ilvl end)
    
    return result
end

function lib:IsValidUpgrade(fromIlvl, toIlvl)
    if not validateItemLevel(fromIlvl) or not validateItemLevel(toIlvl) then return false end
    if toIlvl <= fromIlvl then return false end
    
    local requiredCrest = self:GetRequiredCrest(fromIlvl, toIlvl)
    return requiredCrest ~= nil
end

function lib:CanUpgradeWithCrest(ilvl, crestName)
    if not validateItemLevel(ilvl) or not crestName then return false end
    
    -- Get the actual next upgrade level dynamically
    local nextUpgrade = self:GetNextUpgrade(ilvl)
    if not nextUpgrade then return false end
    
    local requiredCrest = self:GetCrestByItemLevel(nextUpgrade.itemLevel)
    return requiredCrest == crestName
end

function lib:GetItemLevels(trackName)
    if not validateTrackName(trackName) then return nil end
    
    local track = self:GetTrack(trackName)
    if not track or not track.itemLevels then return nil end
    
    return track.itemLevels
end

function lib:GetItemLevelsWithCrest(crestName)
    if not crestName or type(crestName) ~= "string" then return nil end
    if not self.data then return nil end
    
    local result = {}
    for ilvl, itemData in pairs(self.data.itemLevels or {}) do
        if itemData.crest == crestName then
            table.insert(result, ilvl)
        end
    end
    
    table.sort(result)
    return #result > 0 and result or nil
end

function lib:GetSeason()
    return self:getCurrentSeason()
end

function lib:GetSeasonTracks()
    return self:GetTracks()
end

function lib:GetSeasonCrests()
    return self:GetCrests()
end

-- Localization methods
function lib:GetTrackName(trackName)
    if not validateTrackName(trackName) then return trackName end
    return L and L[trackName] or trackName
end

function lib:GetCrestName(crestName)
    if not crestName or type(crestName) ~= "string" then return crestName end
    return L and L[crestName] or crestName
end

function lib:GetTrackNames()
    local tracks = self:GetTracks()
    local result = {}
    for i, track in pairs(tracks) do
        if track and track.name then
            result[track.name] = self:GetTrackName(track.name)
        end
    end
    return result
end

function lib:GetCrestNames()
    local crests = self:GetCrests()
    local result = {}
    for _, crestName in ipairs(crests) do
        result[crestName] = self:GetCrestName(crestName)
    end
    return result
end



function lib:GetSeasons()
    if not self.season then return {} end
    
    return {
        {
            expansion = self.season.expansion,
            season = self.season.season,
            key = string.format("%d_%d", self.season.expansion, self.season.season)
        }
    }
end

