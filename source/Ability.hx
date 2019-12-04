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
    }
}