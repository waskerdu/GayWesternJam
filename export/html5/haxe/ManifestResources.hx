package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		Assets.defaultRootPath = rootPath;

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_pacifico_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy29:assets%2Fdata%2Fgamedata.jsony4:sizei5421y4:typey4:TEXTy2:idR1y7:preloadtgoR2i75568R3y4:FONTy9:classNamey34:__ASSET__assets_fonts_pacifico_ttfR5y29:assets%2Ffonts%2FPacifico.ttfR6tgoR0y27:assets%2Fimages%2FHeads.pngR2i17130R3y5:IMAGER5R11R6tgoR0y26:assets%2Fimages%2FPopo.pngR2i48620R3R12R5R13R6tgoR0y40:assets%2Fimages%2FPower%20Bottoms.png%7ER2i921422R3y6:BINARYR5R14R6tgoR0y34:assets%2Fimages%2FPowerBottoms.pngR2i100171R3R12R5R16R6tgoR0y37:assets%2Fimages%2FPowerBottoms.png%7ER2i921422R3R15R5R17R6tgoR0y31:assets%2Fimages%2FPowerTops.pngR2i145701R3R12R5R18R6tgoR0y34:assets%2Fimages%2FPowerTops.png%7ER2i2611187R3R15R5R19R6tgoR2i397152R3y5:SOUNDR5y48:assets%2Fmusic%2FChooChoo-Track01TitleScreen.oggy9:pathGroupaR21hR6tgoR2i499059R3R20R5y42:assets%2Fmusic%2FChooChoo-Track02Batle.oggR22aR23hR6tgoR2i28234R3R20R5y40:assets%2Fmusic%2FChooChoo-Track03Win.oggR22aR24hR6tgoR2i41875R3R20R5y41:assets%2Fmusic%2FChooChoo-Track04Lose.oggR22aR25hR6tgoR2i112922R3R20R5y36:assets%2Fsounds%2FLandlord-Evict.wavR22aR26hR6tgoR2i138244R3R20R5y40:assets%2Fsounds%2FLandlord-Powerbill.wavR22aR27hR6tgoR2i94982R3R20R5y33:assets%2Fsounds%2FMenu-Accept.wavR22aR28hR6tgoR2i67248R3R20R5y31:assets%2Fsounds%2FMenu-Back.wavR22aR29hR6tgoR2i42168R3R20R5y31:assets%2Fsounds%2FMenu-Deny.wavR22aR30hR6tgoR2i74190R3R20R5y33:assets%2Fsounds%2FMenu-Select.wavR22aR31hR6tgoR2i107244R3R20R5y30:assets%2Fsounds%2FPig-Oink.wavR22aR32hR6tgoR2i98458R3R20R5y30:assets%2Fsounds%2FPig-Womp.wavR22aR33hR6tgoR2i145648R3R20R5y35:assets%2Fsounds%2FPlayer-Attack.wavR22aR34hR6tgoR2i113212R3R20R5y35:assets%2Fsounds%2FPlayer-Defend.wavR22aR35hR6tgoR2i938518R3R20R5y37:assets%2Fsounds%2FPlayer-Kickline.wavR22aR36hR6tgoR2i814918R3R20R5y40:assets%2Fsounds%2FPlayer-PurpleProse.wavR22aR37hR6tgoR2i979294R3R20R5y36:assets%2Fsounds%2FPlayer-Rainbow.wavR22aR38hR6tgoR2i673324R3R20R5y33:assets%2Fsounds%2FPlayer-Ship.wavR22aR39hR6tgoR2i2114R3y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3R22aR41y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R40R5y28:flixel%2Fsounds%2Fflixel.mp3R22aR43y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3R20R5R42R22aR41R42hgoR2i33629R3R20R5R44R22aR43R44hgoR2i15744R3R7R8y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R7R8y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R12R5R49R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R12R5R50R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_gamedata_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_pacifico_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_heads_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_popo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_power_bottoms_png_ extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_powerbottoms_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_powerbottoms_png_ extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_powertops_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_powertops_png_ extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_choochoo_track01titlescreen_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_choochoo_track02batle_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_choochoo_track03win_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_choochoo_track04lose_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_landlord_evict_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_landlord_powerbill_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_accept_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_back_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_deny_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_select_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_pig_oink_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_pig_womp_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_player_attack_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_player_defend_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_player_kickline_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_player_purpleprose_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_player_rainbow_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_player_ship_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/gamedata.json") @:noCompletion #if display private #end class __ASSET__assets_data_gamedata_json extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/Pacifico.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_pacifico_ttf extends lime.text.Font {}
@:keep @:image("assets/images/Heads.png") @:noCompletion #if display private #end class __ASSET__assets_images_heads_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Popo.png") @:noCompletion #if display private #end class __ASSET__assets_images_popo_png extends lime.graphics.Image {}
@:keep @:file("assets/images/Power Bottoms.png~") @:noCompletion #if display private #end class __ASSET__assets_images_power_bottoms_png_ extends haxe.io.Bytes {}
@:keep @:image("assets/images/PowerBottoms.png") @:noCompletion #if display private #end class __ASSET__assets_images_powerbottoms_png extends lime.graphics.Image {}
@:keep @:file("assets/images/PowerBottoms.png~") @:noCompletion #if display private #end class __ASSET__assets_images_powerbottoms_png_ extends haxe.io.Bytes {}
@:keep @:image("assets/images/PowerTops.png") @:noCompletion #if display private #end class __ASSET__assets_images_powertops_png extends lime.graphics.Image {}
@:keep @:file("assets/images/PowerTops.png~") @:noCompletion #if display private #end class __ASSET__assets_images_powertops_png_ extends haxe.io.Bytes {}
@:keep @:file("assets/music/ChooChoo-Track01TitleScreen.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_choochoo_track01titlescreen_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/music/ChooChoo-Track02Batle.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_choochoo_track02batle_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/music/ChooChoo-Track03Win.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_choochoo_track03win_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/music/ChooChoo-Track04Lose.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_choochoo_track04lose_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Landlord-Evict.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_landlord_evict_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Landlord-Powerbill.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_landlord_powerbill_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Menu-Accept.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_accept_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Menu-Back.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_back_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Menu-Deny.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_deny_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Menu-Select.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_select_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Pig-Oink.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_pig_oink_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Pig-Womp.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_pig_womp_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Player-Attack.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_player_attack_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Player-Defend.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_player_defend_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Player-Kickline.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_player_kickline_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Player-PurpleProse.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_player_purpleprose_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Player-Rainbow.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_player_rainbow_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Player-Ship.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_player_ship_wav extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,3/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,3/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,3/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,6,3/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,6,3/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,6,3/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_fonts_pacifico_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_pacifico_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Pacifico"; #else ascender = 2881; descender = -934; height = 3815; numGlyphs = 232; underlinePosition = -205; underlineThickness = 102; unitsPerEM = 2048; #end name = "Pacifico"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_fonts_pacifico_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_pacifico_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_pacifico_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_fonts_pacifico_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_pacifico_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_pacifico_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
