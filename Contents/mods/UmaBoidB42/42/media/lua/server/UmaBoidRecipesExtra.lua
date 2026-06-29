Recipe = Recipe or {}
Recipe.OnCreate = Recipe.OnCreate or {}
function Recipe.OnCreate.AdmireVegaCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.AgnesDigitalCrafted(items, result, player, selectedItem)
    -- Use Context to swap main/alt
    player:getInventory():AddItem("Base.AgnesDigitalRibbon");
    -- Casual
    player:getInventory():AddItem("Base.AgnesDigitalCasualBag");
end

function Recipe.OnCreate.AgnesTachyonCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.AirGrooveCrafted(items, result, player, selectedItem)
    -- Alt
    player:getInventory():AddItem("Base.AirGrooveWeddingVeil");
end

function Recipe.OnCreate.AirShakurCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.AoiKiryuinCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.AstonMachanCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("Base.AstonMachanCrown");
    -- Alt
    player:getInventory():AddItem("Base.AstonMachanAltGlasses");
end

function Recipe.OnCreate.BambooMemoryCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.BikoPegasusCrafted(items, result, player, selectedItem)
    -- Use Context to swap main/alt
    player:getInventory():AddItem("Base.BikoPegasusHairAccessory");
end

function Recipe.OnCreate.BitterGlaceCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.BiwaHayahideCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("Base.BiwaHayahideGlasses");
    -- Casual
    player:getInventory():AddItem("Base.BiwaHayahideCasualBag");
    player:getInventory():AddItem("Base.BiwaHayahideCasualScarf");
    -- Alt, use context to swap between alt variantions
    player:getInventory():AddItem("Base.BiwaHayahideAlt1Glasses");
    -- Alt
    player:getInventory():AddItem("Base.BiwaHayahideAltTiara");
end

function Recipe.OnCreate.ByerleyTurkCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("Base.ByerleyTurkHat");
    -- Main
    player:getInventory():AddItem("Base.ByerleyTurkScarf");
    -- Main
    player:getInventory():AddItem("Base.ByerleyTurkCrown");
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
    player:getInventory():AddItem("Base.DaiwaScarletTiara");
end

function Recipe.OnCreate.DarleyArabianCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.FujiKisekiCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("Base.FujiKisekiHat");
end

function Recipe.OnCreate.EishinFlashCrafted(items, result, player, selectedItem)
    -- Alt
    player:getInventory():AddItem("Base.EishinFlashAltHat");
end

function Recipe.OnCreate.ElCondorPasaCrafted(items, result, player, selectedItem)
    -- Use Context to swap main/alt
    player:getInventory():AddItem("Base.ElCondorPasaMask");
end

function Recipe.OnCreate.EtsukoOtonashiCrafted(items, result, player, selectedItem)
    --
    player:getInventory():AddItem("Base.EtsukoOtonashiBag");
end

function Recipe.OnCreate.FineMotionCrafted(items, result, player, selectedItem)
   -- Alt
   player:getInventory():AddItem("Base.FineMotionWeddingVeil");
   -- Alt
   player:getInventory():AddItem("Base.FineMotionWeddingTiara");
end

function Recipe.OnCreate.GodolphinBarbCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.GoldCityCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.GoldShipCrafted(items, result, player, selectedItem)
    player:getInventory():AddItem("Base.GoldShipBag");
end

function Recipe.OnCreate.GrassWonderCrafted(items, result, player, selectedItem)
    -- player:getInventory():AddItem("Base.GrassWonderAlt");
    -- player:getInventory():AddItem("Base.GrassWonderUmaRap");
    -- Alt
    player:getInventory():AddItem("Base.GrassWonderAltHat");
    -- UMARap
    player:getInventory():AddItem("Base.GrassWonderUmaRapHat");
end

function Recipe.OnCreate.HappyMeekCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.HaruUraraCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.HishiAkebonoCrafted(items, result, player, selectedItem)
     -- Use Context to swap main/alt
     player:getInventory():AddItem("Base.HishiAkebonoHairPin");
     -- Main
     player:getInventory():AddItem("Base.HishiAkebonoHat");
end

function Recipe.OnCreate.HishiAmazonCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.HishiMiracleCrafted(items, result, player, selectedItem)
    --
end

function Recipe.OnCreate.HokkoTarumaeCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("Base.HokkoTarumaeArmSling");
end

function Recipe.OnCreate.IkunoDictusCrafted(items, result, player, selectedItem)
    --
    player:getInventory():AddItem("Base.IkunoDictusGlasses");
end

function Recipe.OnCreate.InariOneCrafted(items, result, player, selectedItem)
    -- Main/Casual
    player:getInventory():AddItem("Base.InariOneMask");
end

function Recipe.OnCreate.InesFujinCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("Base.InesFujinHat");
    -- Alt
    player:getInventory():AddItem("Base.InesFujinAltHeadBand");
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
    player:getInventory():AddItem("Base.LittleCoconHarness");
end

function Recipe.OnCreate.ManhattanCafeCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.MaruzenskyCrafted(items, result, player, selectedItem)
    -- Casual
    player:getInventory():AddItem("Base.MaruzenskyCasualNeckShirt");
end

function Recipe.OnCreate.MarvelousSundayCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.FukukitaruCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("Base.MatikaneFukukitaruBag");
    -- Alt
    player:getInventory():AddItem("Base.MatikaneFukukitaruAltFrontBag");
    -- Alt
    player:getInventory():AddItem("Base.MatikaneFukukitaruAltBackBag");
end

