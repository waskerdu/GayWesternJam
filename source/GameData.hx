package;

import openfl.Assets;
import flixel.FlxBasic;

class GameData extends FlxBasic{
    /*
    "classes":[],
    "genders":[],
    "identies":[],
    "jobs":[],
    "abilities":[],
    "augments":[],
    "elements":[],
    "weaknesses":[],
    "items":[],
    "enemies":[]*/
    public var classes:Array<CharacterClass>;
    public var genders:Array<String>;
    public var identies:Array<String>;
    public var jobs:Array<String>;
    public var abilities:Array<Ability>;
    public var augments:Array<String>;
    public var elements:Array<String>;
    public var weaknesses:Array<String>;
    public var items:Array<String>;
    public var enemies:Array<Enemy>;

    public function new() {
        super();
        var str = Assets.getText("assets/data/gamedata.json");
        var data = haxe.Json.parse(str);
        classes = new Array<CharacterClass>();
        var tempClasses:Array<Dynamic> = data.classes.length;
        for (i in 0...tempClasses.length){
            classes.push(new CharacterClass(tempClasses[i]));
        }
        abilities = new Array<Ability>();
        var tempAbilities:Array<Dynamic> = data.abilities.length;
        for (i in 0...tempAbilities.length){
            abilities.push(new Ability(tempAbilities[i]));
        }
        genders = data.genders;
        identies = data.identities;
        jobs = data.jobs;
        augments = data.augments;
        elements = data.elements;
        weaknesses = data.weaknesses;
        items = data.items;
        enemies = new Array<Enemy>();
        var tempEnemies:Array<Dynamic> = data.enemies.length;
        for(i in 0...tempEnemies.length){
            enemies.push(new Enemy(tempEnemies[i]));
        }
    }
}