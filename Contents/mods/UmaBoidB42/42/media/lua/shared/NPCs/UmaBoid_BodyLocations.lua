local group = BodyLocations.getGroup("Human")

local customIds = {
    "umaboid:back",
    "umaboid:hip2",
    "umaboid:spine_front",
    "umaboid:spine_back",
    "umaboid:torso",
    "umaboid:torso_extra",
    "umaboid:legs",
    "umaboid:tail",
    "umaboid:shoulder_right",
    "umaboid:shoulder_left",
    "umaboid:foot",
    "umaboid:head_extra",
    "umaboid:costume",
}

for _, id in ipairs(customIds) do
    local loc = ItemBodyLocation.get(ResourceLocation.of(id))
    group:getOrCreateLocation(loc)
end

-- Full-body costumes: hide other clothing meshes only.
-- No setExclusive — armor/clothes stay equipped so defenses still stack.
local costume = ItemBodyLocation.get(ResourceLocation.of("umaboid:costume"))

local hideUnderCostume = {
    ItemBodyLocation.SKIRT,
    ItemBodyLocation.LONG_SKIRT,
    ItemBodyLocation.PANTS,
    ItemBodyLocation.PANTS_SKINNY,
    ItemBodyLocation.PANTS_EXTRA,
    ItemBodyLocation.SHORT_PANTS,
    ItemBodyLocation.SHORTS_SHORT,
    ItemBodyLocation.DRESS,
    ItemBodyLocation.LONG_DRESS,
    ItemBodyLocation.LEGS5,
    ItemBodyLocation.SOCKS,
    ItemBodyLocation.CODPIECE,
    ItemBodyLocation.THIGH_LEFT,
    ItemBodyLocation.THIGH_RIGHT,
    ItemBodyLocation.KNEE_LEFT,
    ItemBodyLocation.KNEE_RIGHT,
    ItemBodyLocation.CALF_LEFT,
    ItemBodyLocation.CALF_RIGHT,
    ItemBodyLocation.UNDERWEAR_BOTTOM,
    ItemBodyLocation.TSHIRT,
    ItemBodyLocation.TANK_TOP,
    ItemBodyLocation.SHIRT,
    ItemBodyLocation.SHORT_SLEEVE_SHIRT,
    ItemBodyLocation.SWEATER,
    ItemBodyLocation.SWEATER_HAT,
    ItemBodyLocation.JERSEY,
    ItemBodyLocation.JACKET,
    ItemBodyLocation.JACKET_DOWN,
    ItemBodyLocation.JACKET_SUIT,
    ItemBodyLocation.JACKET_HAT,
    ItemBodyLocation.JACKET_BULKY,
    ItemBodyLocation.JACKET_HAT_BULKY,
    ItemBodyLocation.TORSO_EXTRA,
    ItemBodyLocation.TORSO_EXTRA_VEST,
    ItemBodyLocation.TORSO_EXTRA_VEST_BULLET,
    ItemBodyLocation.CUIRASS,
    ItemBodyLocation.FULL_TOP,
    ItemBodyLocation.BOILERSUIT,
    ItemBodyLocation.BATH_ROBE,
    ItemBodyLocation.FULL_ROBE,
    ItemBodyLocation.BODY_COSTUME,
}

local umaboidHide = {
    "umaboid:legs",
    "umaboid:torso",
    "umaboid:torso_extra",
    "umaboid:foot",
}

for _, other in ipairs(hideUnderCostume) do
    if other ~= nil then
        group:setHideModel(costume, other)
    end
end

for _, id in ipairs(umaboidHide) do
    local other = ItemBodyLocation.get(ResourceLocation.of(id))
    if other ~= nil then
        group:setHideModel(costume, other)
    end
end
