fx_version 'bodacious'
game 'gta5' 
author "kayscore"
lua54 'yes'


escrow_ignore {
    "Config.lua"
}

ui_page 'web/index.html'
files {
    'web/**'
}

client_script {
    'init.lua',
    'client.lua',
    'charCreator.lua',
    'cl_charCreate.lua',
    'clotheshop.lua',
    'accessoriesShop.lua',
    'hairshop.lua',
    'makeup.lua',
    "modules/**/shared/*.lua",
    "modules/**/client/*.lua",
    'Config.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "modules/**/shared/*.lua",
    "sv_charCreator.lua",
    'Config.lua',
}

exports {
    "isInInterface",
    'draw',
    "isInInventory",
}

shared_scripts {
    'Config.lua',
}

