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

local WEAPON_AMMO_TYPE = {
    "AMMO_22",                                     -- 0x7DF4D025		-- 2113196069
    "AMMO_22_TRANQUILIZER",                        -- 0x8E919F27		-- -1903059161
    "AMMO_ARROW",                                  -- 0x38E6F55F		-- 954660191
    "AMMO_ARROW_CONFUSION",                        -- 0x1F901FAE		-- 529538990
    "AMMO_ARROW_DISORIENT",                        -- 0xDC6FE2FE		-- -596647170
    "AMMO_ARROW_DRAIN",                            -- 0xA3B9DB42		-- -1548100798
    "AMMO_ARROW_DYNAMITE",                         -- 0xC1F57A79		-- -1040876935
    "AMMO_ARROW_FIRE",                             -- 0x11B25B49		-- 296901449
    "AMMO_ARROW_IMPROVED",                         -- 0x9238061F		-- -1841822177
    "AMMO_ARROW_POISON",                           -- 0x07865A92		-- 126245522
    "AMMO_ARROW_SMALL_GAME",                       -- 0xAE6E2B0E		-- -1368511730
    "AMMO_ARROW_TRACKING",                         -- 0x62CEC038		-- 1657716792
    "AMMO_ARROW_TRAIL",                            -- 0xF680010B		-- -159383285
    "AMMO_ARROW_WOUND",                            -- 0xB6731F5A		-- -1233969318
    "AMMO_BOLAS",                                  -- 0x020C7A4A		-- 34372170
    "AMMO_BOLAS_HAWKMOTH",                         -- 0x22E119A9		-- 585177513
    "AMMO_BOLAS_INTERTWINED",                      -- 0x9AB3E5C1		-- -1699486271
    "AMMO_BOLAS_IRONSPIKED",                       -- 0x87BA17E6		-- -2017847322
    "AMMO_CANNON",                                 -- 0xB6976AA1		-- -1231590751
    "AMMO_DYNAMITE",                               -- 0x1C9D6E9D		-- 480079517
    "AMMO_DYNAMITE_VOLATILE",                      -- 0x321BA159		-- 840671577
    "AMMO_HATCHET",                                -- 0x194631D6		-- 424030678
    "AMMO_HATCHET_ANCIENT",                        -- 0xA9708E57		-- -1452241321
    "AMMO_HATCHET_CLEAVER",                        -- 0xB925EC32		-- -1188697038
    "AMMO_HATCHET_DOUBLE_BIT",                     -- 0x63A5047F		-- 1671758975
    "AMMO_HATCHET_DOUBLE_BIT_RUSTED",              -- 0xCABE0C0F		-- -893514737
    "AMMO_HATCHET_HEWING",                         -- 0x8507C1F7		-- -2063089161
    "AMMO_HATCHET_HUNTER",                         -- 0x1AA32EB0		-- 446901936
    "AMMO_HATCHET_HUNTER_RUSTED",                  -- 0xBEDC8EB6		-- -1092841802
    "AMMO_HATCHET_VIKING",                         -- 0xE501537B		-- -452897925
    "AMMO_LASSO",                                  -- 0xEAD00129		-- -355466967
    "AMMO_LASSO_REINFORCED",                       -- 0xAE802EDC		-- -1367331108
    "AMMO_MOLOTOV",                                -- 0x5633F9D5		-- 1446246869
    "AMMO_MOLOTOV_VOLATILE",                       -- 0x886C55D7		-- -2006166057
    "AMMO_MOONSHINEJUG",                           -- 0x631C84FC		-- 1662813436
    "AMMO_MOONSHINEJUG_MP",                        -- 0x656A2F3B		-- 1701457723
    "AMMO_PISTOL",                                 -- 0x743D4F54		-- 1950175060
    "AMMO_PISTOL_EXPRESS",                         -- 0x31E2AD5B		-- 836939099
    "AMMO_PISTOL_EXPRESS_EXPLOSIVE",               -- 0x46A648C2		-- 1185302722
    "AMMO_PISTOL_HIGH_VELOCITY",                   -- 0xABD96830		-- -1411815376
    "AMMO_PISTOL_SPLIT_POINT",                     -- 0x0E163B80		-- 236338048
    "AMMO_POISONBOTTLE",                           -- 0x39714C4F		-- 963726415
    "AMMO_REPEATER",                               -- 0xB0B80B9A		-- -1330115686
    "AMMO_REPEATER_EXPRESS",                       -- 0xDD871DC8		-- -578347576
    "AMMO_REPEATER_EXPRESS_EXPLOSIVE",             -- 0x9C8B6796		-- -1668585578
    "AMMO_REPEATER_HIGH_VELOCITY",                 -- 0x0DCBE210		-- 231465488
    "AMMO_REPEATER_SPLIT_POINT",                   -- 0x44750C88		-- 1148521608
    "AMMO_REVOLVER",                               -- 0x64356159		-- 1681219929
    "AMMO_REVOLVER_EXPRESS",                       -- 0x4970588D		-- 1232099469
    "AMMO_REVOLVER_EXPRESS_EXPLOSIVE",             -- 0x04A8EFBB		-- 78180283
    "AMMO_REVOLVER_HIGH_VELOCITY",                 -- 0x83C5E860		-- -2084181920
    "AMMO_REVOLVER_SPLIT_POINT",                   -- 0x4A25B008		-- 1243983880
    "AMMO_RIFLE",                                  -- 0x0D05319F		-- 218444191
    "AMMO_RIFLE_ELEPHANT",                         -- 0xB392591E		-- -1282254562
    "AMMO_RIFLE_EXPRESS",                          -- 0x62A11A4B		-- 1654725195
    "AMMO_RIFLE_EXPRESS_EXPLOSIVE",                -- 0x6D926443		-- 1838310467
    "AMMO_RIFLE_HIGH_VELOCITY",                    -- 0x6ECB67F9		-- 1858824185
    "AMMO_RIFLE_SPLIT_POINT",                      -- 0x0BEFA5B2		-- 200254898
    "AMMO_SHOTGUN",                                -- 0x90083D3B		-- -1878508229
    "AMMO_SHOTGUN_BUCKSHOT_INCENDIARY",            -- 0xBFCB2621		-- -1077205471
    "AMMO_SHOTGUN_SLUG",                           -- 0x12C60041		-- 314966081
    "AMMO_SHOTGUN_SLUG_EXPLOSIVE",                 -- 0x2314B32A		-- 588559146
    "AMMO_THROWING_KNIVES",                        -- 0x9E4AD291		-- -1639263599
    "AMMO_THROWING_KNIVES_CONFUSE",                -- 0x9117CF91		-- -1860710511
    "AMMO_THROWING_KNIVES_DISORIENT",              -- 0x59DCB686		-- 1507636870
    "AMMO_THROWING_KNIVES_DRAIN",                  -- 0x6D0020AB		-- 1828724907
    "AMMO_THROWING_KNIVES_IMPROVED",               -- 0x48DC05F6		-- 1222378998
    "AMMO_THROWING_KNIVES_JAVIER",                 -- 0xF51D1AC7		-- -182641977
    "AMMO_THROWING_KNIVES_POISON",                 -- 0x7BA5E56E		-- 2074469742
    "AMMO_THROWING_KNIVES_TRAIL",                  -- 0x4BC1020F		-- 1270940175
    "AMMO_THROWING_KNIVES_WOUND",                  -- 0x9143D131		-- -1857826511
    "AMMO_THROWN_ITEM",                            -- 0xCE156C30		-- -837456848
    "AMMO_TOMAHAWK",                               -- 0x49A985D7		-- 1235846615
    "AMMO_TOMAHAWK_ANCIENT",                       -- 0xF25D45BC		-- -228768324
    "AMMO_TOMAHAWK_HOMING",                        -- 0xABD7C401		-- -1411922943
    "AMMO_TOMAHAWK_IMPROVED",                      -- 0xCE489834		-- -834103244
    "AMMO_TURRET",                                 -- 0xBA2D509B		-- -1171435365

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
