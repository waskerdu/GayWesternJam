package;

import flixel.FlxSprite;
import flixel.FlxBasic;

class Enemy extends Actor{
    public var description:String;
    var chains:Array<Array<FlxSprite>>;

    override function loadData(data:Dynamic){
        //var statNames = ["sass","wit","flair","moxie","realness"];
        stats = data.stats;
        /*for (statName in statNames){
            stats[statName] = data.stats[statName];
        }*/
        name = data.name;
        chains = new Array<Array<FlxSprite>>();
        //sprite.loadGraphic(data.sprite);
    }
}