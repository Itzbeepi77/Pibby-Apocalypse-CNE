function onCountdown(event) {// countdown thingy
    switch(curSong){
        case 'suffering-siblings', 'brotherly-love', 'blessed-by-swords', 'what-am-i':
            switch(event.swagCounter) {
                case 0:
                    camera.zoom += 0.06;
                    bfIntro.playAnim('3', true);
                    pibbyIntro.playAnim('3', true); 
                    boyfriend.alpha = 0.0001; 
                    bfIntro.alpha = 1; 
                    pibbyIntro.alpha = 1; 
                    gf.alpha = 0.0001;
                    countNum.animation.play('3', true);
                    countNum.alpha = 1;

                case 1: 
                    camera.zoom += 0.06; 
                    bfIntro.playAnim('2', true); 
                    pibbyIntro.playAnim('2', true);
                    countNum.animation.play('2', true);

                case 2:
                    camera.zoom += 0.06; 
                    bfIntro.playAnim('1', true); 
                    pibbyIntro.playAnim('1', true);
                    countNum.animation.play('1', true);

                case 3: 
                    FlxTween.tween(camera, {zoom: defaultCamZoom}, 0.05); // for zoom back to their default camZoom
                    bfIntro.playAnim('idle', true); 
                    pibbyIntro.playAnim('idle', true); 
                    camHUD.visible = true; 
                    camHUD.flash(FlxColor.WHITE, 0.25);
                    countNum.animation.play('Go', true);
            };
        
        case 'retcon', 'childs-play':
            switch(event.swagCounter) {
                case 0:
                        camera.zoom += 0.03;
                        bfIntro.playAnim('3', true);
                        boyfriend.alpha = 0.0001; 
                        bfIntro.alpha = 1; 
                        countNum.animation.play('3', true);
                        countNum.alpha = 1;
    
                case 1: 
                        camera.zoom += 0.03; 
                        bfIntro.playAnim('2', true); 
                        countNum.animation.play('2', true);
    
                case 2:
                        camera.zoom += 0.03; 
                        bfIntro.playAnim('1', true); 
                        countNum.animation.play('1', true);
    
                case 3: 
                        camera.zoom -= 0.06; // for zoom back to their default camZoom
                        bfIntro.playAnim('idle', true); 
                        countNum.animation.play('Go', true);
                        camHUD.visible = true; 
                        camHUD.flash(FlxColor.WHITE, 0.25);
            };

        default:
            switch(event.swagCounter) {
                case 0:
                        countNum.animation.play('3', true);
                        countNum.alpha = 1;
    
                case 1: 
                        countNum.animation.play('2', true);
    
                case 2:
                        countNum.animation.play('1', true);
    
                case 3: 
                        countNum.animation.play('Go', true);
            };
    }
}
function update(elapsed:Float) {

    switch(curSong){
        case 'suffering-siblings', 'brotherly-love', 'blessed-by-swords', 'what-am-i', 'retcon', 'childs-play':
        if (Conductor.songPosition < 0) {
            curCameraTarget = 1;
            camFollow.setPosition(2100, 1100);
        }
    }
}
function postCreate(){
    if (Conductor.songPosition < 0) {
    trace("Countdown Shits");
    }
}