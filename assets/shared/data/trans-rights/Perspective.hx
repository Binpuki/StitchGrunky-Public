import backend.ClientPrefs;
import flixel.FlxSprite;
import flixel.addons.display.FlxRuntimeShader;
import openfl.utils.Assets;
import objects.BGSprite;
import openfl.filters.ShaderFilter;

function onCreatePost()
{
    // stupid fix sorry - ur local vivi
    if (ClientPrefs.data.shaders)
    {
        var floor:FlxSprite = game.modchartSprites["floor"];

        floor.shader = new FlxRuntimeShader(Assets.getText(Paths.shaderFragment("perspective")), null);
        floor.shader.setFloatArray("u_top", [0, 1]);
        floor.shader.setFloat("u_depth", 0.65);
    }
}