if isClient() then return end

require "Items/ProceduralDistributions"
require "Items/Distributions"

local UmaBoidDistributions = {}

local genericWeaponsRate = 1
local heavyWeaponsRate = 1
local magicWeaponsRate = 1
local consumablesRate = 1.25
local booksRate = 1

local function insertTableSafe(listName, pairTable)
    local bucket = ProceduralDistributions.list[listName]
    if not bucket or type(bucket.items) ~= "table" then
        return
    end

    for i = 1, #pairTable, 2 do
        table.insert(bucket.items, pairTable[i])
        table.insert(bucket.items, pairTable[i + 1])
    end
end

local function initSandboxRates()
    local umaboidVars = SandboxVars.UmaBoid or {}
    genericWeaponsRate = (umaboidVars.GenericWeaponLoot or 5) * 0.2
    heavyWeaponsRate = (umaboidVars.HeavyWeaponLoot or 5) * 0.2
    magicWeaponsRate = (umaboidVars.MagicWeaponLoot or 5) * 0.2
    consumablesRate = (umaboidVars.ConsumableLoot or 5) * 0.25
    booksRate = (umaboidVars.BookLoot or 5) * 0.2
end

local function applyDistributions()
    if UmaBoidDistributions.done then return end
    UmaBoidDistributions.done = true

-- Weapons

insertTableSafe("MeleeWeapons", {"Base.GrassWonderNaginata"     ,2 * heavyWeaponsRate })
insertTableSafe("MeleeWeapons", {"Base.EishinFlashSword"        ,4 * heavyWeaponsRate })


insertTableSafe("CrateMechanics", {"Base.GrassWonderNaginata"     ,0.2 * heavyWeaponsRate })
insertTableSafe("CrateMechanics", {"Base.EishinFlashSword"        ,0.3 * heavyWeaponsRate })

insertTableSafe("ArmyHangarTools", {"Base.GrassWonderNaginata"     ,0.3 * heavyWeaponsRate })
insertTableSafe("ArmyHangarTools", {"Base.EishinFlashSword"        ,0.6 * heavyWeaponsRate })

insertTableSafe("GarageTools", {"Base.GrassWonderNaginata"     ,0.3 * heavyWeaponsRate })
insertTableSafe("GarageTools", {"Base.EishinFlashSword"        ,0.3 * heavyWeaponsRate })

insertTableSafe("CrateRandomJunk", {"Base.GrassWonderNaginata"     ,0.05 * heavyWeaponsRate })
insertTableSafe("CrateRandomJunk", {"Base.EishinFlashSword"        ,0.05 * heavyWeaponsRate })

insertTableSafe("CrateTools", {"Base.GrassWonderNaginata"     ,0.1 * heavyWeaponsRate })
insertTableSafe("CrateTools", {"Base.EishinFlashSword"        ,0.1 * heavyWeaponsRate })

insertTableSafe("DrugShackTools", {"Base.GrassWonderNaginata"     ,0.1 * heavyWeaponsRate })
insertTableSafe("DrugShackTools", {"Base.EishinFlashSword"        ,0.1 * heavyWeaponsRate })

insertTableSafe("DrugShackWeapons", {"Base.GrassWonderNaginata"     ,0.1 * heavyWeaponsRate })
insertTableSafe("DrugShackWeapons", {"Base.EishinFlashSword"        ,0.1 * heavyWeaponsRate })

insertTableSafe("FireStorageTools", {"Base.EishinFlashSword"        ,1 * heavyWeaponsRate })
insertTableSafe("FireStorageTools", {"Base.GrassWonderNaginata"     ,1 * heavyWeaponsRate })

insertTableSafe("ForestFireTools", {"Base.EishinFlashSword"        ,0.05 * heavyWeaponsRate })
insertTableSafe("ForestFireTools", {"Base.GrassWonderNaginata"     ,0.05 * heavyWeaponsRate })

insertTableSafe("GarageCarpentry", {"Base.EishinFlashSword"        ,0.2 * heavyWeaponsRate })
insertTableSafe("GarageCarpentry", {"Base.GrassWonderNaginata"     ,0.2 * heavyWeaponsRate })

