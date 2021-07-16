local CAMERA_NOCLIP = nil;

local MAIN_MENU = RageM.Get("RageM", "Main")
RageM.New("Player", "Main", RageUI.CreateSubMenu(MAIN_MENU, "Player", "Player"))

function RageUI.PoolMenus:Player()

    RageM.Get("Player", "Main"):IsVisible(function(Item)
        Item:CheckBox("NoClip", nil, Player.IsInNoClip, {}, function(onSelected, onActive, IsChecked)
            if (onSelected) then
                if (IsChecked) then
                    if (CAMERA_NOCLIP == nil) then
                        CAMERA_NOCLIP = CreateCamera(GetHashKey("DEFAULT_SCRIPTED_CAMERA"), true)
                    end
                    SetCamActive(CAMERA_NOCLIP, true)
                    SetCamCoord(CAMERA_NOCLIP, GetEntityCoords(Player.PedId))
                    RenderScriptCams(true, false, 0, true, true)
                    FreezeEntityPosition(Player.PedId, true)
                    SetEntityInvincible(Player.PedId, true)
                    SetEntityVisible(Player.PedId, false)
                    Player.IsInNoClip = true
                end
                if not (IsChecked) then
                    local CAM_COORDS = GetCamCoord(CAMERA_NOCLIP)
                    DestroyCam(CAMERA_NOCLIP)
                    RenderScriptCams(false, false, 0, false, false)
                    FreezeEntityPosition(Player.PedId, false)
                    SetEntityCoords(Player.PedId, CAM_COORDS.x, CAM_COORDS.y, CAM_COORDS.z)
                    SetEntityInvincible(Player.PedId, false)
                    SetEntityVisible(Player.PedId, true)
                    if (CAMERA_NOCLIP) then
                        CAMERA_NOCLIP = nil;
                    end
                    Player.IsInNoClip = false
                end
            end
        end)
    end, function(Panel)

    end)

end

function Thread.Registers:Player()
    if (Player.IsInNoClip) then
        local camCoords = GetCamCoord(CAMERA_NOCLIP)
        SetEntityRotation(Player.PedId, GetCamRot(CAMERA_NOCLIP))
        if IsControlPressed(1, 0x8FD015D8) then
            local newCamPos = camCoords + GetEntityForwardVector(Player.PedId) * Player.NoClipSpeed
            SetCamCoord(CAMERA_NOCLIP, newCamPos.x, newCamPos.y, newCamPos.z)
            SetEntityCoords(Player.PedId, newCamPos.x, newCamPos.y, newCamPos.z)
        end

        if IsControlPressed(0, 0x110AD1D2) then
            if (Player.NoClipSpeed - 0.1 >= 0.1) then
                print("Update noclip speed [" .. Player.NoClipSpeed .. "]")
                Player.NoClipSpeed = Player.NoClipSpeed - 0.1
            end
        end
        if IsControlPressed(0, 0x446258B6) then
            if (Player.NoClipSpeed + 0.1 >= 0.1) then
                print("Update noclip speed [" .. Player.NoClipSpeed .. "]")
                Player.NoClipSpeed = Player.NoClipSpeed + 0.1
            end
        end

        local xMagnitude = GetDisabledControlNormal(0, 0xA987235F)
        local yMagnitude = GetDisabledControlNormal(0, 0xD2047988)
        local camRot = GetCamRot(CAMERA_NOCLIP)
        local x = camRot.x - yMagnitude * 10
        local y = camRot.y
        local z = camRot.z - xMagnitude * 10
        if x < -75.0 then
            x = -75.0
        end
        if x > 100.0 then
            x = 100.0
        end
        SetCamRot(CAMERA_NOCLIP, x, y, z)
    end
end

