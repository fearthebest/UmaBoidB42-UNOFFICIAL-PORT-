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
}

for _, id in ipairs(customIds) do
    local loc = ItemBodyLocation.get(ResourceLocation.of(id))
    group:getOrCreateLocation(loc)
end
