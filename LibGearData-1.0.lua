local MAJOR, MINOR = "LibGearData-1.0", 1
local lib = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then return end

-- Season data storage
local seasonData = {}
local currentSeason = "11.3" -- Default to current season
local currencyCache = {}

local function SafeGetCurrencyInfo(id)
    if currencyCache[id] then return currencyCache[id] end
    local info = C_CurrencyInfo.GetCurrencyInfo(id)
    if info and info.iconFileID and info.name then
        currencyCache[id] = info
        return info
    end
    local fallback = { iconFileID = 134400, name = "?" }
    currencyCache[id] = fallback
    return fallback
end

-- Build crest icons for a season
local function BuildCrestIcons(season)
    if not seasonData[season] or not seasonData[season].crests then return {}, {} end
    
    local crestIcons = {}
    local crestIconsWithNames = {}
    
    for crestKey, config in pairs(seasonData[season].crests) do
        local currencyInfo = SafeGetCurrencyInfo(config.currencyId)
        crestIcons[crestKey] = "|T"..currencyInfo.iconFileID..":12|t"
        crestIconsWithNames[crestKey] = "|T"..currencyInfo.iconFileID..":12|t " .. currencyInfo.name
    end
    
    return crestIcons, crestIconsWithNames
end

--- Register season data
-- @param seasonId string The season identifier (e.g. "11.3")
-- @param data table The season data containing crests, maxRanks, and item level data
function lib:RegisterSeasonData(seasonId, data)
    seasonData[seasonId] = data
    -- Build icons for this season
    seasonData[seasonId].crestIcons, seasonData[seasonId].crestIconsWithNames = BuildCrestIcons(seasonId)
end

