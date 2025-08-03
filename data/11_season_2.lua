-- Season 11.3 - The War Within Season 1
local _, ns = ...

-- Store season data in namespace
if not ns.seasons then
    ns.seasons = {}
end

ns.seasons["11.2"] = {
    name = "The War Within - Season 2",
    expansion = 11,
    season = 2,

    
    -- Version validity (WoW interface versions)
    validFrom = 110100, -- 11.1
    validTo = 110200,   -- 11.2 (exclusive)
    
    -- Alternative: version prefix matching
    -- versionPrefix = "1102", -- matches 11.2.x

    tracks = {
        { name = "Explorer", maxRank = 8 },
        { name = "Adventurer", maxRank = 8 },
        { name = "Veteran", maxRank = 8 },
        { name = "Champion", maxRank = 8 },
        { name = "Hero", maxRank = 6 },
        { name = "Myth", maxRank = 6 }
    },

    crests = {
        { name = "weathered", currency = 3107 },
        { name = "carved", currency = 3108 },
        { name = "runed", currency = 3109 },
        { name = "gilded", currency = 3110 }
    },
    

    data = {
        [597] = {tracks = {{1, 1}}},
        [600] = {tracks = {{1, 2}}},
        [603] = {tracks = {{1, 3}}},
        [606] = {tracks = {{1, 4}}},
        [610] = {tracks = {{1, 5}, {2, 1}}},
        [613] = {tracks = {{1, 6}, {2, 2}}},
        [616] = {tracks = {{1, 7}, {2, 3}}},
        [619] = {tracks = {{1, 8}, {2, 4}}},
        [623] = {crest = 1, tracks = {{2, 5}, {3, 1}}},
        [626] = {crest = 1, tracks = {{2, 6}, {3, 2}}},
        [629] = {crest = 1, tracks = {{2, 7}, {3, 3}}},
        [632] = {crest = 1, tracks = {{2, 8}, {3, 4}}},
        [636] = {crest = 2, tracks = {{3, 5}, {4, 1}}},
        [639] = {crest = 2, tracks = {{3, 6}, {4, 2}}},
        [642] = {crest = 2, tracks = {{3, 7}, {4, 3}}},
        [645] = {crest = 2, tracks = {{3, 8}, {4, 4}}},
        [649] = {crest = 3, tracks = {{4, 5}, {5, 1}}},
        [652] = {crest = 3, tracks = {{4, 6}, {5, 2}}},
        [655] = {crest = 3, tracks = {{4, 7}, {5, 3}}},
        [658] = {crest = 3, tracks = {{4, 8}, {5, 4}}},
        [662] = {crest = 4, tracks = {{5, 5}, {6, 1}}},
        [665] = {crest = 4, tracks = {{5, 6}, {6, 2}}},
        [668] = {crest = 4, tracks = {{6, 3}}},
        [672] = {crest = 4, tracks = {{6, 4}}},
        [675] = {crest = 4, tracks = {{6, 5}}},
        [678] = {crest = 4, tracks = {{6, 6}}}
    },



     

    
    dungeons = {
        { level = "Heroic", key = 619, vault = 632, crest = 1 },
        { level = "Mythic", key = 636, vault = 645, crest = 2, crestAmount = 15 },
        { level = 2, key = 639, vault = 649, crest = 3, crestAmount = 10 },
        { level = 3, key = 639, vault = 649, crest = 3, crestAmount = 12 },
        { level = 4, key = 642, vault = 652, crest = 3, crestAmount = 14 },
        { level = 5, key = 645, vault = 652, crest = 3, crestAmount = 16 },
        { level = 6, key = 649, vault = 655, crest = 3, crestAmount = 18 },
        { level = 7, key = 649, vault = 658, crest = 4, crestAmount = 10 },
        { level = 8, key = 652, vault = 658, crest = 4, crestAmount = 12 },
        { level = 9, key = 652, vault = 658, crest = 4, crestAmount = 14 },
        { level = 10, key = 655, vault = 662, crest = 4, crestAmount = 16 },
        { level = 11, key = 655, vault = 662, crest = 4, crestAmount = 18 },
        { level = 12, key = 655, vault = 662, crest = 4, crestAmount = 20 }
    },


    delves = {
        { tier = 1, bountiful = 610, vault = 623, crests = 1 },
        { tier = 2, bountiful = 613, vault = 623 },
        { tier = 3, bountiful = 616, vault = 626 },
        { tier = 4, bountiful = 619, delversBounty = 626, vault = 636, crests = {1, 2} },
        { tier = 5, bountiful = 623, delversBounty = 632, vault = 642 },
        { tier = 6, bountiful = 626, delversBounty = 639, vault = 645, crests = {2, 3} },
        { tier = 7, bountiful = 636, delversBounty = 645, vault = 649 },
        { tier = 8, bountiful = 639, delversBounty = 649, vault = 649, crests = {3, 4} },
        { tier = 9, bountiful = 639, delversBounty = 649, vault = 649 },
        { tier = 10, bountiful = 639, delversBounty = 649, vault = 649 },
        { tier = 11, bountiful = 639, delversBounty = 649, vault = 649 }
    },


    crafting = {
        { itemQuality = 1, enchantedWeathered = 616, sparkOfOmens = 632, enchantedRuned = 645, enchantedGilded = 662 },
        { itemQuality = 2, enchantedWeathered = 619, sparkOfOmens = 636, enchantedRuned = 649, enchantedGilded = 665 },
        { itemQuality = 3, enchantedWeathered = 623, sparkOfOmens = 639, enchantedRuned = 652, enchantedGilded = 668 },
        { itemQuality = 4, enchantedWeathered = 626, sparkOfOmens = 642, enchantedRuned = 655, enchantedGilded = 672 },
        { itemQuality = 5, enchantedWeathered = 629, sparkOfOmens = 645, enchantedRuned = 658, enchantedGilded = 675 }
    },


    raidBosses = {"1", "2-3", "4-6", "7-8"},

    raid = {
        { difficulty = "LFR", bosses = "1", loot = 623, crest = 1, crestAmount = 15 },
        { difficulty = "LFR", bosses = "2-3", loot = 626},
        { difficulty = "LFR", bosses = "4-6", loot = 629 },
        { difficulty = "LFR", bosses = "7-8", loot = 632, crests = {1, 2} },
        { difficulty = "LFR", veryRare = 639 },
        { difficulty = "Normal", bosses = "1", loot = 636, crest = 2, crestAmount = 15 },
        { difficulty = "Normal", bosses = "2-3", loot = 639 },
        { difficulty = "Normal", bosses = "4-6", loot = 642 },
        { difficulty = "Normal", bosses = "7-8", loot = 645, crests = {2, 3} },
        { difficulty = "Normal", veryRare = 652 },
        { difficulty = "Heroic", bosses = "1", loot = 649, crest = 3, crestAmount = 15 },
        { difficulty = "Heroic", bosses = "2-3", loot = 652 },
        { difficulty = "Heroic", bosses = "4-6", loot = 655 },
        { difficulty = "Heroic", bosses = "7-8", loot = 658, crests = {3, 4} },
        { difficulty = "Heroic", veryRare = 665 },
        { difficulty = "Mythic", bosses = "1", loot = 662, crest = 4, crestAmount = 15 },
        { difficulty = "Mythic", bosses = "2-3", loot = 665 },
        { difficulty = "Mythic", bosses = "4-6", loot = 668 },
        { difficulty = "Mythic", bosses = "7-8", loot = 672 },
        { difficulty = "Mythic", veryRare = 678 }
    },

    -- dungeonLoot = {
    --     { difficulty = "Heroic", ilvl1 = 619, ilvl2 = 632, crestIdx = 1 },
    --     { difficulty = "Mythic", ilvl1 = 636, ilvl2 = 645, crestIdx = 2},
    --     { difficulty = 2, ilvl1 = 639, ilvl2 = 649, crestIdx = 3, crestAmount = 10 },
    --     { difficulty = 3, ilvl1 = 639, ilvl2 = 649, crestIdx = 3, crestAmount = 12 },
    --     { difficulty = 4, ilvl1 = 642, ilvl2 = 652, crestIdx = 3, crestAmount = 14 },
    --     { difficulty = 5, ilvl1 = 645, ilvl2 = 652, crestIdx = 3, crestAmount = 16 },
    --     { difficulty = 6, ilvl1 = 649, ilvl2 = 655, crestIdx = 3, crestAmount = 18 },
    --     { difficulty = 7, ilvl1 = 649, ilvl2 = 658, crestIdx = 4, crestAmount = 10 },
    --     { difficulty = 8, ilvl1 = 652, ilvl2 = 658, crestIdx = 4, crestAmount = 12 },
    --     { difficulty = 9, ilvl1 = 652, ilvl2 = 658, crestIdx = 4, crestAmount = 14 },
    --     { difficulty = 10, ilvl1 = 655, ilvl2 = 662, crestIdx = 4, crestAmount = 16 },
    --     { difficulty = 11, ilvl1 = 655, ilvl2 = 662, crestIdx = 4, crestAmount = 18 },
    --     { difficulty = 12, ilvl1 = 655, ilvl2 = 662, crestIdx = 4, crestAmount = 20 }
    -- },

    -- delvesLoot = {
    --     { difficulty = 1, ilvl1 = 610, ilvl2 = 623, crestIdx = 1 },
    --     { difficulty = 2, ilvl1 = 613, ilvl2 = 626, crestIdx = 1  },
    --     { difficulty = 3, ilvl1 = 616, ilvl2 = 629, crestIdx = 1  },
    --     { difficulty = 4, ilvl1 = 619, ilvl2 = 632, crestIdx = 1  },
    --     { difficulty = 5, ilvl1 = 623, ilvl2 = 636, crestIdx = 1  },
    --     { difficulty = 6, ilvl1 = 626, ilvl2 = 642, crestIdx = 2 },
    --     { difficulty = 7, ilvl1 = 636, ilvl2 = 645, crestIdx = 2 },
    --     { difficulty = 8, ilvl1 = 639, ilvl2 = 649, crestIdx = 3 },
    --     { difficulty = 9, ilvl1 = 639, ilvl2 = 649, crestIdx = 3 },
    --     { difficulty = 10, ilvl1 = 639, ilvl2 = 649, crestIdx = 3 },
    --     { difficulty = 11, ilvl1 = 639, ilvl2 = 649, crestIdx = 4 }
    -- },

    -- raidLootIlvlsBosses = {"1-2", "3-4", "5-6", "7-8"},
    -- raidLoot = {
    --     { name = "LFR", ilvls = {623, 626, 629, 632}, crestIdx = 1 },
    --     { name = "LFR", ilvls = {"", 639, 639, 639}, crestIdx = 1 },
    --     { name = PLAYER_DIFFICULTY1, ilvls = {636, 639, 642, 645}, crestIdx = 2 },
    --     { name = PLAYER_DIFFICULTY1, ilvls = {"", 652, 652, 652}, crestIdx = 2 },
    --     { name = PLAYER_DIFFICULTY2, ilvls = {649, 652, 655, 658}, crestIdx = 3 },
    --     { name = PLAYER_DIFFICULTY2, ilvls = {"", 665, 665, 665}, crestIdx = 3 },
    --     { name = PLAYER_DIFFICULTY6, ilvls = {662, 665, 668, 672}, crestIdx = 4 },
    --     { name = PLAYER_DIFFICULTY6, ilvls = {"", 678, 678, 678}, crestIdx = 4 }
    -- }
}
