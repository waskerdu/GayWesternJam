package;

import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, BattleScene, 1, 60, 60, true));
		//addChild(new FlxGame(0, 0, MainMenu, 1, 60, 60, true));
		//addChild(new FlxGame(0, 0, LoseScene, 1, 60, 60, true));
	}
}
