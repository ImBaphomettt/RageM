---
--- @author Dylan MALANDAIN, Kalyptus
--- @version 1.0.0
--- File [Ipls] created at [16/07/2021 21:28]
---

---@class Ipls
Ipls = {}
Ipls.__index = Ipls

setmetatable(Ipls, {
    __call = function(_)
        local self = setmetatable({}, Ipls);

        return self;
    end
})

---New
---@public
---@return void
function Ipls:New()
    Ipls();
end 
