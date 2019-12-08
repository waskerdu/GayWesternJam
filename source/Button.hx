package;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.text.FlxText;
import flixel.FlxObject;

class Button extends FlxGroup{
    public var x:Float = 0;
    public var y:Float = 0;
    public var sprite:FlxSprite;
    public var text:FlxText;
    public var callback:(String -> Void);
    public var arg:String;
    public function new() {
        super();
        sprite = new FlxSprite();
        text = new FlxText();
        add(sprite);
        add(text);
        FlxMouseEventManager.add(sprite, onDown, null, null, null);
    }

    override function update(elapsed:Float) {
        sprite.x = x;
        sprite.y = y;
        text.x = x;
        text.y = y;
        super.update(elapsed);
    }

    function onDown(object:FlxObject) {
        callback(arg);
    }

    override public function destroy():Void
	{
		FlxMouseEventManager.remove(sprite);
		super.destroy();
	}
}