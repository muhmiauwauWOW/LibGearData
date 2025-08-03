# LibGearData

LibGearData is a World of Warcraft library that models item level upgrades, track systems, and crest requirements for Dragonflight seasons. It provides a unified API for addons to query and process item levels, upgrades, tracks, and crests.

## Features
- Query item level tracks and upgrades
- Crest requirements for upgrades
- Support for multiple seasons and expansions
- Localization for track and crest names
- API for dungeon, raid, and delves loot

## Installation
1. Copy the `LibGearData` directory into your addon folder.
2. Include the library in your addon:
   ```lua
   local LibGearData = LibStub("LibGearData-1.0")
   ```

## API Overview

### Season & Expansion
- `LibGearData:SetSeason(season, expansion)`
  - Activates a specific season and expansion.
  - Returns: Instance with data for the selected season.

- `LibGearData:GetCurrentSeason()`
  - Returns the currently active season.

- `LibGearData:GetSeasons()`
  - Returns all available seasons.

### Itemlevel & Tracks
- `LibGearData:GetTracksByItemLevel(ilvl)`
  - Returns the tracks for a specific item level.

- `LibGearData:GetTracks()`
  - Returns all tracks for the current season.

- `LibGearData:GetTrack(trackIdentifier)`
  - Returns track details by name or index.

- `LibGearData:GetTrackNames()`
  - Returns all track names.

### Upgrades
- `LibGearData:GetUpgradeOptions(ilvl)`
  - Returns all upgrade options for an item level.

- `LibGearData:GetNextUpgrade(ilvl)`
  - Returns the next possible upgrade for an item level.

- `LibGearData:GetMaxUpgrade(ilvl, trackName)`
  - Returns the maximum upgrade for an item level and track.

- `LibGearData:IsValidUpgrade(fromIlvl, toIlvl)`
  - Checks if an upgrade is possible.

- `LibGearData:CanUpgradeWithCrest(ilvl, crestName)`
  - Checks if an upgrade is possible with a specific crest.

### Crests
- `LibGearData:GetCrests()`
  - Returns all available crests.

- `LibGearData:GetCrest(crestName)`
  - Returns crest details for a given name.

- `LibGearData:GetCrestNames()`
  - Returns all crest names.

- `LibGearData:GetCrestByItemLevel(ilvl)`
  - Returns the required crest for an item level.

- `LibGearData:GetRequiredCrest(fromIlvl, toIlvl)`
  - Returns the crest required for an upgrade.

### Loot Lists
- `LibGearData:GetDungeonLootList()`
  - Returns the dungeon loot list.

- `LibGearData:GetRaidLootList()`
  - Returns the raid loot list.

- `LibGearData:GetDelvesLootList()`
  - Returns the delves loot list.

### Miscellaneous
- `LibGearData:GetItemLevels(trackName)`
  - Returns all item levels for a track.

- `LibGearData:GetItemLevelsWithCrest(crestName)`
  - Returns all item levels that require a specific crest.

- `LibGearData:GetTrackRank(ilvl)`
  - Returns track and rank for an item level.

- `LibGearData:GetTrackName(trackName)`
  - Returns the localized name of a track.

- `LibGearData:GetCrestName(crestName)`
  - Returns the localized name of a crest.

- `LibGearData:GetData(typ)`
  - Returns the raw data for a type (e.g. "dungeons", "raid").

## Example
```lua
local LibGearData = LibStub("LibGearData-1.0")
local tracks = LibGearData:GetTracksByItemLevel(681)
local crest = LibGearData:GetCrestByItemLevel(681)
print("Tracks:", tracks)
print("Crest:", crest)
```

## License
MIT