insertTableSafe("GardenStoreTools", {"Base.EishinFlashSword"        ,0.05 * heavyWeaponsRate })
insertTableSafe("GardenStoreTools", {"Base.GrassWonderNaginata"     ,0.05 * heavyWeaponsRate })

insertTableSafe("GigamartFarming", {"Base.EishinFlashSword"        ,0.05 * heavyWeaponsRate })
insertTableSafe("GigamartFarming", {"Base.GrassWonderNaginata"     ,0.05 * heavyWeaponsRate })

insertTableSafe("GigamartTools", {"Base.EishinFlashSword"        ,0.25 * heavyWeaponsRate })
insertTableSafe("GigamartTools", {"Base.GrassWonderNaginata"     ,0.25 * heavyWeaponsRate })

insertTableSafe("Homesteading", {"Base.EishinFlashSword"        ,0.25 * heavyWeaponsRate })
insertTableSafe("Homesteading", {"Base.GrassWonderNaginata"     ,0.25 * heavyWeaponsRate })

insertTableSafe("LoggingFactoryTools", {"Base.EishinFlashSword"        ,0.5 * heavyWeaponsRate })
insertTableSafe("LoggingFactoryTools", {"Base.GrassWonderNaginata"     ,0.5 * heavyWeaponsRate })

insertTableSafe("SurvivalGear", {"Base.EishinFlashSword"        ,0.5 * heavyWeaponsRate })
insertTableSafe("SurvivalGear", {"Base.GrassWonderNaginata"     ,0.5 * heavyWeaponsRate })

insertTableSafe("ToolStoreCarpentry", {"Base.EishinFlashSword"        ,0.1 * heavyWeaponsRate })
insertTableSafe("ToolStoreCarpentry", {"Base.GrassWonderNaginata"     ,0.1 * heavyWeaponsRate })

insertTableSafe("ToolStoreFarming", {"Base.EishinFlashSword"        ,0.05 * heavyWeaponsRate })
insertTableSafe("ToolStoreFarming", {"Base.GrassWonderNaginata"     ,0.05 * heavyWeaponsRate })

insertTableSafe("ToolStoreTools", {"Base.EishinFlashSword"        ,0.1 * heavyWeaponsRate })
insertTableSafe("ToolStoreTools", {"Base.GrassWonderNaginata"     ,0.1 * heavyWeaponsRate })

insertTableSafe("PawnShopKnives", {"Base.EishinFlashSword"        ,0.5 * heavyWeaponsRate })
insertTableSafe("PawnShopKnives", {"Base.GrassWonderNaginata"     ,0.8 * heavyWeaponsRate })

local _bms = "Base.BambooMemoryShinai"
insertTableSafe("MeleeWeapons", {_bms     ,4 * genericWeaponsRate})
insertTableSafe("CrateMechanics", {_bms     ,0.5 * genericWeaponsRate })
insertTableSafe("ArmyHangarTools", {_bms     ,0.5 * genericWeaponsRate })
insertTableSafe("GarageTools", {_bms     ,0.5 * genericWeaponsRate })
insertTableSafe("CrateRandomJunk", {_bms     ,0.1 * genericWeaponsRate })
insertTableSafe("CrateTools", {_bms     ,0.2 * genericWeaponsRate })
insertTableSafe("DrugShackTools", {_bms     ,0.3 * genericWeaponsRate })
insertTableSafe("DrugShackWeapons", {_bms     ,0.3 * genericWeaponsRate })
insertTableSafe("FireStorageTools", {_bms        ,3 * genericWeaponsRate })
insertTableSafe("ForestFireTools", {_bms        ,0.2 * genericWeaponsRate })
insertTableSafe("GarageCarpentry", {_bms        ,0.5 * genericWeaponsRate })
insertTableSafe("Hobbies", {_bms        ,1 * genericWeaponsRate })
insertTableSafe("BarCounterWeapon", {_bms        ,2 * genericWeaponsRate })
insertTableSafe("BarCratePool", {_bms        ,2 * genericWeaponsRate })
insertTableSafe("ClosetShelfGeneric", {_bms        ,2 * genericWeaponsRate })
insertTableSafe("ToolStoreTools", {_bms        ,0.5 * genericWeaponsRate })
insertTableSafe("LivingRoomShelfNoTapes", {_bms        ,0.25 * genericWeaponsRate })
insertTableSafe("LivingRoomShelf", {_bms        ,0.25 * genericWeaponsRate })
insertTableSafe("ShelfGeneric", {_bms        ,0.1 * genericWeaponsRate })
insertTableSafe("GigamartToys", {_bms        ,0.1 * genericWeaponsRate })

