if not SERVER then return end

hook.Add("PlayerSwitchWeapon", "InfAmmoSwitch", function(old, weapon)
    if not weapon or not IsValid(weapon) then return end
    owner = weapon:GetOwner()
    if not owner then return end

    owner:SetAmmo(9999, weapon:GetPrimaryAmmoType())
    owner:SetAmmo(9999, weapon:GetSecondaryAmmoType())
end)

hook.Add("WeaponEquip", "InfAmmoEquip", function(weapon, owner)
    if not weapon or not IsValid(weapon) or not owner then return end

    owner:SetAmmo(9999, weapon:GetPrimaryAmmoType())
    owner:SetAmmo(9999, weapon:GetSecondaryAmmoType())
end)
