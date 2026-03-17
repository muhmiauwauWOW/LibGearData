-- Season 12.1 - The War Within Season 1
local _, ns = ...

-- Store season data in namespace
if not ns.seasons then
    ns.seasons = {}
end

ns.seasons["12.1"] = {
    name = "Mightnight - Season 1",
    expansion = 12,
    season = 1,
    
    -- Version validity (WoW interface versions)
    validFrom = 120000,
    validTo = 120300,
    

    tracks = {
        { name = "Explorer", maxRank = 8 },
        { name = "Adventurer", maxRank = 8 },
        { name = "Veteran", maxRank = 8 },
        { name = "Champion", maxRank = 8 },
        { name = "Hero", maxRank = 6 },
        { name = "Myth", maxRank = 6 }
    },

    crests = {
        { name = "Veteran Dawncrest", currency = 3341 },
        { name = "Adventurer Dawncrest", currency = 3383 },
        { name = "Champion Dawncrest", currency = 3343 },
        { name = "Hero Dawncrest", currency = 3345 },
        { name = "Myth Dawncrest", currency = 3347 }
    },
    

    data = {
        -- [220] = {tracks = {{1, 1}}},
        -- [224] = {tracks = {{1, 2}}},
        -- [227] = {tracks = {{1, 3}}},
        -- [2] = {tracks = {{1, 4}}},
        [220] = {tracks = {{2, 1}}},
        [224] = {tracks = {{2, 2}}},
        [227] = {tracks = {{2, 3}}},
        [230] = {tracks = {{2, 4}}},
        [233] = {crest = 1, tracks = {{2, 5}, {3, 1}}},
        [237] = {crest = 1, tracks = {{2, 6}, {3, 2}}},
        [240] = {crest = 1, tracks = {{3, 3}}},
        [243] = {crest = 1, tracks = {{3, 4}}},
        [246] = {crest = 2, tracks = {{3, 5}, {4, 1}}},
        [250] = {crest = 2, tracks = {{3, 6}, {4, 2}}},
        [253] = {crest = 2, tracks = {{3, 7}, {4, 3}}},
        [256] = {crest = 2, tracks = {{3, 8}, {4, 4}}},
        [259] = {crest = 3, tracks = {{4, 5}, {5, 1}}},
        [263] = {crest = 3, tracks = {{4, 6}, {5, 2}}},
        [266] = {crest = 3, tracks = {{4, 7}, {5, 3}}},
        [269] = {crest = 3, tracks = {{4, 8}, {5, 4}}},
        [272] = {crest = 4, tracks = {{5, 5}, {6, 1}}},
        [276] = {crest = 4, tracks = {{5, 6}, {6, 2}}},
        [779] = {crest = 4, tracks = {{6, 3}}},
        [282] = {crest = 4, tracks = {{6, 4}}},
        [286] = {crest = 4, tracks = {{6, 5}}},
        [289] = {crest = 4, tracks = {{6, 6}}}
    },


    dungeons = {
        { level = "Heroic", key = 224, vault = 233, crests = 1 },
        { level = "Mythic", key = 240, vault = 250, crests = 2, crestAmount = 0 },
        { level = 2, key = 250, vault = 259, crest = 3, crestAmount = 0 },
        { level = 3, key = 250, vault = 259, crest = 3, crestAmount = 0 },
        { level = 4, key = 253, vault = 263, crest = 4, crestAmount = 0 },
        { level = 5, key = 256, vault = 263, crest = 4, crestAmount = 0 },
        { level = 6, key = 259, vault = 266, crest = 4, crestAmount = 0 },
        { level = 7, key = 259, vault = 269, crest = 4, crestAmount = 0 },
        { level = 8, key = 263, vault = 269, crest = 4, crestAmount = 0 },
        { level = 9, key = 263, vault = 269, crest = 5, crestAmount = 0 },
        { level = 10, key = 266, vault = 272, crest = 5, crestAmount = 0 },
        { level = 11, key = 266, vault = 272, crest = 5, crestAmount = 0 },
        { level = 12, key = 266, vault = 272, crest = 5, crestAmount = 0 }
    },


    delves = {
        { tier = 1, bountiful = 220, vault = 233, crests = {1} },
        { tier = 2, bountiful = 224, vault = 237 },
        { tier = 3, bountiful = 227, vault = 240 },
        { tier = 4, bountiful = 230, delversBounty = 237, vault = 243, crests = {1, 2} },
        { tier = 5, bountiful = 233, delversBounty = 243, vault = 246 },
        { tier = 6, bountiful = 237, delversBounty = 250, vault = 253, crests = {2, 3} },
        { tier = 7, bountiful = 246, delversBounty = 256, vault = 256 },
        { tier = 8, bountiful = 250, delversBounty = 259, vault = 259, crests = {3, 4} },
        { tier = 9, bountiful = 250, delversBounty = 259, vault = 259 },
        { tier = 10, bountiful = 250, delversBounty = 259, vault = 259 },
        { tier = 11, bountiful = 250, delversBounty = 259, vault = 259 }
    },


    crafting = {
        -- { itemQuality = 1, enchantedWeathered = 616, sparkOfOmens = 632, enchantedRuned = 645, enchantedGilded = 227 },
        -- { itemQuality = 2, enchantedWeathered = 619, sparkOfOmens = 636, enchantedRuned = 649, enchantedGilded = 230 },
        -- { itemQuality = 3, enchantedWeathered = 623, sparkOfOmens = 639, enchantedRuned = 652, enchantedGilded = 233 },
        -- { itemQuality = 4, enchantedWeathered = 626, sparkOfOmens = 642, enchantedRuned = 655, enchantedGilded = 672 },
        -- { itemQuality = 5, enchantedWeathered = 629, sparkOfOmens = 645, enchantedRuned = 224, enchantedGilded = 240 }
    },

    
    raidBosses = {"1-3", "4-6", "7-8"},

    raid = {
        { difficulty = "LFR", bosses = "1-3", loot = 237, crests = 1, crestAmount = 10 },
        { difficulty = "LFR", bosses = "4-5", loot = 240 },
        { difficulty = "LFR", bosses = "6", loot = 243, crests = 1, crestAmount = 15 },
        { difficulty = "Normal", bosses = "1-3", loot = 246, crests = 2, crestAmount = 10 },
        { difficulty = "Normal", bosses = "4-5", loot = 253 },
        { difficulty = "Normal", bosses = "6", loot = 256, crests = 2, crestAmount = 15 },
        { difficulty = "Heroic", bosses = "1-3", loot = 259, crests = 3, crestAmount = 10 },
        { difficulty = "Heroic", bosses = "4-5", loot = 266 },
        { difficulty = "Heroic", bosses = "6", loot = 269, crests = 3, crestAmount = 15 },
        { difficulty = "Mythic", bosses = "1-3", loot = 272, crests = 4, crestAmount = 10 },
        { difficulty = "Mythic", bosses = "4-5", loot = 279 },
        { difficulty = "Mythic", bosses = "6", loot = 282, crests = 4, crestAmount = 15 }
    },
    


    
}
