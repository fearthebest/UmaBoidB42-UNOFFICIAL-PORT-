require 'TimedActions/ISWearClothing'
require 'TimedActions/ISEatFoodAction'
require 'ISUI/ISEmoteRadialMenu'
---------------------- 
-- Apply Uma Mod Data to character on equiping
local original_ISWearClothing_perform = ISWearClothing.perform
function ISWearClothing:perform()
    -- Wear as usual
    original_ISWearClothing_perform(self)
    -- Get item data
    local item = self.item;
    if not item then
        return
    end
    -- Check if this item is shoes
    local okBodyLoc, bodyLoc = pcall(function() return item:getBodyLocation() end)
    -- B42: getBodyLocation() returns ItemBodyLocation, not the string "Shoes"
    local isShoes = okBodyLoc and bodyLoc ~= nil and bodyLoc == ItemBodyLocation.SHOES
    -- If not shoes, skip checking entirely
    if not isShoes then
        return
    end
    -- Check if has Uma mod data
    local umaModData = item:getModData().Uma
    -- Apply/Remove mod data
    if umaModData then
        self.character:getModData().Uma = umaModData
    else
        self.character:getModData().Uma = nil
    end

end

---------------------- 
-- Apply pain reduction after consuming TP Drinks
local original_ISEatFoodAction_perform = ISEatFoodAction.perform
function ISEatFoodAction:perform()
    -- Eat as usual
    original_ISEatFoodAction_perform(self)
    -- Get item data
    local item = self.item
    if not item then return end
    local itemName = item:getType()
    -- If not TP drink, skip
    if itemName == "Toughness" then
        local painReduceBase = 40
        local painReduceAmt = painReduceBase * self.percentage
        self.character:getStats():setPain(self.character:getStats():getPain() - painReduceBase);
    end
    if itemName == "ToughnessMax" then
        local painReduceBase = 120
        local painReduceAmt = painReduceBase * self.percentage
        self.character:getStats():setPain(self.character:getStats():getPain() - painReduceBase);
    end
end

-- ---------------------- 
-- -- Use a special shout voiceline if player is specific character
-- local original_ISEmoteRadialMenu_emote = ISEmoteRadialMenu.emote

-- function ISEmoteRadialMenu:emote(emote)
--     original_ISEmoteRadialMenu_emote(self,emote)
--     -- Check if shout mote 
--     local player = self.character
--     local umaModData = player:getModData().Uma
--     if emote == "shout" then 
--         -- Check if is using character with special shout
--         if umaModData == "DaitakuHelios" or umaModData == "MatikaneTannhauser" then 
--             -- Get Player and Uma player is using
--             -- Emit sounds
--             player:playSound(tostring(umaModData.."Shout"))
--         end
--     end
-- end

-- function specialShout(key)
-- -- Check if press shout key
--     -- Get Player and Uma player is using
--     local player = getSpecificPlayer(0)
--     local umaModData = player:getModData().Uma
--     -- Skip if not shout key / not uma / sneaking
--     if key ~= getCore():getKey("Shout") or not umaModData or player:isSneaking() then
--         return false
--      -- Only Helios and Tannhausser supported atm
--     elseif umaModData == "DaitakuHelios" or umaModData == "MatikaneTannhauser" then 
--         -- Get Player and Uma player is using
--         -- Emit sounds
--         player:playSound(tostring(umaModData.."Shout"))
--     end
-- end

-- Bind Events
--local function OnGameStart() Events.OnKeyPressed.Add(specialShout) end
--Events.OnGameStart.Add(OnGameStart)