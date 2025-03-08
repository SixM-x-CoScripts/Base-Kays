fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'matsy.dev'
description 'FlashBack Hud Style Reworked By matsy.dev'
version '1.0.0'

ui_page 'html/ui.html'

files {
	'html/style.css',
	'html/main.js',
	'html/ui.html',
}

shared_scripts {
	'@frwk/imports.lua',
	'@ox_lib/init.lua'
}

client_scripts {
	"stream/hud_reticle.gfx",
    "stream/minimap.gfx",
	'client.lua'
}