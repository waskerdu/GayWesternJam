package;

import flixel.FlxSprite;

class Character extends FlxSprite{
    var hatInd:Int = 0;
    var headInd:Int = 0;
    var topInd:Int = 0;
    var bottomInd:Int = 0;
    var hatSprite:FlxSprite;
    var headSprite:FlxSprite;
    var topSprite:FlxSprite;
    var bottomSprite:FlxSprite;
    var sass:Float;
    var wit:Float;
    var moxie:Float;
    var flair:Float;
    var realness:Float;
    var quiddity:Float;
    var weaknesses:Array<String>;
    var tempWeaknesses:Array<{name:String, duration:Float}>;
    var buffs:Array<{name:String, duration:Float, mod:Float}>;
    function new(x:Float, y:Float, data:Dynamic) {
        super(x,y);
        hatSprite = new FlxSprite();
        hatSprite.loadGraphic("assets/Hats.png", true, 64,64);
        headSprite = new FlxSprite();
        headSprite.loadGraphic("assets/Heads.png", true, 64,64);
        topSprite = new FlxSprite();
        topSprite.loadGraphic("assets/Tops.png", true, 64,64);
        bottomSprite = new FlxSprite();
        bottomSprite.loadGraphic("assets/Bottoms.png", true, 64,64);
    }
    function randint(min:Int, max:Int){
        var num = Math.random() * (max - min);
        return Math.round(num) + min;
    }
    function randomize(){
        var stats = new Array<Float>();
        var num:Float;
        while(stats.length < 2){
            num = (Math.random() + Math.random())/2;
            if(num > 0.6){stats.push(num);}
        }
        while(stats.length < 2){
            num = (Math.random() + Math.random())/2;
            if(num > 0.4){stats.push(num);}
        }
        for(i in 0...2){
            num = (Math.random() + Math.random())/2;
            stats.push(num);
        }
        // shuffle stats
        sass = stats[0];
        wit = stats[1];
        moxie = stats[2];
        flair = stats[3];
        realness = stats[4];
        quiddity = stats[5];
        hatInd = randint(0,hatSprite.animation.frames-1);
        headInd = randint(0,headSprite.animation.frames-1);
        topInd = randint(0,topSprite.animation.frames-1);
        bottomInd = randint(0,bottomSprite.animation.frames-1);
    }
}