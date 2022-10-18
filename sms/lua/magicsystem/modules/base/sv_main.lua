function SH_SMS.PlayerSwepGive(ply)
    for k,v in pairs(SH_SMS.SMSData["Power"]) do
        for k,v in pairs(v["Spells"]) do
            if SH_SMS.SMSData["Mana"] >= v["ManaNeed"] do
                ply:Give(v["Name"])
            end
        end
    end
end

function SH_SMS.PlayerSpawn( ply )
    if not ply.SMSData then SH_SMS.InitializeData(ply) end

    timer.Simple(0.5, function()
        SH_SMS.PlayerSwepGive(ply)
    end)

end

function SH_SMS.PlayerDeath( ply )
    SH_SMS.SaveData(ply)
end



hook.Add("PlayerSpawn", "SMS_InitializeSpawn", SH_SMS.PlayerSpawn)
hook.Add("PlayerDeath", "SMS_InitializeDeath", SH_SMS.PlayerDeath)

print("[SMS] Scipt base has been loaded")



--[[
MagcID{
    Name = MagicName,
    Lootable = true/false,
    Rarity = RarityValue,
    Spells = {
        SpellID = {
            Name = "MagicName",
            Cost = CostNum,
            Weapons = Wep,
            ManaNeed = NerfMana

        }
    }
    
}



]]