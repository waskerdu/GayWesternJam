package;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.ui.FlxButton;

class CharacterMenu extends FlxGroup{
    static public var hPadding:Float = 5;
    static public var vPadding:Float = 5;
    public var x:Float;
    public var y:Float;
    var buttons:Array<FlxButton>;
    var buttonPool:FlxTypedGroup<FlxButton>;
    public var sprite:FlxSprite;

    public function new(x:Float = 0, y:Float = 0) {
        super();
        this.x = x;
        this.y = y;
        buttons = new Array<FlxButton>();
        buttonPool = new FlxTypedGroup<FlxButton>();
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
            button = new FlxButton();
            buttonPool.add(button);
        }
        return button;
    }

    public function setContents(contents:Array<MenuOption>) {
        buttonPool.forEach(function(button){button.kill();});
        buttons.resize(0);
        for(i in 0...contents.length){
            var button = getButton();
            button.text = contents[i].name;
            //button.onDown = contents[i].func;
            button.Oncl
            buttons.push(button);
            button.x = x;
            button.y = y + 16*i;
        }
    }
}