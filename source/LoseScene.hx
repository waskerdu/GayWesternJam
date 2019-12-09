package;

import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxState;

class LoseScene extends FlxState
{
	override public function create():Void
	{
		super.create();
		FlxG.sound.playMusic(AssetPaths.ChooChoo_Track03Win__ogg, 1, false);
		var button = new Button();
		add(button);
		button.sprite.makeGraphic(200, 150, FlxColor.YELLOW);
		button.text.text = "Play Again?";
		button.text.size = 20;
		button.text.color = FlxColor.BLACK;
		/*var title = new FlxText();
		title.text = "The Good, the Bad, and The";
		title.size = 20;
		title.screenCenter();
		title.y = 100;
		add(title);*/
		var fab = new FlxText();
		fab.text = "Victory was not yours today.";
		fab.setFormat(AssetPaths.Pacifico__ttf);
		fab.color = FlxColor.PURPLE;
		fab.size = 40;
		fab.screenCenter();
		//fab.y = title.y + title.height;
		add(fab);
		button.y = fab.y + fab.height;
		button.x = 400-button.sprite.width/2;
		button.callback = function (str:String){
			FlxG.switchState(new BattleScene());
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
