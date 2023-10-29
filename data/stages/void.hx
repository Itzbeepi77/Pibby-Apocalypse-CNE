import openfl.geom.ColorTransform;

var whiteBG = new FlxSprite();
var scanLines = new CustomShader("scanlines");
public var lowMem = Options.lowMemoryMode;

function create()
{
    tweenLoopAngle(boyfriend, -1, 1, 2.5, 2.5);
    tweenLoopAngle(gf, -1, 1, 2.5, 2.5);
    tweenLoopAngle(dad, -1, 1, 2.5, 2.5);

    if (!lowMem){
    tweenLoopAngle(house, 4, -4, 6, 6);
    tweenLoopAngle(platform, -0.5, 0.5, 2.5, 2.5);
    tweenLoopAngle(rock, -2, 1.2, 2.5, 2.5);
    tweenLoopAngle(rock2, 360, 0, 30, 30);
    tweenLoopAngle(things, 2, -2, 5, 5);

    {
        FlxTween.tween(rock3, {angle: 360}, 30, {
        ease: FlxEase.sineInOut
        });
    }

    stupidFix = FlxTween.tween(things, {y: things.y}, 1);
    }
    
    whiteBG.makeGraphic(6000, 6000, FlxColor.WHITE);
	whiteBG.x = "-600";
	whiteBG.y = "-490";
    whiteBG.alpha = 0.0001;
	insert(1, whiteBG);
    
	if (!FlxG.save.data.shaderShit){
        bg.shader = scanLines;
    }
}
function badApple(turn:String){
    if (turn == "on"){
        whiteBG.alpha = 1;
        boyfriend.color = 0x0000000;
        dad.color = 0x0000000;
        iconP1.color = 0x0000000;
        iconP2.color = 0x0000000;
        gf.color = 0x0000000;

        bg.alpha = 0.0001;
        glitch.alpha = 0.0001;
        house.alpha = 0.0001;
        platform.alpha = 0.0001;

        if (!lowMem){
        rock.alpha = 0.0001;
        rock2.alpha = 0.0001;
        rock3.alpha = 0.0001;
        things.alpha = 0.0001;
        }
    }
    if (turn == "off"){
        whiteBG.alpha = 0.0001;
        boyfriend.color = 0xFFFFFFF;
        dad.color = 0xFFFFFFF;
        iconP1.color = 0xFFFFFFF;
        iconP2.color = 0xFFFFFFF;
        gf.color = 0xFFFFFFF;

        bg.alpha = 1;
        glitch.alpha = 1;
        house.alpha = 1;
        platform.alpha = 1;
        
        if (!lowMem){
        rock.alpha = 1;
        rock2.alpha = 1;
        rock3.alpha = 1;
        things.alpha = 1;
        }
    }
}
function tweenLoopAngle(varx, distance1, distance2, duration1, duration2) {
    FlxTween.tween(varx, {angle: distance1}, duration1, {
        ease: FlxEase.sineInOut,
        onComplete: 
        function (twn:FlxTween)
            {
                FlxTween.tween(varx, {angle: distance2}, duration2, {
                    ease: FlxEase.sineInOut,
                    onComplete: 
                    function (twn:FlxTween)
                        {
                            tweenLoopAngle(varx, distance1, distance2, duration1, duration2);
                        }
                });
            }
    });
}
function postUpdate(){/*
    if (curBeat % 4 == 0 && camZooming && !FlxG.save.data.shaderShit){
        tweenchrom = FlxTween.num(5, 2.5, 0.5, {ease: FlxEase.sineInOut}, function(val:Float) {
            scanLines.iTime = val;
        });
    }*/
    scanLines.iTime = 5;
}
function stepHit(){
    if (curSong == 'retcon'){
        switch(curStep){
            case 256, 512, 896, 1185:
                glitch.alpha = 1;
                camera.flash();

            case 384, 1152:
                FlxTween.tween(glitch, {alpha: 0.0001}, 0.2);

            case 640:
                glitch.alpha = 0.0001;
                camera.flash();
        }
    if (curStep == 1424){
        camHUD.flash();
        badApple("on");
    }}
}