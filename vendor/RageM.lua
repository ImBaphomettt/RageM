---
--- @author Dylan MALANDAIN, Kalyptus
--- @version 1.0.0
--- File [RageM] created at [16/07/2021 20:29]
---

---@class RageM
---@field Type string
---@field Name string
---@field Menu RageUIMenus
RageM = {}
RageM.__index = RageM

RAGEM_MENUS = {};

setmetatable(RageM, {
    __call = function(_, Type, Name, Menu)
        local self = setmetatable({}, RageM);
        self.Type = Type;
        self.Name = Name;
        self.Menu = Menu;

        if (RAGEM_MENUS[self.Type] ~= nil and RAGEM_MENUS[self.Type][self.Name] ~= nil) then
            error("Menu is already registered with this name and type [" .. self.Type .. "][" .. self.Name .. "]")
        end

        if not (RAGEM_MENUS[self.Type]) then
            RAGEM_MENUS[self.Type] = {};
        end

        RAGEM_MENUS[self.Type][self.Name] = Menu;
        print("RageM Registered [" .. self.Type .. "][" .. self.Name .. "]")
        return self;
    end
})

---New
---@param Type string
---@param Name string
---@param Menu RageUIMenus
---@public
---@return void
function RageM.New(Type, Name, Menu)
    RageM(Type, Name, Menu);
end

---Get
---@param Type string
---@param Name string
---@public
---@return RageUIMenus
function RageM.Get(Type, Name)
    if (RAGEM_MENUS[Type] ~= nil and RAGEM_MENUS[Type][Name] ~= nil) then
        return RAGEM_MENUS[Type][Name]
    end
end
