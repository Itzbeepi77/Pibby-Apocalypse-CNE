import openfl.geom.ColorTransform;

var whiteBG = new FlxSprite();
var timerShit = FlxG.random.float(4, 9);
var timerShit2 = FlxG.random.float(3, 7);
var timerShit3 = FlxG.random.float(3, 7);
var centerCams:Bool = false;
var Glitch = new CustomShader("Glitchy");
public var lowMem = Options.lowMemoryMode;

function create()
{
    gf.alpha = 0.0001;

    if (!lowMem){
    tweenLoopAngle(house, 4, -4, 6, 6);
    tweenLoopAngle(platform, -0.5, 0.5, 2.5, 2.5);
    tweenLoopAngle(rock, -2, 1.2, 2.5, 2.5);
    tweenLoopAngle(rock2, 360, 0, 30, 30);
    tweenLoopAngle(things, 2, -2, 5, 5);
    tweenLoopAngle(thingsb, 2, -2, 5, 5);

    tweenLoopAngle(houseb, 16, -12, 6, 6);
    tweenLoopAngle(platform2, -0.5, 0.5, 2.5, 2.5);
    FlxTween.tween(rock3, {angle: 360}, 30, {
        ease: FlxEase.sineInOut
    });
    }

    if (!lowMem){
    stupidFix = FlxTween.tween(things, {y: things.y}, 1);
    stupidFix = FlxTween.tween(thingsb, {y: thingsb.y}, 1);
    }
    
    housebTween = FlxTween.tween(houseb, {x: 2000}, timerShit, {
        ease: FlxEase.sineInOut,
        onComplete: 
        function(e)
        {
            houseb.x = -2600;
            makeShitInsane(houseb, 2000, 4, 9);
        }
    });
    housebTween.active = false;
        
    if (!lowMem){
    rock4bMove = FlxTween.tween(rock4b, {x: 2500}, timerShit2, {
        ease: FlxEase.sineInOut,
        onComplete: 
        function(e)
        {
            rock4b.x = -2600;
            makeShitInsane(rock4b, 2500, 3, 7);
        }
    });
    rock4bMove.active = false;
    }

	whiteBG.makeGraphic(12000, 12000, FlxColor.WHITE);
	whiteBG.x = "-1020";
	whiteBG.y = "-580";
    whiteBG.alpha = 0.0001;
    whiteBG.scrollFactor.set();
	insert(1, whiteBG);

    vignette = new FlxSprite(0, 0).loadGraphic(Paths.image('vignette'));
    vignette.updateHitbox();
    vignette.cameras = [camHUD];
    vignette.alpha = 0.0001;
    add(vignette);

	/*if (!FlxG.save.data.shaderShit){
        bgb.shader = Glitch;
        bg.shader = Glitch;
    }*/

}
function badApple(turn:String){
    if (turn == "on"){
        whiteBG.alpha = 1;

    for (i in [boyfriend,dad,iconP1,iconP2,gf]){
        i.color = 0x0000000;
    }
        bg.alpha = 0.0001;
        house.alpha = 0.0001;
        platform.alpha = 0.0001;

        bgb.alpha = 0.0001;
        houseb.alpha = 0.0001;
        platform2.alpha = 0.0001;

        if (!lowMem){
            for (s in [bg,house,platform,rock,rock2,rock3,things,bgb,houseb,platform2,rockb,rock4b,thingsb]){
                s.color = 0x0000000;
            }
            for (j in [rock,rock2,rock3,things,rockb,rock4b,uhh2,uhh3,thingsb]){
                j.alpha = 0.0001;
            }
        }
    }
    if (turn == "off"){
        whiteBG.alpha = 0.0001;

    for (i in [boyfriend,dad,iconP1,iconP2,gf]){
        i.color = 0xFFFFFFF;
    }
        
    if (!lowMem){
        for (s in [bg,house,platform,rock,rock2,rock3,things,bgb,houseb,platform2,rockb,rock4b,thingsb]){
            s.color = 0xFFFFFFF;
        }
    }
    }
}
function postCreate(){
    for (i in playerStrums.members){
        trace("Player: " + i.x);
    }
    for (i in cpuStrums.members){
        trace("CPU: " + i.x);
    }
}

