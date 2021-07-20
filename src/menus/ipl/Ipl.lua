local MAIN_MENU = RageM.Get("RageM", "Main")
RageM.New("Ipl", "Main", RageUI.CreateSubMenu(MAIN_MENU, "Ipl", "Ipl"))

---@type Ipl[]
local CLOSET = {};

local CLOSET_REFRESH = false;

local CLOSET_SIZE = 60.0

---GetClosetIpl
---@return Ipl[]
local function GetClosetIpl()
    local closet = {};
    local position = Player.Position;
    for vector4, v in pairs(IPLS) do
        if (#(position - vector3(vector4.x, vector4.y, vector4.z)) <= CLOSET_SIZE) then
            table.insert(closet, v)
        end
    end
    return closet;
end

function RageUI.PoolMenus:Ipl()
    RageM.Get("Ipl", "Main"):IsVisible(function(Item)

        Item:CheckBox("Closet auto refresh", nil, CLOSET_REFRESH, {}, function(onSelected, onActive, IsChecked)
            if (onSelected) then
                CLOSET_REFRESH = IsChecked;
            end
        end)

        Item:AddButton("Closet Size [" .. CLOSET_SIZE .. "]", nil, {}, function(onSelected, onActive)
            if (onSelected) then
                local SIZE = CHelper.KeyboardInput("Size to fetch closet IPL", 100, true);
                if not (tonumber(SIZE)) then
                    return
                end
                CLOSET_SIZE = tonumber(SIZE);
            end
        end)

        Item:AddSeparator("Closet IPL.")

        for i, v in pairs(CLOSET) do
            Item:CheckBox(v.hashname == "" and tostring(v.ipl) or string.format("%s [%s]", v.hashname, v.ipl), nil, Native.IsIplActiveHash(v.ipl), {}, function(onSelected, onActive, IsChecked)
                if (onSelected) then
                    if (Native.IsIplActiveHash(v.ipl)) then
                        Native.RemoveIplByHash(v.ipl)
                    else
                        Native.RequestIplByHash(v.ipl)
                    end
                end
                if (onActive) then
                    Native.DrawMarker(-1795314153, v.vector4.x, v.vector4.y, v.vector4.z, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 100.0, 0, 255, 0, 100, false, false, 0, false, false, false, false)
                end
            end)
        end

    end, function(Panel)

    end)
end

local TASK_TIMER = 0;

function Thread.Registers:Ipl()
    local GAME_TIMER = GetGameTimer()

    if (TASK_TIMER + 2000 < GAME_TIMER) then
        TASK_TIMER = GAME_TIMER;
        if (CLOSET_REFRESH) then
            CLOSET = GetClosetIpl();
        end
    end

end


