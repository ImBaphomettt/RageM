local MAIN_MENU = RageM.Get("RageM", "Main")
RageM.New("Weapon", "Main", RageUI.CreateSubMenu(MAIN_MENU, "Weapon", "Weapon"))

function RageUI.PoolMenus:Weapon()

    RageM.Get("Weapon", "Main"):IsVisible(function(Item)

    end, function(Panel)

    end)

end