--- Check if a season is valid for the current WoW version
-- @param seasonId string The season identifier
-- @param wowVersion number Optional WoW interface version (defaults to current)
-- @return boolean True if season is valid for this version
function lib:IsSeasonValid(seasonId, wowVersion)
    local season = seasonData[seasonId]
    if not season then return false end
    
    local version = wowVersion or select(4, GetBuildInfo())
    
    -- Check version range
    if season.validFrom and version < season.validFrom then
        return false
    end
    if season.validTo and version >= season.validTo then
        return false
    end
    
    -- Check version prefix
    if season.versionPrefix then
        local versionStr = tostring(version)
        return versionStr:sub(1, #season.versionPrefix) == season.versionPrefix
    end
    
    return true
end

--- Get the valid season for current WoW version
-- @param wowVersion number Optional WoW interface version (defaults to current)
-- @return string|nil Season identifier or nil if none found
function lib:GetValidSeasonForVersion(wowVersion)
    local version = wowVersion or select(4, GetBuildInfo())
    
    for seasonId in pairs(seasonData) do
        if self:IsSeasonValid(seasonId, version) then
            return seasonId
        end
    end
    return nil
end

--- Auto-set current season based on WoW version
-- @return boolean True if a valid season was found and set
function lib:AutoSetCurrentSeason()
    local validSeason = self:GetValidSeasonForVersion()
    if validSeason then
        currentSeason = validSeason
        return true
    end
    return false
end

--- Set the current active season
-- @param seasonId string The season identifier
-- @return boolean True if season exists and was set
function lib:SetCurrentSeason(seasonId)
    if seasonData[seasonId] then
        currentSeason = seasonId
        return true
    end
    return false
end

--- Get the current active season
-- @return string The current season identifier
function lib:GetCurrentSeason()
    return currentSeason
end

--- Get the current season based on WoW version (auto-detect)
-- @param wowVersion number Optional WoW interface version (defaults to current)
-- @return string|nil The current season for this version or nil if none found
function lib:GetCurrentSeasonForVersion(wowVersion)
    return self:GetValidSeasonForVersion(wowVersion)
end

--- Get all available seasons
-- @param onlyValid boolean Optional, only return seasons valid for current version
-- @return table Array of season identifiers
function lib:GetAvailableSeasons(onlyValid)
    local seasons = {}
    for seasonId in pairs(seasonData) do
        if not onlyValid or self:IsSeasonValid(seasonId) then
            table.insert(seasons, seasonId)
        end
    end
    table.sort(seasons)
    return seasons
end

-- Public API Functions

--- Get tracks for a specific item level
-- @param ilvl number The item level to lookup
-- @param seasonId string Optional season identifier (defaults to current)
-- @return table|nil Array of tracks {{"TrackName", rank}, ...} or nil if not found
function lib:GetTracksByItemLevel(ilvl, seasonId)
    local season = seasonId or currentSeason
    local data = seasonData[season] and seasonData[season].data
    if not data or not data[ilvl] then return nil end
    return data[ilvl].tracks or nil
end

--- Get crest type for a specific item level
-- @param ilvl number The item level to lookup
-- @param seasonId string Optional season identifier (defaults to current)
-- @return string|nil The crest type ("weathered", "carved", "runed", "gilded") or nil
function lib:GetCrestByItemLevel(ilvl, seasonId)
    local season = seasonId or currentSeason
    local data = seasonData[season] and seasonData[season].data
    if not data or not data[ilvl] then return nil end
    return data[ilvl].crest or nil
end

--- Get crest icon by crest key
-- @param key string The crest key ("weathered", "carved", "runed", "gilded")
-- @param withName boolean Include the name text after the icon
-- @param seasonId string Optional season identifier (defaults to current)
-- @return string|nil The formatted icon string or nil if not found
function lib:GetCrestIconByKey(key, withName, seasonId)
    local season = seasonId or currentSeason
    local seasonInfo = seasonData[season]
    if not seasonInfo then return nil end
    
    local icons = withName and seasonInfo.crestIconsWithNames or seasonInfo.crestIcons
    return icons and icons[key] or nil
end

--- Get the maximum rank for a specific track
-- @param trackName string The track name ("Explorer", "Adventurer", etc.)
-- @param seasonId string Optional season identifier (defaults to current)
-- @return number The maximum rank for this track (default: 8)
function lib:GetMaxRankForTrack(trackName, seasonId)
    local season = seasonId or currentSeason
    local maxRanks = seasonData[season] and seasonData[season].maxRanks
    if not maxRanks then return 8 end
    return maxRanks[trackName] or 8
end

--- Get the highest track information for an item level
-- @param ilvl number The item level to lookup
-- @param seasonId string Optional season identifier (defaults to current)
-- @return table|nil Table with track info {name, rank, maxRank} or nil
function lib:GetHighestTrackInfo(ilvl, seasonId)
    local season = seasonId or currentSeason
    local data = seasonData[season] and seasonData[season].data
    if not data then return nil end
    
    local tracks = data[ilvl] and data[ilvl].tracks
    if not tracks or #tracks == 0 then
        return nil
    end
    
    local highest = tracks[#tracks]
    return {
        name = highest[1],
        rank = highest[2],
        maxRank = self:GetMaxRankForTrack(highest[1], season)
    }
end

--- Get all available item levels
-- @param seasonId string Optional season identifier (defaults to current)
-- @return table Array of all item levels that have data
function lib:GetAllItemLevels(seasonId)
    local season = seasonId or currentSeason
    local data = seasonData[season] and seasonData[season].data
    if not data then return {} end
    
    local levels = {}
    for ilvl in pairs(data) do
        table.insert(levels, ilvl)
    end
    table.sort(levels)
    return levels
end

--- Get all available crest types
-- @param seasonId string Optional season identifier (defaults to current)
-- @return table Array of crest type strings
function lib:GetAllCrestTypes(seasonId)
    local season = seasonId or currentSeason
    local crests = seasonData[season] and seasonData[season].crests
    if not crests then return {} end
    
    local types = {}
    for crestKey in pairs(crests) do
        table.insert(types, crestKey)
    end
    table.sort(types)
    return types
end

--- Get item levels for a specific crest type
-- @param crestType string The crest type to search for
-- @param seasonId string Optional season identifier (defaults to current)
-- @return table Array of item levels that use this crest type
function lib:GetItemLevelsByCrest(crestType, seasonId)
    local season = seasonId or currentSeason
    local data = seasonData[season] and seasonData[season].data
    if not data then return {} end
    
    local levels = {}
    for ilvl, info in pairs(data) do
        if info.crest == crestType then
            table.insert(levels, ilvl)
        end
    end
    table.sort(levels)
    return levels
end

--- Check if an item level exists in the data
-- @param ilvl number The item level to check
-- @param seasonId string Optional season identifier (defaults to current)
-- @return boolean True if the item level has data
function lib:HasItemLevel(ilvl, seasonId)
    local season = seasonId or currentSeason
    local data = seasonData[season] and seasonData[season].data
    return data and data[ilvl] ~= nil
end

--- Get season info
-- @param seasonId string Optional season identifier (defaults to current)
-- @return table|nil Season info {name, version, crests, maxRanks, validFrom, validTo, isValid} or nil
function lib:GetSeasonInfo(seasonId)
    local season = seasonId or currentSeason
    local info = seasonData[season]
    if not info then return nil end
    
    return {
        name = info.name,
        version = info.version,
        crests = info.crests,
        maxRanks = info.maxRanks,
        validFrom = info.validFrom,
        validTo = info.validTo,
        versionPrefix = info.versionPrefix,
        isValid = self:IsSeasonValid(season)
    }
end
