if type(isServer) == "function" and isServer() and not isClient() then
    return
end

require "TimedActions/ISWearClothing"
require "TimedActions/ISEatFoodAction"
require "UmaBoid_Shared"

local original_ISWearClothing_perform = ISWearClothing.perform
function ISWearClothing:perform()
    original_ISWearClothing_perform(self)

    local item = self.item
    if not item or not UmaBoid.isUmaBoidClothing(item) then
        return
    end

    if type(item.getBodyLocation) ~= "function" then
        return
    end

    local bodyLoc = item:getBodyLocation()
    if bodyLoc == nil or bodyLoc ~= ItemBodyLocation.SHOES then
        return
    end

    local umaModData = item:getModData().Uma
    if umaModData then
        self.character:getModData().Uma = umaModData
    else
        self.character:getModData().Uma = nil
    end
end

local original_ISEatFoodAction_perform = ISEatFoodAction.perform
function ISEatFoodAction:perform()
    original_ISEatFoodAction_perform(self)

    local item = self.item
    if not item or not UmaBoid.isToughnessDrink(item) then
        return
    end

    local itemName = item:getType()
    local pct = self.percentage or 1

    if UmaBoid.requestAuthorityAction() then
        sendClientCommand(UmaBoid.MOD_ID, UmaBoid.CMD.ToughnessPain, {
            itemType = itemName,
            pct = pct,
        })
        return
    end

    UmaBoid.applyToughnessPain(self.character, itemName, pct)
end
