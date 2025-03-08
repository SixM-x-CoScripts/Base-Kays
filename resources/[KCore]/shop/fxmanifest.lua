fx_version 'adamant'

game 'gta5'
author "Kay"
description 'Slide Shop UI'

lua54 'yes'

client_script 'client/main.lua'
server_script {
    '@oxmysql/lib/MySQL.lua',

    'server/main.lua',
}

files {
    'dist/index.html',
    'dist/styles.css',
    'dist/scripts.js',
    'dist/assets/*.png'
}

ui_page 'dist/index.html'

shared_script 'shared/config.lua'

exports {
    'OpenShop'
}