function onSongStart(){
    if (curSong == 'forgotten-world'){
    badApple("on");
    centerCams = true;
    }
}
function postUpdate(elapsed) {
    if (centerCams){
        	camFollow.setPosition(600, 550);
	}
    /*if (curBeat % 4 == 0 && camZooming && !FlxG.save.data.shaderShit){
        tweenchrom = FlxTween.num(5, 0, 0.5, {ease: FlxEase.sineInOut}, function(val:Float) {
            Glitch.iTime = val;
        });
        tweenchrom = FlxTween.num(0.5, 0.25, 0.5, {ease: FlxEase.sineInOut}, function(val:Float) {
            Glitch.AMT = val;
        });
        tweenchrom = FlxTween.num(0.5, 0.25, 0.5, {ease: FlxEase.sineInOut}, function(val:Float) {
            Glitch.SPEED = val;
        });
    }*/
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
function makeShitInsane(object, xThing, timerRandom1, timerRandom2)
{
    FlxTween.tween(object, {x: xThing}, timerShit, {
        ease: FlxEase.sineInOut,
        onComplete: 
        function(e)
        {
            timerShit = FlxG.random.float(timerRandom1, timerRandom2);
            object.x = -2600;
            makeShitInsane(object, xThing, timerRandom1, timerRandom2);
        }
    });
}
function stepHit(){
    if (curSong == 'forgotten-world'){
    if (curStep == 257 || curStep == 1446){
        centerCams = false;
    }
    if (curStep == 1182){
        centerCams = true;
        badApple("on");
        camHUD.flash();
        bgb.alpha = 0.0001;
        houseb.alpha = 0.0001;
        platform2.alpha = 0.0001;

        if (!lowMem){
        rockb.alpha = 0.0001;
        rock4b.alpha = 0.0001;
        thingsb.alpha = 0.0001;
        uhh2.alpha = 0.0001;
        uhh3.alpha = 0.0001;
        }
    }
    if (curStep == 515 || curStep == 1443){
        badApple("off");
        camHUD.flash();
    }
    if (curStep == 515){

        bg.alpha = 1;
        house.alpha = 1;
        platform.alpha = 1;
        if (!lowMem){
        rock.alpha = 1;
        things.alpha = 1;
        rock2.alpha = 1;
        rock3.alpha = 1;
        }
    }
    if (curStep == 1314){
        camHUD.flash();
        defaultCamZoom = 0.4;

        if (!lowMem){
        for (h in [things,rock,rock2,rock3,house]){
            h.alpha = 1;
        }
        platform2.alpha = 1;
        rockb.alpha = 1;

        FlxTween.tween(things, {y: -2400}, 3, {ease: FlxEase.sineInOut});
        }

    }
    if (curStep == 1377){
        if (!lowMem){
        FlxTween.tween(platform2, {y: -450}, 4, {ease: FlxEase.sineInOut});
        FlxTween.tween(platform2, {x: -600}, 4, {ease: FlxEase.sineInOut});

        FlxTween.tween(house, {y: -2400}, 5, {ease: FlxEase.sineInOut});
        FlxTween.tween(rock, {y: -2400}, 5, {ease: FlxEase.sineInOut});
        FlxTween.tween(rock2, {y: -2400}, 5, {ease: FlxEase.sineInOut});
        FlxTween.tween(rock3, {y: -2400}, 5, {ease: FlxEase.sineInOut});
        }
    }
    if (curStep == 1408){
        FlxTween.tween(boyfriend, {alpha: 0.0001}, 0.5, {ease: FlxEase.sineInOut});
        FlxTween.tween(dad, {alpha: 0.0001}, 0.5, {ease: FlxEase.sineInOut});

        if (!lowMem){
        FlxTween.tween(house, {alpha: 0.0001}, 0.5, {ease: FlxEase.sineInOut});
        FlxTween.tween(rock, {alpha: 0.0001}, 0.5, {ease: FlxEase.sineInOut});
        FlxTween.tween(rock2, {alpha: 0.0001}, 0.5, {ease: FlxEase.sineInOut});
        FlxTween.tween(rock3, {alpha: 0.0001}, 0.5, {ease: FlxEase.sineInOut});

        FlxTween.tween(platform2, {alpha: 0.0001}, 0.5, {ease: FlxEase.sineInOut});
        FlxTween.tween(rockb, {alpha: 0.0001}, 0.5, {ease: FlxEase.sineInOut});
        }
    }
    if (curStep == 1443){
        camHUD.flash();
        housebTween.active = true;
        if (!lowMem){
        rock4bMove.active = true;
        }
        vignette.alpha = 1;
        defaultCamZoom = 0.7;
        boyfriend.alpha = 1;
        dad.alpha = 1;

        bgb.alpha = 1;
        platform2.alpha = 1;
        houseb.alpha = 1;

        if (!lowMem){
        for (h in [platform,rock,rock2,rock3,house]){
            h.alpha = 0.0001;
        }
        for (q in [rock4b,rockb,uhh3,uhh2,thingsb]){
            q.alpha = 1;
        }
        }
    }
    if (curStep == 1993){// scrapped
        //if (!FlxG.save.data.shaderShit){
        //camera.addShader(Glitchy);
        //}
    }
    if (curStep == 2395){
        camera.alpha = 0.0001;
    }
    if (curStep == 2701){
        camHUD.flash();
        camHUD.alpha = 0.0001;
    }
}
}