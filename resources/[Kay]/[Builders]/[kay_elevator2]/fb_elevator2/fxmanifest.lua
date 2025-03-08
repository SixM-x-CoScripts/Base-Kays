fx_version 'cerulean'
game 'gta5'
version '1.0.0'
lua54 "yes"

ui_page "html/index.html"

files {
	"html/build/css/*.css",
	"html/build/js/*.js",
    "html/build/images/*.svg",
	"html/*.html"
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/sv_elevator.lua'
}

client_scripts {
    'menu/menu.lua',
    'client/cl_elevator.lua'
}

escrow_ignore  {
    "menu/menu.lua",
    "sql/fb_elevator2.sql"
}