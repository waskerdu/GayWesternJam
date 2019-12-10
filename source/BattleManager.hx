package;

import openfl.Assets;
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
    public var characterMenu:CharacterMenu;
    public var nextSound:String = "none";

    var currentActor:Int = 0;
    var isHeroTurn:Bool = true;
    var speed:Float = 4;
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
        notice.y = 100;
        notice.setText(message);
        FlxTween.tween(notice, {y:notice.y},0.5*speed, {ease: FlxEase.circOut});
        notice.y = -1000;
    }

    function abilityNotice(ability:Ability, targets:Array<Actor>, source:Actor) {
        notice.visible = true;
        notice.y = 100;
        var target:String = targets[0].name;
        if(ability.targetMode == "allEnemies"){target = "All Enemies!";}
        else if(ability.targetMode == "allHeroes"){target = "All Heroes!";}
        else if(ability.targetMode == "self"){target = "Themself!";}
        notice.setText(source.name + " used " + ability.name + " on " + target);
        FlxTween.tween(notice, {y:notice.y},0.5*speed, {ease: FlxEase.circOut, onComplete: 
            function (tween:FlxTween){
                notice.visible = false;
            }
        });
        notice.y = -1000;
    }

    public function animateNotice() {
        
    }

    public function startHeroPhase() {
        heroTurnNotice.visible = true;
        isHeroTurn = true;
        heroTurnNotice.y = 100;
        currentActor = 0;
        FlxTween.tween(heroTurnNotice, {y:heroTurnNotice.y},0.5*speed, {ease: FlxEase.circOut, onComplete: heroPhase});
        heroTurnNotice.y = -1000;
    }

    public function startEnemyPhase() {
        isHeroTurn = false;
        currentActor = 0;
        enemyTurnNotice.visible = true;
        enemyTurnNotice.y = 100;
        FlxTween.tween(enemyTurnNotice, {y:enemyTurnNotice.y},0.5*speed, {ease: FlxEase.circOut, onComplete: enemyPhase});
        enemyTurnNotice.y = -1000;
        pointer.visible = false;
    }

    function nextTurn(){
        for(i in 0...characters.length){
            if(characters[i].stats["realness"] <= 0){
                characters[i].kill();
                characters[i] = null;
            }
        }
        characters = characters.filter(
            function (char){
                return char != null;
            }
        );
        if(characters.length == 0){FlxG.switchState(new LoseScene());}
        for(i in 0...enemies.length){
            if(enemies[i].stats["realness"] <= 0){
                enemies[i].kill();
                enemies[i] = null;
            }
        }
        enemies = enemies.filter(
            function (char){
                return char != null;
            }
        );
        if(enemies.length == 0){FlxG.switchState(new WinScene());}
        if(isHeroTurn){
            if(currentActor == characters.length){
                startEnemyPhase();
            }
            else{
                heroTurn();
            }
        }
        else{
            if(currentActor == enemies.length){
                startHeroPhase();
            }
            else{
                enemyTurn();
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
        message = ability.use(targets, character, 0.5*speed, nextTurn);
        if(message != null){
            showNotice(message);
            var sound = Assets.getSound("assets/sounds/Menu-Deny.wav");
            FlxG.sound.play(sound);
            return;
        }
        characterMenu.clearContents();
        abilityNotice(ability, targets, character);
        currentActor++;
	}
}