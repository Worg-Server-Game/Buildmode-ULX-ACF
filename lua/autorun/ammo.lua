if not SERVER then return end

hook.Add("PlayerSwitchWeapon", "InfAmmoSwitch", function(old, weapon)
    if not owner or not weapon then return end

    owner = weapon:GetOwner()

    owner:SetAmmo(9999, weapon:GetPrimaryAmmoType())
    owner:SetAmmo(9999, weapon:GetSecondaryAmmoType())
end)

hook.Add("WeaponEquip", "InfAmmoEquip", function(weapon, owner)
    owner:SetAmmo(9999, weapon:GetPrimaryAmmoType())
    owner:SetAmmo(9999, weapon:GetSecondaryAmmoType())
end)
