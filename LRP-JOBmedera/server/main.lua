ESX               = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



  --RegisterNetEvent("esxLRP:gasolinamadera")
 -- AddEventHandler("esxLRP:gasolinamadera", function(item, count)
   -- local _source = source
  --  local xPlayer  = ESX.GetPlayerFromId(_source)

--xPlayer.addWeapon('WEAPON_PETROLCAN', 4500)
    
--TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaverde', text = ' La empresa te dio para la gasolina del viaje ' ,length = 5000})



-- end)


RegisterNetEvent("esxLRP:darmadera")
AddEventHandler("esxLRP:darmadera", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local hachaitem = xPlayer.getInventoryItem('hacha').count 

if hachaitem < 1  then 
 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaroja', text = ' No tienes Hacha para hacer este trabajo ',length = 5500})
else
        if xPlayer ~= nil then
             if xPlayer.getInventoryItem('wood').count < 7 then
                
                xPlayer.addInventoryItem('wood', 1)

                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajanegra', text = ' Encontraste ',length = 5000})
                 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaazul', text = ' Madera x1',length = 5000})

                   -- TriggerClientEvent('esx:showNotification', source, 'You received ~b~stones.')
               else
               TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaroja', text = ' No pudes llevar mas  madera ',length = 7000})

             end
        end
 end   
    end)

    
RegisterNetEvent("esxLRP:Procesamientomadera")
AddEventHandler("esxLRP:Procesamientomadera", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
  local maderacortadacantidad = xPlayer.getInventoryItem('cutted_wood').count    
  local hachaitem = xPlayer.getInventoryItem('hacha').count    

if hachaitem < 1  then 
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaroja', text = ' No tienes Hacha para hacer este trabajo ',length = 5500})
else
        if xPlayer ~= nil then


if maderacortadacantidad  > 6 then   -- el limite seria 7
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaroja', text = ' No puedes Llevar mas Madera  Cortada',length = 5500})
        else    
           
      if xPlayer.getInventoryItem('wood').count > 0 then
                TriggerClientEvent("esxLRP:Procesamientomadera", source)
                Citizen.Wait(15900)
                xPlayer.addInventoryItem('cutted_wood', 1)
                xPlayer.removeInventoryItem("wood", 1)
           
                 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajanegra', text = ' Procesaste ',length = 5000})
                 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaazul', text = ' Madera Cortada x1',length = 5000})

               elseif xPlayer.getInventoryItem('wood').count < 1 then

                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaroja', text = ' No   tienes Madera para cortar.',length = 7000})
                 
            
                 end
 end     

        end
    
 end
    end)

RegisterNetEvent("esxLRP:refinadomadera")
AddEventHandler("esxLRP:refinadomadera", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local randomChance = math.random(1, 100)
    local hachaitem = xPlayer.getInventoryItem('hacha').count    
   
    local limitelevel4 =       xPlayer.getInventoryItem('maderaroble').count 
    local limitelevel3 =       xPlayer.getInventoryItem('maderanogal').count 
    local limitelevel2 =       xPlayer.getInventoryItem('maderacaoba').count 
    local limitelevel1 =       xPlayer.getInventoryItem('packaged_plank').count 


if hachaitem < 1  then 
         TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaroja', text = ' No tienes Hacha para hacer este trabajo ',length = 5500})
else

        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('cutted_wood').count > 0 then
                TriggerClientEvent("esxLRP:refinadomadera", source)
             Citizen.Wait(15900)

             if randomChance < 10 then


               if limitelevel4 > 11 then

                 TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'cajaroja', text = ' No Puedes llevar mas Tablas de Roble ',length = 7000})
                  else

                    xPlayer.addInventoryItem("maderaroble", 4)
                    xPlayer.removeInventoryItem("cutted_wood", 1)
                     TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'cajanegra', text = ' Acabas de obtener ',length = 6000})
                     TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'cajaazul', text = ' Tablas de Roble x4 ',length = 6000})
             end
               
              
                elseif randomChance > 9 and randomChance < 25 then

                
                 if limitelevel3 > 11 then
                 TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'cajaroja', text = ' No Puedes llevar mas Tabla de Nogal ',length = 7000})
                else
                    xPlayer.addInventoryItem("maderanogal", 4)
                    xPlayer.removeInventoryItem("cutted_wood", 1)
                     TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'cajanegra', text = ' Acabas de obtener Tablas de Nogal ',length = 6000})
                     TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'cajaazul', text = ' Tablas de Nogal x4 ',length = 6000})
               end

               
                elseif randomChance > 24 and randomChance < 50 then
                

               
                if limitelevel2 > 11 then
                 TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'cajaroja', text = ' No Puedes llevar mas Hierro',length = 7000})
                else

                    xPlayer.addInventoryItem("maderacaoba", 4)
                    xPlayer.removeInventoryItem("cutted_wood", 1)
                     TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'cajanegra', text = ' Acabas de obtener',length = 6000})
                     TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'cajaazul', text = ' Tablas de Caoba x4 ',length = 6000})
                end
              
               
                elseif randomChance > 49 then

            
                   if limitelevel1 > 27 then
                    TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'cajaroja', text = ' No Puedes llevar mas Cobre ',length = 7000})
                    else
                    xPlayer.addInventoryItem("packaged_plank", 4)
                    xPlayer.removeInventoryItem("cutted_wood", 1)
                      TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'cajanegra', text = ' Acabas de obtener ',length =6000})
                      TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'cajaazul', text = ' Tablas de Madera x4 ',length = 6000})

                     end
                
                end
           
            elseif xPlayer.getInventoryItem('cutted_wood').count < 1 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaroja', text = ' No Tienes suficiente madera cortada para empaquetar ',length = 7000})


            end
        

        end
   
 end
    end)


