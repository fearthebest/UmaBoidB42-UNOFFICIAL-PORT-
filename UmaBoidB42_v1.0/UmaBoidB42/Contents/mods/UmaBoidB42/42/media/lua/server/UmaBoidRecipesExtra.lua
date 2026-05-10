Recipe = Recipe or {}
Recipe.OnCreate = Recipe.OnCreate or {}
function Recipe.OnCreate.AdmireVegaCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.AgnesDigitalCrafted(items, result, player, selectedItem)
    -- Use Context to swap main/alt
    player:getInventory():AddItem("AgnesDigitalRibbon");
    -- Casual
    player:getInventory():AddItem("AgnesDigitalCasualBag");
end

function Recipe.OnCreate.AgnesTachyonCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.AirGrooveCrafted(items, result, player, selectedItem)
    -- Alt
    player:getInventory():AddItem("AirGrooveWeddingVeil");
end

function Recipe.OnCreate.AirShakurCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.AoiKiryuinCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.AstonMachanCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("AstonMachanCrown");
    -- Alt
    player:getInventory():AddItem("AstonMachanAltGlasses");
end

function Recipe.OnCreate.BambooMemoryCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.BikoPegasusCrafted(items, result, player, selectedItem)
    -- Use Context to swap main/alt
    player:getInventory():AddItem("BikoPegasusHairAccessory");
end

function Recipe.OnCreate.BitterGlaceCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.BiwaHayahideCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("BiwaHayahideGlasses");
    -- Casual
    player:getInventory():AddItem("BiwaHayahideCasualBag");
    player:getInventory():AddItem("BiwaHayahideCasualScarf");
    -- Alt, use context to swap between alt variantions
    player:getInventory():AddItem("BiwaHayahideAlt1Glasses");
    -- Alt
    player:getInventory():AddItem("BiwaHayahideAltTiara");
end

function Recipe.OnCreate.ByerleyTurkCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("ByerleyTurkHat");
    -- Main
    player:getInventory():AddItem("ByerleyTurkScarf");
    -- Main
    player:getInventory():AddItem("ByerleyTurkCrown");
end
function Recipe.OnCreate.ChevalGrandCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.CopanoRickeyCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.CurrenChanCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.DaiichiRubyCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.DaitakuHeliosCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.DaiwaScarletCrafted(items, result, player, selectedItem)
    -- Use Context to swap main/alt
    player:getInventory():AddItem("DaiwaScarletTiara");
end

function Recipe.OnCreate.DarleyArabianCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.FujiKisekiCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("FujiKisekiHat");
end

function Recipe.OnCreate.EishinFlashCrafted(items, result, player, selectedItem)
    -- Alt
    player:getInventory():AddItem("EishinFlashAltHat");
end

function Recipe.OnCreate.ElCondorPasaCrafted(items, result, player, selectedItem)
    -- Use Context to swap main/alt
    player:getInventory():AddItem("ElCondorPasaMask");
end

function Recipe.OnCreate.EtsukoOtonashiCrafted(items, result, player, selectedItem)
    --
    player:getInventory():AddItem("EtsukoOtonashiBag");
end

function Recipe.OnCreate.FineMotionCrafted(items, result, player, selectedItem)
   -- Alt
   player:getInventory():AddItem("FineMotionWeddingVeil");
   -- Alt
   player:getInventory():AddItem("FineMotionWeddingTiara");
end

function Recipe.OnCreate.GodolphinBarbCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.GoldCityCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.GoldShipCrafted(items, result, player, selectedItem)
    player:getInventory():AddItem("GoldShipBag");
end

function Recipe.OnCreate.GrassWonderCrafted(items, result, player, selectedItem)
    -- player:getInventory():AddItem("GrassWonderAlt");
    -- player:getInventory():AddItem("GrassWonderUmaRap");
    -- Alt
    player:getInventory():AddItem("GrassWonderAltHat");
    -- UMARap
    player:getInventory():AddItem("GrassWonderUmaRapHat");
end