local _tmos = "Base.TMOperaOStaff"
insertTableSafe("MeleeWeapons", {_tmos     ,4 * genericWeaponsRate})
insertTableSafe("CrateMechanics", {_tmos     ,0.5 * genericWeaponsRate })
insertTableSafe("GarageTools", {_tmos     ,0.5 * genericWeaponsRate })
insertTableSafe("CrateRandomJunk", {_tmos     ,0.1 * genericWeaponsRate })
insertTableSafe("CrateTools", {_tmos     ,0.2 * genericWeaponsRate })
insertTableSafe("DrugShackTools", {_tmos     ,0.3 * genericWeaponsRate })
insertTableSafe("DrugShackWeapons", {_tmos     ,0.3 * genericWeaponsRate })
insertTableSafe("FireStorageTools", {_tmos        ,3 * genericWeaponsRate })
insertTableSafe("GarageCarpentry", {_tmos        ,0.5 * genericWeaponsRate })
insertTableSafe("Hobbies", {_tmos        ,1.5 * genericWeaponsRate })
insertTableSafe("BarCounterWeapon", {_tmos        ,2 * genericWeaponsRate })
insertTableSafe("BarCratePool", {_tmos        ,2 * genericWeaponsRate })
insertTableSafe("ClosetShelfGeneric", {_tmos        ,3  * genericWeaponsRate})
insertTableSafe("ToolStoreTools", {_tmos        ,0.5 * genericWeaponsRate })
insertTableSafe("LivingRoomShelfNoTapes", {_tmos        ,0.25 * genericWeaponsRate })
insertTableSafe("LivingRoomShelf", {_tmos        ,0.25 * genericWeaponsRate })
insertTableSafe("ShelfGeneric", {_tmos        ,0.1 * genericWeaponsRate })

insertTableSafe("WardrobeMan", { _tmos        ,0.15 * genericWeaponsRate})
insertTableSafe("WardrobeManClassy", { _tmos        ,0.15 * genericWeaponsRate})
insertTableSafe("WardrobeWoman", { _tmos        ,0.15 * genericWeaponsRate})
insertTableSafe("WardrobeWomanClassy", { _tmos        ,0.15 * genericWeaponsRate})
insertTableSafe("ClosetShelfGeneric", { _tmos        ,0.15 * genericWeaponsRate})

local _gws = "Base.GrassWonderStaff"
insertTableSafe("ArmyHangarTools", { _gws        ,0.01 * magicWeaponsRate })
insertTableSafe("CrateTools", { _gws        ,0.01 * magicWeaponsRate})
insertTableSafe("DrugShackTools", { _gws        ,0.01 * magicWeaponsRate})
insertTableSafe("FireStorageTools", { _gws        ,0.01 * magicWeaponsRate})
insertTableSafe("GarageTools", { _gws        ,0.01 * magicWeaponsRate})
insertTableSafe("GigamartTools", { _gws        ,0.01 * magicWeaponsRate})
insertTableSafe("LoggingFactoryTools", { _gws        ,0.05 * magicWeaponsRate })
insertTableSafe("MeleeWeapons", { _gws        ,0.2 * magicWeaponsRate})
insertTableSafe("ToolStoreTools", { _gws        ,0.01 * magicWeaponsRate })
insertTableSafe("CrateRandomJunk", { _gws        ,0.01 * magicWeaponsRate})
insertTableSafe("GarageCarpentry", { _gws        ,0.01 * magicWeaponsRate})
insertTableSafe("ToolStoreTools", { _gws        ,0.01 * magicWeaponsRate})
insertTableSafe("Hobbies", {_gws        ,0.001 * magicWeaponsRate })
insertTableSafe("HolidayStuff", {_gws        ,0.001 * magicWeaponsRate })
insertTableSafe("Gifts", {_gws        ,0.001 * magicWeaponsRate })
insertTableSafe("GigamartToys", {_gws        ,0.001 * magicWeaponsRate })

