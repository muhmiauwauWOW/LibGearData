-- Changeset für das Event analReceiving
local changeset = {
    -- Nur die zu ändernden Werte eintragen
    ["itemLevel"] = 450,
    ["quality"] = "epic",
    ["slot"] = "head",
}

-- Beispiel für analReceiving
local function analReceiving(item)
    for key, value in pairs(changeset) do
        item[key] = value
    end
    return item
end

-- Beispielaufruf
-- local myItem = {itemLevel = 400, quality = "rare", slot = "chest"}
-- local updatedItem = analReceiving(myItem)
-- print(updatedItem.itemLevel) -- 450
-- print(updatedItem.quality)   -- epic
-- print(updatedItem.slot)      -- head
