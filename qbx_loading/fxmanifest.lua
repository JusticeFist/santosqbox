fx_version 'cerulean'
game 'gta5'

description 'QBX_Loading'
repository 'https://github.com/Qbox-project/qbx_loading'
version '1.0'

client_script 'client/client.lua'

files {
    'html/assets/**',
    'html/*',
}

loadscreen {
    'html/index.html'
}
loadscreen_cursor 'yes'
loadscreen_manual_shutdown 'no'

lua54 'yes'
use_experimental_fxv2_oal 'yes'
