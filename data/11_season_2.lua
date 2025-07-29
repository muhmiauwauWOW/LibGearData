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
        { name = "weathered", currency = 3285 },
        { name = "carved", currency = 3287 },
        { name = "runed", currency = 3289 },
        { name = "gilded", currency = 3290 }
    },
    

    data = {
        [442] = {tracks = {{1, 1}}},
        [445] = {tracks = {{1, 2}}},
        [449] = {tracks = {{1, 3}}},
        [452] = {tracks = {{1, 4}}},
        [455] = {tracks = {{1, 5}, {2, 1}}},
        [458] = {tracks = {{1, 6}, {2, 2}}},
        [462] = {tracks = {{1, 7}, {2, 3}}},
        [465] = {tracks = {{1, 8}, {2, 4}}},
        [468] = {crest = 1, tracks = {{2, 5}, {3, 1}}},
        [471] = {crest = 1, tracks = {{2, 6}, {3, 2}}},
        [475] = {crest = 1, tracks = {{2, 7}, {3, 3}}},
        [478] = {crest = 1, tracks = {{2, 8}, {3, 4}}},
        [481] = {crest = 2, tracks = {{3, 5}, {4, 1}}},
        [484] = {crest = 2, tracks = {{3, 6}, {4, 2}}},
        [488] = {crest = 2, tracks = {{3, 7}, {4, 3}}},
        [491] = {crest = 2, tracks = {{3, 8}, {4, 4}}},
        [494] = {crest = 3, tracks = {{4, 5}, {5, 1}}},
        [497] = {crest = 3, tracks = {{4, 6}, {5, 2}}},
        [501] = {crest = 3, tracks = {{4, 7}, {5, 3}}},
        [504] = {crest = 3, tracks = {{4, 8}, {5, 4}}},
        [507] = {crest = 4, tracks = {{5, 5}, {6, 1}}},
        [510] = {crest = 4, tracks = {{5, 6}, {6, 2}}},
        [514] = {crest = 4, tracks = {{6, 3}}},
        [517] = {crest = 4, tracks = {{6, 4}}},
        [520] = {crest = 4, tracks = {{6, 5}}},
        [523] = {crest = 4, tracks = {{6, 6}}}
    }
}
