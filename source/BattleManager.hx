package;

import openfl.Assets;
import flixel.system.FlxAssets.FlxSoundAsset;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxBasic;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.FlxG;

class BattleManager extends FlxBasic{
    public var characters:Array<Character>;
    public var enemies:Array<Enemy>;
    public var pointer:FlxSprite;
    public var victory:Label;
    public var defeat:Label;
    public var heroTurnNotice:Label;
    public var enemyTurnNotice:Label;
    public var notice:Label;
    public var buttonPool:FlxTypedGroup<Button>;
    
    var currentActor:Int = 0;
    var isHeroTurn:Bool = true;
    var speed:Float = 2;
    public function new() {
        super();
        characters = new Array<Character>();
        enemies = new Array<Enemy>();
    }

    function getButton(){
        var button = buttonPool.recycle();
        if(button == null){
            button = new Button();
            buttonPool.add(button);
        }
        return button;
    }

    override function update(elapsed:Float) {
        if(FlxG.mouse.justPressed && notice.visible && notice.y != -1000){notice.visible = false;}
        super.update(elapsed);
    }

    function showNotice(message:String) {
        notice.visible = true;
        notice.text.text = message;
        FlxTween.tween(notice, {y:notice.y},0.5*speed, {ease: FlxEase.circOut});
        notice.y = -1000;
    }

    function abilityNotice(ability:Ability, targets:Array<Actor>, source:Actor, func:(Void -> Void)) {
        notice.visible = true;
        var target:String = targets[0].name;
        if(ability.targetMode == "allEnemies"){target = "All Enemies!";}
        else if(ability.targetMode == "allHeroes"){target = "All Heroes!";}
        else if(ability.targetMode == "self"){target = "Themself!";}
        notice.text.text = source.name + " used\n" + ability.name + "\non " + target;
        FlxTween.tween(notice, {y:notice.y},0.5*speed, {ease: FlxEase.circOut, onComplete: 
            function (tween:FlxTween){
                notice.visible = false;
                func();
            }
        });
        notice.y = -1000;
    }

    public function animateNotice() {
        
    }

    public function startHeroPhase() {
        heroTurnNotice.visible = true;
        isHeroTurn = true;
        FlxTween.tween(heroTurnNotice, {y:heroTurnNotice.y},0.5*speed, {ease: FlxEase.circOut, onComplete: heroPhase});
        heroTurnNotice.y = -1000;
        
    }

    public function startEnemyPhase() {
        isHeroTurn = false;
        enemyTurnNotice.visible = true;
        FlxTween.tween(enemyTurnNotice, {y:enemyTurnNotice.y},0.5*speed, {ease: FlxEase.circOut, onComplete: enemyPhase});
        enemyTurnNotice.y = -1000;
        pointer.visible = false;
    }

    function nextTurn(){
        if(isHeroTurn){
            if(currentActor == characters.length){
                currentActor = 0;
                startEnemyPhase();
            }
            else{
                heroTurn();
                //currentActor++;
            }
        }
        else{
            if(currentActor == enemies.length){
                currentActor = 0;
                startHeroPhase();
            }
            else{
                enemyTurn();
                //currentActor++;
            }
        }
    }

    function heroPhase(tween:FlxTween) {
        heroTurnNotice.visible = false;
        pointer.visible = true;
        heroTurn();
    }

    function enemyPhase(tween:FlxTween) {
        enemyTurnNotice.visible = false;
        enemyTurn();
    }

    function heroTurn() {
        var character = characters[currentActor];
        pointer.x = character.x - pointer.width;
        pointer.y = character.y;
        character.stats["quiddity"]++;
        characters[currentActor].setMenu("main");
    }

    function enemyTurn() {
        enemies[currentActor].act();
    }

    function selectAlly() {
        return characters[0];
    }

    function selectEnemy() {
        return enemies[0];
    }

    public function abilityCallback(ability:Ability, character:Actor){
        var message:String = null;
        var targets = new Array<Actor>();
        if(ability.targetMode == "allEnemies"){
            for(enemy in enemies){targets.push(cast enemy);}
        }
        else if(ability.targetMode == "singleEnemy"){
            var target = selectEnemy();
            if(target == null){return;}
            targets.push(cast target);
        }
        else if(ability.targetMode == "allHeroes"){
            for(char in characters){targets.push(cast char);}
        }
        else if(ability.targetMode == "singleHero"){
            var target = selectAlly();
            if(target == null){return;}
            targets.push(cast target);
        }
        else if(ability.targetMode == "randomHero"){
            var target = characters[Actor.randint(0, characters.length-1)];
            targets.push(target);
        }
        else if(ability.targetMode == "self"){
            targets.push(character);
        }
        else{
            trace("target mode "+ability.targetMode+" is not valid");
            return;
        }
        message = ability.use(targets, character);
        if(message != null){
            trace(message);
            showNotice(message);
            return;
        }
        if(ability.soundEffect != ""){
            var sound = Assets.getSound(ability.soundEffect);
            if(ability.soundEffect == "assets/sounds/Attack-Magic.wav"){
                FlxG.sound.play(sound, 0.1);
            }
            else{
                FlxG.sound.play(sound);
            }
            //var sound = new FlxSoundAsset();
            //FlxG.sound.play(sound);
        }
        abilityNotice(ability, targets, character, nextTurn);
        currentActor++;
        /*currentPlayer++;
        if(currentPlayer == characters.length){currentPlayer = 0; startEnemyPhase();}
        heroTurn();*/
	}
}