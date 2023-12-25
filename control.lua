script.on_event(defines.events.on_entity_died, function(event)
    local entity = event.entity
    if entity and entity.valid and entity.type == "gun-turret" then
        local inventory = entity.get_inventory(defines.inventory.turret_ammo)
        if inventory then
            for name, count in pairs(inventory.get_contents()) do
                entity.surface.spill_item_stack(entity.position, {name=name, count=count}, true)
            end
        end
    end
end)
