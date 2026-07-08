local cfg = {
    turn_180_enabled = true,
}

local was_key_down = false

function on_create_move(cmd, local_player)
    if not engine.is_in_game() or not local_player or not local_player:is_alive() then return end

    local is_down = input.is_key_down(keys.MOUSE4)

    if cfg.turn_180_enabled and is_down and not was_key_down then
        local angles = cmd:get_viewangles()
        
        angles.y = angles.y + 180.0
        
        while angles.y > 180 do angles.y = angles.y - 360 end
        while angles.y < -180 do angles.y = angles.y + 360 end
        
        cmd:set_viewangles(angles)
        engine.set_view_angles(angles) 
    end

    was_key_down = is_down
end

menu.add_main_tab("Movement", function()
    imgui.text("Quick Turn Settings")
    imgui.separator()
    imgui.spacing()
    
    local changed, val = imgui.checkbox("Enable 180 Turn (MOUSE4)", cfg.turn_180_enabled)
    if changed then cfg.turn_180_enabled = val end
    
    imgui.spacing()
    imgui.text("Wrer: U can sw button")
    imgui.text("lik  s c d f dfe  etc")
end)
