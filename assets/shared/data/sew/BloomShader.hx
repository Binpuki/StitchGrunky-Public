import backend.ClientPrefs;
import openfl.display.BlendMode;
import flixel.FlxSprite;
import flixel.addons.display.FlxRuntimeShader;
import openfl.utils.Assets;
import objects.BGSprite;

/*
    if shadersEnabled == true then
        initLuaShader("Bloom");
        makeLuaSprite("Bloom") makeGraphic("Bloom", screenWidth, screenHeight);
        setSpriteShader("Bloom", "Bloom");
    
        setShaderFloatArray('Bloom', 'u_samples', {3.5, 3.5}); -- (8.0, 8.0) means it calculates 64 samples per pixel, per frame... Obviously if your FPS went down youre gona decrease this value, the first is how many copies will be displayed acording to the u_size value, the second is how many copies will be displayed among the first section of copies.
        setShaderFloatArray('Bloom', 'u_size', {25, 25}); -- Size of bloom for each axis in pixels(Its like X and Y), the higher the val the more u_samples you will need to make the effect smooth. Has no impact on performance, only u_samples does.
        setShaderFloatArray('Bloom', 'u_tint', {0.85,0.85,0.85}); -- Bloom color multipliyer(RGB)
    
        setShaderFloat('Bloom', 'u_brightness', 1.5); -- Disables calculating samples when 0 for performance
        setShaderFloat('Bloom', 'u_range', 1); -- Softness of the threshold on either side of it. Minimum 0!!
        setShaderFloat('Bloom', 'u_threshold', 0.5); -- Luminance threshold / cutoff for bloom. 0 to 1 range!!
    
        addHaxeLibrary("ShaderFilter", "openfl.filters");
    
        runHaxeCode([[trace(ShaderFilter);
            game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Bloom").shader)]);
        ]]); -- Remove the → // ←  above if you want the shader on the pause screen
    end
*/

function onCreatePost()
{
    if (ClientPrefs.data.shaders)
    {
        var shader:FlxRuntimeShader = new FlxRuntimeShader(Assets.getText(Paths.shaderFragment("Bloom")), null);

        shader.setFloatArray('u_samples', [3.5, 3.5]);
        shader.setFloatArray('u_size', [25, 25]);
        shader.setFloatArray('u_tint', [0.85, 0.85, 0.85]);

        shader.setFloat('u_brightness', 1.5);
        shader.setFloat('u_range', 1);
        shader.setFloat('u_threshold', 0.5);

        game.camGame.setFilters([new ShaderFilter(shader)]);
    }
}