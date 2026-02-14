local WeaponBlacklist = {
    "weapon_rpg",
}

local EntityBlacklist = {
    "item_healthkit",
    "item_healthcharger",
    "item_healthvial",
    "item_battery",
    "item_suitcharger",
    "prop_thumper",
    "sent_ball",
    "item_rpg_round",
    "npc_grenade_frag",
    "grenade_helicopter",
    "acf_npc_base",
    "sent_deployableballoons",
}

for _, value in pairs(WeaponBlacklist) do
    list.RemoveEntry("Weapon", value)
end
for _, value in pairs(EntityBlacklist) do
    list.RemoveEntry("SpawnableEntities", value)
end