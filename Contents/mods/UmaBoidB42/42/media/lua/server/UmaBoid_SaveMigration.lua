-- Save-safe migration: costume Base.Vodka -> Base.UmaVodka (vanilla drink untouched).

if type(isClient) == "function" and isClient()
    and type(isServer) == "function" and not isServer() then
    return
end

require "UmaBoid_Shared"

local OLD_TYPE = "Base.Vodka"
local NEW_TYPE = "Base.UmaVodka"

local function isCostumeVodka(item)
    if not item or type(item.getFullType) ~= "function" then
        return false
    end
    if item:getFullType() ~= OLD_TYPE then
        return false
    end
    if type(item.IsClothing) == "function" and item:IsClothing() then
        return true
    end
    local md = item:getModData()
    if md and md.Uma == "Vodka" then
        return true
    end
    return false
end

local function replaceCostumeVodka(container, oldItem, player)
    if not container or not oldItem or not player then
        return
    end

    local wasEquipped = false
    if type(oldItem.isEquipped) == "function" then
        wasEquipped = oldItem:isEquipped()
    end

    local newItem = container:AddItem(NEW_TYPE)
    if not newItem then
        return
    end

    UmaBoid.copyItemState(oldItem, newItem)
    container:Remove(oldItem)

    if wasEquipped and type(player.setWornItem) == "function"
        and type(newItem.getBodyLocation) == "function" then
        player:setWornItem(newItem:getBodyLocation(), newItem)
    end

    if type(newItem.setNeedTransmit) == "function" then
        newItem:setNeedTransmit(true)
    end
end

local function scanContainer(container, player)
    if not container or type(container.getItems) ~= "function" then
        return
    end

    local items = container:getItems()
    if not items then
        return
    end

    for i = items:size() - 1, 0, -1 do
        local item = items:get(i)
        if item and isCostumeVodka(item) then
            replaceCostumeVodka(container, item, player)
        elseif item and type(item.getItemContainer) == "function" then
            local sub = item:getItemContainer()
            if sub then
                scanContainer(sub, player)
            end
        end
    end
end

local function migratePlayer(player)
    if not player then
        return
    end

    if type(player.getWornItems) == "function" then
        local worn = player:getWornItems()
        if worn then
            for i = worn:size() - 1, 0, -1 do
                local item = nil
                if type(worn.getItemByIndex) == "function" then
                    item = worn:getItemByIndex(i)
                end
                if item and isCostumeVodka(item) then
                    local inv = player:getInventory()
                    if inv then
                        replaceCostumeVodka(inv, item, player)
                    end
                end
            end
        end
    end

    if type(player.getInventory) == "function" then
        scanContainer(player:getInventory(), player)
    end
end

local function onPlayerReady(player)
    migratePlayer(player)
end

Events.OnCreatePlayer.Add(onPlayerReady)

local function onGameStart()
    if type(isServer) == "function" and isServer() then
        local players = getOnlinePlayers()
        if players then
            for i = 0, players:size() - 1 do
                migratePlayer(players:get(i))
            end
        end
    else
        migratePlayer(getSpecificPlayer(0))
    end
end

Events.OnGameStart.Add(onGameStart)
