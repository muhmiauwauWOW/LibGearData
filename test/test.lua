local function AddDataDebug(value, label)
    if value == nil then
        print("DEBUG: " .. label .. " ist NIL")
    else
        -- print("DEBUG: " .. label .. " ist " .. type(value))
    end
    DevTool:AddData(value, label)
end

local LibGearData = LibStub("LibGearData-1.0")

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
    -- Test des neuen Season-Systems
    AddDataDebug(LibGearData, "LibGearData")

    local season2exp10 = LibGearData:SetSeason(2, 11)
    AddDataDebug(season2exp10, "season2exp10")  
    AddDataDebug(LibGearData:GetCurrentSeason(), "Aktive Season")
    AddDataDebug(season2exp10.data, "season2exp10")
    AddDataDebug(season2exp10:GetCurrentSeason(), "Aktive Season nach SetSeason(2, 11)")
    AddDataDebug(LibGearData:GetCurrentSeason(), "Aktive Season")



    -- Realistischer Test für Itemlevel 691 (nur reine API-Abfragen, keine eigene Logik)
    local ilvl = 691
    local tracks = LibGearData:GetTracksByItemLevel(ilvl)
    local crest = LibGearData:GetCrestByItemLevel(ilvl)
    AddDataDebug({
        itemLevel = ilvl,
        tracks = tracks,
        crest = crest,
    }, "Upgrade-Info für Itemlevel 691 (API only)")

    -- Test verschiedener Itemlevel-Bereiche
    local testItemLevels = {642, 655, 668, 675, 681, 694, 707, 714, 723}
    for _, testIlvl in ipairs(testItemLevels) do
        local testTracks = LibGearData:GetTracksByItemLevel(testIlvl)
        local testCrest = LibGearData:GetCrestByItemLevel(testIlvl)
        AddDataDebug({
            itemLevel = testIlvl,
            tracks = testTracks,
            crest = testCrest,
        }, "Test Itemlevel " .. testIlvl)
    end

    local allTracks = LibGearData:GetTracks()
    AddDataDebug(allTracks, "Alle verfügbaren Tracks")

    local season2exp11 = LibGearData:SetSeason(2, 11)
    local allTracks2 = season2exp11:GetTracks()
    AddDataDebug(allTracks2, "Alle verfügbaren Tracks Last season")

    local explorerTrack = LibGearData:GetTrack("Explorer")
    AddDataDebug(explorerTrack, "Explorer Track Details")

    local mythTrack = LibGearData:GetTrack("Myth") 
    AddDataDebug(mythTrack, "Myth Track Details")

    -- Upgrade-Pfad APIs
    local upgradeOptions = LibGearData:GetUpgradeOptions(668)
    AddDataDebug(upgradeOptions, "Upgrade-Optionen für Item 668")

    local nextUpgrade = LibGearData:GetNextUpgrade(668)
    AddDataDebug(nextUpgrade, "Nächstes Upgrade von 668")

    local maxUpgrade = LibGearData:GetMaxUpgrade(668, "Veteran")
    AddDataDebug(maxUpgrade, "Maximales Upgrade von 668 im Veteran Track")

    local highestTrack = LibGearData:GetHighestTrack(668)
    AddDataDebug(highestTrack, "Höchster Track für Itemlevel 668")

    local highestTrackString = LibGearData:GetHighestTrackString(668)
    AddDataDebug(highestTrackString, "Höchster Track String für Itemlevel 668 (formatiert)")

    -- Crest-System APIs
    local allCrests = LibGearData:GetCrests()
    AddDataDebug(allCrests, "Alle verfügbaren Crests")

    local crestInfo = LibGearData:GetCrest("carved")
    AddDataDebug(crestInfo, "Carved Crest Info")

    local requiredCrest = LibGearData:GetRequiredCrest(681, 684)
    AddDataDebug(requiredCrest, "Benötigter Crest für Upgrade 681->684")

    -- Track-Rank-Mapping APIs
    local trackRank = LibGearData:GetTrackRank(691)
    AddDataDebug(trackRank, "Track und Rank für Itemlevel 691")

    local itemLevel = LibGearData:GetItemLevel("Champion", 4)
    AddDataDebug(itemLevel, "Itemlevel für Champion Rank 4")

    -- Validation APIs
    local isValidUpgrade = LibGearData:IsValidUpgrade(668, 671)
    AddDataDebug(isValidUpgrade, "Ist 668->671 gültiges Upgrade?")

    local canUpgradeWith = LibGearData:CanUpgradeWithCrest(681, "carved")
    AddDataDebug(canUpgradeWith, "Kann 681 mit carved crest upgraden?")

    -- Range/Filter APIs
    local itemsInTrack = LibGearData:GetItemLevels("Veteran")
    AddDataDebug(itemsInTrack, "Alle Itemlevel im Veteran Track")

    local itemsWithCrest = LibGearData:GetItemLevelsWithCrest("runed")
    AddDataDebug(itemsWithCrest, "Alle Itemlevel die runed crest benötigen")



    -- Lokalisierung APIs
    local trackName = LibGearData:GetTrackName("Veteran")
    AddDataDebug(trackName, "Track-Name für Veteran")

    local crestName = LibGearData:GetCrestName("carved")
    AddDataDebug(crestName, "Crest-Name für carved")

    local allTrackNames = LibGearData:GetTrackNames()
    AddDataDebug(allTrackNames, "Alle Track-Namen")

    local allCrestNames = LibGearData:GetCrestNames()
    AddDataDebug(allCrestNames, "Alle Crest-Namen")


    -- Edge Case Tests
    local invalidIlvl = LibGearData:GetTracksByItemLevel(999)
    AddDataDebug(invalidIlvl, "Test ungültiges Itemlevel 999")

    local lowIlvl = LibGearData:GetTracksByItemLevel(500)
    AddDataDebug(lowIlvl, "Test niedriges Itemlevel 500")

    local highIlvl = LibGearData:GetTracksByItemLevel(800)
    AddDataDebug(highIlvl, "Test hohes Itemlevel 800")

    -- Boundary/Transition Testing - Critical item levels between tracks
    local boundaryTests = {
        -- Track transitions
        {654, 655}, -- Explorer/Adventurer boundary
        {667, 668}, -- Adventurer/Veteran boundary  
        {680, 681}, -- Veteran/Champion boundary
        {693, 694}, -- Champion/Hero boundary
        {706, 707}, -- Hero/Myth boundary
        
        -- Crest requirement transitions
        {667, 668}, -- Weathered crest starts
        {680, 681}, -- Carved crest starts
        {693, 694}, -- Runed crest starts
        {706, 707}, -- Gilded crest starts
    }
    
    for _, boundary in ipairs(boundaryTests) do
        local before, after = boundary[1], boundary[2]
        local beforeData = {
            tracks = LibGearData:GetTracksByItemLevel(before),
            crest = LibGearData:GetCrestByItemLevel(before)
        }
        local afterData = {
            tracks = LibGearData:GetTracksByItemLevel(after),
            crest = LibGearData:GetCrestByItemLevel(after)
        }
        AddDataDebug({
            before = {ilvl = before, data = beforeData},
            after = {ilvl = after, data = afterData}
        }, "Boundary Test: " .. before .. " -> " .. after)
    end



    
    local season2exp10 = LibGearData:SetSeason(2, 11)
        AddDataDebug(season2exp10:GetRaidLootList(), "GetDungeonLootList")
    AddDataDebug(LibGearData:GetRaidLootList(), "GetDungeonLootList")

    -- Available seasons
    -- local availableSeasons = LibGearData:GetSeasons()
    -- AddDataDebug(availableSeasons, "Available Seasons")

    print("Alle LibGearData API-Tests abgeschlossen!")
end)
