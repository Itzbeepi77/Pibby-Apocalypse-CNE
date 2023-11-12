import openfl.Lib;

var dadCamZoom:Int = 1.2;
var bfCamZoom:Int = 0.9;
var oldTV = new CustomShader("vcr with glitch");
var vhs = new CustomShader("MAWVHS");
function update() {
    if(curCameraTarget == 0){
        defaultCamZoom = dadCamZoom;
    }
    if(curCameraTarget == 1){
        defaultCamZoom = bfCamZoom;
    }
    if(curCameraTarget == 2){
        defaultCamZoom = bfCamZoom;
    }

    FlxTween.num(20, 10, 0.025, {ease: FlxEase.sineInOut}, function(val:Float) {
        oldTV.iTime = val;
    });
    
    FlxTween.num(1, 0, 0.05, {ease: FlxEase.sineInOut}, function(val:Float) {
        vhs.iTime = val;
    });
}
function stepHit(){
    if (curStep == 492){
        bfCamZoom = 1;
    }
    if (curStep == 498){
        bfCamZoom = 1.1;
    }
    if (curStep == 502){
        bfCamZoom = 0.9;
    }
    if (curStep == 1280){
        dadCamZoom = 1.5;
        //FlxTween.tween(camera, {zoom: 1.5}, 1, {ease: FlxEase.sineInOut});
    }
    if (curStep == 1296){
        dadCamZoom = 1.2;
    }
    if (curStep == 1416){
        bfCamZoom = 1;
    }
    if (curStep == 1424){
        bfCamZoom = 0.9;
        FlxTween.tween(camera, {zoom: 2}, 10, {ease: FlxEase.sineInOut});
    }
    if (curStep == 1552){
        camGame.alpha = 0.0001;
    }
    if (curStep == 1568){
        camGame.alpha = 1;
    }
    if (curStep == 2144){
        if (!FlxG.save.data.shaderShit){
            camHUD.addShader(oldTV);
            camera.addShader(oldTV);
            camHUD.addShader(vhs);
            camera.addShader(vhs);
        }
        dad.x = 0 +300;
        dad.y = 0 +310;
        bfCamZoom = 0.8;
        dadCamZoom = 0.8;
    }
    if (curStep == 2688){
        if (!FlxG.save.data.shaderShit){
            camHUD.removeShader(oldTV);
            camera.removeShader(oldTV);
            camHUD.removeShader(vhs);
            camera.removeShader(vhs);
            oldTV.iTime = 0;
            vhs.iTime = 0;
        }
        dadCamZoom = 0.7;
        bfCamZoom = 0.7;
        dad.y = 0 +360;
    }
    if (curStep == 2176)
        {
            bfCamZoom = 1.2;
            dadCamZoom = 1.2;
        }
    if (curStep == 2208)
        {
            bfCamZoom = 0.8;
            dadCamZoom = 0.8;
        }
    if (curStep == 2272)
        {
            bfCamZoom = 0.8;
            dadCamZoom = 0.8;
        }
    if (curStep == 2304)
        {
            bfCamZoom = 1.2;
            dadCamZoom = 1.2;
        }
    if (curStep == 2336)
        {
            bfCamZoom = 0.8;
            dadCamZoom = 0.8;
        }
    if (curStep == 2400)
        {
            bfCamZoom = 0.8;
            dadCamZoom = 0.8;
        }
    if (curStep == 2432)
        {
            bfCamZoom = 1.2;
            dadCamZoom = 1.2;
        }
    if (curStep == 2464)
        {
            bfCamZoom = 0.8;
            dadCamZoom = 0.8;
        }
    if (curStep == 2528)
        {
            bfCamZoom = 0.8;
            dadCamZoom = 0.8;
        }
    if (curStep == 2560)
        {
            bfCamZoom = 1.2;
            dadCamZoom = 1.2;
        }
    if (curStep == 2592)
        {
            bfCamZoom = 0.8;
            dadCamZoom = 0.8;
        }
    if (curStep == 2604)
        {
            bfCamZoom = 0.8;
            dadCamZoom = 0.8;
        }
    if (curStep == 2624)
        {
            bfCamZoom = 1.2;
            dadCamZoom = 1.2;
        }
    if (curStep == 2632)
        {
            bfCamZoom = 0.8;
            dadCamZoom = 0.8;
        }
    if (curStep == 2640)
        {
            bfCamZoom = 0.8;
            dadCamZoom = 0.8;
        }
    if (curStep == 2648)
        {
            bfCamZoom = 1.2;
            dadCamZoom = 1.2;
        }
    if (curStep == 2656)
        {
            bfCamZoom = 0.8;
            dadCamZoom = 0.8;
        }
}