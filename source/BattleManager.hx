package;

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
    var currentPlayer:Int = 0;
    public function new() {
        super();
        characters = new Array<Character>();
        enemies = new Array<Enemy>();
    }

    override function update(elapsed:Float) {
        if(FlxG.mouse.justPressed && notice.visible && notice.y != -1000){notice.visible = false;}
        super.update(elapsed);
    }

    function showNotice(message:String) {
        notice.visible = true;
        notice.text.text = message;
        FlxTween.tween(notice, {y:notice.y},0.5, {ease: FlxEase.circOut});
        notice.y = -1000;
    }

    public function animateNotice() {
        
    }

    public function startHeroPhase() {
        heroTurnNotice.visible = true;
        FlxTween.tween(heroTurnNotice, {y:heroTurnNotice.y},0.5, {ease: FlxEase.circOut, onComplete: heroPhase});
        heroTurnNotice.y = -1000;
        
    }

    public function startEnemyPhase() {
        enemyTurnNotice.visible = true;
        FlxTween.tween(enemyTurnNotice, {y:enemyTurnNotice.y},0.5, {ease: FlxEase.circOut, onComplete: enemyPhase});
        enemyTurnNotice.y = -1000;
        pointer.visible = false;
    }

    function heroPhase(tween:FlxTween) {
        heroTurnNotice.visible = false;
        pointer.visible = true;
        heroTurn();
    }

    function enemyPhase(tween:FlxTween) {
        enemyTurnNotice.visible = false;
        startHeroPhase();
    }

    function heroTurn() {
        characters[currentPlayer].setMenu("main");
        var character = characters[currentPlayer];
        pointer.x = character.x - pointer.width;
        pointer.y = character.y;
        character.stats["quiddity"]++;
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
        trace(ability.name);
        if(ability.targetMode == "allEnemies"){
            trace("got here");
            for(enemy in enemies){targets.push(cast enemy);}
        }
        else if(ability.targetMode == "singleEnemy"){
            var target = selectEnemy();
            if(target == null){return;}
            targets.push(cast target);
        }
        else if(ability.targetMode == "allAllies"){
            for(char in characters){targets.push(cast char);}
        }
        else if(ability.targetMode == "singleAlly"){
            var target = selectAlly();
            if(target == null){return;}
            targets.push(cast target);
        }
        else if(ability.targetMode == "self"){
            targets.push(character);
        }
        else{
            trace("target mode "+ability.targetMode+" is not valid");
            return;
        }
        message = ability.use(targets, character);
        
        /*if(ability.targetMode == "allEnemies"){
            //message = ability.use(enemies, character);
        }
        else if(ability.targetMode == "allAllies"){
            message = ability.use(characters, character);
        }
        else if(ability.targetMode == "self"){
            message = ability.use(characters, character);
        }
        else if(ability.targetMode == "singleEnemy"){
            var target = selectEnemy();
            if(target == null){return;}
            message = ability.use([selectEnemy], character);
        }
        else if(ability.targetMode == "singleAlly"){
            var target = selectAlly();
            if(target == null){return;}
            message = ability.use([target], character);
        }
        else{
            trace("target mode "+ability.targetMode+" is not valid");
            return;
        }*/
        if(message != null){
            trace(message);
            showNotice(message);
            return;
        }
        currentPlayer++;
        if(currentPlayer == characters.length){currentPlayer = 0; startEnemyPhase();}
        heroTurn();
	}
}