if type(isServer) == "function" and isServer() and not isClient() then
    return
end

require "ISUI/ISInventoryPane"
require "ISUI/ISInventoryPaneContextMenu"
require "TimedActions/ISWearClothing"
require "UmaBoid_Shared"

local UmaBoidSwitchContext = {}

local function getExtraData(item)
    if not item or type(item.getScriptItem) ~= "function" then
        return "", ""
    end
    local scriptItem = item:getScriptItem()
    if not scriptItem then
        return "", ""
    end
    return UmaBoid.getClothingExtras(scriptItem)
end

function UmaBoidSwitchContext.onSwitch(item, targetType, playerIndex)
    local playerObj = getSpecificPlayer(playerIndex)
    if not playerObj or not item then
        return
    end
    if not UmaBoid.isUmaBoidClothing(item) then
        return
    end

    local fullType = UmaBoid.resolveFullType(item, targetType)
    if not fullType or not UmaBoid.isAllowedSwitch(item, fullType) then
        return
    end

    if UmaBoid.requestAuthorityAction() then
        if type(item.getFullType) ~= "function" then
            return
        end
        sendClientCommand(UmaBoid.MOD_ID, UmaBoid.CMD.CostumeSwitch, {
            fromType = item:getFullType(),
            toType = fullType,
        })
        return
    end

    UmaBoid.performCostumeSwitch(playerObj, item, fullType)
end

function UmaBoidSwitchContext.addOptions(playerIndex, context, items)
    local actualItems = ISInventoryPane.getActualItems(items)
    if not actualItems or #actualItems ~= 1 then
        return
    end

    local item = actualItems[1]
    if not item or not UmaBoid.isUmaBoidClothing(item) then
        return
    end

    local extrasRaw, optionsRaw = getExtraData(item)
    if extrasRaw == "" then
        return
    end

    local extras = UmaBoid.splitSemicolon(extrasRaw)
    local options = UmaBoid.splitSemicolon(optionsRaw)
    if #extras == 0 then
        return
    end

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

local originalOnClothingItemExtra = ISInventoryPaneContextMenu.onClothingItemExtra
function ISInventoryPaneContextMenu.onClothingItemExtra(item, extra, playerObj)
    if item and UmaBoid.isUmaBoidClothing(item) and UmaBoid.requestAuthorityAction() then
        local fullType = UmaBoid.resolveFullType(item, extra)
        if fullType and UmaBoid.isAllowedSwitch(item, fullType) then
            if type(item.getFullType) == "function" then
                sendClientCommand(UmaBoid.MOD_ID, UmaBoid.CMD.CostumeSwitch, {
                    fromType = item:getFullType(),
                    toType = fullType,
                })
                return
            end
        end
    end
    originalOnClothingItemExtra(item, extra, playerObj)
end
