fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Notepad'
description 'Jobcenter | Notepad'

shared_scripts {
    '@ox_lib/init.lua',
}

client_scripts {
    'lib/Tunnel.lua',
    'lib/Proxy.lua',
    'Config.lua',
    'client.lua'
}

server_scripts {
    '@vrp/lib/utils.lua',
    'Config.lua',
    'server.lua'
}