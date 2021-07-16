local MAIN_MENU = RageM.Get("RageM", "Main")
RageM.New("World", "Main", RageUI.CreateSubMenu(MAIN_MENU, "World", "WORLD"))

local WEATHER_TYPE = {
    "BLIZZARD",
    "CLOUDS",
    "DRIZZLE",
    "FOG",
    "GROUNDBLIZZARD",
    "HAIL",
    "HIGHPRESSURE",
    "HURRICANE",
    "MISTY",
    "OVERCAST",
    "OVERCASTDARK",
    "RAIN",
    "SHOWER",
    "SLEET",
    "SNOW",
    "SNOWCLEARING",
    "SNOWLIGHT",
    "SUNNY",
    "SandStorm",
    "THUNDER",
    "THUNDERSTORM",
    "WHITEOUT",
}

local TIME = {
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24
}
function RageUI.PoolMenus:World()

    RageM.Get("World", "Main"):IsVisible(function(Item)
        for i, v in pairs(TIME) do
            Item:AddButton(tostring(v) .. ":00", nil, {}, function(onSelected, onActive)
                if (onSelected) then
                    Native.NetworkClockTimeOverride(v, 0, 0, 12000, false)
                end
            end)
        end
        Item:AddSeparator("Weather Type")
        for i, v in pairs(WEATHER_TYPE) do
            Item:AddButton(v, nil, {}, function(onSelected, onActive)
                if (onSelected) then
                    Native.SetWeatherType(GetHashKey(v), true, false, true, 50000, false)
                end
            end)
        end
    end, function(Panel)

    end)

end


