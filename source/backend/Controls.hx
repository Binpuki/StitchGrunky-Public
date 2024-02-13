package backend;

import lime.ui.GamepadButton;
import lime.ui.KeyModifier;
import lime.ui.KeyCode;
import flixel.input.gamepad.FlxGamepadButton;
import flixel.input.gamepad.FlxGamepadInputID;
import flixel.input.gamepad.mappings.FlxGamepadMapping;
import flixel.input.keyboard.FlxKey;

class Controls
{
	//Keeping same use cases on stuff for it to be easier to understand/use
	//I'd have removed it but this makes it a lot less annoying to use in my opinion

	//You do NOT have to create these variables/getters for adding new keys,
	//but you will instead have to use:
	//   controls.justPressed("ui_up")   instead of   controls.UI_UP

	//Dumb but easily usable code, or Smart but complicated? Your choice.
	//Also idk how to use macros they're weird as fuck lol

	// Pressed buttons (directions)
	public var UI_UP_P(get, never):Bool;
	public var UI_DOWN_P(get, never):Bool;
	public var UI_LEFT_P(get, never):Bool;
	public var UI_RIGHT_P(get, never):Bool;
	public var NOTE_UP_P(get, never):Bool;
	public var NOTE_DOWN_P(get, never):Bool;
	public var NOTE_LEFT_P(get, never):Bool;
	public var NOTE_RIGHT_P(get, never):Bool;
	private function get_UI_UP_P() return justPressed('ui_up');
	private function get_UI_DOWN_P() return justPressed('ui_down');
	private function get_UI_LEFT_P() return justPressed('ui_left');
	private function get_UI_RIGHT_P() return justPressed('ui_right');
	private function get_NOTE_UP_P() return justPressed('note_up');
	private function get_NOTE_DOWN_P() return justPressed('note_down');
	private function get_NOTE_LEFT_P() return justPressed('note_left');
	private function get_NOTE_RIGHT_P() return justPressed('note_right');

	// Held buttons (directions)
	public var UI_UP(get, never):Bool;
	public var UI_DOWN(get, never):Bool;
	public var UI_LEFT(get, never):Bool;
	public var UI_RIGHT(get, never):Bool;
	public var NOTE_UP(get, never):Bool;
	public var NOTE_DOWN(get, never):Bool;
	public var NOTE_LEFT(get, never):Bool;
	public var NOTE_RIGHT(get, never):Bool;
	private function get_UI_UP() return pressed('ui_up');
	private function get_UI_DOWN() return pressed('ui_down');
	private function get_UI_LEFT() return pressed('ui_left');
	private function get_UI_RIGHT() return pressed('ui_right');
	private function get_NOTE_UP() return pressed('note_up');
	private function get_NOTE_DOWN() return pressed('note_down');
	private function get_NOTE_LEFT() return pressed('note_left');
	private function get_NOTE_RIGHT() return pressed('note_right');

	// Released buttons (directions)
	public var UI_UP_R(get, never):Bool;
	public var UI_DOWN_R(get, never):Bool;
	public var UI_LEFT_R(get, never):Bool;
	public var UI_RIGHT_R(get, never):Bool;
	public var NOTE_UP_R(get, never):Bool;
	public var NOTE_DOWN_R(get, never):Bool;
	public var NOTE_LEFT_R(get, never):Bool;
	public var NOTE_RIGHT_R(get, never):Bool;
	private function get_UI_UP_R() return justReleased('ui_up');
	private function get_UI_DOWN_R() return justReleased('ui_down');
	private function get_UI_LEFT_R() return justReleased('ui_left');
	private function get_UI_RIGHT_R() return justReleased('ui_right');
	private function get_NOTE_UP_R() return justReleased('note_up');
	private function get_NOTE_DOWN_R() return justReleased('note_down');
	private function get_NOTE_LEFT_R() return justReleased('note_left');
	private function get_NOTE_RIGHT_R() return justReleased('note_right');


	// Pressed buttons (others)
	public var ACCEPT(get, never):Bool;
	public var BACK(get, never):Bool;
	public var PAUSE(get, never):Bool;
	public var RESET(get, never):Bool;
	private function get_ACCEPT() return justPressed('accept');
	private function get_BACK() return justPressed('back');
	private function get_PAUSE() return justPressed('pause');
	private function get_RESET() return justPressed('reset');

