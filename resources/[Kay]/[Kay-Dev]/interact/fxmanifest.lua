fx_version("cerulean")
game("gta5")

lua54 "yes"

ui_page("html/ui.html")

files {
    "html/**",
}


client_scripts {
	"client/*.lua",
}


exports {
    "ShowHelpNotification",
}
