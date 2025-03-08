fx_version 'adamant'
game 'gta5'

author 'xmr'
description 'https://discord.gg/fiveui'

lua54 'yes'
version '1.0.0'

escrow_ignore {
    'config.lua',
}

client_scripts {
    'config.lua',
	'client/main.lua',
    'client/client_hook.lua',
}

server_scripts {
    'config.lua',
    'server/server_hook.lua',
	'server/main.lua',
	-- 'server/server.lua',
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
    'html/app.css',
    'html/app.js',
    'html/*.png',
    'html/*.otf',
    'html/images/*.png'
}