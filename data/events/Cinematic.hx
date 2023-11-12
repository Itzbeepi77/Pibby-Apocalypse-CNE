var blackboxUp = new FunkinSprite();//bar up for cinematic

var blackboxDown = new FunkinSprite();//bar down for cinematic
function postCreate(){
    blackboxDown.zoomFactor = 0;
    blackboxUp.zoomFactor = 0;
    
    blackboxDown.makeGraphic(FlxG.width * 20, 1000,  0xFF000000);
    blackboxDown.y = 900;

    blackboxUp.makeGraphic(FlxG.width * 20, 1000,  0xFF000000);
    blackboxUp.y -= 1000;
    blackboxDown.cameras = [camHUD];
    blackboxUp.cameras = [camHUD];
    insert(1, blackboxDown);
    insert(1, blackboxUp);
}
function onEvent(e) {
    if (e.event.name == "Cinematic"){
        FlxTween.tween(blackboxDown, {y: e.event.params[0]}, e.event.params[2], {ease: FlxEase.quadInOut});
        FlxTween.tween(blackboxUp, {y: - e.event.params[1]}, e.event.params[2], {ease: FlxEase.quadInOut});
    }
}