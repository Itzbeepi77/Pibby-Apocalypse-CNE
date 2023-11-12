import openfl.geom.ColorTransform;

var centerCams:Bool = false;
public var lowMem = Options.lowMemoryMode;

function create(){
    gf.alpha = 0.0001;
	importScript("data/scripts/scrollSpeedTween");
}
function postUpdate(elapsed:Float) {
    if (centerCams){
        	camFollow.setPosition(750, 750);
	}
}
function onEvent(e){
    if (e.event.name == "AppleFilter-Alt" || e.event.name == "AppleFilter"){
    if (e.event.params[0] == true || e.event.params[0] == null){
        bg.alpha = 0.0001;

        if (!lowMem){
        penny.alpha = 0.0001;
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
    } else if (e.event.params[0] == false){
        bg.alpha = 1;
        
        if (!lowMem){
        penny.alpha = 1;
        topgoop.alpha = 1;
        droplet.alpha = 1;
        topgoop2.alpha = 1;
        droplet2.alpha = 1;
        sinkgoop.alpha = 1;
        wall.alpha = 1;
        light.alpha = 1;
        idkShit.alpha = 1;
        idkShit2.alpha = 1;
        }
    }}
}
function onSongStart(){
    camZooming = true;
}
function stepHit(){
    if (curSong == 'childs-play'){
        switch(curStep){
            case 384:
                scrollSpeedTween(3, 2);
            case 1472:
                scrollSpeedTween(3, 1);
            case 1184:
                scrollSpeedTween(2.5, 2);
            case 2192:
                scrollSpeedTween(2.5, 1);
            case 2208:
                scrollSpeedTween(1.8, 2);
            case 2225:
                scrollSpeedTween(1, 2);
        }
    if (curStep == 416){
        if (!lowMem){
        penny.alpha = 1;
        droplet.alpha = 1;
        droplet2.alpha = 1;
        sinkgoop.alpha = 1;
        topgoop.alpha = 1;
        topgoop2.alpha = 1;
        }
    }
    if (curStep == 64 || curStep == 352){
        FlxTween.tween(camera, {zoom: 2}, 9.5, {ease: FlxEase.sineInOut});
    }
    if (curStep == 1200){
        FlxTween.tween(camera, {zoom: 1.2}, 5.4, {ease: FlxEase.sineInOut});
    }
    if (curStep == 384 || curStep == 2240){
        camGame.alpha = 0.0001;
    }
    if (curStep == 384){
        camHUD.alpha = 0.6;
    }
    if (curStep == 2240){
        camHUD.visible = false;
    }
    if (curStep == 416){
        camHUD.alpha = 1;
        camGame.alpha = 1;
    }}
}