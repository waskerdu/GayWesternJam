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
    var buttons:Array<Button>;
    var buttonPool:FlxTypedGroup<Button>;
    var quidString:FlxText;
    var realString:FlxText;
    var nameString:FlxText;
    public var sprite:FlxSprite;

    public function new(x:Float = 0, y:Float = 0) {
        super();
        this.x = x;
        this.y = y;
        buttons = new Array<Button>();
        buttonPool = new FlxTypedGroup<Button>();
        sprite = new FlxSprite();
        quidString = new FlxText();
        quidString.size = 16;
        quidString.color = FlxColor.BLACK;
        realString = new FlxText();
        realString.size = 16;
        realString.color = FlxColor.BLACK;
        nameString = new FlxText();
        nameString.size = 16;
        nameString.color = FlxColor.BLACK;
        add(sprite);
        add(buttonPool);
        add(nameString);
        add(quidString);
        add(realString);
    }

    override function update(elapsed:Float) {
        sprite.x = x;
        sprite.y = y;
        nameString.x = x + sprite.width - nameString.width;
        nameString.y = y;
        quidString.x = x + sprite.width - quidString.width;
        quidString.y = y + nameString.height;
        realString.x = x + sprite.width - realString.width;
        realString.y = y + nameString.height + quidString.height;

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

    public function clearContents() {
        buttonPool.forEach(function(button){button.kill();});
        buttons.resize(0);
    }

    public function setContents(contents:Array<MenuOption>,name:String, realness:String, quiddity:String) {
        clearContents();
        nameString.text = name;
        realString.text = realness;
        quidString.text = quiddity;
        for(i in 0...contents.length){
            var button = getButton();
            button.text.text = contents[i].name;
            button.text.color = FlxColor.BLACK;
            button.sprite.makeGraphic(100, 16, FlxColor.YELLOW);
            button.callback = contents[i].func;
            button.arg = contents[i].arg;
            buttons.push(button);
            button.x = x;
            button.y = y + 20*i;
        }
    }
}