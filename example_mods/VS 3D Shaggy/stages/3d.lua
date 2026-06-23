local shadname = "glitchEffect";

function onCreate()
    initLuaShader(shadname)

	makeLuaSprite('sprite1', 'background', -762, -531);
	scaleObject('sprite1', 10,10,true)
    setProperty('sprite1.antialiasing', false)
	setSpriteShader('sprite1', shadname)

	makeLuaSprite('sprite3', 'pyramids', -409, -254);
	scaleObject('sprite3', 4,4,true)
    setProperty('sprite3.antialiasing', false)
	setSpriteShader('sprite3', shadname)


	makeLuaSprite('bg', 'hills', -1310, 561);
    setProperty('bg.antialiasing', false)
	scaleObject('bg', 2.5,2.5,true)

        addLuaSprite('sprite1');
        addLuaSprite('sprite3');
	addLuaSprite('bg');
	setShaderFloat('sprite1', 'uWaveAmplitude', 0.1)
	setShaderFloat('sprite1', 'uFrequency', 5)
	setShaderFloat('sprite1', 'uSpeed', 2)
	setShaderFloat('sprite3', 'uWaveAmplitude', 0.1)
	setShaderFloat('sprite3', 'uFrequency', 5)
	setShaderFloat('sprite3', 'uSpeed', 2)
end
function onUpdatePost(elapsed)
	setShaderFloat('sprite1', 'uTime', os.clock())
	setShaderFloat('sprite3', 'uTime', os.clock())
end