function Recipe.OnCreate.HappyMeekCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.HaruUraraCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.HishiAkebonoCrafted(items, result, player, selectedItem)
     -- Use Context to swap main/alt
     player:getInventory():AddItem("HishiAkebonoHairPin");
     -- Main
     player:getInventory():AddItem("HishiAkebonoHat");
end

function Recipe.OnCreate.HishiAmazonCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.HishiMiracleCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.HokkoTarumaeCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("HokkoTarumaeArmSling");
end

function Recipe.OnCreate.IkunoDictusCrafted(items, result, player, selectedItem)
    --
    player:getInventory():AddItem("IkunoDictusGlasses");
end

function Recipe.OnCreate.InariOneCrafted(items, result, player, selectedItem)
    -- Main/Casual
    player:getInventory():AddItem("InariOneMask");
end

function Recipe.OnCreate.InesFujinCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("InesFujinHat");
    -- Alt
    player:getInventory():AddItem("InesFujinAltHeadBand");
end

function Recipe.OnCreate.JunglePocketCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.KatsuragiAceCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.KawakamiPrincessCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.KingHaloCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.KitasanBlackCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.KSMiracleCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.LightHelloCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.LittleCoconCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("LittleCoconHarness");
end

function Recipe.OnCreate.ManhattanCafeCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.MaruzenskyCrafted(items, result, player, selectedItem)
    -- Casual
    player:getInventory():AddItem("MaruzenskyCasualNeckShirt");
end

function Recipe.OnCreate.MarvelousSundayCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.FukukitaruCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("MatikaneFukukitaruBag");
    -- Alt
    player:getInventory():AddItem("MatikaneFukukitaruAltFrontBag");
    -- Alt
    player:getInventory():AddItem("MatikaneFukukitaruAltBackBag");
end

function Recipe.OnCreate.TannhauserCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("MatikaneTannhauserBag");
    -- Main
    player:getInventory():AddItem("MatikaneTannhauserCape");
     -- Use Context to swap main/alt
    player:getInventory():AddItem("MatikaneTannhauserHat");
end

function Recipe.OnCreate.MayanoTopGunCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.MeishoDotoCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("MeishoDotoBag");
end

function Recipe.OnCreate.MejiroArdanCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.MejiroBrightCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.MejiroDoberCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.MejiroMcQueenCrafted(items, result, player, selectedItem)
    -- Anime
    player:getInventory():AddItem("MejiroMcQueenAnimeHat");
end

function Recipe.OnCreate.MejiroRamonuCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.MejiroPalmerCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.MejiroRyanCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.MihonoBourbonCrafted(items, result, player, selectedItem)
    -- Main 
    player:getInventory():AddItem("MihonoBourbonFootPart");
    -- Main
    player:getInventory():AddItem("MihonoBourbonHipsPart");
    -- Main
    player:getInventory():AddItem("MihonoBourbonTailPart");
end

function Recipe.OnCreate.MontjeuCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.MrCBCrafted(items, result, player, selectedItem)
    -- use context menu to switch Main/Casual
    player:getInventory():AddItem("MrCBHat");
end

function Recipe.OnCreate.NakamayaFestaCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.NaritaBrianCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.NaritaTaishinCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("NaritaTaishinShirtWaist");
    -- Alt
    player:getInventory():AddItem("NaritaTaishinAltPouches");
    -- Alt
    player:getInventory():AddItem("NaritaTaishinAltMonocle");
    -- Casual
    player:getInventory():AddItem("NaritaTaishinCasualHat");
end

function Recipe.OnCreate.NaritaTopRoadCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.NeoUniverseCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.NiceNatureCrafted(items, result, player, selectedItem)
    -- Alt
    player:getInventory():AddItem("NiceNatureAltPom");
end

function Recipe.OnCreate.NishinoFlowerCrafted(items, result, player, selectedItem)
    -- Alt
    player:getInventory():AddItem("NishinoFlowerAltVeil");
end

function Recipe.OnCreate.OguriCapCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.RiceShowerCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.RikoKashimotoCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.SakuraBakushinOCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.SakuraChiyonoOCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.SakuraLaurelCrafted(items, result, player, selectedItem)
    -- Casual
    player:getInventory():AddItem("SakuraLaurelCasualBag");
