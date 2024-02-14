import states.PlayState;
import flixel.FlxG;
import flixel.math.FlxMath;

function onUpdate(elapsed:Float)
{
	PlayState.instance.camZooming = false; // FUCK built-in stuff, imma start DOING IT MANUALLY
}

function onUpdatePost(elapsed:Float)
{
	FlxG.camera.zoom = PlayState.instance.defaultCamZoom;
	PlayState.instance.camHUD.zoom = 1.0;
}