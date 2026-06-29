if type(isClient) == "function" and isClient()
    and type(isServer) == "function" and not isServer() then
    return
end

require "UmaBoid_Shared"

local switchCooldown = {}
local painCooldown = {}
local SWITCH_COOLDOWN_MS = 400
local PAIN_COOLDOWN_MS = 1500

local function onCooldown(tableRef, player, ms)
    if not player or type(player.getUsername) ~= "function" then
        return true
    end
    local key = player:getUsername()
    local now = getTimestampMs()
    local last = tableRef[key]
    if last and (now - last) < ms then
        return true
    end
    tableRef[key] = now
    return false
end

local function handleCostumeSwitch(player, args)
    if not player or type(args) ~= "table" then
        return
    end
    if not UmaBoid.runsOnAuthorityJvm() then
        return
    end

    local fromFullType = args.fromType
    local toFullType = args.toType
    if type(fromFullType) ~= "string" or type(toFullType) ~= "string" then
        return
    end
    if onCooldown(switchCooldown, player, SWITCH_COOLDOWN_MS) then
        return
    end

    if not UmaBoid.isAllowedSwitchForFullTypes(fromFullType, toFullType) then
        print("[UmaBoid] costume switch rejected: invalid target for " .. player:getUsername())
        return
    end

    local item = UmaBoid.findPlayerItemByFullType(player, fromFullType)
    if not item then
        print("[UmaBoid] costume switch rejected: item not found for " .. player:getUsername())
        return
    end

    if not UmaBoid.performCostumeSwitch(player, item, toFullType) then
        print("[UmaBoid] costume switch rejected: switch failed for " .. player:getUsername())
    end
end

local function handleToughnessPain(player, args)
    if not player or type(args) ~= "table" then
        return
    end
    if not UmaBoid.runsOnAuthorityJvm() then
        return
    end

    local itemType = args.itemType
    local pct = args.pct
    if type(itemType) ~= "string" then
        return
    end
    if itemType ~= "Toughness" and itemType ~= "ToughnessMax" then
        return
    end
    if onCooldown(painCooldown, player, PAIN_COOLDOWN_MS) then
        return
    end

    UmaBoid.applyToughnessPain(player, itemType, pct)
end

local function onClientCommand(module, command, player, args)
    if module ~= UmaBoid.MOD_ID or not player then
        return
    end
    if not isServer() then
        return
    end

    if command == UmaBoid.CMD.CostumeSwitch then
        handleCostumeSwitch(player, args)
    elseif command == UmaBoid.CMD.ToughnessPain then
        handleToughnessPain(player, args)
    end
end

Events.OnClientCommand.Add(onClientCommand)