local _dss = "Base.DaiwaScarletStaff"
insertTableSafe("ArmyHangarTools", { _dss         ,0.01 * magicWeaponsRate})
insertTableSafe("CrateTools", { _dss         ,0.01 * magicWeaponsRate})
insertTableSafe("DrugShackTools", { _dss         ,0.01 * magicWeaponsRate})
insertTableSafe("FireStorageTools", { _dss         ,0.01 * magicWeaponsRate})
insertTableSafe("GarageTools", { _dss         ,0.01 * magicWeaponsRate})
insertTableSafe("GigamartTools", { _dss         ,0.01 * magicWeaponsRate})
insertTableSafe("LoggingFactoryTools", { _dss         ,0.05 * magicWeaponsRate})
insertTableSafe("MeleeWeapons", { _dss         ,0.2 * magicWeaponsRate})
insertTableSafe("ToolStoreTools", { _dss         ,0.01 * magicWeaponsRate})
insertTableSafe("CrateRandomJunk", { _dss         ,0.01 * magicWeaponsRate})
insertTableSafe("GarageCarpentry", { _dss         ,0.01 * magicWeaponsRate})
insertTableSafe("ToolStoreTools", { _dss         ,0.01 * magicWeaponsRate})
insertTableSafe("Hobbies", {_dss         ,0.001 * magicWeaponsRate })
insertTableSafe("HolidayStuff", {_dss         ,0.001 * magicWeaponsRate })
insertTableSafe("Gifts", {_dss         ,0.001 * magicWeaponsRate })
insertTableSafe("GigamartToys", {_dss         ,0.001 * magicWeaponsRate })

local _eyelander = "Base.ZennoRobRoyClaymore"
insertTableSafe("ArmyHangarTools", { _eyelander        ,0.01 * heavyWeaponsRate})
insertTableSafe("CrateTools", { _eyelander        ,0.01 * heavyWeaponsRate})
insertTableSafe("DrugShackTools", { _eyelander        ,0.01 * heavyWeaponsRate})
insertTableSafe("FireStorageTools", { _eyelander        ,0.01 * heavyWeaponsRate})
insertTableSafe("GarageTools", { _eyelander        ,0.01 * heavyWeaponsRate})
insertTableSafe("GigamartTools", { _eyelander        ,0.01 * heavyWeaponsRate})
insertTableSafe("LoggingFactoryTools", { _eyelander        ,0.05 * heavyWeaponsRate})
insertTableSafe("MeleeWeapons", { _eyelander        ,0.3 * heavyWeaponsRate})
insertTableSafe("ToolStoreTools", { _eyelander        ,0.01 * heavyWeaponsRate})
insertTableSafe("CrateRandomJunk", { _eyelander        ,0.01 * heavyWeaponsRate})
insertTableSafe("GarageCarpentry", { _eyelander        ,0.01 * heavyWeaponsRate})
insertTableSafe("ToolStoreTools", { _eyelander        ,0.01 * heavyWeaponsRate})
insertTableSafe("Hobbies", {_eyelander        ,0.001 * heavyWeaponsRate })
insertTableSafe("HolidayStuff", {_eyelander        ,0.001 * heavyWeaponsRate })
insertTableSafe("Gifts", {_eyelander        ,0.001  * heavyWeaponsRate})
insertTableSafe("GigamartToys", {_eyelander        ,0.001 * heavyWeaponsRate })

