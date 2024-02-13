package debug;

import openfl.display.Sprite;
import flixel.FlxG;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.system.System;

/**
	The FPS class provides an easy-to-use monitor to display
	the current frame rate of an OpenFL project
**/
class FPSCounter extends Sprite
{
	/**
		The current frame rate, expressed using frames-per-second
	**/
	public var currentFPS(default, null):Int;

	/**
		The current memory usage (WARNING: this is NOT your total program memory usage, rather it shows the garbage collector memory)
	**/
	public var memoryMegas(get, never):Float;

	@:noCompletion private var times:Array<Float>;

	public var fpsText:TextField;
	public var fpsLabel:TextField;
	public var memText:TextField;
	public var memLabel:TextField;

	public function new()
	{
		super();

		fpsText = new TextField();
		fpsLabel = new TextField();
		memText = new TextField();
		memLabel = new TextField();

		var textGroup:Array<TextField> = [fpsText, fpsLabel, memText, memLabel];
		for (i in 0...textGroup.length)
		{
			var text:TextField = textGroup[i];
			text.autoSize = LEFT;
			text.multiline = text.wordWrap = text.selectable = false;
			text.defaultTextFormat = new TextFormat("VCR OSD Mono", (i == 0 || i == 2) ? 18 : 12, 0xFFFFFFFF, true);
			addChild(text);
		}

		fpsLabel.text = "FPS";
		fpsLabel.y = memLabel.y = 4;
	}

	var deltaTimeout:Float = 0.0;

	// Event Handlers
	private override function __enterFrame(deltaTime:Float):Void
	{
		currentFPS = currentFPS < FlxG.updateFramerate ? Math.floor(1 / (deltaTime / 1000)) : FlxG.updateFramerate;		
		updateText();
		deltaTimeout += deltaTime;
	}

	public dynamic function updateText():Void { // so people can override it in hscript
		var memoryText:String = flixel.util.FlxStringUtil.formatBytes(memoryMegas);
		fpsText.text = '${currentFPS}';
		memText.text = '${memoryText.substring(0, memoryText.indexOf(' '))}';
		memLabel.text = '${memoryText.substring(memoryText.indexOf(' ') + 1)}';
		
		fpsLabel.x = fpsText.x + fpsText.width;
		memText.x = fpsLabel.x + fpsLabel.width;
		memLabel.x = memText.x + memText.width;

		for (textField in [fpsText, fpsLabel, memText, memLabel])
		{
			textField.textColor = 0xFFFFFFFF;
			if (currentFPS < FlxG.drawFramerate * 0.5)
				textField.textColor = 0xFFFF0000;
		}
	}

	inline function get_memoryMegas():Float
		return cast(System.totalMemory, UInt);
}
