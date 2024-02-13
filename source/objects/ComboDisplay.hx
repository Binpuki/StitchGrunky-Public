package objects;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class ComboDisplay extends FlxSpriteGroup
{
    public var uiPrefix:String = "default/";
    public var uiSuffix:String = "";

    public var currentJudge:FlxSprite;
    private var currentJudgeTween:FlxTween;

    public var msTimeTxt:FlxText;

    public var currentCombos:Array<FlxSprite> = [];
    private var currentComboTweens:Array<FlxTween> = [];

    private var comboTimer:FlxTimer;

    public override function new(X:Float, Y:Float) 
    {
        super(X, Y);

        alpha = 0.5;

        currentJudge = new FlxSprite();
        currentJudge.alpha = 0;
        add(currentJudge);

        msTimeTxt = new FlxText(-100, ClientPrefs.data.downScroll ? 40 : -90, 200, "", 24);
        msTimeTxt.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        msTimeTxt.centerOrigin();
        add(msTimeTxt);
    }

    public function updateCombo(judgePath:String, combo:Int, hitTiming:Float)
    {
        for (combo in currentCombos)
        {
            combo.alpha = 0;
            combo.velocity.set();
            combo.acceleration.set();
        }

        if (comboTimer != null)
            comboTimer.cancel();

        if (currentJudgeTween != null)
            currentJudgeTween.cancel();

        currentJudge.loadGraphic(Paths.image("ui/" + uiPrefix + "judge/" + judgePath + uiSuffix));
        currentJudge.acceleration.set();
        currentJudge.velocity.set();
        currentJudge.scale.set(0.7 * (2 / 3), 0.7 * (2 / 3));
        currentJudge.updateHitbox();
        currentJudge.setPosition(x - (currentJudge.width / 2), y - (currentJudge.height * (ClientPrefs.data.downScroll ? 1 : 0)));
        currentJudge.scale.set(1.25 * 0.7 * (2 / 3), 1.25 * 0.7 * (2 / 3));
        currentJudge.alpha = alpha;
        currentJudgeTween = FlxTween.tween(currentJudge.scale, { x: 0.7 * (2 / 3), y: 0.7 * (2 / 3) }, 0.1);

        for (twn in currentComboTweens)
            if (twn != null)
                twn.cancel();
        
        var comboDigits:Array<String> = Std.string(combo).split('');
        if (comboDigits.length <= currentCombos.length)
        {
            for (i in 0...comboDigits.length)
            {
                var combo:FlxSprite = currentCombos[i];
                combo.loadGraphic(Paths.image("ui/" + uiPrefix + 'combo/num' + comboDigits[i] + uiSuffix));
                combo.alpha = 0;
                combo.scale.set(1 / 3, 1 / 3);
                combo.centerOrigin();
            }
        }
        else if (comboDigits.length > currentCombos.length)
        {
            for (i in currentCombos.length...comboDigits.length)
            {
                currentCombos[i] = new FlxSprite().loadGraphic(Paths.image("ui/" + uiPrefix + 'combo/num' + comboDigits[i] + uiSuffix));
                currentCombos[i].alpha = alpha;
                currentCombos[i].scale.set(1 / 3, 1 / 3);
                currentCombos[i].updateHitbox();
                currentCombos[i].centerOrigin();
                add(currentCombos[i]);
            }
        }

        // Position em now
        for (i in 0...comboDigits.length)
        {
            var combo:FlxSprite = currentCombos[i];
            var generalSize:Float = ((50 * (2 / 3)) * comboDigits.length);
            combo.setPosition(x - (generalSize / 2) + ((50 * (2 / 3)) * i), y + (!ClientPrefs.data.downScroll ? -50 : 0));
            combo.alpha = alpha;
            combo.scale.set(1.2 * (1 / 3), 1.2 * (1 / 3));
            currentComboTweens[i] = FlxTween.tween(combo.scale, { x: 1 / 3, y: 1 / 3 }, 0.2);
        }

        msTimeTxt.text = '${FlxMath.roundDecimal(hitTiming, 2)} ms';
        msTimeTxt.scale.set(1.25, 1.25);
        msTimeTxt.alpha = 1;
        currentComboTweens.push(FlxTween.tween(msTimeTxt.scale, { x: 1.0, y: 1.0 }, 0.2));
        
        comboTimer = new FlxTimer().start(1, function(tmr:FlxTimer){
            currentJudge.acceleration.y = 550 * (2 / 3) * Conductor.playbackRate * Conductor.playbackRate;
            currentJudge.velocity.y -= FlxG.random.int(140, 175) * (2 / 3) * Conductor.playbackRate;
            currentJudge.velocity.x -= FlxG.random.int(0, 10) * (2 / 3) * Conductor.playbackRate;

            for (combo in currentCombos)
            {
                combo.acceleration.y = FlxG.random.int(200, 300) * (2 / 3) * Conductor.playbackRate * Conductor.playbackRate;
		        combo.velocity.y -= FlxG.random.int(140, 160) * (2 / 3) * Conductor.playbackRate;
                combo.velocity.x += FlxG.random.int(1, 10) * (2 / 3) * Conductor.playbackRate;

                currentComboTweens.push(FlxTween.tween(combo, {alpha: 0}, 0.2, {
                    startDelay: Conductor.crochet * 0.002 / Conductor.playbackRate
                }));
            }

            currentComboTweens.push(FlxTween.tween(currentJudge, {alpha: 0}, 0.2 / Conductor.playbackRate, {
                startDelay: Conductor.crochet * 0.002 / Conductor.playbackRate
            }));

            currentComboTweens.push(FlxTween.tween(msTimeTxt, {alpha: 0}, 0.2 / Conductor.playbackRate, {
                startDelay: Conductor.crochet * 0.002 / Conductor.playbackRate
            }));
        });
    }
}