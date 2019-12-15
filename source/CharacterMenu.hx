package;

import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;

class CharacterMenu extends FlxGroup{
    static public var hPadding:Float = 5;
    static public var vPadding:Float = 5;
    public var x:Float;
    public var y:Float;
    var buttonPool:FlxTypedGroup<Button>;
    var linePool:FlxTypedGroup<FlxText>;
    var quidString:FlxText;
    var realString:FlxText;
    var nameString:FlxText;
    public var sprite:FlxSprite;

    public function new(x:Float = 0, y:Float = 0) {
        super();
        this.x = x;
        this.y = y;
        linePool = new FlxTypedGroup<FlxText>();
        buttonPool = new FlxTypedGroup<Button>();
        sprite = new FlxSprite();
        add(sprite);
        add(buttonPool);
        add(linePool);
    }

    override function update(elapsed:Float) {
        sprite.x = x;
        sprite.y = y;
        super.update(elapsed);
    }

    function getButton(){
        var button = buttonPool.recycle();
        if(button == null){
            button = new Button();
            buttonPool.add(button);
        }
        return button;
    }

    function getLine(){
        var line = linePool.recycle();
        if(line == null){
            line = new FlxText();
            linePool.add(line);
        }
        return line;
    }

    public function clearContents() {
        buttonPool.forEach(function(button){button.kill();});
        linePool.forEach(function(line){line.kill();});
    }

    public function setContents(contents:Array<MenuOption>, lines:Array<String>) {
        clearContents();
        for (i in 0...lines.length){
            var line = getLine();
            line.text = lines[i];
            line.size = 16; 
            line.color = FlxColor.BLACK;
            line.x = x + sprite.width - line.width;
            line.y = y + i * line.height;
        }
        for(i in 0...contents.length){
            var button = getButton();
            button.text.text = contents[i].name;
            button.text.color = FlxColor.BLACK;
            button.sprite.makeGraphic(100, 16, FlxColor.YELLOW);
            button.callback = contents[i].func;
            button.arg = contents[i].arg;
            //buttons.push(button);
            button.x = x;
            button.y = y + 20*i;
        }
    }
}