local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

function sendToDiscord(color, name, message, footer, webhook)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = footer,
              },
          }
      }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
  end

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","nt_jobcenter")

RegisterServerEvent('nt_jobcenter:set_job')
AddEventHandler('nt_jobcenter:set_job', function(job)
    local user_id = vRP.getUserId({source})
    if Config.Jobs[job] then
        vRP.addUserGroup({user_id,job})
        sendToDiscord(16753920, "[Notepad's Jobcenter]", "Spiller Id: ```"..user_id.."```\nJob:\n```"..job.."```", "Lavet af Notepad", Config.JobLogs)
    else
        sendToDiscord(16753920, "[Notepad's Jobcenter]", "**Han prøver at exploit dette script!**\nSpiller Id: ```"..user_id.."```\nJob:\n```"..job.."```", "Lavet af Notepad", Config.ExploitLogs)
    end
end)