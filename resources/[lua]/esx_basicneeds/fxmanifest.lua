fx_version 'adamant'

game 'gta5'

description 'Adds a Hunger & Thrist system'
lua54 'yes'
version '1.0'
legacyversion '1.9.1'

shared_script '@frwk/imports.lua'

server_scripts {
    '@frwk/locale.lua',
    'locales/*.lua',
    'config.lua',
    'server/main.lua'
}

client_scripts {
    '@frwk/locale.lua',
    'locales/*.lua',
    'config.lua',
    'client/main.lua'
}

dependencies {
    'frwk',
    'esx_status'
}


ui_page "html/ui.html"

files {
	"html/*",
	"html/**/*",
}

dependency '/assetpacks'