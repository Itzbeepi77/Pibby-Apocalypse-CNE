function update(){
    if (curStep == 1787){
        boyfriend.angle = 180;
        boyfriend.x = 770;
        boyfriend.y = -700;
        dad.x = 100;
        dad.y = 300;
    }
}
function stepHit(){
    if (curStep == 1792){
        downscroll = false;
        boyfriend.cameras = [camHUD];
        dad.cameras = [camHUD];
        FlxTween.tween(dad, {y: 100}, 1, {ease: FlxEase.quadInOut});
        FlxTween.tween(boyfriend, {y: -500}, 1, {ease: FlxEase.quadInOut});
    }
}