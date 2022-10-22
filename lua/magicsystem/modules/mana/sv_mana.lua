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

hook.Add("KeyPress", "ManaUse", function( ply, key)
    if ply.Cooldown == nil then ply.Cooldown = CurTime() end
    if ply.Cooldown <= CurTime() then
        ply.Cooldown = CurTime() + 0.1
		if key == IN_ATTACK || key == IN_ATTACK2 then
			if ply:Alive() && ply:GetActiveWeapon() then
				if table.HasValue(SMS_Config.MagieWeapon, ply:GetActiveWeapon():GetClass() ) then
                    for i=2, #SMS_Config.MagieTable[ply.MagicData["SMS_Magie_Number"]] do
						if ply:GetActiveWeapon():GetClass() == SMS_Config.MagieTable[ply.MagicData["SMS_Magie_Number"]][i][1] then
                            SMS_Main.Energyuse(ply, SMS_Config.MagieTable[ply.MagicData["SMS_Magie_Number"]][i][2])
						end
					end                    
                end
            end
		end
	end
end)