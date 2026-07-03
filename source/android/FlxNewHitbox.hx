package android;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import openfl.display.BitmapData;
import openfl.display.Shape;
import android.flixel.FlxButton;

/**
 * A zone with 4 hint's (A hitbox).
 * It's really easy to customize the layout.
 *
 * @author Mihai Alexandru (M.A. Jigsaw)
 */
class FlxNewHitbox extends FlxSpriteGroup
{
	public static inline var DPAD_UP:String = 'DPAD_UP';
	public static inline var DPAD_DOWN:String = 'DPAD_DOWN';
	public static inline var DPAD_LEFT:String = 'DPAD_LEFT';
	public static inline var DPAD_RIGHT:String = 'DPAD_RIGHT';

	public var buttonLeft:FlxButton = new FlxButton(0, 0);
	public var buttonDown:FlxButton = new FlxButton(0, 0);
	public var buttonUp:FlxButton = new FlxButton(0, 0);
	public var buttonRight:FlxButton = new FlxButton(0, 0);


	/**
	 * Create the zone.
	 */
	public function new():Void
	{
		super();

		add(buttonLeft = createHint(0, 0, Std.int(FlxG.width / 4), FlxG.height, 0xFF00FF));
		add(buttonDown = createHint(FlxG.width / 4, 0, Std.int(FlxG.width / 4), FlxG.height, 0x00FFFF));
		add(buttonUp = createHint(FlxG.width / 2, 0, Std.int(FlxG.width / 4), FlxG.height, 0x00FF00));
		add(buttonRight = createHint((FlxG.width / 2) + (FlxG.width / 4), 0, Std.int(FlxG.width / 4), FlxG.height, 0xFF0000));

		scrollFactor.set();
	}

	/**
	 * Clean up memory.
	 */
	override function destroy():Void
	{
		super.destroy();

		buttonLeft = null;
		buttonDown = null;
		buttonUp = null;
		buttonRight = null;
	}

	private function createHintGraphic(Width:Int, Height:Int, Color:Int = 0xFFFFFF):BitmapData
	{
		var shape:Shape = new Shape();
		shape.graphics.beginFill(Color);
		shape.graphics.lineStyle(10, Color, 1);
		shape.graphics.drawRect(0, 0, Width, Height);
		shape.graphics.endFill();

		var bitmap:BitmapData = new BitmapData(Width, Height, true, 0);
		bitmap.draw(shape);
		return bitmap;
	}

	private function createHint(X:Float, Y:Float, Width:Int, Height:Int, Color:Int = 0xFFFFFF):FlxButton
	{
		var hint:FlxButton = new FlxButton(X, Y);
		hint.loadGraphic(createHintGraphic(Width, Height, Color));
		hint.solid = false;
		hint.immovable = true;
		hint.scrollFactor.set();
		hint.alpha = 0.00001;
		hint.onDown.callback = hint.onOver.callback = function()
		{
			if (hint.alpha != ClientPrefs.hitboxalpha)
				hint.alpha = ClientPrefs.hitboxalpha;
		}
		hint.onUp.callback = hint.onOut.callback = function()
		{
			if (hint.alpha != 0.00001)
				hint.alpha = 0.00001;
		}
	#if FLX_DEBUG
		hint.ignoreDrawDebug = true;
		#end
	return hint;
}

	inline public function pressed(key:String):Bool
	{
		return switch (key)
		{
			case DPAD_LEFT: buttonLeft.pressed;
			case DPAD_RIGHT: buttonRight.pressed;
			case DPAD_UP: buttonUp.pressed;
			case DPAD_DOWN: buttonDown.pressed;
			case _: false;
		}
	}

	inline public function justPressed(key:String):Bool
	{
		return switch (key)
		{
			case DPAD_LEFT: buttonLeft.justPressed;
			case DPAD_RIGHT: buttonRight.justPressed;
			case DPAD_UP: buttonUp.justPressed;
			case DPAD_DOWN: buttonDown.justPressed;
			case _: false;
		}
	}

	inline public function justReleased(key:String):Bool
	{
		return switch (key)
		{
			case DPAD_LEFT: buttonLeft.justReleased;
			case DPAD_RIGHT: buttonRight.justReleased;
			case DPAD_UP: buttonUp.justReleased;
			case DPAD_DOWN: buttonDown.justReleased;
			case _: false;
		}
	}

}
