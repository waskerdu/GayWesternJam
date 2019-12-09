package;

import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.FlxBasic;
import openfl.Assets;
import flixel.FlxG;
import haxe.Timer;

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
    public var targetMode:String = "singleEnemy";
    public var soundEffect:String = "none";
    public var animation:String = "none";
    public var targetAnimation:String = "none";
    var doneCallback:(Void->Void);
    var sendCallback:Bool = false;
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
        if(data.targetMode != null){targetMode = data.targetMode;}
        if(data.soundEffect != null){soundEffect = data.soundEffect;}
        if(data.animation != null){animation = data.animation;}
        if(data.targetAnimation != null){targetAnimation = data.targetAnimation;}
    }
    /**function showNotice(message:String) {
        notice.visible = true;
        notice.y = 100;
        notice.text.text = message;
        FlxTween.tween(notice, {y:notice.y},0.5*speed, {ease: FlxEase.circOut});
        notice.y = -1000;
    }**/

    function knockback(target:Actor, delay:Float) {
        var dir = 1;
        if (target.x < 400){dir = -1;}
        dir*=100;
        var startX = target.x;
        var midX = target.x + dir;
        FlxTween.tween(target, {x:midX}, 0.5, {ease: FlxEase.backIn, startDelay: delay,  onComplete: 
            function (tween:FlxTween){
                FlxTween.tween(target, {x:startX}, 0.5, {ease: FlxEase.circOut});
                if(delay != 0){play();done(null);}
            }
        });
    }

    function play() {
        if(soundEffect != "none"){
            if(Assets.exists(soundEffect)){
                var sound = Assets.getSound(soundEffect);
                FlxG.sound.play(sound);
            }
            else{
                trace("sound: " + soundEffect + " cannot be found");
            }
        }
    }

    function melee(target:Actor, source:Actor, type:String, delay:Float) {
        var startX = source.x;
        var midX = target.x;
        var startY = source.y;
        var midY = target.y;
        FlxTween.tween(source, {x:midX, y:midY}, 0.5, {ease: FlxEase.backIn, startDelay: delay,  onComplete: 
            function (tween:FlxTween){
                FlxTween.tween(source, {x:startX, y:startY}, 0.5, {ease: FlxEase.circOut, onComplete: done});
                animate(target, source, targetAnimation, 0);
                play();
            }
        });
    }

    function done(tween:FlxTween) {
        if(sendCallback == false){
            sendCallback = true;
            doneCallback();
        }
    }

    function animate(target:Actor, source:Actor, type:String, delay:Float) {
        if(type == "melee"){
            melee(target, source, targetAnimation, delay);
        }
        else if(type == "knockback"){
            knockback(target, delay);
        }
        else{
            Timer.delay(play, Math.round(delay * 1000));
            done(null);
        }
    }

    public function use(targets:Array<Actor>, source:Actor, delay:Float, doneCallback:(Void->Void)):String {
        this.doneCallback = doneCallback;
        if(source.stats["quiddity"] < cost){
            return "Not enough quiddity!";
        }
        source.stats["quiddity"]-=cost;
        sendCallback = false;
        for (target in targets){
            var damage = source.stats[mainStat] * power;
            if(defendStat != "none"){damage *= target.stats[defendStat] / 10;}
            if(damage < 1 && damage > 0){damage = 1;}
            if(damage < 0 && damage > -1){damage = -1;}
            target.stats[targetStat] -= damage;
            if(target.stats[targetStat]<0){target.stats[targetStat] = 0;}
            animate(target, source, animation, delay);
        }
        if(sendCallback){
            Timer.delay(doneCallback, Math.round(delay * 1000));
        }
        return null;
    }
}