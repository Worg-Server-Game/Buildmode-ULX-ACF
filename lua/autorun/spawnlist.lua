local WeaponBlacklist = {
    "m9k_minigun",
    "weapon_rpg",
}

local EntityBlacklist = {
    "item_healthkit",
    "item_healthcharger",
    "item_healthvial",
    "item_battery",
    "item_suitcharger",
    "prop_thumper",
}

for _, value in pairs(WeaponBlacklist) do
    list.RemoveEntry("Weapon", value)
end
for _, value in pairs(EntityBlacklist) do
    list.RemoveEntry("SpawnableEntities", value)
end