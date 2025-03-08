fx_version "adamant"
games {"gta5", "rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

ui_page "html/ui.html"

files {
	"html/*",
	"html/**/*",
}

lua54 'yes'
-- TODO use_experimental_fxv2_oal 'yes'

escrow_ignore {
    'server/**/*.lua',
}