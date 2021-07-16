local MAIN_MENU = RageM.Get("RageM", "Main")
RageM.New("Mics", "Main", RageUI.CreateSubMenu(MAIN_MENU, "Mics", "Mics"))

function RageUI.PoolMenus:Mics()

    RageM.Get("Mics", "Main"):IsVisible(function(Item)

    end, function(Panel)

    end)

end


