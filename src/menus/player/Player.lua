local MAIN_MENU = RageM.Get("RageM", "Main")
RageM.New("Player", "Main", RageUI.CreateSubMenu(MAIN_MENU, "Player", "Player"))

function RageUI.PoolMenus:Player()

    RageM.Get("Player", "Main"):IsVisible(function(Item)
        Item:CheckBox("NoClip", nil, Player.IsInNoClip, {}, function(onSelected, onActive, IsChecked)
            if (onSelected) then
                CHelper.NoClip(IsChecked)
            end
        end)
        Item:CheckBox("Invincible", nil, Player.IsInvincible, {}, function(onSelected, onActive, IsChecked)
            if (onSelected) then
                Player.IsInvincible = IsChecked
            end
        end)
    end, function(Panel)

    end)

end

function Thread.Registers:Player()

    if IsControlJustPressed(1, 0x4CC0E2FE) then
        CHelper.NoClip(not Player.IsInNoClip)
    end

    if (Player.IsInNoClip) then
        local camCoords = GetCamCoord(Global.CameraNoClip)
        SetEntityRotation(Player.PedId, GetCamRot(Global.CameraNoClip))
        if IsControlPressed(1, 0x8FD015D8) then
            local newCamPos = camCoords + GetEntityForwardVector(Player.PedId) * Player.NoClipSpeed
            SetCamCoord(Global.CameraNoClip, newCamPos.x, newCamPos.y, newCamPos.z)
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
        local camRot = GetCamRot(Global.CameraNoClip)
        local x = camRot.x - yMagnitude * 10
        local y = camRot.y
        local z = camRot.z - xMagnitude * 10
        if x < -75.0 then
            x = -75.0
        end
        if x > 100.0 then
            x = 100.0
        end
        SetCamRot(Global.CameraNoClip, x, y, z)
    end

    if (Player.IsInvincible) then
        Citizen.InvokeNative(0xFEBEEBC9CBDF4B12, Player.PlayerId, true)
    end


end

