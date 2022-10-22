--[[-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------Power Gestion-----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]--

function SH_SMS.RollPower()
    local power = table.Random(SH_SMS.SellData)
    local chance = math.random(0, 100)

    if SH_SMS.SellData[power][rarity] <= chance then
        return power
    end
end

function SH_SMS.CreatePower(id, name, rarity, active)
    if !(SH_SMS.SellData[id] == nil) then return end

    local pattern = '[\\/:%*%?"<>|] ' -- a set of all restricted characters
    local start = string.find( id, pattern )
    if start ~= nil then return end

    SH_SMS.SellData[id] = {
        name = name,
        rarity = rarity,
        active = active,
        Spells = {}
    }
    SH_SMS.SaveSpells()
end

function SH_SMS.EditPower(powerid, key, newvalue)
    SH_SMS.SellData[powerid][key] = newvalue
    SH_SMS.SaveSpells()
end

function SH_SMS.GetAllMagicID()
    local magicid = {}
    for k,v in pairs(SH_SMS.SellData) do
        table.insert(magicid, k)
    end
    return magicid
end

--[[-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------Spell Gestion-----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]--

function SH_SMS.CreateSpell(powerid, id, name, weapon, rmana, cmana)
    if !(SH_SMS.SellData[id] == nil) then return end

    local pattern = '[\\/:%*%?"<>|] ' -- a set of all restricted characters
    local start = string.find( id, pattern )
    if start ~= nil then return end

    SH_SMS.SpellData[powerid]["Spells"][id] = {
        name = name,
        weapon = weapon,
        rmana = rmana,
        cmana = cmana
    }
    SH_SMS.SaveSpells()
end

function SH_SMS.EditSpell(powerid, spellid, key, newvalue)
    SH_SMS.SellData[powerid]["Spells"][spellid][key] = newvalue
    SH_SMS.SaveSpells()
end

--[[-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------Player Gestion-----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------]]--


function SH_SMS.AddPower(ply)
    if table.GetLastKey(ply.SMSData["Spells"]) >= SMS_Config.MaxPower then return end
    local power = SH_SMS.RollPower()
    table.insert(ply.SMSData, power)

    SH_SMS.SaveData(ply)
end

function SH_SMS.RemovePower(ply, powerid)
    table.RemoveByValue(ply.SMSData, powerid)
    SH_SMS.SaveData(ply)
end

function SH_SMS.RollPower(ply, powerid)
    local power = SH_SMS.RollPower()
    ply.SMSData[table.KeysFromValue(ply.SMSData, powerid)] = power
end