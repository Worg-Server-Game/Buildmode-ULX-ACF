if not SERVER then return end

hook.Add("EntityTakeDamage", "ACFExplosivesFix", function(target, dmg )
    local inflictor = dmg:GetInflictor()

    if not target:IsPlayer() then return true end
    if target:InVehicle() then return true end
    if inflictor:IsPlayer() then return true end

    return false
end)