	//Gamepad & Keyboard stuff
	public var keyboardBinds:Map<String, Array<FlxKey>>;
	public var gamepadBinds:Map<String, Array<FlxGamepadInputID>>;
	public function justPressed(key:String)
	{
		var result:Bool = (FlxG.keys.anyJustPressed(keyboardBinds[key]) == true);
		if(result) controllerMode = false;

		return result || _myGamepadJustPressed(gamepadBinds[key]) == true;
	}

	public function pressed(key:String)
	{
		var result:Bool = (FlxG.keys.anyPressed(keyboardBinds[key]) == true);
		if(result) controllerMode = false;

		return result || _myGamepadPressed(gamepadBinds[key]) == true;
	}

	public function justReleased(key:String)
	{
		var result:Bool = (FlxG.keys.anyJustReleased(keyboardBinds[key]) == true);
		if(result) controllerMode = false;

		return result || _myGamepadJustReleased(gamepadBinds[key]) == true;
	}

	public var controllerMode:Bool = false;
	private function _myGamepadJustPressed(keys:Array<FlxGamepadInputID>):Bool
	{
		if(keys != null)
		{
			for (key in keys)
			{
				if (FlxG.gamepads.anyJustPressed(key) == true)
				{
					controllerMode = true;
					return true;
				}
			}
		}
		return false;
	}
	private function _myGamepadPressed(keys:Array<FlxGamepadInputID>):Bool
	{
		if(keys != null)
		{
			for (key in keys)
			{
				if (FlxG.gamepads.anyPressed(key) == true)
				{
					controllerMode = true;
					return true;
				}
			}
		}
		return false;
	}
	private function _myGamepadJustReleased(keys:Array<FlxGamepadInputID>):Bool
	{
		if(keys != null)
		{
			for (key in keys)
			{
				if (FlxG.gamepads.anyJustReleased(key) == true)
				{
					controllerMode = true;
					return true;
				}
			}
		}
		return false;
	}

	// IGNORE THESE
	public static var instance:Controls;
	public function new()
	{
		keyboardBinds = ClientPrefs.keyBinds;
		gamepadBinds = ClientPrefs.gamepadBinds;
	}
}

