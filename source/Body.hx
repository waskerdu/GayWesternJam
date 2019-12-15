package;

import flixel.group.FlxGroup;

class Body extends FlxGroup{
    var gameData:GameData;
    public function new(gameData) {
        super();
        this.gameData = gameData;
    }
}