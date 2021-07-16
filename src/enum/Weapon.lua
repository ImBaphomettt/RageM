---
--- @author Dylan MALANDAIN, Kalyptus
--- @version 1.0.0
--- File [Weapon] created at [16/07/2021 21:28]
---
--- Data base from this repo github
---
--- https://github.com/femga/rdr3_discoveries/blob/master/weapons/weapons.lua
---
---

---@class Weapon
---@field Weapon string
---@field Hash number
---@field Group string
Weapon = {}
Weapon.__index = Weapon

---@type Weapon[]
WEAPONS = {};

---@type Weapon[]
WEAPONS_GROUP = {};

WEAPONS_GROUP_AVAILABLE = {
    "group_melee",
    "group_pistol",
    "group_repeater",
    "group_revolver",
    "group_rifle",
    "group_shotgun",
    "group_sniper",
    "group_thrown",
    "group_held",
    "group_bow",
    "group_fishingrod",
    "group_lasso",
    "group_held",
}

setmetatable(Weapon, {
    __call = function(_, _Weapon, Hash, Group)
        local self = setmetatable({}, Weapon);

        self.Weapon = _Weapon;
        self.Hash = Hash;
        self.Group = Group;

        if (WEAPONS[self.Weapon]) then
            error("Weapon already exist with this name [" .. self.Weapon .. "]")
        end

        if not (WEAPONS_GROUP[self.Group]) then
            WEAPONS_GROUP[self.Group] = {};
        end
        WEAPONS_GROUP[self.Group][#WEAPONS_GROUP[self.Group] + 1] = self

        WEAPONS[self.Weapon] = self;

        return self;
    end
})

---New
---@param _Weapon string
---@param Hash number
---@param Group string
---@public
---@return void
function Weapon.New(_Weapon, Hash, Group)
    Weapon(_Weapon, Hash, Group);
end

Weapon.New('weapon_melee_knife_jawbone', 277270593, 'group_melee')
Weapon.New('weapon_melee_machete', 680856689, 'group_melee')
Weapon.New('weapon_melee_torch', 1742487518, 'group_melee')
Weapon.New('weapon_melee_knife', -618550132, 'group_melee')
Weapon.New('weapon_pistol_volcanic', 34411519, 'group_pistol')
Weapon.New('weapon_pistol_m1899', 1534638301, 'group_pistol')
Weapon.New('weapon_pistol_semiauto', 1701864918, 'group_pistol')
Weapon.New('weapon_pistol_mauser', -2055158210, 'group_pistol')
Weapon.New('weapon_repeater_evans', 1905553950, 'group_repeater')
Weapon.New('weapon_repeater_henry', -1783478894, 'group_repeater')
Weapon.New('weapon_repeater_winchester', -1471716628, 'group_repeater')
Weapon.New('weapon_repeater_carbine', -183018591, 'group_repeater')
Weapon.New('weapon_revolver_doubleaction', 127400949, 'group_revolver')
Weapon.New('weapon_revolver_cattleman', 379542007, 'group_revolver')
Weapon.New('weapon_revolver_cattleman_mexican', 383145463, 'group_revolver')
Weapon.New('weapon_revolver_lemat', 1529685685, 'group_revolver')
Weapon.New('weapon_revolver_schofield', 2075992054, 'group_revolver')
Weapon.New('weapon_revolver_doubleaction_gambler', -2082646505, 'group_revolver')
Weapon.New('weapon_rifle_springfield', 1676963302, 'group_rifle')
Weapon.New('weapon_rifle_boltaction', 1999408598, 'group_rifle')
Weapon.New('weapon_rifle_varmint', -570967010, 'group_rifle')
Weapon.New('weapon_shotgun_sawedoff', 392538360, 'group_shotgun')
Weapon.New('weapon_shotgun_doublebarrel_exotic', 575725904, 'group_shotgun')
Weapon.New('weapon_shotgun_pump', 834124286, 'group_shotgun')
Weapon.New('weapon_shotgun_repeating', 1674213418, 'group_shotgun')
Weapon.New('weapon_shotgun_semiauto', 1838922096, 'group_shotgun')
Weapon.New('weapon_shotgun_doublebarrel', 1845102363, 'group_shotgun')
Weapon.New('weapon_sniperrifle_carcano', 1402226560, 'group_sniper')
Weapon.New('weapon_sniperrifle_rollingblock', -506285289, 'group_sniper')
Weapon.New('weapon_melee_hatchet', 165751297, 'group_thrown')
Weapon.New('weapon_melee_hatchet_hunter', 710736342, 'group_thrown')
Weapon.New('weapon_thrown_molotov', 1885857703, 'group_thrown')
Weapon.New('weapon_thrown_tomahawk_ancient', 2133046983, 'group_thrown')
Weapon.New('weapon_thrown_tomahawk', -1511427369, 'group_thrown')
Weapon.New('weapon_thrown_dynamite', -1504859554, 'group_thrown')
Weapon.New('weapon_melee_hatchet_double_bit', -1127860381, 'group_thrown')
Weapon.New('weapon_thrown_throwing_knives', -764310200, 'group_thrown')
Weapon.New('weapon_melee_cleaver', -281894307, 'group_thrown')
Weapon.New('weapon_melee_davy_lantern', 1247405313, 'group_held')
Weapon.New('weapon_kit_binoculars', -160924582, 'group_held')
Weapon.New('weapon_kit_camera', -1016714371, 'group_held')
Weapon.New('weapon_bow', -2002235300, 'group_bow')
Weapon.New('weapon_fishingrod', -1415022764, 'group_fishingrod')
Weapon.New('weapon_lasso', 2055893578, 'group_lasso')
Weapon.New('weapon_kit_camera_advanced', 332793555, 'group_held')
Weapon.New('weapon_melee_machete_horror', 1953585457, 'group_melee')
Weapon.New('weapon_bow_improved', 115405099, 'group_bow')
Weapon.New('weapon_rifle_elephant', -1717423096, 'group_rifle')
Weapon.New('weapon_revolver_navy', 132728264, 'group_revolver')
Weapon.New('weapon_lasso_reinforced', -680302000, 'group_lasso')
Weapon.New('weapon_kit_binoculars_improved', 1652431022, 'group_held')
Weapon.New('weapon_melee_knife_trader', -1448818329, 'group_melee')
Weapon.New('weapon_melee_machete_collector', -1774451313, 'group_melee')
Weapon.New('weapon_moonshinejug_mp', 1698907612, 'group_petrolcan')
Weapon.New('weapon_thrown_bolas', 1151374672, 'group_thrown')
Weapon.New('weapon_thrown_poisonbottle', -577893115, 'group_thrown')
Weapon.New('weapon_kit_metal_detector', -862059856, 'group_held')
Weapon.New('weapon_revolver_navy_crossover', 389133414, 'group_revolver')
Weapon.New('weapon_thrown_bolas_hawkmoth', 193638004, 'group_thrown')
Weapon.New('weapon_thrown_bolas_ironspiked', -1907739637, 'group_thrown')
Weapon.New('weapon_thrown_bolas_intertwined', -1965723000, 'group_thrown')
