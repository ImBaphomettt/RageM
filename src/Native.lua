---
--- @author Dylan MALANDAIN, Kalyptus
--- @version 1.0.0
--- File [Native] created at [16/07/2021 21:49]
---

Native = {};

function Native.GiveWeaponToPed(ped, weaponHash, ammoCount, bForceInHand, bForceInHolster, attachPoint, bAllowMultipleCopies, p7, p8, addReason, bIgnoreUnlocks, p11, p12)
    Citizen.InvokeNative(0x5E3BDDBCB83F3D84, ped, weaponHash, ammoCount, bForceInHand, bForceInHolster, attachPoint, bAllowMultipleCopies, p7, p8, addReason, bIgnoreUnlocks, p11, p12)
end

function Native.ForceLightningFlashAtCoords(x, y, z, p3)
    Citizen.InvokeNative(0x67943537D179597C, x, y, z, p3)
end

function Native.SetWeatherType(weatherHash, p1, p2, overrideNetwork, transitionTime, p5)
    Citizen.InvokeNative(0x59174F1AFE095B5A, weatherHash, true, false, true, transitionTime, false)
end

function Native.NetworkClockTimeOverride(hour, minute, second, transitionTime, pauseClock)
    Citizen.InvokeNative(0x669E223E64B1903C, hour, minute, second, transitionTime, pauseClock)
end

function Native.IsIplActiveHash(hash)
    return Citizen.InvokeNative(0xD779B9B910BD3B7C, hash)
end

function Native.RequestIplByHash(hash)
    Citizen.InvokeNative(0x9E211A378F95C97C, hash)
end

function Native.RemoveIplByHash(hash)
    Citizen.InvokeNative(0x431E3AB760629B34, hash)
end

function Native.DrawMarker(type, posX, posY, posZ, dirX, dirY, dirZ, rotX, rotY, rotZ, scaleX, scaleY, scaleZ, red, green, blue, alpha, bobUpAndDown, faceCamera, p19, rotate, textureDict, textureName, drawOnEnts)
    Citizen.InvokeNative(0x2A32FAA57B937173, type, posX, posY, posZ, dirX, dirY, dirZ, rotX, rotY, rotZ, scaleX, scaleY, scaleZ, red, green, blue, alpha, bobUpAndDown, faceCamera, p19, rotate, textureDict, textureName, drawOnEnts)
end
