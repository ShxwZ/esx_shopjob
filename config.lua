Config                            = {} -- No tocar
-- By ShxwZ (https://github.com/ShxwZ)
-- Shaw#5926
--================================================================
-- Markers (Puntos) ajustes generales
--================================================================

Config.DrawDistance               = 100.0
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }

--================================================================
-- Markers (Puntos) Especificos
--================================================================

-- Armario

Config.MarkerTypeArmario		   = 29 -- Tipo (https://docs.fivem.net/docs/game-references/markers/)
Config.MarkerColorArmario          = { r = 0, g = 254, b = 36 } -- Color (R, G, B)

-- Vehiculos

Config.MarkerTypeVehiculos		    = 39 -- Tipo (https://docs.fivem.net/docs/game-references/markers/)
Config.MarkerColorVehiculos         = { r = 0, g = 254, b = 0 } -- Color (R, G, B)

-- Garaje

Config.MarkerTypeGaraje		     = 39 -- Tipo (https://docs.fivem.net/docs/game-references/markers/)
Config.MarkerColorGaraje         = { r = 255, g = 0, b = 0 } -- Color (R, G, B)

-- Jefe

Config.MarkerTypeJefe		    = 22 -- Tipo (https://docs.fivem.net/docs/game-references/markers/)
Config.MarkerColorJefe          = { r = 0, g = 254, b = 135 } -- Color (R, G, B)

--================================================================
-- Configuración de los vehiculos
--================================================================

Config.modEngine = 2 -- Motor
Config.modBrakes = 2 -- Frenos
Config.modTransmission = 2  -- Transmisión
Config.modSuspension = 2 -- Suspensión
Config.modTurbo = true -- Turbo (True / False)
-- Colores personalizados para los vehiculos
Config.primario = 1 -- Color primario (Desactivar con -1 si no lo quieres cambiar)
Config.secundario = 1 -- Color secundario (Desactivar con -1 si no lo quieres cambiar)

--================================================================
-- Configuraciones generales
--================================================================

Config.EnablePlayerManagement     = true -- Poder contratar despedir personal (solo jefe)
Config.EnableESXIdentity          = true -- Activarlo si vais a usar el esxidentity para los nombres en la lista de "empleados"
Config.MaxInService               = -1 -- Número maximo de empleados en el mismo trabajo ( -1 = ilimitados)
Config.Locale                     = 'es' -- Idioma de los mensajes (carpeta locales)

--================================================================
-- Configuración de la tienda 
--================================================================

Config.BaduStations = {

  Badu = {

	Blip = { -- Marcador
		Coords  = vector3(-705.7, -905.82, 19.22),
		Sprite  = 52, -- Icono en el mapa ( https://docs.fivem.net/docs/game-references/blips/ )
		Display = 4, -- Mostrar
		Scale   = 1.2, -- Tamaño icono
		Colour  = 29, -- Color icono
		Name	= 'Nombre de la tienda 🛒' -- « Nombre en el mapa
	},

    Armories = {
      { x = -705.7, y = -905.82, z = 19.22}, -- Localización del armario
    },
	
	AuthorizedVehicles = {
	  { name = 'mule',  label = '🚚 Camión' }, -- Vehiculos  (Nombre del vehiculo, nombre a mostrar en el menu de vehiculos)
	},

    Items = { -- Objetos para comprar (Nombre del objeto en base de datos, nombre a motrar, precio)
            { name = 'bread',     label = '🍞 Pan',      price = 1 }, 
            { name = 'water',  label = '🥤 Agua',   price = 2 },
     },

    Vehicles = { -- Punto para sacar vehiculos
      {
       Spawner    = {x = -730.66, y = -909.34, z = 19.04 }, -- Localización del punto
       SpawnPoint = { x = -736.66, y = -919.34, z = 19.04 }, -- Donde aparece el vehiculo
       Heading    = 92.23, -- Haciado donde sale mirando el vehiculo
      }
    },
	
    VehicleDeleters = {
    { x = -724.07, y = -913.25, z = 18.8 }, -- Punto para eliminar vehiculos
    },

    BossActions = {
      { x = -708.48, y = -904.99, z = 18.8 } -- Acciones de jefe (Eliminar/Contratar empleados - Salarios ...)
    },

  },

}


-- By ShxwZ (https://github.com/ShxwZ)
-- Shaw#5926