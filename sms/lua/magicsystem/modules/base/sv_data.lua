if not file.Exists( "magicsystem", "DATA" ) then
	file.CreateDir( "magicsystem" )
end

function SH_SMS.InitializeData( ply )
    local SteamID64 = ply:SteamID64()
    if not file.Exists( "magicsystem/".. SteamID64 ..".txt", "DATA" ) then
            local Data = {
                Power = {},
                Mana = SMS_Config.DefaultMana,
                Reroll = SMS_Config.DefaultReroll

            }
        file.Write("magicsystem/" .. SteamID64 .. ".txt", util.TableToJSON(Data))
        ply.SaveData = Data
        SH_SMS.SaveData(ply)
    else
        local Data = util.JSONToTable(file.Read("magicsystem/".. SteamID64 ..".txt", "DATA"))
        ply.SaveData = Data
        SH_SMS.SaveData(ply)
    end

    SH_SMS.PlayerSwepGive( ply )
end

function SH_SMS.SaveData(ply)
    if not IsValid(ply) then return end
    file.Write("magicsystem/" .. ply:SteamID64() .. ".txt", util.TableToJSON(ply.SaveData))

    net.Start("SendToClient")
    net.WriteTable(ply.SaveData)
    net.Send(ply)
end


print("[SMS] Data has been loaded")
