package states;

import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.1.0'; // This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	var menuSparks:FlxTypedGroup<FlxSprite>;

	var optionShit:Array<String> = ['STORY', 'FREEPLAY', 'OPTIONS'];
	var sparkleShit:Array<String> = ['story', 'frply', 'options'];

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	var mO = 600;
	var mOY = 355;
	override function create()
	{
		Paths.clearStoredMemory();
		Paths.clearUnusedMemory();
		#if MODS_ALLOWED
		Mods.pushGlobalMods();
		#end
		Mods.loadTopMod();

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg:FlxSprite = new FlxSprite(-950 + mO, -740 + mOY).loadGraphic(Paths.image('MENUS/STORY/BG'));
		bg.frames = Paths.getSparrowAtlas('MENUS/STORY/BG');
		bg.animation.addByPrefix('idle', 'BG', 24);
		bg.animation.play('idle');
		bg.updateHitbox();
		// bg.screenCenter();
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.antialiasing = ClientPrefs.data.antialiasing;
		magenta.scrollFactor.set(0, yScroll);
		magenta.setGraphicSize(Std.int(magenta.width * 1.175));
		magenta.updateHitbox();
		// magenta.screenCenter();
		magenta.visible = false;
		magenta.color = 0xFFfd719b;
		// add(magenta);

		var bb = new FlxSprite(-970 + mO, -650 + mOY).loadGraphic(Paths.image('MENUS/STORY/BLACKBARS'));
		bb.scale.x = 0.70;
		bb.scale.y = 0.70;
		add(bb);
		
		menuSparks = new FlxTypedGroup<FlxSprite>();
		add(menuSparks);
		
		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);


		for (i in 0...1)
		{
			var menuSpark = new FlxSprite(-450 + mO, -460 + mOY);
			menuSpark.frames = Paths.getSparrowAtlas('MENUS/STORY/' + "storysprkls");
			menuSpark.animation.addByPrefix('SHINE', 'storysprkls', 24);
			menuSpark.animation.play("SHINE");
			menuSpark.scale.x = 0.70;
			menuSpark.scale.y = 0.70;
			menuSparks.add(menuSpark);
			menuSpark.ID = i;

			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(-400 + mO, -270 + mOY);
			menuItem.scale.x = 0.70;
			menuItem.scale.y = 0.70;
			menuItem.frames = Paths.getSparrowAtlas('MENUS/STORY/' + optionShit[i]);
			menuItem.animation.addByPrefix('selected', "story" + 'SLCTD', 24);
			menuItem.animation.addByPrefix('idle', "story" + " friend", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItems.add(menuItem);

			// menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();
		}

		for (i in 1...2)
			{
				var menuSpark = new FlxSprite(376 + mO , -340 + mOY);
				menuSpark.frames = Paths.getSparrowAtlas('MENUS/STORY/' + "frplysprkls");
				menuSpark.animation.addByPrefix('SHINE', 'freeplayspkls', 24);
				menuSpark.animation.play("SHINE");
				menuSpark.scale.x = 0.70;
				menuSpark.scale.y = 0.70;
				menuSparks.add(menuSpark);
				menuSpark.ID = i;
	
				var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
				var menuItem:FlxSprite = new FlxSprite(80 + mO, -275 + mOY);
			menuItem.scale.x = 0.70;
			menuItem.scale.y = 0.70;
			menuItem.frames = Paths.getSparrowAtlas('MENUS/STORY/' + optionShit[i]);
			menuItem.animation.addByPrefix('selected', 'freeplay' + 'SLCTD', 24);
			menuItem.animation.addByPrefix('idle', 'freeplay' + " friend", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItems.add(menuItem);

			// menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();
			}
			for (i in 2...3)
				{
					var menuSpark = new FlxSprite(380 + mO , 280 + mOY);
					menuSpark.frames = Paths.getSparrowAtlas('MENUS/STORY/' + "optionssprkls");
					menuSpark.animation.addByPrefix('SHINE', 'optionsprkls', 24);
					menuSpark.animation.play("SHINE");
					menuSpark.scale.x = 0.70;
					menuSpark.scale.y = 0.70;
					menuSparks.add(menuSpark);
					menuSpark.ID = i;
		
					var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
					var menuItem:FlxSprite = new FlxSprite(80 + mO , -35 + mOY);
					menuItem.scale.x = 0.70;
					menuItem.scale.y = 0.70;
					menuItem.frames = Paths.getSparrowAtlas('MENUS/STORY/' + optionShit[i]);
					menuItem.animation.addByPrefix('selected', 'options' + 'SLCTD', 24);
					menuItem.animation.addByPrefix('idle', 'options' + " friend", 24);
					menuItem.animation.play('idle');
					menuItem.ID = i;
					menuItems.add(menuItem);

					// menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
					menuItem.updateHitbox();
				}
	

		var psychVer:FlxText = new FlxText(12, FlxG.height - 44, 0, "Council Engine " + psychEngineVersion, 12);
		psychVer.scrollFactor.set();
		psychVer.setFormat("Neon 80s", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(psychVer);
		var fnfVer:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		fnfVer.scrollFactor.set();
		fnfVer.setFormat("Neon 80s", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(fnfVer);
		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		// Unlocks "Freaky on a Friday Night" achievement if it's a Friday and between 18:00 PM and 23:59 PM
		/*
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18)
			Achievements.unlock('friday_night_play');
		*/

		#if MODS_ALLOWED
		Achievements.reloadList();
		#end
		#end

		super.create();

		// FlxG.camera.follow(camFollow, null, 0.15);
	}

	var selectedSomethin:Bool = false;

	// IK THIS IS BADLY CODED BUT I HAVE LIKE 2 HOURS HELP
	var onLeft:Bool = true;
	var onFreeplay:Bool = true;
	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * elapsed;
			if (FreeplayState.vocals != null)
				FreeplayState.vocals.volume += 0.5 * elapsed;
		}

		if (!selectedSomethin)
		{
			if (controls.UI_LEFT_P || controls.UI_RIGHT_P)
				onLeft = !onLeft;

			if ((controls.UI_DOWN_P || controls.UI_UP_P) && !onLeft)
				onFreeplay = !onFreeplay;

			if (onLeft)
				curSelected = 0;
			else
				curSelected = onFreeplay ? 1 : 2;

			if (controls.UI_LEFT_P || controls.UI_RIGHT_P || controls.UI_DOWN_P || controls.UI_UP_P)
				changeItem(0);
			
			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'));
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else
				{
					selectedSomethin = true;

					if (ClientPrefs.data.flashing)
						FlxFlicker.flicker(magenta, 1.1, 0.15, false);

					FlxFlicker.flicker(menuItems.members[curSelected], 1, 0.06, false, false, function(flick:FlxFlicker)
					{
						switch (optionShit[curSelected])
						{
							case 'STORY':
								MusicBeatState.switchState(new StoryMenuState());
							case 'FREEPLAY':
								MusicBeatState.switchState(new FreeplayState());

							#if MODS_ALLOWED
							case 'mods':
								MusicBeatState.switchState(new ModsMenuState());
							#end

							#if ACHIEVEMENTS_ALLOWED
							case 'awards':
								MusicBeatState.switchState(new AchievementsMenuState());
							#end

							case 'credits':
								MusicBeatState.switchState(new CreditsState());
							case 'OPTIONS':
								MusicBeatState.switchState(new OptionsState());
								OptionsState.onPlayState = false;
								if (PlayState.SONG != null)
								{
									PlayState.SONG.arrowSkin = null;
									PlayState.SONG.splashSkin = null;
									PlayState.stageUI = 'normal';
								}
						}
					});

					for (i in 0...menuItems.members.length)
					{
						if (i == curSelected)
							continue;
						FlxTween.tween(menuItems.members[i], {alpha: 0}, 0.4, {
							ease: FlxEase.quadOut,
							onComplete: function(twn:FlxTween)
							{
								menuItems.members[i].kill();
							}
						});
					}
				}
			}
			#if desktop
			if (controls.justPressed('debug_1'))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		super.update(elapsed);
	}

	function changeItem(huh:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'));
		menuItems.members[curSelected].animation.play('idle');
		menuItems.members[curSelected].updateHitbox();
		// menuItems.members[curSelected].screenCenter(X);

		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuSparks.forEach(function(spark:FlxSprite) {
			spark.alpha = 0;
			if (spark.ID == curSelected) {
				spark.alpha = 1;
			}
		});
		menuItems.members[curSelected].animation.play('selected');
		// menuItems.members[curSelected].centerOffsets();
		// menuItems.members[curSelected].screenCenter(X);

		camFollow.setPosition(menuItems.members[curSelected].getGraphicMidpoint().x,
			menuItems.members[curSelected].getGraphicMidpoint().y - (menuItems.length > 4 ? menuItems.length * 8 : 0));
	}
}