end

function Recipe.OnCreate.SasamiCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("SasamiEyeMask");
    -- Weapon
    player:getInventory():AddItem("AnshinsawaNeedle");
    player:getInventory():AddItem("AnshinsawaNeedle");
    player:getInventory():AddItem("AnshinsawaNeedle");
    player:getInventory():AddItem("AnshinsawaNeedle");
    player:getInventory():AddItem("AnshinsawaNeedle");
end

function Recipe.OnCreate.SatonoCrownCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("SatonoCrownCrown");
end

function Recipe.OnCreate.SatonoDiamondCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.SeiunSkyCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.SeekingThePearlCrafted(items, result, player, selectedItem)
    -- Main, use context menu to switch variation
    player:getInventory():AddItem("SeekingThePearlGlassesOnHead");
    -- Casual
    player:getInventory():AddItem("SeekingThePearlCasualShirtHip");
end

function Recipe.OnCreate.ShinkoWindyCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.SilenceSuzukaCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.SmartFalconCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.SpecialWeekCrafted(items, result, player, selectedItem)
    -- Casual
    player:getInventory():AddItem("SpecialWeekCasualBag");
end


function Recipe.OnCreate.SuperCreekCrafted(items, result, player, selectedItem)
    -- Main, Use Context to swap Side
    player:getInventory():AddItem("SuperCreekBag");
    -- Main, Use Context to swap Side
    player:getInventory():AddItem("SuperCreekScarf");
end

function Recipe.OnCreate.SweepToshoCrafted(items, result, player, selectedItem)
    player:getInventory():AddItem("SweepToshoHat");
end

function Recipe.OnCreate.SymboliKrisSCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.SymboliRudolfCrafted(items, result, player, selectedItem)
    -- Casual
    player:getInventory():AddItem("SymboliRudolfCasualBag");
    -- Casual
    player:getInventory():AddItem("SymboliRudolfCasualGlasses");
end

function Recipe.OnCreate.SymboliSiriusCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.TaikiShuttleCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("TaikiShuttleHatScarf");
    -- Alt
    player:getInventory():AddItem("TaikiShuttleAltCamera");
end

function Recipe.OnCreate.TamamoCrossCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.TapDanceCityCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.TaninoGimletCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("TaninoGimletEyepatch");
end

function Recipe.OnCreate.TazunaCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.TMOperaOCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("TMOperaOCrown");
end

function Recipe.OnCreate.TokaiTeioCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.TosenJordanCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.TsurumaruTsuyoshiCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.TwinTurboCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.VodkaCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.WinningTicketCrafted(items, result, player, selectedItem)
    -- Casual
    player:getInventory():AddItem("WinningTicketCasualShirtWaist");
    -- Alt, use context menu to switch variation
    player:getInventory():AddItem("WinningTicketAltGogglesOnHead");
    -- Alt
    player:getInventory():AddItem("WinningTicketAltToolbelt");
    -- Alt
    player:getInventory():AddItem("WinningTicketAltScarf");
    -- UMARap
    player:getInventory():AddItem("WinningTicketUmaRapHat");
end

function Recipe.OnCreate.WonderAcuteCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.YaenoMutekiCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.YamaninZephyrCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.YayoiCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("YayoiHat");
end

function Recipe.OnCreate.YukinoBijinCrafted(items, result, player, selectedItem)
    -- UMARap
    player:getInventory():AddItem("YukinoBijinUmaRapHat");
    -- UMARap
    player:getInventory():AddItem("YukinoBijinUmaRapSunglasses");
end

function Recipe.OnCreate.ZennoRobRoyCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("ZennoRobRoyHarness");
    -- Main/Casual
    player:getInventory():AddItem("ZennoRobRoyGlasses");
    -- Main
    player:getInventory():AddItem("ZennoRobRoyHat");
    -- Casual
    player:getInventory():AddItem("ZennoRobRoyCasualBag");
end

