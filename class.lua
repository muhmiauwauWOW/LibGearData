local _, ns = ...
local L = ns.L

local class = {}
ns.class = class

function class:GetSeasons() return ns.transformedSeasons or {} end

function class:SetSeason(season, expansion)
    if type(season) ~= "number" or season < 1 then
        error("Invalid season number", 2)
    end

    if expansion and (type(expansion) ~= "number" or expansion < 1) then
        error("Invalid expansion number", 2)
    end
    if self.SetSeason then self = {} end
    local newLib = setmetatable(self, {__index = ns.class})
    newLib.data = nil
    newLib.season = nil

    newLib.season = {
        season = season,
        expansion = expansion or math.floor(select(4, GetBuildInfo()) / 10000)
    }

    -- Try to find and activate the matching season data
    local key = string.format("%s.%s", expansion, season)
    newLib.data = ns.getSeasonData(key)

    return newLib
end

function class:GetCurrentSeason() return self.season end

-- Helper functions
local function validateItemLevel(ilvl) return
    type(ilvl) == "number" and ilvl > 0 end

local function validateTrackName(trackName)
    return type(trackName) == "string" and trackName ~= ""
end

-- Public API Methods

function class:GetTracksByItemLevel(ilvl)
    if not validateItemLevel(ilvl) then return nil end
    if not self.data then return nil end

    local itemData = self.data.itemLevels and self.data.itemLevels[ilvl]
    return itemData and itemData.tracks or nil
end

function class:GetCrestByItemLevel(ilvl)
    if not validateItemLevel(ilvl) then return nil end
    if not self.data then return nil end

    local itemData = self.data.itemLevels and self.data.itemLevels[ilvl]
    return itemData and self:GetCrestName(itemData.crest) or nil

end

function class:GetTracks()
    if not self.data then return {} end

    return self.data.tracks
end

function class:GetTrack(trackIdentifier)
    if not self.data then return nil end

    -- Support both index (number) and name (string)
    if type(trackIdentifier) == "number" then
        return self.data.tracks and self.data.tracks[trackIdentifier] or nil
    elseif type(trackIdentifier) == "string" and trackIdentifier ~= "" then
        -- Find track by name
        for i, track in pairs(self.data.tracks or {}) do
            if track.key == trackIdentifier then return track end
        end
    end

    return nil
end

function class:GetUpgradeOptions(ilvl)
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

function class:GetNextUpgrade(ilvl)
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
                str = string.format("%s %d/%d", option.track, option.nextRank,
                                    option.max),
                itemLevel = option.nextItemLevel
            }
        end
    end
    return nextUpgrade
end

function class:GetMaxUpgrade(ilvl, trackName)
    if not validateItemLevel(ilvl) or not validateTrackName(trackName) then
        return nil
    end

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

function class:GetHighestTrack(ilvl)
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

function class:GetHighestTrackString(ilvl)
    local tracks = self:GetTracksByItemLevel(ilvl)
    if not tracks or #tracks == 0 then return "unknown" end

    local highest = tracks[#tracks]
    local trackIndex, rank = highest[1], highest[2]
    local track = self:GetTrack(trackIndex)
    if not track then return "-" end

    local localizedName = self:GetTrackName(track.name)
    local maxRank = track.maxRank

    return string.format("%s %d/%d", localizedName, rank, maxRank)
end

function class:GetCrests()
    if not self.data then return {} end

    local crests = {}
    for crestName, _ in pairs(self.data.crests or {}) do
        table.insert(crests, crestName)
    end
    table.sort(crests)
    return crests
end

function class:GetCrest(crestName)
    if not crestName or type(crestName) ~= "string" then return nil end
    if not self.data then return nil end

    return self.data.crests and self.data.crests[crestName] or nil
end

function class:GetRequiredCrest(fromIlvl, toIlvl)
    if not validateItemLevel(fromIlvl) or not validateItemLevel(toIlvl) then
        return nil
    end
    if toIlvl <= fromIlvl then return nil end

    return self:GetCrestByItemLevel(toIlvl)
end

function class:GetTrackRank(ilvl)
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

function class:GetItemLevel(trackName, rank)
    if not validateTrackName(trackName) or not rank or type(rank) ~= "number" or
        rank < 1 then return nil end

    local track = self:GetTrack(trackName)
    if not track or not track.itemLevels or rank > track.maxRank then
        return nil
    end

    return track.itemLevels[rank]
end

function class:IsValidUpgrade(fromIlvl, toIlvl)
    if not validateItemLevel(fromIlvl) or not validateItemLevel(toIlvl) then
        return false
    end
    if toIlvl <= fromIlvl then return false end

    local requiredCrest = self:GetRequiredCrest(fromIlvl, toIlvl)
    return requiredCrest ~= nil
end

function class:CanUpgradeWithCrest(ilvl, crestName)
    if not validateItemLevel(ilvl) or not crestName then return false end

    -- Get the actual next upgrade level dynamically
    local nextUpgrade = self:GetNextUpgrade(ilvl)
    if not nextUpgrade then return false end

    local requiredCrest = self:GetCrestByItemLevel(nextUpgrade.itemLevel)
    return requiredCrest == crestName
end

function class:GetItemLevels(trackName)
    if not validateTrackName(trackName) then return nil end

    local track = self:GetTrack(trackName)
    if not track or not track.itemLevels then return nil end

    return track.itemLevels
end

function class:GetItemLevelsWithCrest(crestName)
    if not crestName or type(crestName) ~= "string" then return nil end
    if not self.data then return nil end

    local result = {}
    for ilvl, itemData in pairs(self.data.itemLevels or {}) do
        if itemData.crest == crestName then table.insert(result, ilvl) end
    end

    table.sort(result)
    return #result > 0 and result or nil
end

function class:GetTrackName(trackName)
    if not self.data.tracksByNames[trackName] then return trackName end
    return self.data.tracksByNames[trackName].name
end

function class:GetCrestName(crestName)
    if not self.data.crests[crestName] then return crestName end
    return self.data.crests[crestName].name
end

function class:GetTrackNames()
    local new_array = {}
    for i, value in ipairs(self.data.tracks) do new_array[i] = value.name end
    return new_array
end

function class:GetCrestNames()
    local new_array = {}
    for key, value in pairs(self.data.crests) do
        table.insert(new_array, value.name)
    end
    return new_array
end

-- Returns the icon string for a given crest key (crestName)
function class:GetCrestIconByKey(key, name)
    if not key or type(key) ~= "string" then return nil end
    if not self.data or not self.data.crests then return nil end

    local crest = self.data.crests[key]
    local out = crest.icon
    if name then out = string.format("%s %s", crest.icon, crest.name) end

    return out
end

function class:GetRaidBossesMap()
    if not self.data or not self.data.raidBossesMap then return {} end
    return self.data.raidBossesMap
end
function class:GetDifficultiesOrder(typ)
    if not typ or type(typ) ~= "string" then return {} end
    return self.data.DifficultiesOrder[typ]
end

function class:GetData(typ)
    if not self.data or not self.data[typ] then return {} end
    return self.data[typ]
end