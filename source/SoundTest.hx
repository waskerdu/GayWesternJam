package;

import openfl.ui.GameInput;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxState;

class SoundTest extends FlxState
{
	var gameData:GameData;
    override public function create():Void
	{
		super.create();
        gameData = new GameData();
        for (i in 0...gameData.music.length){
            trace(gameData.music[i].fileName);
            var track1:Button = new Button();
            track1.callback = function (str:String){
                FlxG.sound.playMusic(gameData.music[i].fileName, 1, gameData.music[i].loop);
            }
            track1.sprite.makeGraphic(200, 50, FlxColor.YELLOW);
            track1.text.text = gameData.music[i].name;
            track1.text.size = 20;
            track1.x = (track1.sprite.width + 10)*i;
            track1.text.color = FlxColor.BLACK;
            add(track1);
        }
        /*var track1:Button = new Button();
        track1.callback = function (str:String){
			FlxG.sound.playMusic(AssetPaths.ChooChoo_Track01TitleScreen__ogg);
		}
        track1.sprite.makeGraphic(200, 150, FlxColor.YELLOW);
        track1.text.text = "Track 1";
		track1.text.size = 20;
		track1.text.color = FlxColor.BLACK;
        add(track1);
        var track2:Button = new Button();
        track2.callback = function (str:String){
			FlxG.sound.playMusic(AssetPaths.ChooChoo_Track03Win__ogg, 1, false);
		}
        track2.sprite.makeGraphic(200, 150, FlxColor.YELLOW);
        track2.text.text = "Track 2";
		track2.text.size = 20;
        track2.x = track1.sprite.width + 10;
		track2.text.color = FlxColor.BLACK;
        add(track2);
        var track3:Button = new Button();
        track3.callback = function (str:String){
			FlxG.sound.playMusic(AssetPaths.ChooChoo_Track04Lose__ogg, 1, false);
		}
        track3.sprite.makeGraphic(200, 150, FlxColor.YELLOW);
        track3.text.text = "Track 3";
		track3.text.size = 20;
        track3.x = track1.sprite.width * 2 + 20;
		track3.text.color = FlxColor.BLACK;
        add(track3);
        var track4:Button = new Button();
        track4.callback = function (str:String){
			FlxG.sound.playMusic(AssetPaths.ChooChoo_Track02Batle__ogg, 1, false);
		}
        track4.sprite.makeGraphic(200, 150, FlxColor.YELLOW);
        track4.text.text = "Track 4";
		track4.text.size = 20;
        track4.x = track1.sprite.width * 3 + 30;
		track4.text.color = FlxColor.BLACK;
        add(track4);*/
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
