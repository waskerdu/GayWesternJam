package;

import flixel.util.FlxSave;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class BattleScene extends FlxState
{
	var gameData:GameData;
	var gameSave:FlxSave;
	var characters:Array<Character>;
	var speedTrack:FlxSprite;
	var statScreen:StatScreen;
	var characterMenu:CharacterMenu;
	
	override public function create():Void
	{
		super.create();
		gameData = new GameData();
		gameSave = new FlxSave();
		gameSave.bind("global");
		statScreen = new StatScreen();
		statScreen.sprite.makeGraphic(320,160, FlxColor.GRAY);
		statScreen.y = 600-160;
		add(statScreen);
		characterMenu = new CharacterMenu();
		characterMenu.sprite.makeGraphic(320,160, FlxColor.GRAY);
		characterMenu.x = 800-320;
		characterMenu.y = 600-160;
		add(characterMenu);
		/*speedTrack = new FlxSprite();
		speedTrack.makeGraphic(600,20, FlxColor.WHITE);
		speedTrack.x = 100;
		speedTrack.y = 20;
		add(speedTrack);*/

		characters = new Array<Character>();
		for (i in 0...4){
			var char = new Character(gameData);
			char.x = 800-60;
			char.y = 100 + i * 60;
			char.randomize();
			char.statCallback = statScreen.setContents;
			char.menuCallback = characterMenu.setContents;
			add(char);
			characters.push(char);
		}
		characters[0].setMenu("main");
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
