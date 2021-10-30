package;

import flixel.util.FlxColor;
import flixel.addons.transition.TransitionData;
import flixel.addons.transition.TransitionData;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.graphics.FlxGraphic;
import flixel.FlxSprite;
import flixel.input.gamepad.FlxGamepad;
import flixel.addons.transition.FlxTransitionableState;
import flixel.text.FlxText;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.FlxG;

class ThankYou extends MusicBeatState
{
    var thanks:FlxText = new FlxText(0,0,0,"Thank you bob, (wildy) for some of the code c:", 32);

    override function create()
    {
		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

        var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);

        add(thanks);
        thanks.scrollFactor.set();
        thanks.screenCenter();
        super.create();
    }

    override function update(elapsed:Float)
    {
            
         var pressedEnter:Bool = FlxG.keys.justPressed.ENTER;
         #if mobile
        for (touch in FlxG.touches.list)
         {
           if (touch.justPressed)
             {
              pressedEnter = true;
             }
         }
          #end

        var gamepad:FlxGamepad = FlxG.gamepads.lastActive;

		if (gamepad != null)
		{
			if (gamepad.justPressed.START)
				pressedEnter = true;

			#if switch
			if (gamepad.justPressed.B)
				pressedEnter = true;
			#end
		}

        if (pressedEnter)
            {
                trace("oke the people saw da credits.");
                FlxG.switchState(new MainMenuState());
            }
         super.update(elapsed);
    }
}