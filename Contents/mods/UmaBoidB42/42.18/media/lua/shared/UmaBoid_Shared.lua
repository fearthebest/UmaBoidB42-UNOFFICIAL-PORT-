UmaBoid = UmaBoid or {}

UmaBoid.MOD_ID = "UmaBoid_B42_Miroki"

UmaBoid.CMD = {
    CostumeSwitch = "costumeSwitch",
    ToughnessPain = "toughnessPain",
}

UmaBoid.TOUGHNESS_TYPES = {
    Toughness = 40,
    ToughnessMax = 120,
}

function UmaBoid.isSinglePlayer()
    if type(isClient) ~= "function" or type(isServer) ~= "function" then
        return true
    end
    return not isClient() and not isServer()
end

-- PZwiki Networking: MP inventory mutations on server (all MP clients, including host).
function UmaBoid.requestAuthorityAction()
    return type(isMultiplayer) == "function" and isMultiplayer()
        and type(isClient) == "function" and isClient()
end

function UmaBoid.runsOnAuthorityJvm()
    if UmaBoid.isSinglePlayer() then
        return true
    end
    return type(isServer) == "function" and isServer()
end

function UmaBoid.trim(value)
    return (value and tostring(value):match("^%s*(.-)%s*$")) or ""
end

function UmaBoid.splitSemicolon(value)
    local out = {}
    if not value or value == "" then
        return out
    end

    local normalized = tostring(value)
    normalized = normalized:gsub("^%s*%[", ""):gsub("%]%s*$", "")
    normalized = normalized:gsub(",", ";")

    for token in normalized:gmatch("[^;]+") do
        local t = UmaBoid.trim(token)
        if t ~= "" then
            out[#out + 1] = t
        end
    end
    return out
end

function UmaBoid.getClothingExtras(scriptItem)
    if not scriptItem then
        return "", ""
    end

    local extrasRaw = ""
    local optionsRaw = ""

    if type(scriptItem.getClothingItemExtra) == "function" then
        extrasRaw = tostring(scriptItem:getClothingItemExtra() or "")
    end
    if type(scriptItem.getClothingItemExtraOption) == "function" then
        optionsRaw = tostring(scriptItem:getClothingItemExtraOption() or "")
    end

    return extrasRaw, optionsRaw
end

function UmaBoid.resolveFullType(item, targetType)
    if not item or not targetType or targetType == "" then
        return nil
    end
    if tostring(targetType):find("%.", 1, true) then
        return tostring(targetType)
    end
    if type(item.getModule) ~= "function" then
        return nil
    end
    return tostring(item:getModule()) .. "." .. tostring(targetType)
end

function UmaBoid.isUmaBoidClothing(item)
    if not item then
        return false
    end

    local scriptItem = item:getScriptItem()
    if scriptItem and type(scriptItem.getDisplayCategory) == "function" then
        if scriptItem:getDisplayCategory() == "UmaBoid" then
            return true
        end
    end

    local md = item:getModData()
    if md and md.Uma then
        return true
    end

    return false
end

function UmaBoid.isToughnessDrink(item)
    if not item or type(item.getFullType) ~= "function" then
        return false
    end
    local fullType = item:getFullType()
    return fullType == "Base.Toughness" or fullType == "Base.ToughnessMax"
end

function UmaBoid.getAllowedSwitchTargets(item)
    local targets = {}
    if not item or type(item.getScriptItem) ~= "function" then
        return targets
    end

    local scriptItem = item:getScriptItem()
    if not scriptItem then
        return targets
    end

    local extrasRaw, _ = UmaBoid.getClothingExtras(scriptItem)
    local extras = UmaBoid.splitSemicolon(extrasRaw)
    local moduleName = item:getModule()

    for i = 1, #extras do
        targets[#targets + 1] = tostring(moduleName) .. "." .. extras[i]
    end
    return targets
end

function UmaBoid.getScriptItemForFullType(fullType)
    if not fullType or fullType == "" then
        return nil
    end
    if not ScriptManager or not ScriptManager.instance then
        return nil
    end
    if type(ScriptManager.instance.getItem) ~= "function" then
        return nil
    end
    return ScriptManager.instance:getItem(fullType)
end

function UmaBoid.isUmaBoidScriptItem(scriptItem)
    if not scriptItem then
        return false
    end
    if type(scriptItem.getDisplayCategory) == "function" then
        if scriptItem:getDisplayCategory() == "UmaBoid" then
            return true
        end
    end
    return false
end

function UmaBoid.getAllowedSwitchTargetsForFullType(fromFullType)
    local targets = {}
    local scriptItem = UmaBoid.getScriptItemForFullType(fromFullType)
    if not scriptItem then
        return targets
    end

    local moduleName = "Base"
    local dotAt = tostring(fromFullType):find(".", 1, true)
    if dotAt then
        moduleName = tostring(fromFullType):sub(1, dotAt - 1)
    end

    local extrasRaw, _ = UmaBoid.getClothingExtras(scriptItem)
    local extras = UmaBoid.splitSemicolon(extrasRaw)
    for i = 1, #extras do
        targets[#targets + 1] = moduleName .. "." .. extras[i]
    end
    return targets
end

function UmaBoid.isAllowedSwitchForFullTypes(fromFullType, toFullType)
    if not UmaBoid.isUmaBoidScriptItem(UmaBoid.getScriptItemForFullType(fromFullType)) then
        return false
    end
    if not toFullType or tostring(toFullType):sub(1, 5) ~= "Base." then
        return false
    end

    local targets = UmaBoid.getAllowedSwitchTargetsForFullType(fromFullType)
    for i = 1, #targets do
        if targets[i] == toFullType then
            return true
        end
    end
    return false
end

function UmaBoid.isAllowedSwitch(item, toFullType)
    if not UmaBoid.isUmaBoidClothing(item) then
        return false
    end
    if type(item.getFullType) ~= "function" then
        return false
    end
    return UmaBoid.isAllowedSwitchForFullTypes(item:getFullType(), toFullType)
end

function UmaBoid.copyItemState(fromItem, toItem)
    if not fromItem or not toItem then
        return
    end
    if type(fromItem.getCondition) == "function" and type(toItem.setCondition) == "function" then
        toItem:setCondition(fromItem:getCondition())
    end
    if type(fromItem.isFavorite) == "function" and type(toItem.setFavorite) == "function" then
        toItem:setFavorite(fromItem:isFavorite())
    end
    if type(fromItem.getModData) == "function" and type(toItem.getModData) == "function" then
        local fromMd = fromItem:getModData()
        if fromMd and fromMd.Uma then
            toItem:getModData().Uma = fromMd.Uma
        end
    end
end

local function syncContainerAdd(container, item)
    if item and sendAddItemToContainer then
        sendAddItemToContainer(container, item)
    end
end

local function syncContainerRemove(container, item)
    if item and sendRemoveItemFromContainer then
        sendRemoveItemFromContainer(container, item)
    end
end

local function syncWornItem(player, bodyLocation, item)
    if not player or not bodyLocation or not item then
        return
    end
    if sendClothing then
        sendClothing(player, bodyLocation, item)
    end
    if syncClothingFields then
        syncClothingFields(player)
    end
end

function UmaBoid.findItemInContainer(container, itemId)
    if not container or type(container.getItems) ~= "function" or not itemId then
        return nil, nil
    end

    local items = container:getItems()
    if not items then
        return nil, nil
    end

    for i = 0, items:size() - 1 do
        local item = items:get(i)
        if item and type(item.getID) == "function" and item:getID() == itemId then
            return item, container
        end
        if item and type(item.getItemContainer) == "function" then
            local sub = item:getItemContainer()
            if sub then
                local foundItem, foundContainer = UmaBoid.findItemInContainer(sub, itemId)
                if foundItem then
                    return foundItem, foundContainer
                end
            end
        end
    end

    return nil, nil
end

function UmaBoid.findItemInContainerByFullType(container, fullType)
    if not container or type(container.getItems) ~= "function" or not fullType then
        return nil
    end

    local items = container:getItems()
    if not items then
        return nil
    end

    for i = 0, items:size() - 1 do
        local item = items:get(i)
        if item and type(item.getFullType) == "function" and item:getFullType() == fullType then
            return item
        end
        if item and type(item.getItemContainer) == "function" then
            local sub = item:getItemContainer()
            if sub then
                local foundItem = UmaBoid.findItemInContainerByFullType(sub, fullType)
                if foundItem then
                    return foundItem
                end
            end
        end
    end

    return nil
end

function UmaBoid.findPlayerItemByFullType(player, fullType)
    if not player or not fullType then
        return nil
    end

    if type(player.getWornItems) == "function" then
        local worn = player:getWornItems()
        if worn then
            for i = 0, worn:size() - 1 do
                local item = nil
                if type(worn.getItemByIndex) == "function" then
                    item = worn:getItemByIndex(i)
                end
                if item and type(item.getFullType) == "function" and item:getFullType() == fullType then
                    return item
                end
            end
        end
    end

    if type(player.getInventory) == "function" then
        return UmaBoid.findItemInContainerByFullType(player:getInventory(), fullType)
    end

    return nil
end

function UmaBoid.findPlayerItem(player, itemId)
    if not player or not itemId then
        return nil, nil
    end

    if type(player.getWornItems) == "function" then
        local worn = player:getWornItems()
        if worn and type(worn.getItemById) == "function" then
            local wornItem = worn:getItemById(itemId)
            if wornItem then
                return wornItem, player:getInventory()
            end
        end
        if worn then
            for i = 0, worn:size() - 1 do
                local item = nil
                if type(worn.getItemByIndex) == "function" then
                    item = worn:getItemByIndex(i)
                end
                if item and type(item.getID) == "function" and item:getID() == itemId then
                    return item, player:getInventory()
                end
            end
        end
    end

    if type(player.getInventory) == "function" then
        return UmaBoid.findItemInContainer(player:getInventory(), itemId)
    end

    return nil, nil
end

function UmaBoid.applyToughnessPain(character, itemType, percentage)
    if not character or type(character.getStats) ~= "function" then
        return
    end

    local base = UmaBoid.TOUGHNESS_TYPES[itemType]
    if not base then
        return
    end

    local pct = percentage
    if type(pct) ~= "number" or pct < 0 or pct > 1 then
        pct = 1
    end

    local stats = character:getStats()
    if not stats or type(stats.getPain) ~= "function" or type(stats.setPain) ~= "function" then
        return
    end

    local reduceAmt = base * pct
    stats:setPain(stats:getPain() - reduceAmt)
end

function UmaBoid.performCostumeSwitch(player, item, toFullType)
    if not player or not item or not toFullType then
        return false
    end
    if not UmaBoid.isAllowedSwitch(item, toFullType) then
        return false
    end

    local container = item:getContainer()
    if not container then
        container = player:getInventory()
    end
    if not container then
        return false
    end

    local wasEquipped = false
    if type(item.isEquipped) == "function" then
        wasEquipped = item:isEquipped()
    end

    local bodyLocation = nil
    if wasEquipped and type(player.getWornItems) == "function" then
        local worn = player:getWornItems()
        if worn and type(worn.getLocation) == "function" then
            bodyLocation = worn:getLocation(item)
        end
    end
    if not bodyLocation and type(item.getBodyLocation) == "function" then
        bodyLocation = item:getBodyLocation()
    end

    if wasEquipped and type(player.removeWornItem) == "function" then
        player:removeWornItem(item)
    end

    local newItem = container:AddItem(toFullType)
    if not newItem then
        return false
    end

    UmaBoid.copyItemState(item, newItem)
    container:Remove(item)
    syncContainerRemove(container, item)
    syncContainerAdd(container, newItem)

    if wasEquipped and bodyLocation and type(player.setWornItem) == "function" then
        player:setWornItem(bodyLocation, newItem)
        syncWornItem(player, bodyLocation, newItem)
    elseif wasEquipped and type(player.setWornItem) == "function"
        and type(newItem.getBodyLocation) == "function" then
        local newBodyLocation = newItem:getBodyLocation()
        player:setWornItem(newBodyLocation, newItem)
        syncWornItem(player, newBodyLocation, newItem)
    end

    if type(newItem.setNeedTransmit) == "function" then
        newItem:setNeedTransmit(true)
    end
    if type(container.setDrawDirty) == "function" then
        container:setDrawDirty(true)
    end

    return true
end
