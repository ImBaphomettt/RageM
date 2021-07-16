---
--- @author Dylan MALANDAIN, Kalyptus
--- @version 1.0.0
--- File [Vehicle] created at [16/07/2021 21:28]
---

---@class Vehicle
Vehicle = {}
Vehicle.__index = Vehicle

setmetatable(Vehicle, {
    __call = function(_)
        local self = setmetatable({}, Vehicle);

        return self;
    end
})

---New
---@public
---@return void
function Vehicle:New()
    Vehicle();
end 
