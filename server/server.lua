local cooldown = {}

RegisterCommand('dod', function (source)
    TriggerClientEvent("esx_dodza:start", source, 0)
end)

RegisterCommand('sdod', function (source)
    TriggerClientEvent("esx_dodza:stop", source, 0)
	TriggerEvent('esx_dodza:abuse', source)
end)

RegisterServerEvent("esx_dodza:reqdood1")
AddEventHandler("esx_dodza:reqdood1", function(entity)
	local _source = source
	if cooldown[source] then
		if os.time() - cooldown[source] <= Config.Cooldown then
			TriggerClientEvent('esx:showNotification', _source, '~r~Ta Dodza Badi ~b~' ..Config.Cooldown / 60 ..'~r~ Min' )
		  return
		else
		  cooldown[source] = os.time()
		end
	  else
		cooldown[source] = os.time()
	  end
	TriggerClientEvent("esx_dodza:reqdood2", -1, entity)
	TriggerClientEvent("esx_dodza:reqdood3", -1, entity)
	TriggerClientEvent("esx_dodza:reqdood4", -1, entity)
	TriggerClientEvent("esx_dodza:reqdood5", -1, entity)
end)

RegisterServerEvent("esx_dodza:abuse")
AddEventHandler("esx_dodza:abuse", function(entity)
	TriggerClientEvent("esx_dodza:abuse2", -1, entity)
end)

