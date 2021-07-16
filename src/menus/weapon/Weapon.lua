local SELECTED_GROUP = nil;

local MAIN_MENU = RageM.Get("RageM", "Main")
RageM.New("Weapon", "Main", RageUI.CreateSubMenu(MAIN_MENU, "Weapon", "Weapon"))
RageM.New("Weapon", "Selected", RageUI.CreateSubMenu(RageM.Get("Weapon", "Main"), "Weapon", "Weapon"))
RageM.Get("Weapon", "Selected").Closed = function()
    SELECTED_GROUP = nil
    RageM.Get("Weapon", "Selected").Index = 1;
end

function RageUI.PoolMenus:Weapon()

    RageM.Get("Weapon", "Main"):IsVisible(function(Item)
        for i, v in pairs(WEAPONS_GROUP_AVAILABLE) do
            Item:AddButton(v, nil, {}, function(onSelected, onActive)
                if (onSelected) then
                    print("Selected weapon group [" .. v .. "]")
                    SELECTED_GROUP = v
                end
            end, RageM.Get("Weapon", "Selected"))
        end
    end, function(Panel)

    end)

    RageM.Get("Weapon", "Selected"):IsVisible(function(Item)
        if (SELECTED_GROUP ~= nil) and (WEAPONS_GROUP[SELECTED_GROUP] ~= nil) then

            for i, v in pairs(WEAPONS_GROUP[SELECTED_GROUP]) do
                Item:AddButton(v.Weapon, nil, {}, function(onSelected, onActive)
                    if (onSelected) then
                        Native.GiveWeaponToPed(Player.PedId, v.Hash, 1, false, true, 1, false, 0.5, 1.0, "Weapon gived by RageM", 0)
                        SetPedInfiniteAmmo(Player.PedId, true, v.Hash)
                    end
                end)
            end
        end
    end, function(Panel)

    end)

end


