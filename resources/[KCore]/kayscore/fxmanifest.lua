fx_version 'cerulean'
game 'gta5'
author "kayscore"

lua54 'yes'


escrow_ignore {
    "fr.lua",
    "logs.lua",
    "peds.lua",
    "zones.lua",
    "config/**/**/*.lua",
    "config/**/*.lua",
    "config/Config.lua",
    "dist/modules/async/client/main.lua",
    'dist/modules/**/shared/*.lua',
    'dist/functions/functions.lua',
    'dist/modules/**/client/*.lua',
    'dist/modules/**/server/*.lua'
}

ui_page 'dist/UI/index.html'

files {
    'dist/UI/index.html',
    'dist/UI/*.css',
    'dist/UI/*.js',
    'dist/UI/images/*.png',
    'dist/UI/images/*.gif',
    'dist/UI/img/*.png',
    'dist/UI/img/*.svg',
    'dist/UI/img/*.webp',
    'dist/UI/sounds/*.ogg',
    'dist/UI/fonts/*.ttf'
}

shared_script '@ox_lib/init.lua'

shared_scripts {
    'strigger.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'config/Config.lua',
    'config/**/**/*.lua',
    'dist/modules/**/shared/*.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    '@frwk/locale.lua',
    "dist/RageUIv2/RMenu.lua",
    "dist/RageUIv2/menu/RageUI.lua",
    "dist/RageUIv2/menu/Menu.lua",
    "dist/RageUIv2/menu/MenuController.lua",
    "dist/RageUIv2/components/*.lua",
    "dist/RageUIv2/menu/elements/*.lua",
    "dist/RageUIv2/menu/items/*.lua",
    "dist/RageUIv2/menu/panels/*.lua",
    "dist/RageUIv2/menu/windows/*.lua",
    "config/safezone/*.lua",

    'dist/init/cl_esx.lua',
    'fr.lua',

    'dist/functions/functions.lua',
    'dist/modules/**/client/*.lua',
    'dist/modules/async/client/main.lua',
    
    'zones.lua',
   -- 'logs.lua',
    'peds.lua',
    'dist/UI/client/*.lua',
}

server_scripts {
    '@frwk/locale.lua',
    '@oxmysql/lib/MySQL.lua',
    'dist/init/sv_esx.lua',
    'fr.lua',
    'logs.lua',

    'dist/modules/**/server/*.lua',
    -- 'modules/Staff/shared/sv_admin.js',
    'dist/thread/thread.lua',

    'dist/UI/server/*.lua',

    'server.lua'


}

exports {
    'getBoutiquePoint',
    'cl_GetWeaponPerm',
    'sv_GetWeaponPerm',

}