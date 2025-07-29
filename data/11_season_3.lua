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

    

    dungeonLoot = {
        { difficulty = PLAYER_DIFFICULTY2, ilvl1 = 665, ilvl2 = 678, crestIdx = 1 },
        { difficulty = PLAYER_DIFFICULTY6, ilvl1 = 681, ilvl2 = 691, crestIdx = 2 },
        { difficulty = 2, ilvl1 = 684, ilvl2 = 694, crestIdx = 3, crestAmount = 10 },
        { difficulty = 3, ilvl1 = 684, ilvl2 = 694, crestIdx = 3, crestAmount = 12 },
        { difficulty = 4, ilvl1 = 688, ilvl2 = 697, crestIdx = 3, crestAmount = 14 },
        { difficulty = 5, ilvl1 = 691, ilvl2 = 697, crestIdx = 3, crestAmount = 16 },
        { difficulty = 6, ilvl1 = 694, ilvl2 = 701, crestIdx = 3, crestAmount = 18 },
        { difficulty = 7, ilvl1 = 694, ilvl2 = 704, crestIdx = 4, crestAmount = 10 },
        { difficulty = 8, ilvl1 = 697, ilvl2 = 704, crestIdx = 4, crestAmount = 12 },
        { difficulty = 9, ilvl1 = 697, ilvl2 = 704, crestIdx = 4, crestAmount = 14 },
        { difficulty = 10, ilvl1 = 701, ilvl2 = 707, crestIdx = 4, crestAmount = 16 },
        { difficulty = 11, ilvl1 = 701, ilvl2 = 707, crestIdx = 4, crestAmount = 18 },
        { difficulty = "12+", ilvl1 = 701, ilvl2 = 707, crestIdx = 4, crestAmount = 20 }
    },

    delvesLoot = {
        { difficulty = 1, ilvl1 = 655, ilvl2 = 655 },
        { difficulty = 2, ilvl1 = 658, ilvl2 = 668 },
        { difficulty = 3, ilvl1 = 662, ilvl2 = 671 },
        { difficulty = 4, ilvl1 = 665, ilvl2 = 681 },
        { difficulty = 5, ilvl1 = 668, ilvl2 = 684 },
        { difficulty = 6, ilvl1 = 671, ilvl2 = 691 },
        { difficulty = 7, ilvl1 = 681, ilvl2 = 691 },
        { difficulty = 8, ilvl1 = 684, ilvl2 = 694 },
        { difficulty = 9, ilvl1 = 684, ilvl2 = 694 },
        { difficulty = 10, ilvl1 = 684, ilvl2 = 694 },
        { difficulty = 11, ilvl1 = 684, ilvl2 = 694 }
    },

    raidLoot = {
        { name = "LFR", ilvl1 = 671, ilvl2 = 675, ilvl3 = 678, crestIdx = 1 },
        { name = "Normal", ilvl1 = 684, ilvl2 = 688, ilvl3 = 691, crestIdx = 2 },
        { name = "Heroic", ilvl1 = 697, ilvl2 = 701, ilvl3 = 704, crestIdx = 3 },
        { name = "Mythic", ilvl1 = 710, ilvl2 = 714, ilvl3 = 717, crestIdx = 4 }
    }

    
}
