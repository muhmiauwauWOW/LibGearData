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
    
    -- Crest configuration for this season
    crests = {
        weathered = {currencyId = 3285},
        carved = {currencyId = 3287},
        runed = {currencyId = 3289},
        gilded = {currencyId = 3290}
    },
    
    -- Track max ranks for this season
    maxRanks = {
        Explorer = 8,
        Adventurer = 8,
        Veteran = 8,
        Champion = 8,
        Hero = 6,
        Myth = 6
    },
    
    -- Item level data
    data = {
        [642] = {tracks = {{"Explorer", 1}}},
        [645] = {tracks = {{"Explorer", 2}}},
        [649] = {tracks = {{"Explorer", 3}}},
        [652] = {tracks = {{"Explorer", 4}}},
        [655] = {tracks = {{"Explorer", 5}, {"Adventurer", 1}}},
        [658] = {tracks = {{"Explorer", 6}, {"Adventurer", 2}}},
        [662] = {tracks = {{"Explorer", 7}, {"Adventurer", 3}}},
        [665] = {tracks = {{"Explorer", 8}, {"Adventurer", 4}}},
        [668] = {crest = "weathered", tracks = {{"Adventurer", 5}, {"Veteran", 1}}},
        [671] = {crest = "weathered", tracks = {{"Adventurer", 6}, {"Veteran", 2}}},
        [675] = {crest = "weathered", tracks = {{"Adventurer", 7}, {"Veteran", 3}}},
        [678] = {crest = "weathered", tracks = {{"Adventurer", 8}, {"Veteran", 4}}},
        [681] = {crest = "carved", tracks = {{"Veteran", 5}, {"Champion", 1}}},
        [684] = {crest = "carved", tracks = {{"Veteran", 6}, {"Champion", 2}}},
        [688] = {crest = "carved", tracks = {{"Veteran", 7}, {"Champion", 3}}},
        [691] = {crest = "carved", tracks = {{"Veteran", 8}, {"Champion", 4}}},
        [694] = {crest = "runed", tracks = {{"Champion", 5}, {"Hero", 1}}},
        [697] = {crest = "runed", tracks = {{"Champion", 6}, {"Hero", 2}}},
        [701] = {crest = "runed", tracks = {{"Champion", 7}, {"Hero", 3}}},
        [704] = {crest = "runed", tracks = {{"Champion", 8}, {"Hero", 4}}},
        [707] = {crest = "gilded", tracks = {{"Hero", 5}, {"Myth", 1}}},
        [710] = {crest = "gilded", tracks = {{"Hero", 6}, {"Myth", 2}}},
        [714] = {crest = "gilded", tracks = {{"Myth", 3}}},
        [717] = {crest = "gilded", tracks = {{"Myth", 4}}},
        [720] = {crest = "gilded", tracks = {{"Myth", 5}}},
        [723] = {crest = "gilded", tracks = {{"Myth", 6}}}
    }
})
