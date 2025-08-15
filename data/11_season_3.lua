-- Season 11.3 - The War Within Season 1
local _, ns = ...

-- Store season data in namespace
if not ns.seasons then
    ns.seasons = {}
end

ns.seasons["11.3"] = {
    name = "The War Within - Season 3",
    expansion = 11,
    season = 3,
    
    -- Version validity (WoW interface versions)
    validFrom = 110200, -- 11.2
    validTo = 110300,   -- 11.3 (exclusive)
    
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
    },

    

    dungeons = {
        { level = "Heroic", key = 665, vault = 678, crests = 1 },
        { level = "Mythic", key = 681, vault = 691, crests = 2, crestAmount = 15 },
        { level = 2, key = 684, vault = 694, crest = 3, crestAmount = 10 },
        { level = 3, key = 684, vault = 694, crest = 3, crestAmount = 12 },
        { level = 4, key = 688, vault = 697, crest = 3, crestAmount = 14 },
        { level = 5, key = 691, vault = 697, crest = 3, crestAmount = 16 },
        { level = 6, key = 694, vault = 701, crest = 3, crestAmount = 18 },
        { level = 7, key = 694, vault = 704, crest = 4, crestAmount = 10 },
        { level = 8, key = 697, vault = 704, crest = 4, crestAmount = 12 },
        { level = 9, key = 697, vault = 704, crest = 4, crestAmount = 14 },
        { level = 10, key = 701, vault = 707, crest = 4, crestAmount = 16 },
        { level = 11, key = 701, vault = 707, crest = 4, crestAmount = 18 },
        { level = 12, key = 701, vault = 707, crest = 4, crestAmount = 20 }
    },


    delves = {
        { tier = 1, bountiful = 655, vault = 668, crests = {1} },
        { tier = 2, bountiful = 658, vault = 671 },
        { tier = 3, bountiful = 662, vault = 675 },
        { tier = 4, bountiful = 665, delversBounty = 671, vault = 681, crests = {1, 2} },
        { tier = 5, bountiful = 668, delversBounty = 678, vault = 681 },
        { tier = 6, bountiful = 671, delversBounty = 684, vault = 688, crests = {2, 3} },
        { tier = 7, bountiful = 681, delversBounty = 691, vault = 691 },
        { tier = 8, bountiful = 684, delversBounty = 694, vault = 694, crests = {3, 4} },
        { tier = 9, bountiful = 684, delversBounty = 694, vault = 694 },
        { tier = 10, bountiful = 684, delversBounty = 694, vault = 694 },
        { tier = 11, bountiful = 684, delversBounty = 694, vault = 694 }
    },


    crafting = {
        { itemQuality = 1, enchantedWeathered = 616, sparkOfOmens = 632, enchantedRuned = 645, enchantedGilded = 662 },
        { itemQuality = 2, enchantedWeathered = 619, sparkOfOmens = 636, enchantedRuned = 649, enchantedGilded = 665 },
        { itemQuality = 3, enchantedWeathered = 623, sparkOfOmens = 639, enchantedRuned = 652, enchantedGilded = 668 },
        { itemQuality = 4, enchantedWeathered = 626, sparkOfOmens = 642, enchantedRuned = 655, enchantedGilded = 672 },
        { itemQuality = 5, enchantedWeathered = 629, sparkOfOmens = 645, enchantedRuned = 658, enchantedGilded = 675 }
    },

    
    raidBosses = {"1-3", "4-6", "7-8"},

    raid = {
        { difficulty = "LFR", bosses = "1-3", loot = 671, crests = 1, crestAmount = 10 },
        { difficulty = "LFR", bosses = "4-6", loot = 675 },
        { difficulty = "LFR", bosses = "7-8", loot = 678, crests = 1, crestAmount = 15 },
        { difficulty = "Normal", bosses = "1-3", loot = 684, crests = 2, crestAmount = 10 },
        { difficulty = "Normal", bosses = "4-6", loot = 688 },
        { difficulty = "Normal", bosses = "7-8", loot = 691, crests = 2, crestAmount = 15 },
        { difficulty = "Heroic", bosses = "1-3", loot = 697, crests = 3, crestAmount = 10 },
        { difficulty = "Heroic", bosses = "4-6", loot = 701 },
        { difficulty = "Heroic", bosses = "7-8", loot = 704, crests = 3, crestAmount = 15 },
        { difficulty = "Mythic", bosses = "1-3", loot = 710, crests = 4, crestAmount = 10 },
        { difficulty = "Mythic", bosses = "4-6", loot = 714 },
        { difficulty = "Mythic", bosses = "7-8", loot = 717, crests = 4, crestAmount = 15 }
    },
    

    -- dungeonLoot = {
    --     { difficulty = "Heroic", ilvl1 = 665, ilvl2 = 678, crestIdx = 1 },
    --     { difficulty = "Mythic", ilvl1 = 681, ilvl2 = 691, crestIdx = 2 },
    --     { difficulty = 2, ilvl1 = 684, ilvl2 = 694, crestIdx = 3, crestAmount = 10 },
    --     { difficulty = 3, ilvl1 = 684, ilvl2 = 694, crestIdx = 3, crestAmount = 12 },
    --     { difficulty = 4, ilvl1 = 688, ilvl2 = 697, crestIdx = 3, crestAmount = 14 },
    --     { difficulty = 5, ilvl1 = 691, ilvl2 = 697, crestIdx = 3, crestAmount = 16 },
    --     { difficulty = 6, ilvl1 = 694, ilvl2 = 701, crestIdx = 3, crestAmount = 18 },
    --     { difficulty = 7, ilvl1 = 694, ilvl2 = 704, crestIdx = 4, crestAmount = 10 },
    --     { difficulty = 8, ilvl1 = 697, ilvl2 = 704, crestIdx = 4, crestAmount = 12 },
    --     { difficulty = 9, ilvl1 = 697, ilvl2 = 704, crestIdx = 4, crestAmount = 14 },
    --     { difficulty = 10, ilvl1 = 701, ilvl2 = 707, crestIdx = 4, crestAmount = 16 },
    --     { difficulty = 11, ilvl1 = 701, ilvl2 = 707, crestIdx = 4, crestAmount = 18 },
    --     { difficulty = "12+", ilvl1 = 701, ilvl2 = 707, crestIdx = 4, crestAmount = 20 }
    -- },

    -- delvesLoot = {
    --     { difficulty = 1, ilvl1 = 655, ilvl2 = 655 },
    --     { difficulty = 2, ilvl1 = 658, ilvl2 = 668 },
    --     { difficulty = 3, ilvl1 = 662, ilvl2 = 671 },
    --     { difficulty = 4, ilvl1 = 665, ilvl2 = 681 },
    --     { difficulty = 5, ilvl1 = 668, ilvl2 = 684 },
    --     { difficulty = 6, ilvl1 = 671, ilvl2 = 691 },
    --     { difficulty = 7, ilvl1 = 681, ilvl2 = 691 },
    --     { difficulty = 8, ilvl1 = 684, ilvl2 = 694 },
    --     { difficulty = 9, ilvl1 = 684, ilvl2 = 694 },
    --     { difficulty = 10, ilvl1 = 684, ilvl2 = 694 },
    --     { difficulty = 11, ilvl1 = 684, ilvl2 = 694 }
    -- },


   
    -- raidLoot = {
    --     { name = "LFR", ilvls = {671, 675, 678}, crestIdx = 1 },
    --     { name = PLAYER_DIFFICULTY1, ilvls = {684, 688, 691}, crestIdx = 2 },
    --     { name = PLAYER_DIFFICULTY2, ilvls = {697, 701, 704}, crestIdx = 3 },
    --     { name = PLAYER_DIFFICULTY6, ilvls = {710, 714, 717}, crestIdx = 4 }
    -- },

 

    
}
