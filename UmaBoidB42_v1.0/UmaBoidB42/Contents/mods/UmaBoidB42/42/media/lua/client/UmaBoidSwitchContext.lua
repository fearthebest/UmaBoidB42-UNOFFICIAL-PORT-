require "ISUI/ISInventoryPane"
require "ISUI/ISInventoryPaneContextMenu"
require "TimedActions/ISWearClothing"

local UmaBoidSwitchContext = {}

local function trim(s)
    return (s and s:match("^%s*(.-)%s*$")) or ""
end

local function splitSemicolon(value)
    local out = {}
    if not value or value == "" then
        return out
    end

    local normalized = tostring(value)
    -- B42 script getters may stringify arrays as "[A, B]".
    normalized = normalized:gsub("^%s*%[", ""):gsub("%]%s*$", "")
    normalized = normalized:gsub(",", ";")

    for token in normalized:gmatch("[^;]+") do
        local t = trim(token)
        if t ~= "" then
            out[#out + 1] = t
        end
    end
    return out
end

local function getExtraData(item)
    if not item then return nil, nil end
    local scriptItem = item:getScriptItem()
    if not scriptItem then return nil, nil end

    local extras
    local options

    local ok1, v1 = pcall(function() return scriptItem:getClothingItemExtra() end)
    if ok1 then extras = v1 end

    local ok2, v2 = pcall(function() return scriptItem:getClothingItemExtraOption() end)
    if ok2 then options = v2 end

    return tostring(extras or ""), tostring(options or "")
end

local function resolveFullType(item, targetType)
    if not targetType or targetType == "" then return nil end
    if targetType:find("%.", 1, true) then
        return targetType
    end
    return tostring(item:getModule()) .. "." .. targetType
end

function UmaBoidSwitchContext.onSwitch(item, targetType, playerIndex)
    local playerObj = getSpecificPlayer(playerIndex)
    if not playerObj or not item then return end

    local inv = playerObj:getInventory()
    if not inv then return end

    local fullType = resolveFullType(item, targetType)
    if not fullType then return end

    local newItem = inv:AddItem(fullType)
    if not newItem then return end

    -- Preserve a few useful values where possible.
    pcall(function() newItem:setCondition(item:getCondition()) end)
    pcall(function() newItem:setFavorite(item:isFavorite()) end)

    -- If original was worn, wear replacement right away.
    local wasEquipped = false
    pcall(function() wasEquipped = item:isEquipped() end)
    if wasEquipped then
        ISTimedActionQueue.add(ISWearClothing:new(playerObj, newItem, 1))
    end

    inv:Remove(item)
end

function UmaBoidSwitchContext.addOptions(playerIndex, context, items)
    local actualItems = ISInventoryPane.getActualItems(items)
    if not actualItems or #actualItems ~= 1 then return end

    local item = actualItems[1]
    if not item then return end

    local extrasRaw, optionsRaw = getExtraData(item)
    if extrasRaw == "" then return end

    local extras = splitSemicolon(extrasRaw)
    local options = splitSemicolon(optionsRaw)
    if #extras == 0 then return end

    for i = 1, #extras do
        local target = extras[i]
        local optionToken = options[i] or ("Switch " .. target)
        local textKey = "ContextMenu_" .. optionToken
        local label = getText(textKey)
        if not label or label == textKey then
            label = optionToken
        end
        context:addOption(label, item, UmaBoidSwitchContext.onSwitch, target, playerIndex)
    end
end

Events.OnFillInventoryObjectContextMenu.Add(UmaBoidSwitchContext.addOptions)

