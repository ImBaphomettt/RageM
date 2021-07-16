---
--- @author Dylan MALANDAIN, Kalyptus
--- @version 1.0.0
--- File [Native] created at [16/07/2021 21:49]
---

Native = {};

function Native.GiveWeaponToPed(ped, weaponHash, ammoCount, bForceInHand, bForceInHolster, attachPoint, bAllowMultipleCopies, p7, p8, addReason, bIgnoreUnlocks, p11, p12)
    Citizen.InvokeNative(0x5E3BDDBCB83F3D84, ped, weaponHash, ammoCount, bForceInHand, bForceInHolster, attachPoint, bAllowMultipleCopies, p7, p8, addReason, bIgnoreUnlocks, p11, p12)
end

function Native.ForceLightningFlashAtCoords(x,y,z, p3)
    Citizen.InvokeNative(0x67943537D179597C, x,y,z, p3)
end

function Native.SetWeatherType(weatherHash, p1, p2, overrideNetwork, transitionTime, p5)
    Citizen.InvokeNative(0x59174F1AFE095B5A, weatherHash, true, false, true, transitionTime, false)
end

function Native.NetworkClockTimeOverride( hour,  minute,  second,  transitionTime,  pauseClock)
    Citizen.InvokeNative(0x669E223E64B1903C, hour,  minute,  second,  transitionTime,  pauseClock)
end
