package;

import flixel.FlxObject;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.FlxSprite;

class Character extends FlxGroup{
    public var x:Float = 0;
    public var y:Float = 0;
    var hatSprite:FlxSprite;
    var headSprite:FlxSprite;
    var topSprite:FlxSprite;
    var bottomSprite:FlxSprite;
    var sass:Float;
    var wit:Float;
    var moxie:Float;
    var flair:Float;
    var realness:Float;
    var quiddity:Float = 0;
    var weaknesses:Array<String>;
    var tempWeaknesses:Array<{name:String, duration:Float}>;
    var buffs:Array<{name:String, duration:Float, mod:Float}>;
    var spells:Array<String>;
    var gameData:GameData;
    var job:String;
    var identity:String;
    var gender:String;
    public var statCallback:(Array<String> -> Void);
    public var menuCallback:(Array<MenuOption> -> Void);
    var name = "Name";
    public function new(gameData:GameData, x:Float = 0, y:Float = 0) {
        super();
        this.x = x;
        this.y = y;
        this.gameData = gameData;
        spells = new Array<String>();
        weaknesses = new Array<String>();
        tempWeaknesses = new Array<{name:String, duration:Float}>();
        buffs = new Array<{name:String, duration:Float, mod:Float}>();
        hatSprite = new FlxSprite();
        add(hatSprite);
        hatSprite.makeGraphic(50,50,FlxColor.GREEN);
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
        FlxMouseEventManager.add(hatSprite, null, null, mouseOver, null);
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
        spells = data.spells;
        gender = data.gender;
        identity = data.identity;
        job = data.job;
        name = data.name;
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
            bottomInd : this.bottomSprite.animation.frameIndex,
            spells : this.spells,
            gender : this.gender,
            identity: this.identity,
            job : this.job,
            name : this.name,
        }
        return data;
    }
    function randint(min:Int, max:Int){
        var num = Math.random() * (max - min);
        return Math.round(num) + min;
    }
    public function randomize(){
        var stats = new Array<Float>();
        var tempStats = new Array<Float>();
        var num:Float;
        var goodStats = 2;
        var badStats = 0;
        var numStats = 4;
        while(tempStats.length < goodStats){
            num = (Math.random() + Math.random())/2;
            if(num > 0.6){tempStats.push(num);}
        }
        while(tempStats.length < goodStats + badStats){
            num = (Math.random() + Math.random())/2;
            if(num < 0.4){tempStats.push(num);}
        }
        while(tempStats.length < numStats){
            num = (Math.random() + Math.random())/2;
            tempStats.push(num);
        }
        // shuffle stats
        for(i in 0...numStats){
            var randInd = randint(0, tempStats.length-1);
            var stat = tempStats[randInd];
            tempStats[randInd] = -1;
            tempStats.remove(-1);
            stats.push(stat);
        }
        sass = stats[0];
        wit = stats[1];
        moxie = stats[2];
        //flair = stats[3];
        realness = stats[3];
        //quiddity = stats[5];
        hatSprite.animation.frameIndex = randint(0,hatSprite.animation.frames-1);
        /*headSprite.animation.frameIndex = randint(0,headSprite.animation.frames-1);
        topSprite.animation.frameIndex = randint(0,topSprite.animation.frames-1);
        bottomSprite.animation.frameIndex = randint(0,bottomSprite.animation.frames-1);*/
        gender = gameData.genders[randint(0, gameData.genders.length-1)];
        identity = gameData.identities[randint(0, gameData.identities.length-1)];
        job = gameData.jobs[randint(0, gameData.jobs.length-1)];
        spells = spells.concat(gameData.classes[gender].abilities);
        spells = spells.concat(gameData.classes[identity].abilities);
        spells = spells.concat(gameData.classes[job].abilities);
        var firstNames = ["marla","winnefred","albert","ester","fenric","vanessa","edith"];
        name = firstNames[randint(0,firstNames.length-1)];
    }
    function mouseOver(object:FlxObject) {
        // set stat screen
        var stats = new Array<String>();
        stats.push(name);
        stats.push("");
        stats.push("Sass: "+Math.floor(sass*10));
        stats.push("used for physical attacks");
        stats.push("Wit: "+Math.floor(wit*10));
        stats.push("used for magic attacks");
        stats.push("Moxie: "+Math.floor(moxie*10));
        stats.push("used to defend against all attacks");
        //stats.push("Flair: "+Math.floor(flair*10));
        stats.push("Realness: "+Math.floor(realness*100));
        stats.push("how much physical damage a character\n can take before being KO’d");
        stats.push("Quiddity: "+Math.floor(quiddity));
        stats.push("resource used for spells");
        statCallback(stats);
    }

    function ability(name:String) {
        return new MenuOption(
            gameData.abilities[name].name, 
            gameData.abilities[name].description,
            useAbility,
            name
        );
    }

    public function setMenu(menu:String){
        var menuEntries = new Array<MenuOption>();
        if(menu == "main"){
            menuEntries.push(ability("attack"));
            menuEntries.push(new MenuOption(
                "Magic",
                "",
                setMenu,
                "magic"
            ));
            /*menuEntries.push(new MenuOption(
                "Item",
                "",
                SetMenu,
                "item"
            ));*/
            menuEntries.push(ability("defend"));
        }
        else if(menu == "magic"){
            for(spell in spells){
                menuEntries.push(ability(spell));
            }
            menuEntries.push(new MenuOption(
                "Back",
                "",
                setMenu,
                "main"
            ));
        }
        menuCallback(menuEntries);
    }
    function useAbility(menu:String){}
    function useItem(menu:String){}
}