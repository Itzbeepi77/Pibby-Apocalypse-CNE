var anglePart = false;

function update() {
    if(curCameraTarget == 0)
        defaultCamZoom = 0.9;
    if(curCameraTarget == 1)
        defaultCamZoom = 1.0;
    if(curCameraTarget == 2)
        defaultCamZoom = 0.9;
}

function beatHit(curBeat) {
    switch(curBeat){
        case 64, 160, 384, 576, 720:
            camZoomingInterval = 1;
            camZoomingStrength = 1.5;
            camGame.flash();
            anglePart = true;
        
        case 120, 216, 448, 697, 832:
            camZoomingInterval = 4;
            camZoomingStrength = 1;
            anglePart = false;
    }

    if (anglePart == true) {
        if (curBeat % 2 == 0) {
            FlxTween.tween(camHUD, {angle: 5}, Conductor.crochet / 1000, {type: FlxTween.BACKWARD, ease: FlxEase.cubeInOut});
        } else {
            FlxTween.tween(camHUD, {angle: -5}, Conductor.crochet / 1000, {type: FlxTween.BACKWARD, ease: FlxEase.cubeInOut});
        }
    }

}