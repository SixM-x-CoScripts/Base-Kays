fx_version "adamant"
game "gta5"
lua54 "yes"
client_scripts {
	"client.lua"
}

ui_page "ui/ui.html"

files {
	"ui/*.css",
	"ui/*.js",
	"ui/*.html"
}

escrow_ignore  {
    "client.lua"
}

exports {
	"Show",
	"ShowSync",
	"IsVisible",
	"Hide"
}
