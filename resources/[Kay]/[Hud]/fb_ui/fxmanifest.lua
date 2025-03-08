fx_version "adamant"
game "gta5"

client_scripts {
	"client.lua"
}

ui_page "ui/ui.html"

files {
	"ui/*.css",
	"ui/*.js",
	"ui/*.html"
}

exports {
	"Show",
	"ShowSync",
	"IsVisible",
	"Hide"
}
