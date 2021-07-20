version '1.0.0'
author 'Dylan MALANDAIN'
description 'Sandbox resources.'
repository ''

fx_version 'adamant'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
    "src/Native.lua",
    "vendor/RageM.lua",
    "vendor/RageUI/src/RageUI.lua",
    "vendor/RageUI/src/Menu.lua",
    "vendor/RageUI/src/MenuController.lua",
    "vendor/RageUI/src/components/*.lua",
    "vendor/RageUI/src/elements/*.lua",
    "vendor/RageUI/src/items/*.lua",
    "vendor/RageUI/src/panels/*.lua",
    "vendor/RageUI/src/windows/*.lua",
    --"vendor/RageUI/example.lua",

    "src/enum/*.lua",
    "src/helpers/C*.lua",
    "src/C*.lua",
    "src/menus/Main.lua",
    "src/menus/world/*.lua",
    "src/menus/weapon/*.lua",
    "src/menus/mics/*.lua",
    "src/menus/player/*.lua",
    "src/menus/ipl/*.lua",
   -- "tests/C*.lua"
}

server_scripts {
    "src/helpers/S*.lua",
    "src/S*.lua",
}
