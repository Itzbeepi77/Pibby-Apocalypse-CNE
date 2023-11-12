import openfl.geom.ColorTransform;

// making them variables so its less confusing and stuff also stolen code :trolled:
var charColors = [0xff969494, 0xFFBFE5BA];
var houseColors = [0xFF8f8f8f, 0xFF9ADA91];
var rockColors = [0xFFbababa, 0xFFB8D4B5];
var coolThingColors = [0xFFc4c0c0, 0xFFC1CEAA];

var timerShit = FlxG.random.float(4, 9);
var timerShit2 = FlxG.random.float(3, 7);
var timerShit3 = FlxG.random.float(3, 7);
var centerCams:Bool = false;
public var lowMem = Options.lowMemoryMode;
var Glitch = new CustomShader("glitch");

function create()
{
    gf.visible = false;

    if (!lowMem){
    tweenLoopAngle(house, 4, -4, 6, 6);
    tweenLoopAngle(platform, -0.5, 0.5, 2.5, 2.5);
    tweenLoopAngle(rock, -2, 1.2, 2.5, 2.5);
    tweenLoopAngle(rock2, 360, 0, 30, 30);
    tweenLoopAngle(things, 2, -2, 5, 5);
    tweenLoopAngle(thingsb, 2, -2, 3, 3);

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

    vignette = new FlxSprite(0, 0).loadGraphic(Paths.image('vignette'));
    vignette.updateHitbox();
    vignette.cameras = [camHUD];
    vignette.alpha = 0.0001;
    add(vignette);

	if (!FlxG.save.data.shaderShit){
        bgb.shader = Glitch;
        bg.shader = Glitch;
    }

}
function onEvent(e){
    if (e.event.name == "AppleFilter"){
    if (e.event.params[0] == true || e.event.params[0] == null){
        bg.alpha = 0.0001;
        house.alpha = 0.0001;
        platform.alpha = 0.0001;

        bgb.alpha = 0.0001;
        houseb.alpha = 0.0001;
        platform2.alpha = 0.0001;
        
        if (!lowMem){
            rock.alpha = 0.0001;
            rock2.alpha = 0.0001;
            rock3.alpha = 0.0001;
            things.alpha = 0.0001;
        }
    }}
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
    centerCams = true;
    }
}
function postUpdate() {
    if (centerCams){
        	camFollow.setPosition(600, 550);
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
        switch(curStep){
            case 257, 1446:
                centerCams = false;

            case 1182:
                camHUD.flash();

            case 514:
                bg.alpha = 1;
                house.alpha = 1;
                platform.alpha = 1;
                if (!lowMem){
                rock.alpha = 1;
                things.alpha = 1;
                rock2.alpha = 1;
                rock3.alpha = 1;
                }

            case 1442:
                camHUD.flash();
                housebTween.active = true;
                if (!lowMem){
                rock4bMove.active = true;
                }
                vignette.alpha = 1;
                defaultCamZoom = 0.7;
        
                bg.alpha = 0.0001;
                house.alpha = 0.0001;
                platform.alpha = 0.0001;

                bgb.alpha = 1;
                platform2.alpha = 1;
                houseb.alpha = 1;
        
                if (!lowMem){
                    rock.alpha = 0.0001;
                    rock2.alpha = 0.0001;
                    rock3.alpha = 0.0001;
                for (q in [rock4b,rockb,uhh3,uhh2,thingsb]){
                    q.alpha = 1;
                }}

            case 2389:
                camera.alpha = 0.0001;

            case 2715:
                camHUD.flash();
                camHUD.visible = false;
        }
    if (curStep == 514 || curStep == 1442){
        camHUD.flash();
    }
    if (curStep == 1992){// scrapped
        //if (!FlxG.save.data.shaderShit){
        //camera.addShader(Glitchy);
        //}
    }}
}