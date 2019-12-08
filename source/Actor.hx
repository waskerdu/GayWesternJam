package;

import flixel.FlxObject;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.FlxSprite;

class Actor extends FlxGroup{
    public var x:Float = 0;
    public var y:Float = 0;
    /*var sass:Float = 0.5;
    var wit:Float = 0.5;
    var moxie:Float = 0.5;
    var flair:Float = 0.5;
    var realness:Float = 50;
    var quiddity:Float = 0;*/
    public var stats:Map<String,Float>;
    public var weaknesses:Array<String>;
    public var tempWeaknesses:Array<{name:String, duration:Float}>;
    public var buffs:Array<{name:String, duration:Float, mod:Float}>;
    public var spells:Array<String>;
    var gameData:GameData;
    public var sprite:FlxSprite;
    public var statCallback:(Array<String> -> Void);
    public var abilityCallback:(Ability -> Actor -> Void);
    public var name = "Name";
    public function new(gameData:GameData, x:Float = 0, y:Float = 0) {
        super();
        this.x = x;
        this.y = y;
        this.gameData = gameData;
        stats = new Map<String,Float>();
        stats["sass"] = 5;
        stats["wit"] = 5;
        stats["moxie"] = 5;
        stats["realness"] = 50;
        stats["quiddity"] = 0;
        spells = new Array<String>();
        weaknesses = new Array<String>();
        tempWeaknesses = new Array<{name:String, duration:Float}>();
        buffs = new Array<{name:String, duration:Float, mod:Float}>();
        sprite = new FlxSprite();
        add(sprite);
        sprite.makeGraphic(50,50,FlxColor.RED);
        FlxMouseEventManager.add(sprite, null, null, mouseOver, null);
    }
    override public function update(elapsed:Float) {
        sprite.x = x;
        sprite.y = y;
        super.update(elapsed);
    }
    function shuffleInt(start:Array<Int>){
        var temp = new Array<Int>();
        var end = new Array<Int>();
        for (i in start){temp.push(i);}
        for (i in 0...start.length){
            var randInd = randint(0, temp.length-1);
            var val = temp[randInd];
            temp[randInd] = -1;
            temp.remove(-1);
            end.push(val);
        }
        return end;
    }
    public function loadData(data:Dynamic){
        /*sass = data.sass;
        wit = data.wit;
        moxie = data.moxie;
        flair = data.flair;
        spells = data.spells;
        gender = data.gender;
        identity = data.identity;
        job = data.job;
        name = data.name;*/
    }
    public function saveData(){
        var data:Dynamic = {
            /*sass : this.sass,
            wit : this.wit,
            moxie : this.moxie,
            flair : this.flair,
            realness : this.realness,
            hatInd : this.hatSprite.animation.frameIndex,
            headInd : this.headSprite.animation.frameIndex,
            topInd : this.topSprite.animation.frameIndex,
            bottomInd : this.bottomSprite.animation.frameIndex,
            spells : this.spells,
            gender : this.gender,
            identity: this.identity,
            job : this.job,
            name : this.name,*/
        }
        return data;
    }
    public static function randint(min:Int, max:Int){
        var num = Math.random() * (max - min);
        return Math.round(num) + min;
    }
    function mouseOver(object:FlxObject) {
        // set stat screen
        var statArray = new Array<String>();
        statArray.push(name);
        statArray.push("");
        statArray.push("Sass: "+Math.floor(stats["sass"]));
        statArray.push("used for physical attacks");
        statArray.push("Wit: "+Math.floor(stats["wit"]));
        statArray.push("used for magic attacks");
        statArray.push("Moxie: "+Math.floor(stats["moxie"]));
        statArray.push("used to defend against all attacks");
        //stats.push("Flair: "+Math.floor(flair*10));
        statArray.push("Realness: "+Math.floor(stats["realness"]));
        statArray.push("how much physical damage a character\n can take before being KO’d");
        //stats.push("Quiddity: "+Math.floor(quiddity));
        //stats.push("resource used for spells");
        statCallback(statArray);
    }
    function useAbility(name:String){
        abilityCallback(gameData.abilities[name], this);
    }
    function useItem(menu:String){}
}