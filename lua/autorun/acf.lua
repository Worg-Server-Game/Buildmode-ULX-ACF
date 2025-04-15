if not SERVER then return end

--[[*
	ACF Permission mode: build and kill
		this mode lets players in buildmode be protected from ACF
        players in pvp mode can use ACF on eachother freely
//]]


timer.Simple(10, function()
	-- the name for this mode used in commands and identification
	local modename = "buildkill"

	while (not ACF or not ACF.Permissions or not ACF.Permissions.RegisterMode) and continueWait do
		
	end

	if not ACF or not ACF.Permissions or not ACF.Permissions.RegisterMode then
		error("ACF permissions did not load in time")
	end


	local perms = ACF.Permissions
	-- a short description of what the mode does
	local modedescription = "Only allows ACF damage between players in PVP mode."
	-- if the attacker or victim can't be identified, what should we do? true allows damage, false blocks it.
	local DefaultPermission = false

	--[[
		Defines the behaviour of ACF damage protection under this protection mode.
		This function is called every time an entity can be affected by potential ACF damage.
		Args;
			owner		Player:	The owner of the potentially-damaged entity
			attacker	Player:	The initiator of the ACF damage event
			ent			Entity:	The entity which may be damaged.
		Return: boolean
			true if the entity should be damaged, false if the entity should be protected from the damage.
	//]]
	local function modepermission(owner, attacker, ent)
		if IsValid(ent) then 
			if ent:IsPlayer() then
				return not (attacker.buildmode or ent.buildmode)
			elseif ent:IsNPC() then
				return true 
			end
				
		end --print("is squishy")

		if not (owner.SteamID or attacker.SteamID) then
			--print("ACF ERROR: owner or attacker is not a player!", tostring(owner), tostring(attacker), "\n", debug.traceback())
			return DefaultPermission
		end

		local ownerid = owner:SteamID()
		local attackerid = attacker:SteamID()
		local ownerperms = perms.GetDamagePermissions(ownerid)

		return not (attacker.buildmode or owner.buildmode)
	end

	perms.RegisterMode(modepermission, modename, modedescription, false, nil, DefaultPermission)

	print("loaded build/kill permission mode")
	print("changing mode in 5 seconds...")

	if _Kyle_Buildmode["acfdmgpermmode"] then
		timer.Simple(5, function()
			local oldmode = table.KeyFromValue(ACF.Permissions.Modes, ACF.Permissions.DamagePermission)
			ACF.Permissions.DefaultCanDamage = ACF.Permissions.ModeDefaultAction[modename]
			ACF.Permissions.DamagePermission = ACF.Permissions.Modes[modename]
			print("changing mode")
			hook.Run("ACF_OnChangeProtectionMode", modename, oldmode)
		end)
	end
end)
