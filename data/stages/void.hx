import openfl.geom.ColorTransform;

var velocityShitHehe:Int = 1;

// making them variables so its less confusing and stuff also stolen code :trolled:
var charColors = [0xff969494, 0xFFBFE5BA];
var houseColors = [0xFF8f8f8f, 0xFF9ADA91];
var rockColors = [0xFFbababa, 0xFFB8D4B5];
var coolThingColors = [0xFFc4c0c0, 0xFFC1CEAA];
var whiteBG = new FlxSprite();
public var lowMem = Options.lowMemoryMode;

function create(){
    house.color = houseColors[0];

    if (!lowMem){
    tweenLoopAngle(house, 4, -4, 6, 6);
    tweenLoopAngle(platform, -0.5, 0.5, 2.5, 2.5);
    tweenLoopAngle(rock2, 360, 0, 30, 30);
    tweenLoopAngle(things, 2, -2, 5, 5);

    things.color = coolThingColors[0];
    platform.color = rockColors[0];
    rock.color = houseColors[0];
    rock2.color = houseColors[0];
    rock3.color = houseColors[0];

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

        tweenLoopAngle(boyfriend, 0, 0, 0.00001, 0.00001);
        tweenLoopAngle(dad, 0, 0, 0.00001, 0.00001);
        tweenLoopAngle(gf, 0, 0, 0.00001, 0.00001);
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
    FlxTween.tween(varx, {angle: distance1}, duration1 / velocityShitHehe, {
        ease: FlxEase.sineInOut,
        onComplete: 
        function (twn:FlxTween)
            {
                FlxTween.tween(varx, {angle: distance2}, duration2 / velocityShitHehe, {
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
function onSongStart(){
    boyfriend.color = charColors[0];
    dad.color = charColors[0];
    gf.color = charColors[0];
    
    tweenLoopAngle(boyfriend, -2.1, 2.1, 3, 3);
    tweenLoopAngle(dad, -2.1, 2.1, 3, 3);
    tweenLoopAngle(gf, -2.1, 2.1, 3, 3);
    tweenLoopAngle(rock, -0.8, 0.8, 2.5, 2.5);
}
function stepHit(){
    if (curSong == 'retcon'){
        switch(curStep){
            case 512, 1024, 1536, 1824:
                glitch.alpha = 1;
                camera.flash();
                
                boyfriend.color = charColors[1];
                dad.color = charColors[1];
                gf.color = charColors[1];
                house.color = houseColors[1];
                platform.color = rockColors[1];

                rock.color = houseColors[1];
                rock2.color = houseColors[1];
                rock3.color = houseColors[1];
                things.color = coolThingColors[1];

            case 768, 1792:
                velocityShitHehe = 1;
                FlxTween.tween(glitch, {alpha: 0.0001}, 1, {
                    ease: FlxEase.quadInOut
                });

                FlxTween.color(boyfriend, 0.5, charColors[1], charColors[0], {ease: FlxEase.quadInOut } );
                FlxTween.color(dad, 0.5, charColors[1], charColors[0], {ease: FlxEase.quadInOut } );
                FlxTween.color(gf, 0.5, charColors[1], charColors[0], {ease: FlxEase.quadInOut } );
                FlxTween.color(house, 0.5, houseColors[1], houseColors[0], {ease: FlxEase.quadInOut } );

                if (!lowMem){
                FlxTween.color(platform, 0.5, rockColors[1], rockColors[0], {ease: FlxEase.quadInOut } );
                FlxTween.color(rock, 0.5, rockColors[1], rockColors[0], {ease: FlxEase.quadInOut } );
        
                FlxTween.color(rock2, 0.5, houseColors[1], houseColors[0], {ease: FlxEase.quadInOut } );
                FlxTween.color(rock3, 0.5, houseColors[1], houseColors[0], {ease: FlxEase.quadInOut } );
                FlxTween.color(things, 0.5, coolThingColors[1], coolThingColors[0], {ease: FlxEase.quadInOut } );
                }

            case 1280:
                glitch.alpha = 0.0001;
                camera.flash();

                boyfriend.color = charColors[0];
                dad.color = charColors[0];
                gf.color = charColors[0];
                
                house.color = houseColors[0];

                if (!lowMem){
                things.color = coolThingColors[0];
                platform.color = rockColors[0];
                rock.color = houseColors[0];
                rock2.color = houseColors[0];
                rock3.color = houseColors[0];
                }

            case 512, 1024:
                velocityShitHehe = 2;

            case 1280:
                velocityShitHehe = 5;

            case 1536, 1792, 1824:
                velocityShitHehe = 10;
        }

    if (curStep == 2064){
        camHUD.flash();
        badApple("on");
    }}
}