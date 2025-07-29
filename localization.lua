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

L["weathered"] = "Weathered"
L["carved"] = "Carved"
L["runed"] = "Runed"
L["gilded"] = "Gilded"

-- German translations
if locale == "deDE" then
    L["Explorer"] = "Erkunder"
    L["Adventurer"] = "Abenteurer"
    L["Veteran"] = "Veteran"
    L["Champion"] = "Champion"
    L["Hero"] = "Held"
    L["Myth"] = "Mythisch"
    
    L["weathered"] = "Verwittert"
    L["carved"] = "Geschnitzt"
    L["runed"] = "Runenverziert"
    L["gilded"] = "Vergoldet"

-- French translations
elseif locale == "frFR" then
    L["Explorer"] = "Explorateur"
    L["Adventurer"] = "Aventurier"
    L["Veteran"] = "Vétéran"
    L["Champion"] = "Champion"
    L["Hero"] = "Héros"
    L["Myth"] = "Mythique"
    
    L["weathered"] = "Altéré"
    L["carved"] = "Sculpté"
    L["runed"] = "Runique"
    L["gilded"] = "Doré"

-- Spanish translations
elseif locale == "esES" or locale == "esMX" then
    L["Explorer"] = "Explorador"
    L["Adventurer"] = "Aventurero"
    L["Veteran"] = "Veterano"
    L["Champion"] = "Campeón"
    L["Hero"] = "Héroe"
    L["Myth"] = "Mítico"
    
    L["weathered"] = "Deteriorado"
    L["carved"] = "Tallado"
    L["runed"] = "Rúnico"
    L["gilded"] = "Dorado"

-- Italian translations
elseif locale == "itIT" then
    L["Explorer"] = "Esploratore"
    L["Adventurer"] = "Avventuriero"
    L["Veteran"] = "Veterano"
    L["Champion"] = "Campione"
    L["Hero"] = "Eroe"
    L["Myth"] = "Mitico"
    
    L["weathered"] = "Logorato"
    L["carved"] = "Intagliato"
    L["runed"] = "Runico"
    L["gilded"] = "Dorato"

-- Portuguese translations
elseif locale == "ptBR" then
    L["Explorer"] = "Explorador"
    L["Adventurer"] = "Aventureiro"
    L["Veteran"] = "Veterano"
    L["Champion"] = "Campeão"
    L["Hero"] = "Herói"
    L["Myth"] = "Mítico"
    
    L["weathered"] = "Desgastado"
    L["carved"] = "Entalhado"
    L["runed"] = "Rúnico"
    L["gilded"] = "Dourado"

-- Russian translations
elseif locale == "ruRU" then
    L["Explorer"] = "Исследователь"
    L["Adventurer"] = "Искатель приключений"
    L["Veteran"] = "Ветеран"
    L["Champion"] = "Чемпион"
    L["Hero"] = "Герой"
    L["Myth"] = "Мифический"
    
    L["weathered"] = "Выветренный"
    L["carved"] = "Резной"
    L["runed"] = "Рунический"
    L["gilded"] = "Позолоченный"

-- Korean translations
elseif locale == "koKR" then
    L["Explorer"] = "탐험가"
    L["Adventurer"] = "모험가"
    L["Veteran"] = "베테랑"
    L["Champion"] = "챔피언"
    L["Hero"] = "영웅"
    L["Myth"] = "신화"
    
    L["weathered"] = "풍화된"
    L["carved"] = "조각된"
    L["runed"] = "룬"
    L["gilded"] = "금박"

-- Chinese Simplified translations
elseif locale == "zhCN" then
    L["Explorer"] = "探索者"
    L["Adventurer"] = "冒险者"
    L["Veteran"] = "老兵"
    L["Champion"] = "勇士"
    L["Hero"] = "英雄"
    L["Myth"] = "神话"
    
    L["weathered"] = "风化"
    L["carved"] = "雕刻"
    L["runed"] = "符文"
    L["gilded"] = "镀金"

-- Chinese Traditional translations
elseif locale == "zhTW" then
    L["Explorer"] = "探索者"
    L["Adventurer"] = "冒險者"
    L["Veteran"] = "老兵"
    L["Champion"] = "勇士"
    L["Hero"] = "英雄"
    L["Myth"] = "傳說"
    
    L["weathered"] = "風化"
    L["carved"] = "雕刻"
    L["runed"] = "符文"
    L["gilded"] = "鍍金"
end

ns.L = L
