package;

import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import haxe.DynamicAccess;
import flixel.FlxSprite;

class Character extends FlxGroup{
    var x:Float = 0;
    var y:Float = 0;
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
    public function new(x:Float = 0, y:Float = 0) {
        super();
        this.x = x;
        this.y = y;
        hatSprite = new FlxSprite();
        add(hatSprite);
        hatSprite.makeGraphic(50,100,FlxColor.GREEN);
        /*hatSprite.loadGraphic("assets/Hats.png", true, 64,64);
        headSprite = new FlxSprite();
        add(headSprite);
        headSprite.loadGraphic("assets/Heads.png", true, 64,64);
        topSprite = new FlxSprite();
        add(topSprite);
        topSprite.loadGraphic("assets/Tops.png", true, 64,64);
        bottomSprite = new FlxSprite();
        add(bottomSprite);
        bottomSprite.loadGraphic("assets/Bottoms.png", true, 64,64);*/
    }
    override public function update(elapsed:Float) {
        hatSprite.x = x;
        hatSprite.y = y;
        super.update(elapsed);
    }
    public function loadData(data:Dynamic){
        sass = data.sass;
        wit = data.wit;
        moxie = data.moxie;
        flair = data.flair;
        realness = data.realness;
        hatSprite.animation.frameIndex = data.hatInd;
        headSprite.animation.frameIndex = data.headInd;
        topSprite.animation.frameIndex = data.topInd;
        bottomSprite.animation.frameIndex = data.bottomInd;
    }
    public function saveData(){
        var data:Dynamic = {
            sass : this.sass,
            wit : this.wit,
            moxie : this.moxie,
            flair : this.flair,
            realness : this.realness,
            hatInd : this.hatSprite.animation.frameIndex,
            headInd : this.headSprite.animation.frameIndex,
            topInd : this.topSprite.animation.frameIndex,
            bottomInd : this.bottomSprite.animation.frameIndex
        }
        return data;
    }
    function randint(min:Int, max:Int){
        var num = Math.random() * (max - min);
        return Math.round(num) + min;
    }
    public function randomize(){
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
        hatSprite.animation.frameIndex = randint(0,hatSprite.animation.frames-1);
        /*headSprite.animation.frameIndex = randint(0,headSprite.animation.frames-1);
        topSprite.animation.frameIndex = randint(0,topSprite.animation.frames-1);
        bottomSprite.animation.frameIndex = randint(0,bottomSprite.animation.frames-1);*/
    }
}