local _at = "Base.SymboliRudolfAcheryTarget"
insertTableSafe("MeleeWeapons", {_at     ,3 *genericWeaponsRate})
insertTableSafe("CrateMechanics", {_at     ,0.5 *genericWeaponsRate })
insertTableSafe("GarageTools", {_at     ,1 *genericWeaponsRate })
insertTableSafe("GarageCarpentry", {_at     ,2 *genericWeaponsRate })
insertTableSafe("CrateRandomJunk", {_at     ,0.2 *genericWeaponsRate })
insertTableSafe("CrateTools", {_at     ,0.2 *genericWeaponsRate })
insertTableSafe("DrugShackTools", {_at     ,0.3 *genericWeaponsRate })
insertTableSafe("DrugShackWeapons", {_at     ,0.3 *genericWeaponsRate })
insertTableSafe("ForestFireTools", {_at        ,0.5 *genericWeaponsRate })
insertTableSafe("GarageCarpentry", {_at        ,0.5 *genericWeaponsRate })
insertTableSafe("Hobbies", {_at        ,2  *genericWeaponsRate})
insertTableSafe("ClosetShelfGeneric", {_at        ,2  *genericWeaponsRate})
insertTableSafe("ToolStoreTools", {_at        ,0.5 *genericWeaponsRate })
insertTableSafe("ToolStoreMisc", {_at        ,0.5 *genericWeaponsRate })
insertTableSafe("ShelfGeneric", {_at        ,0.2 *genericWeaponsRate })
insertTableSafe("GigamartToys", {_at        ,0.5 *genericWeaponsRate })
insertTableSafe("ImprovisedCrafts", {_at        ,1 *genericWeaponsRate })
insertTableSafe("LoggingFactoryTools", {_at        ,4 *genericWeaponsRate })

local _gc = "Base.UmaGolfClub"
insertTableSafe("MeleeWeapons", {_gc     ,4 *genericWeaponsRate})
insertTableSafe("GolfLockers", {_gc     ,10 *genericWeaponsRate})
insertTableSafe("DrugShackWeapons", {_gc     ,1.0 *genericWeaponsRate})
insertTableSafe("GarageTools", {_gc     ,0.5 *genericWeaponsRate })
insertTableSafe("CrateRandomJunk", {_gc     ,0.1 *genericWeaponsRate })
insertTableSafe("CrateTools", {_gc     ,0.2  *genericWeaponsRate})
insertTableSafe("DrugShackTools", {_gc     ,0.3 *genericWeaponsRate })
insertTableSafe("GarageCarpentry", {_gc        ,0.5 *genericWeaponsRate })
insertTableSafe("Hobbies", {_gc        ,1 *genericWeaponsRate })
insertTableSafe("BarCounterWeapon", {_gc        ,2  *genericWeaponsRate})
insertTableSafe("ClosetShelfGeneric", {_gc        ,4 *genericWeaponsRate })
insertTableSafe("ToolStoreTools", {_gc        ,0.5 *genericWeaponsRate })
insertTableSafe("LivingRoomShelfNoTapes", {_gc        ,0.25 *genericWeaponsRate })
insertTableSafe("LivingRoomShelf", {_gc        ,0.25 *genericWeaponsRate })
insertTableSafe("ShelfGeneric", {_gc        ,0.1 *genericWeaponsRate })
insertTableSafe("GigamartToys", {_gc        ,0.1 *genericWeaponsRate })
--- Umbrella and less of a weapon Stuff

insertTableSafe("WardrobeMan", {
	"Base.WonderAcuteUmbrella"        ,0.18*genericWeaponsRate,
	"Base.MejiroBrightUmbrellaOpen"   ,0.18*genericWeaponsRate,
	"Base.MejiroBrightUmbrellaClose"  ,0.18*genericWeaponsRate
})

insertTableSafe("WardrobeManClassy", {
	"Base.WonderAcuteUmbrella"        ,0.18*genericWeaponsRate,
	"Base.MejiroBrightUmbrellaOpen"   ,0.18*genericWeaponsRate,
	"Base.MejiroBrightUmbrellaClose"  ,0.18*genericWeaponsRate
})

insertTableSafe("WardrobeWoman", {
	"Base.WonderAcuteUmbrella"        ,0.18*genericWeaponsRate,
	"Base.MejiroBrightUmbrellaOpen"   ,0.18*genericWeaponsRate,
	"Base.MejiroBrightUmbrellaClose"  ,0.18*genericWeaponsRate
})

