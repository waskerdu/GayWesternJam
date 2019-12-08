package;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class CharacterMenu extends FlxGroup{
    static public var hPadding:Float = 5;
    static public var vPadding:Float = 5;
    public var x:Float;
    public var y:Float;
    var buttons:Array<Button>;
    var buttonPool:FlxTypedGroup<Button>;
    public var sprite:FlxSprite;

    public function new(x:Float = 0, y:Float = 0) {
        super();
        this.x = x;
        this.y = y;
        buttons = new Array<Button>();
        buttonPool = new FlxTypedGroup<Button>();
        sprite = new FlxSprite();
        add(sprite);
        add(buttonPool);
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

    public function setContents(contents:Array<MenuOption>) {
        buttonPool.forEach(function(button){button.kill();});
        buttons.resize(0);
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