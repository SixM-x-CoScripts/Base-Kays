fx_version "cerulean"
game "gta5"

lua54 "yes"

author "kayscore"

ui_page 'index.html'

this_is_a_map "yes"

shared_script 'strigger.lua'

escrow_ignore {
    "src/shared/Config.lua"
}

files {
    "*.html",
    "assets/*.css",
    "assets/*.js",
    "assets/external/*.mp3",
    "assets/external/*.png",
    "assets/fonts/*.ttf",
}

shared_script '@ox_lib/init.lua'

shared_scripts {
    'src/shared/Config.lua'
}

client_scripts {
    'rage/RMenu.lua',
    'rage/menu/RageUI.lua',
    'rage/menu/Menu.lua',
    'rage/menu/MenuController.lua',
    'rage/components/*.lua',
    'rage/menu/elements/*.lua',
    'rage/menu/items/*.lua',
    'rage/menu/panels/*.lua',
    'rage/menu/windows/*.lua',
    -- RageUI Basic
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",
    "RageUI/components/*.lua",
    "RageUI/menu/elements/*.lua",
    "RageUI/menu/items/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/windows/*.lua",
    -- RageUI Custom 
    'lib/blips.lua',
    'lib/informations.lua',
    'src/client/**/*.lua',
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    'src/server/**/*.lua'
}
dependency '/assetpacks'