insertTableSafe("WardrobeWomanClassy", {
	"Base.WonderAcuteUmbrella"        ,0.18*genericWeaponsRate,
	"Base.MejiroBrightUmbrellaOpen"   ,0.18*genericWeaponsRate,
	"Base.MejiroBrightUmbrellaClose"  ,0.18*genericWeaponsRate
})

insertTableSafe("ClosetShelfGeneric", {
	"Base.WonderAcuteUmbrella"        ,0.18*genericWeaponsRate,
	"Base.MejiroBrightUmbrellaOpen"   ,0.18*genericWeaponsRate,
	"Base.MejiroBrightUmbrellaClose"  ,0.18*genericWeaponsRate
})
local _morb = "Base.SweepToshoBroom"
insertTableSafe("MechanicShelfMisc", {_morb        ,4 *genericWeaponsRate })
insertTableSafe("JanitorCleaning", {_morb     ,4 *genericWeaponsRate })
insertTableSafe("LaundryCleaning", {_morb     ,4 *genericWeaponsRate })
insertTableSafe("CrateCarpentry", {_morb     ,1 *genericWeaponsRate })
insertTableSafe("CrateCostume", {_morb     ,1 *genericWeaponsRate })
insertTableSafe("CrateTools", {_morb     ,3 *genericWeaponsRate })
insertTableSafe("MorgueTools", {_morb     ,2 *genericWeaponsRate })
insertTableSafe("ToolStoreCarpentry", {_morb     ,2 *genericWeaponsRate })
insertTableSafe("ToolStoreMisc", {_morb     ,2 *genericWeaponsRate })
insertTableSafe("ToolStoreTools", {_morb     ,2 *genericWeaponsRate })
insertTableSafe("ArmyHangarTools", {_morb    ,2 *genericWeaponsRate })
insertTableSafe("BurglarTools", {_morb     ,2 *genericWeaponsRate })
insertTableSafe("GarageTools", {_morb     ,2 *genericWeaponsRate })
insertTableSafe("GigamartTools", {_morb     ,2 *genericWeaponsRate })
insertTableSafe("JanitorTools", {_morb     ,4 *genericWeaponsRate })

local _mochihammer = "Base.KitasanBlackMochiMallet"
insertTableSafe("BurgerKitchenButcher", {_mochihammer        ,2 *genericWeaponsRate })
insertTableSafe("ButcherTools", {_mochihammer        ,4 *genericWeaponsRate })
insertTableSafe("ChineseKitchenButcher", {_mochihammer        ,8 *genericWeaponsRate })
insertTableSafe("ChineseKitchenCutlery", {_mochihammer        ,8 *genericWeaponsRate })
insertTableSafe("DinerBackRoomCounter", {_mochihammer        ,2 *genericWeaponsRate })
insertTableSafe("FishChipsKitchenButcher", {_mochihammer        ,1 *genericWeaponsRate })
insertTableSafe("GigamartPots", {_mochihammer        ,4  *genericWeaponsRate})
insertTableSafe("ItalianKitchenButcher", {_mochihammer        ,2  *genericWeaponsRate})
insertTableSafe("JaysKitchenButcher", {_mochihammer        ,2 *genericWeaponsRate })
insertTableSafe("MexicanKitchenButcher", {_mochihammer        ,2 *genericWeaponsRate })
insertTableSafe("PizzaKitchenButcher", {_mochihammer        ,2 *genericWeaponsRate })
insertTableSafe("SeafoodKitchenButcher", {_mochihammer        ,2 *genericWeaponsRate })
insertTableSafe("StoreKitchenButcher", {_mochihammer        ,2 *genericWeaponsRate })
insertTableSafe("StoreKitchenCutlery", {_mochihammer        ,2 *genericWeaponsRate })
insertTableSafe("SushiKitchenBaking", {_mochihammer        ,4 *genericWeaponsRate })
-- Random schitz

--Food and Drink

