RageM.New("RageM", "Main", RageUI.CreateMenu("RageM", "RAGEM"))

local MENU = {
    { Name = "Player", RType = "Player", RName = "Main" },
    { Name = "World", RType = "World", RName = "Main" },
    { Name = "Weapon",  RType = "Weapon", RName = "Main" },
    { Name = "Ipl",  RType = "Ipl", RName = "Main" },
    { Name = "Mics",  RType = "Mics", RName = "Main" },
}

function RageUI.PoolMenus:Main()

    RageM.Get("RageM", "Main"):IsVisible(function(Item)
        for i, v in pairs(MENU) do
            Item:AddButton(v.Name, nil, { }, function(onSelected, onActive)
                if (onSelected) then

                end
            end,  RageM.Get(v.RType, v.RName))

        end
    end, function(Panel)

    end)

end
