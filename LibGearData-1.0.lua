local MAJOR, MINOR = "LibGearData-1.0", 1
local lib = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then return end

-- lib.__index = lib
local _, ns = ...
local L = ns.L

-- Simple data storage
-- lib.data = nil
-- lib.season = nil
local seasons = {} -- Store all registered seasons (raw data)
ns.transformedSeasons = {} -- Store transformed seasons (lazy loaded)

-- Cache for currency iconFileIDs
local currencyIconCache = {}

local function transformSeasonData(data)
    -- Transform the season data into the expected format
    local transformedData = {
        name = data.name,
        expansion = data.expansion,
        season = data.season,
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
            -- Query iconFileID via WoW API if not present, with caching
            local iconFileID = crest.iconFileID
            if not iconFileID and crest.currency then
                if currencyIconCache[crest.currency] ~= nil then
                    iconFileID = currencyIconCache[crest.currency]
                else
                    local info = C_CurrencyInfo and C_CurrencyInfo.GetCurrencyInfo and C_CurrencyInfo.GetCurrencyInfo(crest.currency)
                    if info and info.iconFileID then
                        iconFileID = info.iconFileID
                        currencyIconCache[crest.currency] = iconFileID
                    else
                        currencyIconCache[crest.currency] = false -- Mark as not found
                    end
                end
            end
            local iconString = nil
            if iconFileID then
                iconString = "|T"..iconFileID..":12|t"
            end
            transformedData.crests[crest.name] = {
                key = crest.name,
                name = L and L[crest.name] or crest.name,
                currency = crest.currency,
                iconFileID = iconFileID,
                icon = iconString
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
    
    return transformedData
end

function ns.getSeasonData(seasonKey)
    if not seasons[seasonKey] then return false end
    if  ns.transformedSeasons[seasonKey] then  return  ns.transformedSeasons[seasonKey] end
    
    ns.transformedSeasons[seasonKey] = transformSeasonData(seasons[seasonKey])
    return ns.transformedSeasons[seasonKey]
end


local function isCurrentSeasonVersion(seasonData)
    if not seasonData then return false end
    
    local currentVersion = select(4, GetBuildInfo())
    
    -- Check validFrom and validTo range
    if seasonData.validFrom and seasonData.validTo then
        return currentVersion >= seasonData.validFrom and currentVersion < seasonData.validTo
    end
    
    -- Check version prefix matching
    if seasonData.versionPrefix then
        local versionStr = tostring(currentVersion)
        return versionStr:sub(1, #seasonData.versionPrefix) == seasonData.versionPrefix
    end
    
    return false
end
-- Local function for registering season data (not exposed in public API)
local function RegisterSeasonData(seasonKey, data)
    if type(seasonKey) ~= "string" or type(data) ~= "table" then
        error("Invalid season data registration", 2)
    end
    seasons[seasonKey] = data
    
    if not lib.data and isCurrentSeasonVersion(data) then
        lib = ns.class.SetSeason(lib, 3, 11)
    end
end

-- Load season data from namespace
if ns.seasons then 
    for seasonKey, seasonData in pairs(ns.seasons) do
        RegisterSeasonData(seasonKey, seasonData)
    end
end

