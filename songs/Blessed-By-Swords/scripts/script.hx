function update() {
    if(curCameraTarget == 0)
        defaultCamZoom = 0.85;
    if(curCameraTarget == 1)
        defaultCamZoom = 1.0;
    if(curCameraTarget == 2)
        defaultCamZoom = 0.9;

    if (curStep == 496){
        camGame.alpha = 0.0001;
        camHUD.alpha = 0.4;
    }
    if (curStep == 524){
        camHUD.flash();
        camGame.alpha = 1;
        camHUD.alpha = 1;
    }
}