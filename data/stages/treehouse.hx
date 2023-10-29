function create(){
    //thunder.alpha = 0.0001;

    camOverlay.screenCenter();
    camOverlay.cameras = [camHUD];
    //camOverlay.scale.set(0.6, 0.6);

    vignette = new FlxSprite(0, 0).loadGraphic(Paths.image('vignette'));
    vignette.updateHitbox();
    vignette.cameras = [camHUD];
    vignette.alpha = 0.0001;
    add(vignette);

    vignette2 = new FlxSprite(0, 0).loadGraphic(Paths.image('gradient'));
    vignette2.updateHitbox();
    vignette2.cameras = [camHUD];
    vignette2.alpha = 0.0001;
    add(vignette2);

}
function stepHit(curStep:Int)
    {
        if (curSong == "come-along-with-me"){
        if (curStep == 1536) {
            camHUD.flash();
            boyfriend.alpha = 0.0001;
            bgHeaven.alpha = 1;
            uhhIdfk.alpha = 1;
            things.alpha = 1;
            bg.alpha = 0.0001;
            treehouse.alpha = 0.0001;
            //thunder.alpha = 0.0001;

        }
        if (curStep == 1648)
        {
            camHUD.flash();
            bgHeaven.alpha = 0.0001;
            uhhIdfk.alpha = 0.0001;
            things.alpha = 0.0001;
            bgGlitch.alpha = 1;
            lightG.alpha = 1;
            hill.alpha = 1;
            particles.alpha = 1;
            dangling.alpha = 1;
            corruption.alpha = 1;
        }

        if (curStep == 630)
        {
            vignette.alpha = 1;

            bgHeaven.alpha = 0.0001;
            uhhIdfk.alpha = 0.0001;
            things.alpha = 0.0001;

            bgGlitch.alpha = 1;
            lightG.alpha = 1;
            hill.alpha = 1;
            particles.alpha = 1;
            dangling.alpha = 1;
            corruption.alpha = 1;
            boyfriend.alpha = 0.0001;
        }
        if (curStep == 896) {

            bgGlitch.alpha = 0.0001;
            lightG.alpha = 0.0001;
            hill.alpha = 0.0001;
            particles.alpha = 0.0001;
            dangling.alpha = 0.0001;
            corruption.alpha = 0.0001;
            bg.alpha = 1;
            treehouse.alpha = 1;
            //thunder.alpha = 1;
            boyfriend.alpha = 1;

            vignette.alpha = 1;
        }
        if (curStep == 1664) {

            bgGlitch.alpha = 0.0001;
            lightG.alpha = 0.0001;
            hill.alpha = 0.0001;
            particles.alpha = 0.0001;
            dangling.alpha = 0.0001;
            corruption.alpha = 0.0001;

            bg.alpha = 1;
            treehouse.alpha = 1;
            //thunder.alpha = 1;
            boyfriend.alpha = 1;
        }
        if (curStep == 1754){
            FlxTween.tween(camGame, {alpha: 0}, 1, {ease: FlxEase.quadInOut});
            //FlxTween.tween(vignette2, {alpha: 1}, 0.5, {ease: FlxEase.quadInOut}); nuh uh
        }
    }
}
