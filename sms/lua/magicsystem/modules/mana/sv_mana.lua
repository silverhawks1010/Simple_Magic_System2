function SH_SMS.UpMana(ply)
    timer.Create(ply:SteamID64() .. "UpManaTimer", 60, 0, function()
        SH_SMS.SMSData["Mana"] = SH_SMS.SMSData["Mana"] + SH_SMS.ManaPerMinute

        SH_SMS.SaveData(ply)
    end)
end

function SH_SMS.ManaRegen(ply)
    ply.NoRegen = ply.NoRegen or CurTime()
    ply.Mana = ply.Mana = or SH_SMS.SMSData["Mana"]
    
    timer.Create(ply:SteamID64(), SMS_Config.RegenTime, 0, function()
        if ply.NoRegen <= CurTime() then
            if ply.Mana < SH_SMS.SMSData["Mana"] then
                ply.Mana = ply.Mana + SH_SMS.SMSData["Mana"]/SMS_Config.RegenPercent
                if ply.Mana > SH_SMS.SMSData["Mana"] then
                    ply.Mana = SH_SMS.SMSData["Mana"]
                end
            end
        end
    end)
end