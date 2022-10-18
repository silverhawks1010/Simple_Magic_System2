function SH_SMS.UpMana(ply)
    timer.Create(ply:SteamID64() .. "UpManaTimer", 60, 0, function()
        SH_SMS.SMSData["Mana"] = SH_SMS.SMSData["Mana"] + SH_SMS.ManaPerMinute

        SH_SMS.SaveData(ply)
    end)
end

function SH_SMS.ManaRegen(ply)
    timer.Create(ply:SteamID64(), SMS_Config.RegenTime, 0, function()
        
    end)
end