function onEvent(name)
    if name == 'Lights out' then
        cameraFlash('camGame', 'FFFFFF', 0.35);

setProperty('healthBar.visible', false)
setProperty('healthBarBG.visible', false)
setProperty('iconP1.visible', false)
setProperty('iconP2.visible', false)
setProperty('timeBar.visible',false)
setProperty('timeBarBG.visible',false)
setProperty('timeTxt.visible',false)

        setSpriteShader('iconP1', 'reverseBW');
        setShaderFloat('iconP1', 'lowerBound', 0.01);
        setShaderFloat('iconP1', 'upperBound', 0.12);
        setShaderBool('iconP1', 'invert', true);

        setSpriteShader('iconP2', 'reverseBW');
        setShaderFloat('iconP2', 'lowerBound', 0.01);
        setShaderFloat('iconP2', 'upperBound', 0.12);
        setShaderBool('iconP2', 'invert', true);
        if dadName == 'impostor3' then
            triggerEvent('Change Character', 'dad', 'whitegreen');
        else
            setSpriteShader('dad', 'reverseBW');
            setShaderFloat('dad', 'lowerBound', 0.01);
            setShaderFloat('dad', 'upperBound', 0.12);
            setShaderBool('dad', 'invert', true);
        end
            setSpriteShader('boyfriend', 'reverseBW');
            setShaderFloat('boyfriend', 'lowerBound', 0.01);
            setShaderFloat('boyfriend', 'upperBound', 0.12);
            setShaderBool('boyfriend', 'invert', true);
        end
        setProperty('loBlack.alpha', 1);
        setProperty('gf.visible', false);
        setHealthBarColors('000000', 'FFFFFF');
    end
