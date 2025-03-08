fx_version("cerulean")
game("gta5")

lua54 "yes"

ui_page("ui.html")

files {"ui.html"}

shared_script {
	'@frwk/locale.lua',
}

client_scripts {
	"client/*.lua",
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
	"server/*.lua",
    "config.lua",
}

escrow_ignore {
    "config.lua",
}
dependency '/assetpacks'