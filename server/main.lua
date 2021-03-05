ESX = nil
-- By ShxwZ (https://github.com/ShxwZ)
-- Shaw#5926
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'Badu', Config.MaxInService)
end

TriggerEvent('esx_society:registerSociety', 'Badu', 'Badu', 'society_Badu', 'society_Badu', 'society_Badu', {type = 'public'})



RegisterServerEvent('esx_Badujob:putInVehicle')
AddEventHandler('esx_Badujob:putInVehicle', function(target)
  TriggerClientEvent('esx_Badujob:putInVehicle', target)
end)

RegisterServerEvent('esx_Badujob:OutVehicle')
AddEventHandler('esx_Badujob:OutVehicle', function(target)
    TriggerClientEvent('esx_Badujob:OutVehicle', target)
end)

RegisterServerEvent('esx_Badujob:getStockItem')
AddEventHandler('esx_Badujob:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_Badu', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

  end)

end)

RegisterServerEvent('esx_Badujob:putStockItems')
AddEventHandler('esx_Badujob:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)
  local sourceItem = xPlayer.getInventoryItem(itemName)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_Badu', function(inventory)

    local inventoryItem = inventory.getItem(itemName)

    if sourceItem.count >= count and count > 0 then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end


  end)

end)

ESX.RegisterServerCallback('esx_Badujob:getArmoryWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_Badu', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

RegisterServerEvent('esx_Badujob:getFridgeStockItem')
AddEventHandler('esx_Badujob:getFridgeStockItem', function(itemName, count)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_Badu', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_removed') .. count .. ' ' .. item.label)
  end)
end)

ESX.RegisterServerCallback('esx_Badujob:getStockItems', function(source, cb)
  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_Badu', function(inventory)

    cb(inventory.items)
  end)
end)

RegisterServerEvent('esx_Badujob:buyItem')
AddEventHandler('esx_Badujob:buyItem', function(itemName, price, itemLabel)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local limit = xPlayer.getInventoryItem(itemName).limit
    local qtty = xPlayer.getInventoryItem(itemName).count
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_Badu', function(account)
	
   --     societyAccount = account
    
    --[[if societyAccount ~= nil and societyAccount.money >= price then
        if qtty < limit then
            societyAccount.removeMoney(price)
            xPlayer.addInventoryItem(itemName, 1)
            TriggerClientEvent('esx:showNotification', _source, _U('bought') .. itemLabel)
        else
            TriggerClientEvent('esx:showNotification', _source, _U('max_item'))
        end
    else
        TriggerClientEvent('esx:showNotification', _source, _U('not_enough'))
    end--]]
	if account.money >= price then
			account.removeMoney(price)
			xPlayer.addInventoryItem(itemName, 1)
			xPlayer.showNotification(_U('bought', amount, itemLabel, ESX.Math.GroupDigits(price)))
	else
		xPlayer.showNotification(_U('not_enough'))
	end
	      end)
end)
ESX.RegisterServerCallback('esx_Badujob:getFridgeStockItems', function(source, cb)
  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_Badu', function(inventory)

    cb(inventory.items)
  end)
end)
RegisterServerEvent('esx_Badujob:putFridgeStockItems')
AddEventHandler('esx_Badujob:putFridgeStockItems', function(itemName, count)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_Badu', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('invalid_quantity'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('you_added') .. count .. ' ' .. item.label)
  end)
end)

ESX.RegisterServerCallback('esx_Badujob:addArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_Badu', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_Badujob:removeArmoryWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_Badu', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)


ESX.RegisterServerCallback('esx_Badujob:buy', function(source, cb, amount)

  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_Badu', function(account)

    if account.money >= amount then
      account.removeMoney(amount)
      cb(true)
    else
      cb(false)
    end

  end)

end)

ESX.RegisterServerCallback('esx_Badujob:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_Badu', function(inventory)
    cb(inventory.items)
  end)

end)

ESX.RegisterServerCallback('esx_Badujob:getPlayerInventory', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb({items = items})
end)


-- By ShxwZ (https://github.com/ShxwZ)
-- Shaw#5926