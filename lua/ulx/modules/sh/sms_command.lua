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

function ulx.CreatePower(calling_ply, target_ply, id, name, rarity, active)
	if !(id or name or rarity or active) then ULib.tsayError("Une information est manquante !") return end
	SH_SMS.CreatePower(id, name, rarity, active)
	target_ply:ChatPrint("Vous vennez de crée la magie suivante: " .. name .. " !")
end
local CreatePower = ulx.command("SMS Config", "ulx createpower", ulx.CreatePower, "!createpower")
CreatePower:addParam{type=ULib.cmds.PlayerArg}
CreatePower:addParam{type=ULib.cmds.StringArg, hint="id"}
CreatePower:addParam{type=ULib.cmds.StringArg, hint="name"}
CreatePower:addParam{type=ULib.cmds.NumArg, min=1, max=100, hint="rarity"}
CreatePower:addParam{type=ULib.cmds.BoolArg, hint="active"}
CreatePower:defaultAccess(ULib.ACCESS_SUPERADMIN )
CreatePower:help("Create a new power.")

function ulx.CreateSpell(calling_ply, target_ply, powerid, id, name, weapon, rmana, cmana)
	if !(id or name or weapon or rmana or cmana or spellid) then ULib.tsayError("Une information est manquante !") return end
	SH_SMS.CreateSpell(powerid, id, name, weapon, rmana, cmana)
	target_ply:ChatPrint("Vous vennez de reçevoir crée le sort suivant: " .. name .. " !")
end
local CreateSpell = ulx.command("SMS Config", "ulx createspell", ulx.CreateSpell, "!createspell")
CreateSpell:addParam{type=ULib.cmds.PlayerArg}
CreateSpell:addParam{type=ULib.cmds.StringArg, hint="powerid", completes=SH_SMS.GetAllMagicID()}
CreateSpell:addParam{type=ULib.cmds.StringArg, hint="id"}
CreateSpell:addParam{type=ULib.cmds.StringArg, hint="name"}
CreateSpell:addParam{type=ULib.cmds.StringArg, hint="weapon"}
CreateSpell:addParam{type=ULib.cmds.NumArg, hint="rmana"}
CreateSpell:addParam{type=ULib.cmds.NumArg, hint="cmana"}
CreateSpell:defaultAccess(ULib.ACCESS_SUPERADMIN )
CreateSpell:help("Create a new spell.")