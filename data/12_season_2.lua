-- Season 12.2 - The War Within Season 2
local _, ns = ...

-- Store season data in namespace
if not ns.seasons then
    ns.seasons = {}
end

ns.seasons["12.2"] = {
    name = "Midnight - Season 2",
    expansion = 12,
    season = 2,
    
    -- Version validity (WoW interface versions)
    validFrom = 120100,
    validTo = 120199,
    

    tracks = {
        { name = "Explorer", maxRank = 6 },
        { name = "Adventurer", maxRank = 6 },
        { name = "Veteran", maxRank = 6 },
        { name = "Champion", maxRank = 6 },
        { name = "Hero", maxRank = 6 },
        { name = "Myth", maxRank = 6 }
    },

    crests = {
        { name = "Adventurer Dawncrest", currency = 3442 },
        { name = "Veteran Dawncrest", currency = 3443 },
        { name = "Champion Dawncrest", currency = 3444 },
        { name = "Hero Dawncrest", currency = 3445 },
        { name = "Myth Dawncrest", currency = 3446 }
    },
    

    data = {
        [266] = {tracks = {{2, 1}}},
        [269] = {tracks = {{2, 2}}},
        [272] = {tracks = {{2, 3}}},
        [276] = {tracks = {{2, 4}}},
        [279] = {crest = 1, tracks = {{2, 5}, {3, 1}}},
        [282] = {crest = 1, tracks = {{2, 6}, {3, 2}}},
        [285] = {crest = 1, tracks = {{3, 3}}},
        [289] = {crest = 1, tracks = {{3, 4}}},
        [292] = {crest = 2, tracks = {{3, 5}, {4, 1}}},
        [295] = {crest = 2, tracks = {{3, 6}, {4, 2}}},
        [298] = {crest = 2, tracks = {{4, 3}}},
        [302] = {crest = 2, tracks = {{4, 4}}},
        [305] = {crest = 3, tracks = {{4, 5}, {5, 1}}},
        [308] = {crest = 3, tracks = {{4, 6}, {5, 2}}},
        [311] = {crest = 3, tracks = {{5, 3}}},
        [315] = {crest = 3, tracks = {{5, 4}}},
        [318] = {crest = 4, tracks = {{5, 5}, {6, 1}}},
        [321] = {crest = 4, tracks = {{5, 6}, {6, 2}}},
        [324] = {crest = 4, tracks = {{6, 3}}},
        [328] = {crest = 4, tracks = {{6, 4}}},
        [331] = {crest = 4, tracks = {{6, 5}}},
        [334] = {crest = 4, tracks = {{6, 6}}},
        [341] = {crest = 4, tracks = {{6, 8}}},
        [344] = {crest = 4, tracks = {{6, 9}}}
    },


    dungeons = {
        { level = "Heroic", key = 276, vault = 289, crests = 2, crestAmount = 10 },
        { level = "Mythic", key = 292, vault = 302, crests = 3, crestAmount = 10 },
        { level = 2, key = 295, vault = 305, crest = 3, crestAmount = 10 },
        { level = 3, key = 295, vault = 305, crest = 3, crestAmount = 12 },
        { level = 4, key = 298, vault = 308, crest = 4, crestAmount = 10 },
        { level = 5, key = 302, vault = 308, crest = 4, crestAmount = 12 },
        { level = 6, key = 305, vault = 311, crest = 4, crestAmount = 14 },
        { level = 7, key = 305, vault = 315, crest = 4, crestAmount = 16 },
        { level = 8, key = 308, vault = 315, crest = 4, crestAmount = 18 },
        { level = 9, key = 308, vault = 315, crest = 5, crestAmount = 10 },
        { level = 10, key = 311, vault = 318, crest = 5, crestAmount = 12 },
        { level = 11, key = 311, vault = 318, crest = 5, crestAmount = 14 },
        { level = 12, key = 311, vault = 318, crest = 5, crestAmount = 16 }
    },


    delves = {
        { tier = 1, bountiful = 266, crests = {1} },
        { tier = 2, bountiful = 269, crests = {1} },
        { tier = 3, bountiful = 272, crests = {1} },
        { tier = 4, bountiful = 276, delversBounty = 282, vault = 279, crests = {2} },
        { tier = 5, bountiful = 279, delversBounty = 289, vault = 282, crests = {2} },
        { tier = 6, bountiful = 282, delversBounty = 292, vault = 285, crests = {3} },
        { tier = 7, bountiful = 292, delversBounty = 295, vault = 289, crests = {3} },
        { tier = 8, bountiful = 295, delversBounty = 305, vault = 305, crests = {4} },
        { tier = 9, bountiful = 295, delversBounty = 305, vault = 305, crests = {4} },
        { tier = 10, bountiful = 295, delversBounty = 305, vault = 305, crests = {4} },
        { tier = 11, bountiful = 295, delversBounty = 305, vault = 305, crests = {4} }
    },


    crafting = {},

    
    raidBosses = {"1", "2-3", "4-6", "7-8"},

    raid = {
        { difficulty = "LFR", bosses = "1", loot = 279, crests = 2, crestAmount = 10 },
        { difficulty = "LFR", bosses = "2-3", loot = 282, crests = 2, crestAmount = 15 },
        { difficulty = "LFR", bosses = "4-6", loot = 285, crests = 2, crestAmount = 20 },
        { difficulty = "LFR", bosses = "7-8", loot = 289, crests = 2, crestAmount = 20 },

        { difficulty = "Normal", bosses = "1", loot = 292, crests = 3, crestAmount = 10 },
        { difficulty = "Normal", bosses = "2-3", loot = 295, crests = 3, crestAmount = 15 },
        { difficulty = "Normal", bosses = "4-6", loot = 298, crests = 3, crestAmount = 20 },
        { difficulty = "Normal", bosses = "7-8", loot = 302, crests = 3, crestAmount = 20 },

        { difficulty = "Heroic", bosses = "1", loot = 305, crests = 4, crestAmount = 10 },
        { difficulty = "Heroic", bosses = "2-3", loot = 308, crests = 4, crestAmount = 15 },
        { difficulty = "Heroic", bosses = "4-6", loot = 311, crests = 4, crestAmount = 20 },
        { difficulty = "Heroic", bosses = "7-8", loot = 315, crests = 4, crestAmount = 20 },

        { difficulty = "Mythic", bosses = "1", loot = 318, crests = 5, crestAmount = 10 },
        { difficulty = "Mythic", bosses = "2-3", loot = 321, crests = 5, crestAmount = 15 },
        { difficulty = "Mythic", bosses = "4-6", loot = 324, crests = 5, crestAmount = 20 },
        { difficulty = "Mythic", bosses = "7-8", loot = 344, crests = 5, crestAmount = 20 }
    },
    


    
}
