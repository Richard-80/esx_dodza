
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

p_smoke_location = {
	200279,
}

local IsActiveDodza = false

RegisterNetEvent("esx_dodza:start")
AddEventHandler("esx_dodza:start", function(source)
  local ped = GetPlayerPed(-1)
  local car = GetVehiclePedIsIn(ped)
  local model = GetEntityModel(car)

  for _,Vehicles in ipairs(Config.Vehicle) do
    if model == GetHashKey(Vehicles) and car ~= 0 then

      IsActiveDodza = true

      ESX.ShowNotification('~g~Dodza Faal Shod')

    end
  end
end)

RegisterNetEvent("esx_dodza:stop")
AddEventHandler("esx_dodza:stop", function()
    IsActiveDodza = false
end)

RegisterNetEvent("esx_dodza:reqdood")
AddEventHandler("esx_dodza:reqdood", function()
	if IsActiveDodza then
        local ped = PlayerPedId()
        TriggerServerEvent("esx_dodza:reqdood1", PedToNet(ped))	
    end
end)

RegisterNetEvent("esx_dodza:reqdood2")
AddEventHandler("esx_dodza:reqdood2", function(c_ped)
	for _,bones in pairs(p_smoke_location) do
		if DoesEntityExist(NetToPed(c_ped)) and not IsEntityDead(NetToPed(c_ped)) then

      createdSmoke = UseParticleFxAssetNextCall("core")
			createdPart = StartNetworkedParticleFxLoopedOnEntityBone("proj_grenade_smoke", NetToVeh(c_ped), 0.5, -2.4, 0.0, 0.0, 0.0, 0.0, GetPedBoneIndex(NetToVeh(c_ped), bones), Config.SmokeSize, 0.0, 0.0, 0.0)

      Wait(2800)

			while DoesParticleFxLoopedExist(createdSmoke) do
				StopParticleFxLooped(createdSmoke, 1)
			  Wait(0)
			end

			Wait(Config.SmokeTime * 1000)
			RemoveParticleFxFromEntity(NetToPed(c_ped))

      IsActiveDodza = false
		--	break

    end
  end
end)

RegisterNetEvent("esx_dodza:reqdood3")
AddEventHandler("esx_dodza:reqdood3", function(c_ped)
	for _,bones in pairs(p_smoke_location) do
		if DoesEntityExist(NetToPed(c_ped)) and not IsEntityDead(NetToPed(c_ped)) then

      createdSmoke = UseParticleFxAssetNextCall("core")
			createdPart = StartNetworkedParticleFxLoopedOnEntityBone("ent_amb_fbi_smoke_stair_gather", NetToVeh(c_ped), 0.5, -4.4, 1.0, 0.0, 0.0, 0.0, GetPedBoneIndex(NetToVeh(c_ped), bones), Config.SmokeSize2, 0.0, 0.0, 0.0)

      Wait(2800)

			while DoesParticleFxLoopedExist(createdSmoke) do
				StopParticleFxLooped(createdSmoke, 1)
			  Wait(0)
			end

			Wait(Config.SmokeTime * 1000)
			RemoveParticleFxFromEntity(NetToPed(c_ped))

      IsActiveDodza = false
		--	break

    end
  end
end)

RegisterNetEvent("esx_dodza:reqdood4")
AddEventHandler("esx_dodza:reqdood4", function(c_ped)
	for _,bones in pairs(p_smoke_location) do
		if DoesEntityExist(NetToPed(c_ped)) and not IsEntityDead(NetToPed(c_ped)) then

      createdSmoke = UseParticleFxAssetNextCall("core")
			createdPart = StartNetworkedParticleFxLoopedOnEntityBone("exp_grd_grenade_smoke", NetToVeh(c_ped), 0.5, -4.4, 1.0, 0.0, 0.0, 0.0, GetPedBoneIndex(NetToVeh(c_ped), bones), Config.SmokeSize2, 0.0, 0.0, 0.0)

      Wait(2800)

			while DoesParticleFxLoopedExist(createdSmoke) do
				StopParticleFxLooped(createdSmoke, 1)
			  Wait(0)
			end

			Wait(Config.SmokeTime * 1000)
			RemoveParticleFxFromEntity(NetToPed(c_ped))

      IsActiveDodza = false
		--	break

    end
  end
end)

RegisterNetEvent("esx_dodza:reqdood5")
AddEventHandler("esx_dodza:reqdood5", function(c_ped)
	for _,bones in pairs(p_smoke_location) do
		if DoesEntityExist(NetToPed(c_ped)) and not IsEntityDead(NetToPed(c_ped)) then

      createdSmoke = UseParticleFxAssetNextCall("core")
			createdPart = StartNetworkedParticleFxLoopedOnEntityBone("exp_grd_grenade_smoke", NetToVeh(c_ped), 0.5, -5.4, 1.0, 0.0, 0.0, 0.0, GetPedBoneIndex(NetToVeh(c_ped), bones), Config.SmokeSize2, 0.0, 0.0, 0.0)

      Wait(2800)

			while DoesParticleFxLoopedExist(createdSmoke) do
				StopParticleFxLooped(createdSmoke, 1)
			  Wait(0)
			end

			Wait(Config.SmokeTime * 1000)
			RemoveParticleFxFromEntity(NetToPed(c_ped))

      IsActiveDodza = false
		--	break

    end
  end
end)

RegisterNetEvent("esx_dodza:abuse2")
AddEventHandler("esx_dodza:abuse2", function(c_ped)	
  RemoveParticleFxFromEntity(NetToPed(c_ped))
end)

Citizen.CreateThread(function()
	while true do
    Citizen.Wait(5)

		if IsActiveDodza then
      local ped = GetPlayerPed(-1)
      local car = GetVehiclePedIsIn(ped)
      if car ~= 0 then

        if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1)), -1) == GetPlayerPed(-1) then

        if IsControlPressed(0, Config.DodKey) then

					TriggerEvent("esx_dodza:reqdood", 0)
        end
        Citizen.Wait(5)
      end
    end
  end
end
end)

Citizen.CreateThread(function()
	while true do
    Citizen.Wait(2500)
    local ped = GetPlayerPed(-1)
    local car = GetVehiclePedIsIn(ped)
    if car ~= 0 then
    else
      local ped2 = PlayerPedId()
      TriggerServerEvent("esx_dodza:abuse", PedToNet(ped2))
      IsActiveDodza = false
      Citizen.Wait(2500)
    end
  end
end)
