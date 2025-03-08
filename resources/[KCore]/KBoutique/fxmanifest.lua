fx_version 'adamant'
game 'gta5'
lua54 'yes'

shared_scripts {"config/*.lua"}

client_scripts {
    "client/main.lua",
	"client/functions.lua",
}

server_scripts {
	"@oxmysql/lib/MySQL.lua",
	"server/main.lua",
	"server/functions.lua",
}

ui_page "ui/index.html"

files {
	"ui/index.html",
	"ui/main.js",
	"ui/main.css",
	"ui/font/**",
	"ui/img/**",
}

escrow_ignore {
	"config/*.lua",
	"client/functions.lua",
	"server/functions.lua",
}server_scripts { '@oxmysql/lib/MySQL.lua' }
dependency '/assetpacks'