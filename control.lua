script.on_event(defines.events.on_player_created, function(event)
    log("HELLO")
    local player = game.get_player(event.player_index)
    if not player then return end

    local planet_name = "vulcanus"
    local planet = game.planets[planet_name]
    local surface = planet.create_surface()
    surface.request_to_generate_chunks({ 0, 0 }, 3)
    surface.force_generate_chunk_requests()

    local force = game.forces["player"]
    force.unlock_space_location(planet_name)
    local origin = force.get_spawn_position()

    local position = surface.find_non_colliding_position("character", { 0, 0 }, 0, 2)

    log(position)

    -- for name, planet in pairs(game.planets) do
    --     log("Planet: " .. name)
    -- end

    -- for name, surface in pairs(game.surfaces) do
    --     log("Surface: " .. name)
    -- end

    -- for name, surface in pairs(game.forces) do
    --     log("Forces: " .. name)
    -- end

    log(surface)


    player.teleport(position, surface)
    log("TEST")
end)
