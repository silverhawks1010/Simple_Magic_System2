if SMS_Config.UseULX then

		function ulx.setMana(calling_ply, target_ply, mana)
	   		if not mana then ULib.tsayError("Mana not specified!") return end
			target_ply.MagicData["SMS_Mana"] = math.floor( mana )
			target_ply.Mana = target_ply.MagicData["SMS_Mana"]
			SMS_Data.SaveData()
			net.Start("SendToClientMana")
			net.WriteString(target_ply.Mana)
			net.Send(target_ply)
			target_ply:ChatPrint("Votre mana a été modifier pour une valeur de " .. mana .. " mana !")
			calling_ply:ChatPrint("Vous vennez de modifier le mana de " .. target_ply:Nick() .. " pour une valeur de ".. mana .." mana !")
		end
		local setMana = ulx.command("SimpleMagicSystem", "ulx setmana", ulx.setMana, "!setmana")
		setMana:addParam{type=ULib.cmds.PlayerArg}
		setMana:addParam{type=ULib.cmds.NumArg, hint="mana"}
		setMana:defaultAccess(ULib.ACCESS_SUPERADMIN )
		setMana:help("Set a players Mana.")

		function ulx.addMana(calling_ply, target_ply, mana)
	    	if not mana then ULib.tsayError("Mana not specified!") return end
	        target_ply.MagicData["SMS_Mana"] = math.floor( target_ply.MagicData["SMS_Mana"] + mana )
	        target_ply.Mana = target_ply.MagicData["SMS_Mana"]
			SMS_Data.SaveData()
			net.Start("SendToClientMana")
			net.WriteString(target_ply.Mana)
			net.Send(target_ply)
			target_ply:ChatPrint("Vous vennez de reçevoir " .. mana .. " de mana en plus !")
			calling_ply:ChatPrint("Vous vennez d'ajouter " .. mana .. " mana à ".. target_ply:Nick() .." !")
		end
		local addMana = ulx.command("SimpleMagicSystem", "ulx addmana", ulx.addMana, "!addmana")
		addMana:addParam{type=ULib.cmds.PlayerArg}
		addMana:addParam{type=ULib.cmds.NumArg, hint="mana"}
		addMana:defaultAccess(ULib.ACCESS_SUPERADMIN )
		addMana:help("Set a players Mana.")

		function ulx.AddReroll(calling_ply, target_ply, reroll)
	    if not reroll then ULib.tsayError("Alter not specified!") return end
			target_ply.MagicData["SMS_ReRoll"] = target_ply.MagicData["SMS_ReRoll"] + reroll
	        SMS_Data.SaveData()
			target_ply:ChatPrint("Vous vennez de reçevoir " .. reroll .. " reroll !")
			calling_ply:ChatPrint("Vous vennez d'envoyer " .. reroll .. " reroll à ".. target_ply:Nick() .." !")
		end
		local AddReroll = ulx.command("SimpleMagicSystem", "ulx addreroll", ulx.AddReroll, "!addreroll")
		AddReroll:addParam{type=ULib.cmds.PlayerArg}
		AddReroll:addParam{type=ULib.cmds.NumArg, hint="reroll"}
		AddReroll:defaultAccess(ULib.ACCESS_SUPERADMIN )
		AddReroll:help("Add a player Reroll.")


		function ulx.PlayerInfo(calling_ply, target_ply)
			if IsValid(calling_ply) then
			calling_ply:ChatPrint("---------------------------------------------------------")
			calling_ply:ChatPrint("Information de " .. target_ply:Nick())
			calling_ply:ChatPrint("---------------------------------------------------------")
			calling_ply:ChatPrint("Magie: " .. SMS_Config.MagieTable[target_ply.MagicData["SMS_Magie_Number"]][1])
			calling_ply:ChatPrint("Mana: " .. target_ply.MagicData["SMS_Mana"])
			calling_ply:ChatPrint("ReRoll: " .. target_ply.MagicData["SMS_ReRoll"])
			calling_ply:ChatPrint("---------------------------------------------------------")
			else
				print("---------------------------------------------------------")
				print("Information de " .. target_ply:Nick())
				print("---------------------------------------------------------")
				print("Magie: " .. SMS_Config.MagieTable[target_ply.MagicData["SMS_Magie_Number"]][1])
				print("Mana: " .. target_ply.MagicData["SMS_Mana"])
				print("ReRoll: " .. target_ply.MagicData["SMS_ReRoll"])
				print("---------------------------------------------------------")
			end
		end
		local PlayerInfo = ulx.command("SimpleMagicSystem", "ulx playerinfo", ulx.PlayerInfo, "!playerinfo")
		PlayerInfo:addParam{type=ULib.cmds.PlayerArg}
		PlayerInfo:defaultAccess(ULib.ACCESS_ADMIN )
		PlayerInfo:help("Get player info.")

		print("Ulx Command loaded")
end
