package;

import flixel.FlxState;

class PlayState extends FlxState
{
	var gameData:GameData;
	override public function create():Void
	{
		super.create();
		gameData = new GameData();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
