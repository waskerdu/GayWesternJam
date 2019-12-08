package;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxSave;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class BattleScene extends FlxState
{
	var gameData:GameData;
	var gameSave:FlxSave;
	var speedTrack:FlxSprite;
	var statScreen:StatScreen;
	var characterMenu:CharacterMenu;
	var battleManager:BattleManager;
	
	override public function create():Void
	{
		super.create();
		gameData = new GameData();
		gameSave = new FlxSave();
		gameSave.bind("global");
		statScreen = new StatScreen();
		statScreen.sprite.makeGraphic(320,160, FlxColor.GRAY);
		statScreen.y = 600-160;
		add(statScreen);
		characterMenu = new CharacterMenu();
		characterMenu.sprite.makeGraphic(320,160, FlxColor.GRAY);
		characterMenu.x = 800-320;
		characterMenu.y = 600-160;
		add(characterMenu);
		battleManager = new BattleManager();
		add(battleManager);
		battleManager.victory = addLabel("Victory!",FlxColor.GREEN);
		battleManager.defeat = addLabel("Defeat!",FlxColor.RED);
		battleManager.heroTurnNotice = addLabel("Hero Turn",FlxColor.YELLOW);
		battleManager.enemyTurnNotice = addLabel("Enemy Turn",FlxColor.YELLOW);
		battleManager.notice = addLabel("",FlxColor.YELLOW);
		battleManager.notice.text.size = 40;
		battleManager.pointer = new FlxSprite();
		battleManager.pointer.makeGraphic(10, 10, FlxColor.YELLOW);
		battleManager.pointer.visible = false;
		battleManager.buttonPool = new FlxTypedGroup<Button>();
		add(battleManager.pointer);
		add(battleManager.buttonPool);

		for (i in 0...1){
			var char = new Character(gameData);
			char.x = 800-60;
			char.y = 100 + i * 60;
			char.randomize();
			char.statCallback = statScreen.setContents;
			char.menuCallback = characterMenu.setContents;
			char.abilityCallback = battleManager.abilityCallback;
			add(char);
			battleManager.characters.push(char);
		}
		for (i in 0...1){
			var enemy = new Enemy(gameData);
			enemy.loadData(gameData.enemies["pig"]);
			enemy.x = 0;
			enemy.y = 100 + i * 60;
			enemy.statCallback = statScreen.setContents;
			enemy.abilityCallback = battleManager.abilityCallback;
			add(enemy);
			battleManager.enemies.push(enemy);
		}
		//battleManager.characters[0].setMenu("main");
		battleManager.startHeroPhase();
	}

	function addLabel(text:String, color:FlxColor){
		var label = new Label();
		label.text.text = text;
		label.text.size = 72;
		label.text.color = FlxColor.BLACK;
		label.sprite.makeGraphic(500, 300, color);
		label.x = 150;
		label.y = 100;
		label.visible = false;
		add(label);
		return label;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
