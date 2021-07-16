local MAIN_MENU = RageM.Get("RageM", "Main")
RageM.New("Player", "Main", RageUI.CreateSubMenu(MAIN_MENU, "Player", "Player"))

function RageUI.PoolMenus:Player()

    RageM.Get("Player", "Main"):IsVisible(function(Item)

    end, function(Panel)

    end)

end


