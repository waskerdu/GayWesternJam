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
	
	override public function create():Void
	{
		super.create();
		gameData = new GameData();
		gameSave = new FlxSave();
		gameSave.bind("global");
		speedTrack = new FlxSprite();
		speedTrack.makeGraphic(600,20, FlxColor.WHITE);
		speedTrack.x = 100;
		speedTrack.y = 20;
		add(speedTrack);
		characters = new Array<Character>();
		for (i in 0...4){
			var char = new Character(gameData);
			char.x = 800-60;
			char.y = 100 + i * 60;
			char.randomize();
			add(char);
			characters.push(char);
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
