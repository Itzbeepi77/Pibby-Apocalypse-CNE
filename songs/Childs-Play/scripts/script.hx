var dadCamZoom:Int = 1.2;
var bfCamZoom:Int = 0.9;
function update() {
    if(curCameraTarget == 0)
        defaultCamZoom = dadCamZoom;
    if(curCameraTarget == 1)
        defaultCamZoom = bfCamZoom;
    if(curCameraTarget == 2)
        defaultCamZoom = bfCamZoom;
    
    if (curStep == 1200){
        bfCamZoom = 1.2;
    }
    if (curStep == 1472){
        bfCamZoom = 0.9;
    }
}