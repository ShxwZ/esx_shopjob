resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX ShopJob - By ShxwZ'


version '1.0.1'

server_scripts {
  '@es_extended/locale.lua',
  'locales/es.lua',
  '@mysql-async/lib/MySQL.lua',
  'config.lua',
  'server/main.lua'
}

client_scripts {
  '@es_extended/locale.lua',
  'locales/es.lua',
  'config.lua',
  'client/main.lua'
}

-- By ShxwZ (https://github.com/ShxwZ)
-- Shaw#5926