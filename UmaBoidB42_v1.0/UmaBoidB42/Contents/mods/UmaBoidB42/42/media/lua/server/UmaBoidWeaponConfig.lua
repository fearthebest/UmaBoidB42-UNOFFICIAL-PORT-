-- if isServer() then return end
local atkfxOn = false;
local atkfxLoop = 0;
local atkfxcounter = 0;
local atkfxendcounter = 3;
local attackSquare = nil;
local fxscript =  ScriptManager.instance:getItem("Base.GrassWonderStaffFX")
local fx = nil;
-- Detect weapon swing
local function OnWeaponSwing(character,handWeapon)
	if handWeapon ~= nil then
		local weaponName = handWeapon:getName()
		-- Check if Machan bomb is thrown then plays sounds
		if weaponName == "Aston Machan Plushie Bomb" then
			-- Get a sound and make a souns
			local randSong = ZombRand(2) + 1
			character:playSound("MachanBombThrow"..tostring(randSong))
		end
		-- Check if is swinging Grass Wonder's staff or Daiwa Scarlet's staff
		if weaponName == "Grass Wonder's Staff" or weaponName == "Daiwa Scarlet's Staff" then
			-- Get attack square and enable attack fx
			-- attackSquare = character:getAttackTargetSquare();
			-- atkfxOn = true;
		end
	end
end

-- Update Grass Wonder's staff attack effect
local function atkfxUpdate()
	if atkfxOn and attackSquare ~= nil then
		if atkfxcounter == 6 then
			-- Find a way to remove only effects	
			attackSquare:removeAllWorldObjects()
			atkfxcounter = 0
			if atkfxLoop == atkfxendcounter then
				atkfxLoop = 0
				atkfxOn = false
			else
				atkfxLoop = atkfxLoop + 1;
			end
		end
		if atkfxOn then
			atkfxcounter = atkfxcounter + 1
			fx = attackSquare:AddWorldInventoryItem("Base.GrassWonderStaffFX", 0, 0, 0)
			fxscript:DoParam("Icon = grasswonderstaffhitsfx"..tostring(atkfxcounter))
		end
	end
end
Events.OnWeaponSwing.Add(OnWeaponSwing)
-- Too buggy, should be disabled
-- Events.OnTick.Add(atkfxUpdate)