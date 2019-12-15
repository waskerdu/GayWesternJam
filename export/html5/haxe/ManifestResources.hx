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

		data = '{"name":null,"assets":"aoy4:pathy26:assets%2Fimages%2FPopo.pngy4:sizei48620y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y34:assets%2Fimages%2FPowerBottoms.pngR2i100171R3R4R5R7R6tgoR0y38:assets%2Fimages%2FPowerBottoms2.png%7ER2i899879R3y6:BINARYR5R8R6tgoR0y30:assets%2Fimages%2Flandlady.pngR2i73216R3R4R5R10R6tgoR0y30:assets%2Fimages%2Fbackdrop.pngR2i58562R3R4R5R11R6tgoR0y32:assets%2Fimages%2FPopobetter.pngR2i46660R3R4R5R12R6tgoR0y31:assets%2Fimages%2FPowerTops.pngR2i145701R3R4R5R13R6tgoR0y35:assets%2Fimages%2FPopobetter.png%7ER2i2283945R3R9R5R14R6tgoR0y27:assets%2Fimages%2FHeads.pngR2i17130R3R4R5R15R6tgoR0y35:assets%2Fimages%2FPowerBottoms2.pngR2i101415R3R4R5R16R6tgoR0y33:assets%2Fimages%2Flandlady.png%7ER2i1273338R3y4:TEXTR5R17R6tgoR2i113212R3y5:SOUNDR5y35:assets%2Fsounds%2FPlayer-Defend.wavy9:pathGroupaR20hR6tgoR2i814918R3R19R5y40:assets%2Fsounds%2FPlayer-PurpleProse.wavR21aR22hR6tgoR2i673324R3R19R5y33:assets%2Fsounds%2FPlayer-Ship.wavR21aR23hR6tgoR2i74190R3R19R5y33:assets%2Fsounds%2FMenu-Select.wavR21aR24hR6tgoR2i145648R3R19R5y35:assets%2Fsounds%2FPlayer-Attack.wavR21aR25hR6tgoR2i67248R3R19R5y31:assets%2Fsounds%2FMenu-Back.wavR21aR26hR6tgoR2i98458R3R19R5y30:assets%2Fsounds%2FPig-Womp.wavR21aR27hR6tgoR2i107244R3R19R5y30:assets%2Fsounds%2FPig-Oink.wavR21aR28hR6tgoR2i112922R3R19R5y36:assets%2Fsounds%2FLandlord-Evict.wavR21aR29hR6tgoR2i94982R3R19R5y33:assets%2Fsounds%2FMenu-Accept.wavR21aR30hR6tgoR2i938518R3R19R5y37:assets%2Fsounds%2FPlayer-Kickline.wavR21aR31hR6tgoR2i138244R3R19R5y40:assets%2Fsounds%2FLandlord-Powerbill.wavR21aR32hR6tgoR2i979294R3R19R5y36:assets%2Fsounds%2FPlayer-Rainbow.wavR21aR33hR6tgoR2i42168R3R19R5y31:assets%2Fsounds%2FMenu-Deny.wavR21aR34hR6tgoR0y29:assets%2Fdata%2Fgamedata.jsonR2i7431R3R18R5R35R6tgoR2i75568R3y4:FONTy9:classNamey34:__ASSET__assets_fonts_pacifico_ttfR5y29:assets%2Ffonts%2FPacifico.ttfR6tgoR2i28234R3R19R5y40:assets%2Fmusic%2FChooChoo-Track03Win.oggR21aR40hR6tgoR2i499059R3R19R5y42:assets%2Fmusic%2FChooChoo-Track02Batle.oggR21aR41hR6tgoR2i41875R3R19R5y41:assets%2Fmusic%2FChooChoo-Track04Lose.oggR21aR42hR6tgoR2i397152R3R19R5y48:assets%2Fmusic%2FChooChoo-Track01TitleScreen.oggR21aR43hR6tgoR2i2114R3y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3R21aR45y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R44R5y28:flixel%2Fsounds%2Fflixel.mp3R21aR47y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i33629R3R19R5R48R21aR47R48hgoR2i5794R3R19R5R46R21aR45R46hgoR2i15744R3R36R37y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R36R37y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R4R5R53R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R4R5R54R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
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

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_popo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_powerbottoms_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_powerbottoms2_png_ extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_landlady_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_backdrop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_popobetter_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_powertops_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_popobetter_png_ extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_heads_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_powerbottoms2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_landlady_png_ extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_player_defend_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_player_purpleprose_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_player_ship_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_select_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_player_attack_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_back_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_pig_womp_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_pig_oink_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_landlord_evict_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_accept_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_player_kickline_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_landlord_powerbill_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_player_rainbow_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_deny_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_gamedata_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_pacifico_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_choochoo_track03win_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_choochoo_track02batle_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_choochoo_track04lose_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_choochoo_track01titlescreen_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:image("assets/images/Popo.png") @:noCompletion #if display private #end class __ASSET__assets_images_popo_png extends lime.graphics.Image {}
@:keep @:image("assets/images/PowerBottoms.png") @:noCompletion #if display private #end class __ASSET__assets_images_powerbottoms_png extends lime.graphics.Image {}
@:keep @:file("assets/images/PowerBottoms2.png~") @:noCompletion #if display private #end class __ASSET__assets_images_powerbottoms2_png_ extends haxe.io.Bytes {}
@:keep @:image("assets/images/landlady.png") @:noCompletion #if display private #end class __ASSET__assets_images_landlady_png extends lime.graphics.Image {}
@:keep @:image("assets/images/backdrop.png") @:noCompletion #if display private #end class __ASSET__assets_images_backdrop_png extends lime.graphics.Image {}
@:keep @:image("assets/images/Popobetter.png") @:noCompletion #if display private #end class __ASSET__assets_images_popobetter_png extends lime.graphics.Image {}
@:keep @:image("assets/images/PowerTops.png") @:noCompletion #if display private #end class __ASSET__assets_images_powertops_png extends lime.graphics.Image {}
@:keep @:file("assets/images/Popobetter.png~") @:noCompletion #if display private #end class __ASSET__assets_images_popobetter_png_ extends haxe.io.Bytes {}
@:keep @:image("assets/images/Heads.png") @:noCompletion #if display private #end class __ASSET__assets_images_heads_png extends lime.graphics.Image {}
@:keep @:image("assets/images/PowerBottoms2.png") @:noCompletion #if display private #end class __ASSET__assets_images_powerbottoms2_png extends lime.graphics.Image {}
@:keep @:file("assets/images/landlady.png~") @:noCompletion #if display private #end class __ASSET__assets_images_landlady_png_ extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Player-Defend.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_player_defend_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Player-PurpleProse.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_player_purpleprose_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Player-Ship.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_player_ship_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Menu-Select.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_select_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Player-Attack.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_player_attack_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Menu-Back.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_back_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Pig-Womp.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_pig_womp_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Pig-Oink.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_pig_oink_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Landlord-Evict.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_landlord_evict_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Menu-Accept.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_accept_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Player-Kickline.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_player_kickline_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Landlord-Powerbill.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_landlord_powerbill_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Player-Rainbow.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_player_rainbow_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Menu-Deny.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_menu_deny_wav extends haxe.io.Bytes {}
@:keep @:file("assets/data/gamedata.json") @:noCompletion #if display private #end class __ASSET__assets_data_gamedata_json extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/Pacifico.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_pacifico_ttf extends lime.text.Font {}
@:keep @:file("assets/music/ChooChoo-Track03Win.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_choochoo_track03win_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/music/ChooChoo-Track02Batle.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_choochoo_track02batle_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/music/ChooChoo-Track04Lose.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_choochoo_track04lose_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/music/ChooChoo-Track01TitleScreen.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_choochoo_track01titlescreen_ogg extends haxe.io.Bytes {}
@:keep @:file("/home/riley/haxelib/flixel/4,6,3/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("/home/riley/haxelib/flixel/4,6,3/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("/home/riley/haxelib/flixel/4,6,3/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:file("/home/riley/haxelib/flixel/4,6,3/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("/home/riley/haxelib/flixel/4,6,3/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("/home/riley/haxelib/flixel/4,6,3/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
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