-- Uma Drink
local _umad = "Base.UmaDrink"
insertTableSafe("BandPracticeFridge", {_umad     ,6 *consumablesRate })
insertTableSafe("BarCounterMisc", {_umad     ,8 *consumablesRate })
insertTableSafe("CafeteriaDrinks", {_umad     ,6 *consumablesRate })
insertTableSafe("ClassroomDesk", {_umad     ,1 *consumablesRate })
insertTableSafe("CrateSodaCans", {_umad     ,12 *consumablesRate })
insertTableSafe("FridgeBreakRoom", {_umad     ,4 *consumablesRate })
insertTableSafe("FridgeGeneric", {_umad     ,2 *consumablesRate })
insertTableSafe("FridgeOffice", {_umad     ,4 *consumablesRate })
insertTableSafe("FridgeRich", {_umad     ,2 *consumablesRate })
insertTableSafe("FridgeSoda", {_umad     ,8 *consumablesRate })
insertTableSafe("FridgeTrailerPark", {_umad    ,2 *consumablesRate })
insertTableSafe("GasStorageCombo", {_umad     ,10 *consumablesRate })
insertTableSafe("GigamartBottles", {_umad     ,8*consumablesRate  })
insertTableSafe("KitchenBottles", {_umad     ,8*consumablesRate  })
insertTableSafe("MotelFridge", {_umad     ,6*consumablesRate  })
insertTableSafe("StoreShelfCombo", {_umad     ,10 *consumablesRate })
insertTableSafe("StoreShelfDrinks", {_umad     ,10 *consumablesRate })
insertTableSafe("TheatreDrinks", {_umad     ,10 *consumablesRate })
insertTableSafe("PrisonCellRandom", {_umad     ,8 *consumablesRate })

-- Uma Snack
local _umas = "Base.UmaSnack"
insertTableSafe("StoreShelfSnacks", {_umas     ,10 *consumablesRate })
insertTableSafe("CafeteriaSnacks", {_umas     ,8 *consumablesRate })
insertTableSafe("ClassroomDesk", {_umas    ,1 *consumablesRate })
insertTableSafe("CrateChocolate", {_umas     ,20  *consumablesRate})
insertTableSafe("GasStorageCombo", {_umas     ,10 *consumablesRate })
insertTableSafe("GigamartCrisps", {_umas     ,8 *consumablesRate })
insertTableSafe("GigamartCandy", {_umas     ,10 *consumablesRate })
insertTableSafe("GroceryStorageCrate1", {_umas     ,1*consumablesRate  })
insertTableSafe("KitchenDryFood", {_umas     ,4 *consumablesRate })
insertTableSafe("PrisonCellRandom", {_umas     ,8 *consumablesRate })
insertTableSafe("StoreShelfCombo", {_umas     ,10 *consumablesRate })
insertTableSafe("BarCounterMisc", {_umas     ,8  *consumablesRate})
insertTableSafe("CandyStoreSnacks", {_umas     ,10 *consumablesRate })
insertTableSafe("TheatreSnacks", {_umas     ,10 *consumablesRate })
insertTableSafe("CrateCandyPackage", {_umas     ,6 *consumablesRate })

-- Hachimi
local _hachimi = "Base.Hachimi"
insertTableSafe("CafeteriaDrinks", {_hachimi     ,4 *consumablesRate })
insertTableSafe("ClassroomDesk", {_hachimi ,    2 *consumablesRate })
insertTableSafe("FridgeBreakRoom", {_hachimi     ,2 *consumablesRate })
insertTableSafe("FridgeGeneric", {_hachimi     ,1 *consumablesRate })
insertTableSafe("FridgeOffice", {_hachimi     ,2 *consumablesRate })
insertTableSafe("FridgeRich", {_hachimi     ,4 *consumablesRate })
insertTableSafe("FridgeTrailerPark", {_hachimi    ,2 *consumablesRate })
insertTableSafe("MotelFridge", {_hachimi     ,4 *consumablesRate })
insertTableSafe("StoreShelfCombo", {_hachimi     ,10 *consumablesRate })
insertTableSafe("StoreShelfDrinks", {_hachimi     ,10 *consumablesRate })
insertTableSafe("TheatreDrinks", {_hachimi     ,10 *consumablesRate })

