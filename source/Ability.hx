package;

import flixel.FlxBasic;

class Ability extends FlxBasic{
    public var name:String;
    public var description:String;
    public var mainStat:String = "wit";
    public var power:Float = 1;
    public var cost:Float = 0;
    public var defendStat:String = "moxie";
    public var targetStat:String = "realness";
    public var duration:Float = 0;
    public var augments:Array<String>;
    public var attackAugments:Array<String>;
    public var targetMode:String = "singleEnemy";
    public function new(data:Dynamic) {
        super();
        augments = new Array<String>();
        attackAugments = new Array<String>();
        name = data.name;
        description = data.description;
        if(data.mainStat != null){mainStat = data.mainStat;}
        if(data.power != null){power = data.power;}
        if(data.cost != null){cost = data.cost;}
        if(data.defendStat != null){defendStat = data.defendStat;}
        if(data.targetStat != null){targetStat = data.targetStat;}
        if(data.duration != null){duration = data.duration;}
        if(data.augments != null){augments = data.augments;}
        if(data.attackAugments != null){attackAugments = data.attackAugments;}
        if(data.targetMode != null){targetMode = data.targetMode;}
    }

    public function use(targets:Array<Actor>, source:Actor):String {
        //trace(name);
        if(source.stats["quiddity"] < cost){
            return "Not enough quiddity!";
        }
        source.stats["quiddity"]-=cost;
        for (target in targets){
            trace(name+" fired!");
            var damage = source.stats[mainStat] * power;
            if(defendStat != "none"){damage *= target.stats[defendStat] / 10;}
            if(damage < 1 && damage > 0){damage = 1;}
            if(damage < 0 && damage > -1){damage = -1;}
            trace("damage: "+damage);
            trace("target stat before: "+target.stats[targetStat]);
            target.stats[targetStat] -= damage;
            trace("target stat after: "+target.stats[targetStat]);
            if(target.stats[targetStat]<0){target.stats[targetStat] = 0;}
        }
        return null;
    }
}