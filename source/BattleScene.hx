package;

import flixel.util.FlxSave;
import flixel.FlxState;

class BattleScene extends FlxState
{
	var gameData:GameData;
	var gameSave:FlxSave;
	var characters:Array<Character>;
	
	override public function create():Void
	{
		super.create();
		gameData = new GameData();
		gameSave = new FlxSave();
		gameSave.bind("global");
		characters = new Array<Character>();
		for (i in 0...1){
			var char = new Character();
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