function Recipe.OnCreate.TannhauserCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("Base.MatikaneTannhauserBag");
    -- Main
    player:getInventory():AddItem("Base.MatikaneTannhauserCape");
     -- Use Context to swap main/alt
    player:getInventory():AddItem("Base.MatikaneTannhauserHat");
end

function Recipe.OnCreate.MayanoTopGunCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.MeishoDotoCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("Base.MeishoDotoBag");
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
    player:getInventory():AddItem("Base.MejiroMcQueenAnimeHat");
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
    player:getInventory():AddItem("Base.MihonoBourbonFootPart");
    -- Main
    player:getInventory():AddItem("Base.MihonoBourbonHipsPart");
    -- Main
    player:getInventory():AddItem("Base.MihonoBourbonTailPart");
end

function Recipe.OnCreate.MontjeuCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.MrCBCrafted(items, result, player, selectedItem)
    -- use context menu to switch Main/Casual
    player:getInventory():AddItem("Base.MrCBHat");
end

function Recipe.OnCreate.NakayamaFestaCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.NaritaBrianCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.NaritaTaishinCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("Base.NaritaTaishinShirtWaist");
    -- Alt
    player:getInventory():AddItem("Base.NaritaTaishinAltPouches");
    -- Alt
    player:getInventory():AddItem("Base.NaritaTaishinAltMonocle");
    -- Casual
    player:getInventory():AddItem("Base.NaritaTaishinCasualHat");
end

function Recipe.OnCreate.NaritaTopRoadCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.NeoUniverseCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.NiceNatureCrafted(items, result, player, selectedItem)
    -- Alt
    player:getInventory():AddItem("Base.NiceNatureAltPom");
end

function Recipe.OnCreate.NishinoFlowerCrafted(items, result, player, selectedItem)
    -- Alt
    player:getInventory():AddItem("Base.NishinoFlowerAltVeil");
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
    player:getInventory():AddItem("Base.SakuraLaurelCasualBag");
end

function Recipe.OnCreate.SasamiCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("Base.SasamiEyeMask");
    -- Weapon
    player:getInventory():AddItem("Base.AnshinsawaNeedle");
    player:getInventory():AddItem("Base.AnshinsawaNeedle");
    player:getInventory():AddItem("Base.AnshinsawaNeedle");
    player:getInventory():AddItem("Base.AnshinsawaNeedle");
    player:getInventory():AddItem("Base.AnshinsawaNeedle");
end

function Recipe.OnCreate.SatonoCrownCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("Base.SatonoCrownCrown");
end

function Recipe.OnCreate.SatonoDiamondCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.SeiunSkyCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.SeekingThePearlCrafted(items, result, player, selectedItem)
    -- Main, use context menu to switch variation
    player:getInventory():AddItem("Base.SeekingThePearlGlassesOnHead");
    -- Casual
    player:getInventory():AddItem("Base.SeekingThePearlCasualShirtHip");
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
    player:getInventory():AddItem("Base.SpecialWeekCasualBag");
end


function Recipe.OnCreate.SuperCreekCrafted(items, result, player, selectedItem)
    -- Main, Use Context to swap Side
    player:getInventory():AddItem("Base.SuperCreekBag");
    -- Main, Use Context to swap Side
    player:getInventory():AddItem("Base.SuperCreekScarf");
end

function Recipe.OnCreate.SweepToshoCrafted(items, result, player, selectedItem)
    player:getInventory():AddItem("Base.SweepToshoHat");
end

function Recipe.OnCreate.SymboliKrisSCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.SymboliRudolfCrafted(items, result, player, selectedItem)
    -- Casual
    player:getInventory():AddItem("Base.SymboliRudolfCasualBag");
    -- Casual
    player:getInventory():AddItem("Base.SymboliRudolfCasualGlasses");
end

function Recipe.OnCreate.SymboliSiriusCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.TaikiShuttleCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("Base.TaikiShuttleHatScarf");
    -- Alt
    player:getInventory():AddItem("Base.TaikiShuttleAltCamera");
end

function Recipe.OnCreate.TamamoCrossCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.TapDanceCityCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.TaninoGimletCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("Base.TaninoGimletEyepatch");
end

function Recipe.OnCreate.TazunaCrafted(items, result, player, selectedItem)
    -- 
end

function Recipe.OnCreate.TMOperaOCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("Base.TMOperaOCrown");
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
    player:getInventory():AddItem("Base.WinningTicketCasualShirtWaist");
    -- Alt, use context menu to switch variation
    player:getInventory():AddItem("Base.WinningTicketAltGogglesOnHead");
    -- Alt
    player:getInventory():AddItem("Base.WinningTicketAltToolbelt");
    -- Alt
    player:getInventory():AddItem("Base.WinningTicketAltScarf");
    -- UMARap
    player:getInventory():AddItem("Base.WinningTicketUmaRapHat");
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
    player:getInventory():AddItem("Base.YayoiHat");
end

function Recipe.OnCreate.YukinoBijinCrafted(items, result, player, selectedItem)
    -- UMARap
    player:getInventory():AddItem("Base.YukinoBijinUmaRapHat");
    -- UMARap
    player:getInventory():AddItem("Base.YukinoBijinUmaRapSunglasses");
end

function Recipe.OnCreate.ZennoRobRoyCrafted(items, result, player, selectedItem)
    -- Main
    player:getInventory():AddItem("Base.ZennoRobRoyHarness");
    -- Main/Casual
    player:getInventory():AddItem("Base.ZennoRobRoyGlasses");
    -- Main
    player:getInventory():AddItem("Base.ZennoRobRoyHat");
    -- Casual
    player:getInventory():AddItem("Base.ZennoRobRoyCasualBag");
end

