if type(isServer) == "function" and isServer() and not isClient() then
    return
end

local fxscript = nil
if ScriptManager and ScriptManager.instance and type(ScriptManager.instance.getItem) == "function" then
    fxscript = ScriptManager.instance:getItem("Base.GrassWonderStaffFX")
end

local function OnWeaponSwing(character, handWeapon)
    if not character or not handWeapon or type(handWeapon.getName) ~= "function" then
        return
    end

    local weaponName = handWeapon:getName()
    if weaponName == "Aston Machan Plushie Bomb" then
        local randSong = ZombRand(2) + 1
        character:playSound("MachanBombThrow" .. tostring(randSong))
    end
end

Events.OnWeaponSwing.Add(OnWeaponSwing)
