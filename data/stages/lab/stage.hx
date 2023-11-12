// uhh yeah.. fuck it
import openfl.geom.ColorTransform;
import funkin.game.HealthIcon;

var flickerTween:Array<FlxTween> = [];
var flickerTween2:Array<FlxTween> = [];
var jakeIcons:HealthIcon;
var centerCams:Bool = false;
public var lowMem = Options.lowMemoryMode;

function create()
{
    //insert(members.indexOf(strumLines.members[0].characters[0])-1, strumLines.members[3].characters[0]);
	importScript("data/scripts/scrollSpeedTween");

    if (!lowMem){
	flickerTween = FlxTween.tween(light, {alpha: 0}, 0.25, {ease: FlxEase.bounceInOut, type: 4});
	flickerTween.active = true;

	flickerTween2 = FlxTween.tween(light, {alpha: 0}, 0.25, {ease: FlxEase.bounceInOut, type: 4});
	flickerTween2.active = true;
    }

    Finntransform.cameras [camHUD];
    Finntransform.screenCenter();
    Finntransform.alpha = 0.0001;
    Finntransform.active = false;

    if (!lowMem){
    insert(members.indexOf(boyfriend), light);
    insert(members.indexOf(boyfriend), dark);
    insert(members.indexOf(boyfriend), bulb);
    }
    
    if (curSong == 'suffering-siblings'){
        strumLines.members[0].characters[0].x = 1030;
    }
    if (curSong == "blessed-by-swords"){
        strumLines.members[0].characters[1].alpha = 0.0001;
    }
}
function postCreate(){
    if (curSong == 'suffering-siblings'){
    var dad2nd = strumLines.members[3].characters[0];

    jakeIcons = new HealthIcon(dad2nd.icon!=null?dad2nd.icon:dad2nd.curCharacter);
    jakeIcons.visible = true;
    jakeIcons.cameras = [camHUD];
    jakeIcons.health = health;
	insert(members.indexOf(healthBar) + 2, jakeIcons);

    jakeIcons.x = 200;
    jakeIcons.y = iconP1.y;
    }
}
function onEvent(e) {
    if (e.event.name == "AppleFilter-Alt"){
    if (e.event.params[0] == true || e.event.params[0] == null){
        bg.alpha = 0.0001;
        
        if (!lowMem){
        light.alpha = 0.0001;
        bulb.alpha = 0.0001;
        dark.alpha = 0.0001;
        flickerTween.active = false;
        flickerTween2.active = false;
        }
    } else if (e.event.params[0] == false){
        bg.alpha = 1;
        
        if (!lowMem){
        light.alpha = 1;
        bulb.alpha = 1;
        dark.alpha = 1;
        flickerTween.active = true;
        flickerTween2.active = true;
        }
    }}
}
function onSongStart(){
    if (curSong == 'mindless'){
        bg.alpha = 0.0001;
        
    if (!lowMem){
        light.alpha = 0.0001;
        bulb.alpha = 0.0001;
        dark.alpha = 0.0001;
        flickerTween.active = false;
        flickerTween2.active = false;
    }
        dad.alpha = 0.0001;
    }
}
function postUpdate(elapsed) {
    if (!lowMem){
	light.angle = Math.sin((Conductor.songPosition / 1000) * (Conductor.bpm / 60) * 1.0) * 5;
	dark.angle = light.angle;
	bulb.angle = light.angle;
    }
    
    if (curSong == 'suffering-siblings'){
    jakeIcons.scale.x = iconP1.scale.x;
    jakeIcons.scale.y = iconP1.scale.y;
    }

    if (centerCams){
        camFollow.x = 1700;
    }
}

