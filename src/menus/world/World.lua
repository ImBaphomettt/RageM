local MAIN_MENU = RageM.Get("RageM", "Main")
RageM.New("World", "Main", RageUI.CreateSubMenu(MAIN_MENU, "World", "WORLD"))

function RageUI.PoolMenus:World()

    RageM.Get("World", "Main"):IsVisible(function(Item)

    end, function(Panel)

    end)

end


