package;

import flixel.FlxG;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;
import flixel.text.FlxText;

class StatScreen extends FlxGroup{
    public var x:Float = 0;
    public var y:Float = 0;
    static public var hPadding:Float = 5;
    static public var vPadding:Float = 5;
    var fields:Array<FlxText>;
    public var sprite:FlxSprite;
    var fieldPool:FlxTypedGroup<FlxText>;
    var toolTip:FlxText;
    var tips:Array<String>;
    var isMouseOver:Bool = false;
    public function new(x:Float = 0, y:Float = 0) {
        super();
        fields = new Array<FlxText>();
        sprite = new FlxSprite();
        fieldPool = new FlxTypedGroup<FlxText>();
        toolTip = new FlxText();
        tips = new Array<String>();
        add(sprite);
        add(fieldPool);
        add(toolTip);
        FlxMouseEventManager.add(sprite, null, null, mouseOver, mouseOff);
    }

    function mouseOver(object:FlxObject){
        isMouseOver = true;
        toolTip.visible = true;
    }

    function mouseOff(object:FlxObject){
        isMouseOver = false;
        toolTip.visible = false;
    }

    override function update(elapsed:Float) {
        sprite.x = x;
        sprite.y = y;
        if(isMouseOver){
            var i = Math.floor((FlxG.mouse.y-y) / 20);
            if(i > 0 && i < fields.length){
                toolTip.y = fields[i].y;
                toolTip.x = x + sprite.width;
                toolTip.text = tips[i];
            }
            
            /*var maxY = y;
            for(i in 0...fields.length){
                if(FlxG.mouse.y < maxY){
                    toolTip.y = fields[i].y;
                    toolTip.x = x + sprite.width;
                    toolTip.text = tips[i];
                    break;
                }
                else{maxY=fields[i].y;}
            }*/
        }
        super.update(elapsed);
    }

    function getField(){
        var field = fieldPool.recycle();
        if(field == null){
            field = new FlxText();
            fieldPool.add(field);
        }
        field.color = FlxColor.BLACK;
        return field;
    }

    public function setContents(strings:Array<String>) {
        fieldPool.forEach(function(field){field.kill();});
        fields.resize(0);
        tips.resize(0);
        for (i in 0...strings.length){
            var str = strings[i];
            //trace(str);
            if(i%2 == 1){tips.push(str); continue;}
            var field = getField();
            if(i == 0){field.size = 16;}
            else{field.size = 12;}
            field.text = str;
            field.x = x;
            field.y = y + i*20/2;
            fields.push(field);
        }
    }
}