function stepHit(curStep){
    if (curSong == "what-am-i"){
        if (curStep == 3968){
            camera.fade(FlxColor.BLACK, 20);
            camHUD.fade(FlxColor.BLACK, 20);
        }
    }

    if (curSong == 'mindless'){
        switch(curStep){
            case 304, 1616:
                scrollSpeedTween(3, 0.5);
            case 1568:
                camera.zoom += 0.1;
                scrollSpeedTween(1.8, 0.2);
                scrollSpeedTween(2.4, 0.5);
            case 2864:
                camera.zoom += 0.1;
                scrollSpeedTween(1.8, 0.2);
                scrollSpeedTween(2.4, 0.5);
            case 2912:
                camera.zoom += 0.1;
                scrollSpeedTween(2.4, 0.2);
                scrollSpeedTween(3.4, 0.5);
            case 3424:
                camera.zoom += 0.1;
                scrollSpeedTween(2.5, 0.2);
                scrollSpeedTween(3.52, 0.5);
        }
    if (curStep == 256){
        FlxTween.tween(camGame, {alpha: 0.0001}, 0.5);
        FlxTween.tween(camera, {zoom: 2}, 1);
    }

	if (curStep == 296)
	{
        bg.alpha = 1;
        dad.alpha = 1;
        
    if (!lowMem){
        light.alpha = 1;
        bulb.alpha = 1;
        dark.alpha = 1;
        flickerTween.active = true;
        flickerTween2.active = true;
    }

        FlxTween.tween(camGame, {alpha: 1}, 0.5);
        iconP1.visible = true;
        iconP2.visible = true;
    }

    if (curStep == 1576){
        //camGame.alpha = 0.0001;
        bg.alpha = 0.0001;
        
    if (!lowMem){
        light.alpha = 0.0001;
        bulb.alpha = 0.0001;
        dark.alpha = 0.0001;
        flickerTween.active = false;
        flickerTween2.active = false;
    }
        gf.alpha = 0.0001;
        dad.alpha = 0.0001;
        boyfriend.alpha = 0.0001;
        Finntransform.alpha = 1;
        Finntransform.active = true;
    }

    if (curStep == 1613){
        bg.alpha = 1;
        
    if (!lowMem){
        light.alpha = 1;
        bulb.alpha = 1;
        dark.alpha = 1;
        flickerTween.active = true;
        flickerTween2.active = true;
    }
        gf.alpha = 1;
        dad.alpha = 1;
        boyfriend.alpha = 1;
        Finntransform.alpha = 0.0001;
        Finntransform.active = false;
    }

    if (curStep == 3712){
        camera.fade(FlxColor.BLACK, 0.5);
        camHUD.fade(FlxColor.BLACK, 0.5);
    }
}

if (curSong == "blessed-by-swords"){
    if (curStep == 831 || curStep == 909 || curStep == 942 || curStep == 991 || curStep == 1079 || curStep == 1087){
        strumLines.members[0].characters[1].alpha = 1;
        strumLines.members[0].characters[0].alpha = 0.0001;
    }

    if (curStep == 836 || curStep == 912 || curStep == 945 || curStep == 995 || curStep == 1081 || curStep == 1091){
        strumLines.members[0].characters[0].alpha = 1;
        strumLines.members[0].characters[1].alpha = 0.0001;
    }

    if (curStep == 1347 || curStep == 1352 || curStep == 1356 || curStep == 1363 || curStep == 1379 || curStep == 1395){
        strumLines.members[0].characters[1].alpha = 1;
        strumLines.members[0].characters[0].alpha = 0.0001;
    }

    if (curStep == 1349 || curStep == 1353 || curStep == 1357 || curStep == 1365 || curStep == 1391 || curStep == 1397){
        strumLines.members[0].characters[0].alpha = 1;
        strumLines.members[0].characters[1].alpha = 0.0001;
    }
}

if (curSong == 'suffering-siblings'){
    if (curStep == 1664){
        camGame.flash(0x000000, 16);
        //camHUD.flash();
    }

    if (curStep == 1696){
        boyfriend.alpha = 0.6;
        dad.alpha =  0.6;
    }

    if (curStep == 1824){
        dad.alpha = 1;
    }

    if (curStep == 2080){
        boyfriend.alpha = 1;
    }

    if (curStep == 2080){
        //camHUD.flash();
        centerCams = true;
        FlxTween.tween(camera, {zoom: 0.6}, 20);
        gf.alpha = 0.0001;
        strumLines.members[3].characters[0].alpha = 0.0001;
        bg.alpha = 0.0001;
        
        if (!lowMem){
            light.alpha = 0.0001;
            bulb.alpha = 0.0001;
            dark.alpha = 0.0001;
            flickerTween.active = false;
            flickerTween2.active = false;
        }
    }

    if (curStep == 2336){
        //camHUD.flash();
        gf.alpha = 1;
        strumLines.members[3].characters[0].alpha = 1;
        bg.alpha = 1;
        
        if (!lowMem){
            light.alpha = 1;
            bulb.alpha = 1;
            dark.alpha = 1;
            flickerTween.active = true;
            flickerTween2.active = true;
        }
    }

    if (curStep == 2400){
        centerCams = false;
    }

    if (curStep == 3360){
        camGame.alpha = 0.0001;
        //camHUD.flash();
    }

    if (curStep == 3392){
        //camHUD.flash();
        camGame.alpha = 1;
        dad.visible = false;
        strumLines.members[3].characters[0].alpha = 0.0001;
    }
}

if (curSong == 'brotherly-love'){
	if (curStep == 1023){
        camHUD.flash();
    }

    if (curStep == 1520){
        camGame.alpha = 0.0001;
    }

    if (curStep == 1536){
        camHUD.flash();
        camGame.alpha = 1;
    }

    if (curStep == 3328){
        FlxTween.tween(camGame, {alpha: 0.0001}, 0.5);
        camHUD.fade(FlxColor.BLACK, 0.5);
    }
}
}