import openfl.geom.ColorTransform;

var blackBG = new FlxSprite();
var centerCams:Bool = false;
public var lowMem = Options.lowMemoryMode;

function create(){
    gf.alpha = 0.0001;
	importScript("data/scripts/scrollSpeedTween");

    blackBG.makeGraphic(6000, 6000, FlxColor.BLACK);
	blackBG.x = "-490";
	blackBG.y = "-490";
    blackBG.alpha = 0.0001;
	insert(3, blackBG);
}

function alternateBA(sprite, red, blue, green, alpha, red2, blue2, green2, alpha2) {
    //sprite.color = 0xFFffffff;
    blackBG.alpha = 1;
    sprite.setColorTransform();
    sprite.colorTransform.redMultiplier = red;
    sprite.colorTransform.blueMultiplier = blue;
    sprite.colorTransform.greenMultiplier = green;
    sprite.colorTransform.alphaMultiplier = alpha;
    sprite.colorTransform.redOffset = red2;
    sprite.colorTransform.blueOffset = blue2;
    sprite.colorTransform.greenOffset = green2;
    sprite.colorTransform.alphaOffset = alpha2;
    sprite.dirty = true;
    
    bg.alpha = 0.0001;

    if (!lowMem){
    wall.alpha = 0.0001;
    light.alpha = 0.0001;
    idkShit.alpha = 0.0001;
    idkShit2.alpha = 0.0001;
    }
}
function resetColor(sprite){
        blackBG.alpha = 0.0001;
        sprite.color = 0xFFffffff;
        sprite.setColorTransform();
        sprite.colorTransform.redMultiplier = 1;
        sprite.colorTransform.blueMultiplier = 1;
        sprite.colorTransform.greenMultiplier = 1;
        sprite.colorTransform.alphaMultiplier = 1;
        sprite.colorTransform.redOffset = 0;
        sprite.colorTransform.blueOffset = 0;
        sprite.colorTransform.greenOffset = 0;
        sprite.colorTransform.alphaOffset = 0;
        sprite.dirty = true;
}
function postUpdate(elapsed:Float) {
    if (centerCams){
        	camFollow.setPosition(750, 750);
	}
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
    if (curStep == 80 || curStep == 352){
        FlxTween.tween(camera, {zoom: 2}, 7, {ease: FlxEase.sineInOut});
    }
    if (curStep == 120){
        FlxTween.tween(camera, {zoom: 1.2}, 1.5, {ease: FlxEase.sineInOut});
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
    }
    if (curStep == 1216){
        alternateBA(dad, 1, 1, 1, 1, 255, 255, 255, 0);
        alternateBA(boyfriend, 1, 1, 1, 1, 255, 255, 255, 0);
    }
    if (curStep == 1472){
        resetColor(dad);
        resetColor(boyfriend);

        bg.alpha = 1;
        
    if (!lowMem){
        wall.alpha = 1;
        light.alpha = 1;
        idkShit.alpha = 1;
        idkShit2.alpha = 1;
    }
    }}
}