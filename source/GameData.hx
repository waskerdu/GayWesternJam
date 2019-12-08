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
    public var classes:Map<String,CharacterClass>;
    public var genders:Array<String>;
    public var identities:Array<String>;
    public var jobs:Array<String>;
    public var abilities:Map<String,Ability>;
    public var augments:Array<String>;
    public var elements:Array<String>;
    public var weaknesses:Array<String>;
    public var items:Array<String>;
    public var enemies:Map<String,Dynamic>;

    public function new() {
        super();
        var str = Assets.getText("assets/data/gamedata.json");
        var data = haxe.Json.parse(str);
        genders = new Array<String>();
        identities = new Array<String>();
        jobs = new Array<String>();
        classes = new Map<String,CharacterClass>();
        abilities = new Map<String,Ability>();
        enemies = new Map<String,Enemy>();
        var tempArray:Array<Dynamic>;
        tempArray = data.classes;
        for (i in 0...tempArray.length){
            classes[tempArray[i].id] = new CharacterClass(tempArray[i]);
            if(tempArray[i].type == "gender"){genders.push(tempArray[i].id);}
            else if(tempArray[i].type == "identity"){identities.push(tempArray[i].id);}
            else if(tempArray[i].type == "job"){jobs.push(tempArray[i].id);}
        }
        tempArray = data.abilities;
        for (i in 0...tempArray.length){
            abilities[tempArray[i].id] = new Ability(tempArray[i]);
        }
        tempArray = data.enemies;
        for (i in 0...tempArray.length){
            enemies[tempArray[i].id] = tempArray[i];
        }
    }
}