-- HachimiXL
local _hachimixl = "Base.HachimiXL"
insertTableSafe("ClassroomDesk", {_hachimixl     ,1 *consumablesRate })
insertTableSafe("FridgeBreakRoom", {_hachimixl     ,0.5 *consumablesRate })
insertTableSafe("FridgeGeneric", {_hachimixl     ,0.5*consumablesRate  })
insertTableSafe("FridgeOffice", {_hachimixl     ,0.5 *consumablesRate })
insertTableSafe("FridgeRich", {_hachimixl     ,0.5 *consumablesRate })
insertTableSafe("FridgeTrailerPark", {_hachimixl    ,0.5 *consumablesRate })
insertTableSafe("MotelFridge", {_hachimixl     ,1 *consumablesRate })
insertTableSafe("StoreShelfCombo", {_hachimixl     ,4 *consumablesRate })
insertTableSafe("StoreShelfDrinks", {_hachimixl     ,4 *consumablesRate })
insertTableSafe("TheatreDrinks", {_hachimixl     ,4 *consumablesRate })

-- Rare Toughness Drink spotted, MAX not randomly spawned
insertTableSafe("BandPracticeFridge", {"Base.Toughness"     ,0.5 *consumablesRate })
insertTableSafe("BarCounterMisc", {"Base.Toughness"     ,0.5 *consumablesRate })
insertTableSafe("CafeteriaDrinks", {"Base.Toughness"     ,0.5 *consumablesRate })
insertTableSafe("FridgeBottles", {"Base.Toughness"     ,1 *consumablesRate })
insertTableSafe("FridgeBreakRoom", {"Base.Toughness"     ,0.2 *consumablesRate })
insertTableSafe("FridgeGeneric", {"Base.Toughness"     ,0.2 *consumablesRate })
insertTableSafe("FridgeOffice", {"Base.Toughness"     ,0.5 *consumablesRate })
insertTableSafe("FridgeSoda", {"Base.Toughness"     ,0.5 *consumablesRate })
insertTableSafe("FridgeRich", {"Base.Toughness"     ,0.5 *consumablesRate })
insertTableSafe("FridgeTrailerPark", {"Base.Toughness"     ,0.2*consumablesRate  })
insertTableSafe("GasStorageCombo", {"Base.Toughness"     ,0.5 *consumablesRate })
insertTableSafe("GigamartBottles", {"Base.Toughness"     ,2 *consumablesRate })
insertTableSafe("KitchenBottles", {"Base.Toughness"     ,1 *consumablesRate })
insertTableSafe("MotelFridge", {"Base.Toughness"     ,0.5 *consumablesRate })
insertTableSafe("StoreShelfCombo", {"Base.Toughness"     ,0.5 *consumablesRate })
insertTableSafe("StoreShelfDrinks", {"Base.Toughness"     ,0.5 *consumablesRate })
insertTableSafe("TheatreDrinks", {"Base.Toughness"     ,1 *consumablesRate })
insertTableSafe("PrisonCellRandom", {"Base.Toughness"     ,0.2 *consumablesRate })


--Book with best waifu Mr CB
local _number ="Base.UmaBookNumber"
insertTableSafe("BookstoreMisc", { _number ,1 *booksRate})
insertTableSafe("CrateBooks", { _number ,1*booksRate})
insertTableSafe("CrateMagazines", { _number ,2*booksRate})
insertTableSafe("LibraryBooks", { _number ,2*booksRate})
insertTableSafe("LibraryCounter", { _number ,0.5*booksRate})
insertTableSafe("LivingRoomShelf", { _number ,0.2*booksRate})
insertTableSafe("LivingRoomShelfNoTapes", { _number ,0.2*booksRate})
insertTableSafe("LivingRoomSideTable", { _number ,0.2*booksRate})
insertTableSafe("LivingRoomSideTableNoRemote", { _number ,0.2*booksRate})
insertTableSafe("MagazineRackMixed", { _number ,1*booksRate})
insertTableSafe("PostOfficeMagazines", { _number ,0.5*booksRate})
insertTableSafe("ShelfGeneric", { _number ,0.1*booksRate})

end

Events.OnInitGlobalModData.Add(initSandboxRates)

if Events.OnPostDistributionMerge then
    Events.OnPostDistributionMerge.Add(applyDistributions)
else
    Events.OnInitGlobalModData.Add(applyDistributions)
end
