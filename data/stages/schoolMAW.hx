import openfl.geom.ColorTransform;

var whiteBG = new FlxSprite();
var centerCams:Bool = false;
public var lowMem = Options.lowMemoryMode;
//var vhs = new CustomShader("MAWVHS"); it crashed ._.

function create(){
    gf.alpha = 0.0001;

    //strumLines.members[2].visible = false;

    bgV.alpha = 0.0001;
    house.alpha = 0.0001;
    platform.alpha = 0.0001;

    if (!lowMem){
    rock.alpha = 0.0001;
    rock2.alpha = 0.0001;
    things.alpha = 0.0001;
    }

	whiteBG.makeGraphic(6000, 6000, FlxColor.WHITE);
	whiteBG.x = "-490";
	whiteBG.y = "-490";
    whiteBG.alpha = 0.0001;
	insert(1, whiteBG);

    tweenLoopAngle(house, 4, -4, 6, 6);
    tweenLoopAngle(platform, -0.5, 0.5, 2.5, 2.5);

    if (!lowMem){
    tweenLoopAngle(rock, -2, 1.2, 2.5, 2.5);
    tweenLoopAngle(rock2, 360, 0, 30, 30);
    tweenLoopAngle(things, 2, -2, 5, 5);
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
function badApple(turn:String){
    if (turn == "on"){
        whiteBG.alpha = 1;
        boyfriend.color = 0x0000000;
        dad.color = 0x0000000;
        iconP1.color = 0x0000000;
        iconP2.color = 0x0000000;
        gf.color = 0x0000000;

        bg.alpha = 0.0001;
        if (!lowMem){
        topgoop.alpha = 0.0001;
        droplet.alpha = 0.0001;
        topgoop2.alpha = 0.0001;
        droplet2.alpha = 0.0001;
        sinkgoop.alpha = 0.0001;
        wall.alpha = 0.0001;
        light.alpha = 0.0001;
        idkShit.alpha = 0.0001;
        idkShit2.alpha = 0.0001;
        }
    }
    if (turn == "off"){
        whiteBG.alpha = 0.0001;
        boyfriend.color = 0xFFFFFFF;
        dad.color = 0xFFFFFFF;
        iconP1.color = 0xFFFFFFF;
        iconP2.color = 0xFFFFFFF;
        gf.color = 0xFFFFFFF;
    }
}
function postUpdate() {
    if (centerCams){
            camMoving = false;
        	camFollow.setPosition(750, 725);
	}
}
function stepHit(){
    if (curSong == 'my-amazing-world'){
    if (curStep == 512 || curStep == 1568){
        badApple("on");
        camHUD.flash();
    }
    if (curStep == 2144){
        badApple("off");
        camHUD.flash();
    }
    if (curStep == 1024 || curStep == 1824){
        bg.alpha = 1;
        if (!lowMem){
        sinkgoop.alpha = 1;
        topgoop.alpha = 1;
        droplet.alpha = 1;
        topgoop2.alpha = 1;
        droplet2.alpha = 1;
        wall.alpha = 1;
        light.alpha = 1;
        idkShit.alpha = 1;
        idkShit2.alpha = 1;
        }
    }
    if (curStep == 1024 || curStep == 1824){
        badApple("off");
    }
    if (curStep == 2080){
        boyfriend.alpha = 0.0001;
        badApple("on");
    }
    if (curStep == 1024 || curStep == 2400){
        camGame.flash(FlxColor.BLACK, 2.5);
    }
    if (curStep == 1568){
        boyfriend.alpha = 0.6;
    }
    if (curStep == 1568 || curStep == 2688){
        gf.alpha = 1;
    }
    if (curStep == 2688){
        boyfriend.alpha = 1;
        bgV.alpha = 1;
        house.alpha = 1;
        platform.alpha = 1;
        if (!lowMem){
        rock.alpha = 1;
        rock2.alpha = 1;
        things.alpha = 1;
        }
        
        ch1.alpha = 0.0001;
        ch2.alpha = 0.0001;
        ch3.alpha = 0.0001;

        /*if (!FlxG.save.data.shaderShit){
            camera.removeShader(vhs);
            camHUD.removeShader(vhs);
    
            vhs.iTime = 0;
        }*/
        //centerCams = false;
    }
    if (curStep == 2144){
        //strumLines.members[2].visible = false;
        //strumLines.members[1].visible = true;
        //gf.alpha = 0;
        //boyfriend.alpha = 1;

        bg.alpha = 0.0001;
        if (!lowMem){
        sinkgoop.alpha = 0.0001;
        wall.alpha = 0.0001;
        light.alpha = 0.0001;
        idkShit.alpha = 0.0001;
        idkShit2.alpha = 0.0001;
        topgoop.alpha = 0.0001;
        droplet.alpha = 0.0001;
        topgoop2.alpha = 0.0001;
        droplet2.alpha = 0.0001;
        }

        /*if (!FlxG.save.data.shaderShit){
        camera.addShader(vhs);
        camHUD.addShader(vhs);

        vhs.iTime = 5;
        }*/

        ch1.alpha = 1;
        centerCams = true;
    }
    if (curStep == 2176)
        {
            ch1.alpha = 0.0001;
            ch2.alpha = 1;
        }
    if (curStep == 2208)
        {
            ch2.alpha = 0.0001;
            ch3.alpha = 1;
        }
    if (curStep == 2272)
        {
            ch3.alpha = 0.0001;
            ch1.alpha = 1;
        }
    if (curStep == 2304)
        {
            ch1.alpha = 0.0001;
            ch2.alpha = 1;
        }
    if (curStep == 2336)
        {
            ch2.alpha = 0.0001;
            ch3.alpha = 1;
        }
    if (curStep == 2400)
        {
            ch3.alpha = 0.0001;
            ch1.alpha = 1;
        }
    if (curStep == 2432)
        {
            ch1.alpha = 0.0001;
            ch2.alpha = 1;
        }
    if (curStep == 2464)
        {
            ch2.alpha = 0.0001;
            ch3.alpha = 1;
        }
    if (curStep == 2528)
        {
            ch3.alpha = 0.0001;
            ch1.alpha = 1;
        }
    if (curStep == 2560)
        {
            ch1.alpha = 0.0001;
            ch2.alpha = 1;
        }
    if (curStep == 2592)
        {
            ch2.alpha = 0.0001;
            ch3.alpha = 1;
        }
    if (curStep == 2604)
        {
            ch3.alpha = 0.0001;
            ch1.alpha = 1;
        }
    if (curStep == 2624)
        {
            ch1.alpha = 0.0001;
            ch2.alpha = 1;
        }
    if (curStep == 2632)
        {
            ch2.alpha = 0.0001;
            ch3.alpha = 1;
        }
    if (curStep == 2640)
        {
            ch3.alpha = 0.0001;
            ch1.alpha = 1;
        }
    if (curStep == 2648)
        {
            ch1.alpha = 0.0001;
            ch2.alpha = 1;
        }
    if (curStep == 2656)
        {
            centerCams = false;
            ch2.alpha = 0.0001;
            ch3.alpha = 1;
        }
    }
}