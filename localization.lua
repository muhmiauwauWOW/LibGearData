local _, ns = ...
local L = {}

-- Get current locale
local locale = GetLocale()

-- Default English translations
L["Explorer"] = "Explorer"
L["Adventurer"] = "Adventurer" 
L["Veteran"] = "Veteran"
L["Champion"] = "Champion"
L["Hero"] = "Hero"
L["Myth"] = "Myth"

-- German translations
if locale == "deDE" then
    L["Explorer"] = "Erkunder"
    L["Adventurer"] = "Abenteurer"
    L["Veteran"] = "Veteran"
    L["Champion"] = "Champion"
    L["Hero"] = "Held"
    L["Myth"] = "Mythisch"
    
-- French translations
elseif locale == "frFR" then
    L["Explorer"] = "Explorateur"
    L["Adventurer"] = "Aventurier"
    L["Veteran"] = "Vétéran"
    L["Champion"] = "Champion"
    L["Hero"] = "Héros"
    L["Myth"] = "Mythique"
    
-- Spanish translations
elseif locale == "esES" or locale == "esMX" then
    L["Explorer"] = "Explorador"
    L["Adventurer"] = "Aventurero"
    L["Veteran"] = "Veterano"
    L["Champion"] = "Campeón"
    L["Hero"] = "Héroe"
    L["Myth"] = "Mítico"
    
-- Italian translations
elseif locale == "itIT" then
    L["Explorer"] = "Esploratore"
    L["Adventurer"] = "Avventuriero"
    L["Veteran"] = "Veterano"
    L["Champion"] = "Campione"
    L["Hero"] = "Eroe"
    L["Myth"] = "Mitico"
    
-- Portuguese translations
elseif locale == "ptBR" then
    L["Explorer"] = "Explorador"
    L["Adventurer"] = "Aventureiro"
    L["Veteran"] = "Veterano"
    L["Champion"] = "Campeão"
    L["Hero"] = "Herói"
    L["Myth"] = "Mítico"
    
-- Russian translations
elseif locale == "ruRU" then
    L["Explorer"] = "Исследователь"
    L["Adventurer"] = "Искатель приключений"
    L["Veteran"] = "Ветеран"
    L["Champion"] = "Чемпион"
    L["Hero"] = "Герой"
    L["Myth"] = "Мифический"
    
-- Korean translations
elseif locale == "koKR" then
    L["Explorer"] = "탐험가"
    L["Adventurer"] = "모험가"
    L["Veteran"] = "베테랑"
    L["Champion"] = "챔피언"
    L["Hero"] = "영웅"
    L["Myth"] = "신화"
    
-- Chinese Simplified translations
elseif locale == "zhCN" then
    L["Explorer"] = "探索者"
    L["Adventurer"] = "冒险者"
    L["Veteran"] = "老兵"
    L["Champion"] = "勇士"
    L["Hero"] = "英雄"
    L["Myth"] = "神话"
    
-- Chinese Traditional translations
elseif locale == "zhTW" then
    L["Explorer"] = "探索者"
    L["Adventurer"] = "冒險者"
    L["Veteran"] = "老兵"
    L["Champion"] = "勇士"
    L["Hero"] = "英雄"
    L["Myth"] = "傳說"
end

ns.L = L
