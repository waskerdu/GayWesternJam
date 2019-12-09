package;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.FlxObject;

class Label extends FlxGroup{
    public var x:Float = 0;
    public var y:Float = 0;
    public var sprite:FlxSprite;
    public var text:FlxText;
    public function new() {
        super();
        sprite = new FlxSprite();
        text = new FlxText();
        add(sprite);
        add(text);
    }

    public function setText(newText:String) {
        text.text = newText;
        text.fieldWidth = sprite.width;
    }

    override function update(elapsed:Float) {
        sprite.x = x;
        sprite.y = y;
        text.x = x + (sprite.width - text.width)/2;
        text.y = y + (sprite.height - text.height)/2;
        super.update(elapsed);
    }
}