RegisterNetEvent("esxLRP:VentamaderaNivel4")
AddEventHandler("esxLRP:VentamaderaNivel4", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local hachaitem = xPlayer.getInventoryItem('hacha').count 

if hachaitem < 1  then 
 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaroja', text = ' No tienes Hacha para hacer este trabajo ',length = 5500})

else

        if xPlayer ~= nil then

            if xPlayer.getInventoryItem('maderaroble').count > 0 then
                local pieniadze = Config.MaterialNivel4
                xPlayer.removeInventoryItem('maderaroble', 1)
                xPlayer.addMoney(pieniadze)

               -- TriggerClientEvent('esx:showNotification', source, 'You sell ~b~1 diamond.')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaverde', text = 'Acabas de Vender Tablas de Roble ',length = 2000})

            elseif xPlayer.getInventoryItem('maderaroble').count < 1 then
                
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaroja', text = ' No tienes Tablas de Roble ',length = 5500})
                --TriggerClientEvent('esx:showNotification', source, 'You do not have ~b~diamonds.')
           
            end
        end
 
end
    end)

RegisterNetEvent("esxLRP:VentamaderaNivel3")
AddEventHandler("esxLRP:VentamaderaNivel3", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local hachaitem = xPlayer.getInventoryItem('hacha').count 

if hachaitem < 1  then 
 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaroja', text = ' No tienes Hacha para hacer este trabajo ',length = 5500})
else

        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('maderanogal').count > 0 then
                local pieniadze = Config.MaterialNivel3
                xPlayer.removeInventoryItem('maderanogal', 1)
                xPlayer.addMoney(pieniadze)

            --TriggerClientEvent('esx:showNotification', source, 'You sell ~y~5 gold.')
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaverde', text = 'Acabas de vender Tablas de Nogal ',length = 2000})
  
            elseif xPlayer.getInventoryItem('maderanogal').count < 1 then

            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaroja', text = ' No tienes Tablas de Nogal ',length = 5500})
           -- TriggerClientEvent('esx:showNotification', source, 'You do not have ~b~gold')
          
            end
        end

end
    end)

RegisterNetEvent("esxLRP:VentamaderaNivel2")
AddEventHandler("esxLRP:VentamaderaNivel2", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
  local hachaitem = xPlayer.getInventoryItem('hacha').count 

if hachaitem < 1  then 
 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaroja', text = ' No tienes Hacha para hacer este trabajo ',length = 5500})
else

        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('maderacaoba').count > 0 then
                local pieniadze = Config.MaterialNivel2
                xPlayer.removeInventoryItem('maderacaoba', 1)              
                xPlayer.addMoney(pieniadze)

                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaverde', text = 'Acabas de Vender Tablas de Caoba ',length = 2000})
               -- TriggerClientEvent('esx:showNotification', source, 'You sell ~w~10 iron.')
           
            elseif xPlayer.getInventoryItem('maderacaoba').count < 1 then
                --TriggerClientEvent('esx:showNotification', source, 'You do not have ~b~iron.')
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaroja', text = ' No tienes Tablas de Caoba ',length = 5500})

            end
        end

end
    end)

RegisterNetEvent("esxLRP:VentamaderaNivel1")
AddEventHandler("esxLRP:VentamaderaNivel1", function(item, count)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local hachaitem = xPlayer.getInventoryItem('hacha').count 

if hachaitem < 1  then 
 TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaroja', text = ' No tienes Hacha para hacer este trabajo ',length = 5500})
else

        if xPlayer ~= nil then
            if xPlayer.getInventoryItem('packaged_plank').count > 0 then
                local pieniadze = Config.MaterialNivel1
                xPlayer.removeInventoryItem('packaged_plank', 1)
                xPlayer.addMoney(pieniadze)
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaverde', text = 'Acabas de vender tablas de madera ',length = 2000})
                --TriggerClientEvent('esx:showNotification', source, 'You sell ~o~20 copper.')
            elseif xPlayer.getInventoryItem('packaged_plank').count < 1 then
              --TriggerClientEvent('esx:showNotification', source, 'You do not have ~b~copper.')
              TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'cajaroja', text = ' No tienes para vender tablas de madera ',length = 5500})

            end
        end

end
    end)
