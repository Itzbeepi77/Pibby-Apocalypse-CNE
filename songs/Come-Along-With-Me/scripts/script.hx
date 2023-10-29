import openfl.Lib;

var dadCamZoom:Int = 0.8;
function update() {
    if(curCameraTarget == 0)
        defaultCamZoom = dadCamZoom;
    if(curCameraTarget == 1)
        defaultCamZoom = 1;
}
function beatHit(){
}
function stepHit(){
    if (curStep == 128 || curStep == 384){
        camHUD.flash();
    }
    if (curStep == 640) {
        camera.zoom += 0.2;
        dadCamZoom = 0.75;
    }
    if (curStep == 720) {
        dadCamZoom = 0.9;
    }
    if (curStep == 736) {
        dadCamZoom = 0.8;
    }
    if (curStep == 896) {
        dadCamZoom = 0.6;
    }
    if (curStep == 1535) {
        dadCamZoom = 0.75;
    }
    if (curStep == 1648){
        dadCamZoom = 0.7;
    }
    if (curStep == 1536){
        dadCamZoom = 0.8;
    }
    if (curStep == 1664){
        dadCamZoom = 0.6;
    }
}