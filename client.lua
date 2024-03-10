vRP = Proxy.getInterface("vRP")
local ped = false



-- Spawn Npc
Citizen.CreateThread(function() 
    if ped == false then 
        RequestModel(GetHashKey(Config.NpcPed)) 
            while not HasModelLoaded(Config.NpcPed) do
                Citizen.Wait(100) 
            end 
        local Hash = GetHashKey(Config.NpcPed)
        Ped = CreatePed(4, Hash, Config.NpcCoords.x, Config.NpcCoords.y, Config.NpcCoords.z -1,235.82000732422, false, true) 
        SetEntityHeading(Ped, 170.02000732422)
        FreezeEntityPosition(Ped, true) 
        SetEntityInvincible(Ped, true) 
        SetBlockingOfNonTemporaryEvents(Ped, true) 
        RequestAnimDict("anim@amb@world_human_valet@formal_right@base@")
            while not HasAnimDictLoaded("anim@amb@world_human_valet@formal_right@base@") do 
                Citizen.Wait(100) 
            end
        TaskPlayAnim(Ped, "anim@amb@world_human_valet@formal_right@base@", "base_a_m_y_vinewood_01", 8.0, 8.0, -1, 1, 0, 0, 0, 0) 
        ped = false
    end
end)
-- Menu
lib.registerContext({
    id = 'nt_jobcenter:menu',
    title = 'Jobcenter',
    options = {
      {
        title = 'Arbejdsløs',
        onSelect = function()
            TriggerServerEvent('nt_jobcenter:set_job', 'Arbejdsløs')
        end
      },
      {
        title = 'Burgershot Medarbejder',
        onSelect = function()
            TriggerServerEvent('nt_jobcenter:set_job', 'Burgershot Medarbejder')
        end
      },
      {
        title = 'Farmer',
        onSelect = function()
            TriggerServerEvent('nt_jobcenter:set_job', 'Farmer')
        end
      },
      {
        title = 'Kriminel',
        onSelect = function()
            TriggerServerEvent('nt_jobcenter:set_job', 'Kriminel')
        end
      },
      {
        title = 'Lastbilchauffør',
        onSelect = function()
            TriggerServerEvent('nt_jobcenter:set_job', 'Lastbilchauffør')
        end
      },
      {
        title = 'Miner',
        onSelect = function()
            TriggerServerEvent('nt_jobcenter:set_job', 'Miner')
        end
      },
      {
        title = 'Pizzabud',
        onSelect = function()
            TriggerServerEvent('nt_jobcenter:set_job', 'Pizzabud')
        end
      },
      {
        title = 'Skovhugger',
        onSelect = function()
            TriggerServerEvent('nt_jobcenter:set_job', 'Skovhugger')
        end
      },
      {
        title = 'Skraldemand',
        onSelect = function()
            TriggerServerEvent('nt_jobcenter:set_job', 'Skraldemand')
        end
      },
      {
        title = 'Taxi Chauffør',
        onSelect = function()
            TriggerServerEvent('nt_jobcenter:set_job', 'Taxi Chauffør')
        end
      },
    }
  })

-- Eye Target
exports.ox_target:addBoxZone({
	coords = vec3(Config.NpcCoords.x, Config.NpcCoords.y, Config.NpcCoords.z),
  size = vec3(0.7, 0.7, 2),
	debug = false,
	options = {
		{
            distance = 1.5,
			name = 'nt_jobcenter',
			icon = 'fa-regular fa-clipboard',
			label = 'Åben Jobcenter',
            onSelect = function()
                lib.showContext('nt_jobcenter:menu')
              end,
		}
	}
})