class Converter
{
	public static function fromKeyCodeToFlxKey(key:KeyCode, modifier:KeyModifier) // I am SO sorry this is so fucking long - Binpuki
	{
		switch (key)
		{
			case UNKNOWN:
				return FlxKey.NONE;
			case A:
				return FlxKey.A;
			case B:
				return FlxKey.B;
			case C:
				return FlxKey.C;
			case D:
				return FlxKey.D;
			case E:
				return FlxKey.E;
			case F:
				return FlxKey.F;
			case G:
				return FlxKey.G;
			case H:
				return FlxKey.H;
			case I:
				return FlxKey.I;
			case J:
				return FlxKey.J;
			case K:
				return FlxKey.K;
			case L:
				return FlxKey.L;
			case M:
				return FlxKey.M;
			case N:
				return FlxKey.N;
			case O:
				return FlxKey.O;
			case P:
				return FlxKey.P;
			case Q:
				return FlxKey.Q;
			case R:
				return FlxKey.R;
			case S:
				return FlxKey.S;
			case T:
				return FlxKey.T;
			case U:
				return FlxKey.U;
			case V:
				return FlxKey.V;
			case W:
				return FlxKey.W;
			case X:
				return FlxKey.X;
			case Y:
				return FlxKey.Y;
			case Z:
				return FlxKey.Z;
			case NUMBER_0:
				return FlxKey.ZERO;
			case NUMBER_1:
				return FlxKey.ONE;
			case NUMBER_2:
				return FlxKey.TWO;
			case NUMBER_3:
				return FlxKey.THREE;
			case NUMBER_4:
				return FlxKey.FOUR;
			case NUMBER_5:
				return FlxKey.FIVE;
			case NUMBER_6:
				return FlxKey.SIX;
			case NUMBER_7:
				return FlxKey.SEVEN;
			case NUMBER_8:
				return FlxKey.EIGHT;
			case NUMBER_9:
				return FlxKey.NINE;
			case PAGE_UP:
				return FlxKey.PAGEUP;
			case PAGE_DOWN:
				return FlxKey.PAGEDOWN;
			case HOME:
				return FlxKey.HOME;
			case END:
				return FlxKey.END;
			case INSERT:
				return FlxKey.INSERT;
			case ESCAPE:
				return FlxKey.ESCAPE;
			case MINUS:
				return FlxKey.MINUS;
			case PLUS:
				return FlxKey.PLUS;
			case DELETE:
				return FlxKey.DELETE;
			case BACKSPACE:
				return FlxKey.BACKSPACE;
			case LEFT_BRACKET:
				return FlxKey.LBRACKET;
			case RIGHT_BRACKET:
				return FlxKey.RBRACKET;
			case BACKSLASH:
				return FlxKey.BACKSLASH;
			case CAPS_LOCK:
				return FlxKey.CAPSLOCK;
			case SEMICOLON:
				return FlxKey.SEMICOLON;
			case QUOTE:
				return FlxKey.QUOTE;
			case RETURN:
				return FlxKey.ENTER;
			case COMMA:
				return FlxKey.COMMA;
			case PERIOD:
				return FlxKey.PERIOD;
			case SLASH:
				return FlxKey.SLASH;
			case GRAVE:
				return FlxKey.GRAVEACCENT;
			case SPACE:
				return FlxKey.SPACE;
			case UP:
				return FlxKey.UP;
			case DOWN:
				return FlxKey.DOWN;
			case LEFT:
				return FlxKey.LEFT;
			case RIGHT:
				return FlxKey.RIGHT;
			case TAB:
				return FlxKey.TAB;
			case PRINT_SCREEN:
				return FlxKey.PRINTSCREEN;
			case F1:
				return FlxKey.F1;
			case F2:
				return FlxKey.F2;
			case F3:
				return FlxKey.F3;
			case F4:
				return FlxKey.F4;
			case F5:
				return FlxKey.F5;
			case F6:
				return FlxKey.F6;
			case F7:
				return FlxKey.F7;
			case F8:
				return FlxKey.F8;
			case F9:
				return FlxKey.F9;
			case F10:
				return FlxKey.F10;
			case F11:
				return FlxKey.F11;
			case F12:
				return FlxKey.F12;
			case NUMPAD_0:
				return FlxKey.NUMPADZERO;
			case NUMPAD_1:
				return FlxKey.NUMPADONE;
			case NUMPAD_2:
				return FlxKey.NUMPADTWO;
			case NUMPAD_3:
				return FlxKey.NUMPADTHREE;
			case NUMPAD_4:
				return FlxKey.NUMPADFOUR;
			case NUMPAD_5:
				return FlxKey.NUMPADFIVE;
			case NUMPAD_6:
				return FlxKey.NUMPADSIX;
			case NUMPAD_7:
				return FlxKey.NUMPADSEVEN;
			case NUMPAD_8:
				return FlxKey.NUMPADEIGHT;
			case NUMPAD_9:
				return FlxKey.NUMPADNINE;
			case NUMPAD_MINUS:
				return FlxKey.NUMPADMINUS;
			case NUMPAD_PLUS:
				return FlxKey.NUMPADPLUS;
			case NUMPAD_PERIOD:
				return FlxKey.NUMPADPERIOD;
			case NUMPAD_MULTIPLY:
				return FlxKey.NUMPADMULTIPLY;
			default:
				return fromKeyModifierToFlxKey(modifier);
		}

		return FlxKey.NONE;
	}

	static function fromKeyModifierToFlxKey(modif:KeyModifier):FlxKey
	{
		if (modif.shiftKey)
			return FlxKey.SHIFT;
		if (modif.ctrlKey)
			return FlxKey.CONTROL;
		if (modif.altKey)
			return FlxKey.ALT;

		return FlxKey.NONE;
	}

	public static function fromFlxGamepadToGamepadButton(button:FlxGamepadInputID):GamepadButton
	{
		return cast(button, GamepadButton);
	}
}