package;

import flixel.FlxBasic;

class Enemy extends FlxBasic{
    public var name:String;
    public var description:String;
    public var abilities:Array<String>;
    public function new(data:Dynamic) {
        super();
        name = data.name;
        description = data.description;
        abilities = data.abilities;
    }
}