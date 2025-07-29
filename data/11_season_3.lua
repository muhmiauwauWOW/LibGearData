-- Season 11.3 - The War Within Season 1
local LibGearData = LibStub("LibGearData-1.0")

LibGearData:RegisterSeasonData("11.3", {
    name = "The War Within - Season 3",
    version = "11.3",
    
    -- Version validity (WoW interface versions)
    validFrom = 110200, -- 11.0.2
    validTo = 110300,   -- 11.0.3 (exclusive)
    
    -- Alternative: version prefix matching
    -- versionPrefix = "1102", -- matches 11.0.2.x

    tracks = {
        { name = "Explorer", maxRank = 8 },
        { name = "Adventurer", maxRank = 8 },
        { name = "Veteran", maxRank = 8 },
        { name = "Champion", maxRank = 8 },
        { name = "Hero", maxRank = 6 },
        { name = "Myth", maxRank = 6 }
    },

    crests = {
        { name = "weathered", currency = 3285 },
        { name = "carved", currency = 3287 },
        { name = "runed", currency = 3289 },
        { name = "gilded", currency = 3290 }
    },
    

    data = {
        [642] = {tracks = {{1, 1}}},
        [645] = {tracks = {{1, 2}}},
        [649] = {tracks = {{1, 3}}},
        [652] = {tracks = {{1, 4}}},
        [655] = {tracks = {{1, 5}, {2, 1}}},
        [658] = {tracks = {{1, 6}, {2, 2}}},
        [662] = {tracks = {{1, 7}, {2, 3}}},
        [665] = {tracks = {{1, 8}, {2, 4}}},
        [668] = {crest = 1, tracks = {{2, 5}, {3, 1}}},
        [671] = {crest = 1, tracks = {{2, 6}, {3, 2}}},
        [675] = {crest = 1, tracks = {{2, 7}, {3, 3}}},
        [678] = {crest = 1, tracks = {{2, 8}, {3, 4}}},
        [681] = {crest = 2, tracks = {{3, 5}, {4, 1}}},
        [684] = {crest = 2, tracks = {{3, 6}, {4, 2}}},
        [688] = {crest = 2, tracks = {{3, 7}, {4, 3}}},
        [691] = {crest = 2, tracks = {{3, 8}, {4, 4}}},
        [694] = {crest = 3, tracks = {{4, 5}, {5, 1}}},
        [697] = {crest = 3, tracks = {{4, 6}, {5, 2}}},
        [701] = {crest = 3, tracks = {{4, 7}, {5, 3}}},
        [704] = {crest = 3, tracks = {{4, 8}, {5, 4}}},
        [707] = {crest = 4, tracks = {{5, 5}, {6, 1}}},
        [710] = {crest = 4, tracks = {{5, 6}, {6, 2}}},
        [714] = {crest = 4, tracks = {{6, 3}}},
        [717] = {crest = 4, tracks = {{6, 4}}},
        [720] = {crest = 4, tracks = {{6, 5}}},
        [723] = {crest = 4, tracks = {{6, 6}}}
    }
})
