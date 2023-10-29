var blackboxUp = new FlxSprite();
var blackboxDown = new FlxSprite();

function create(){
    blackboxDown.makeGraphic(FlxG.width * 20, 1000,  0xFF000000);
    blackboxDown.y = 900;

    blackboxUp.makeGraphic(FlxG.width * 20, 1000,  0xFF000000);
    blackboxUp.y -= 1000;
    blackboxDown.cameras = [camHUD];
    blackboxUp.cameras = [camHUD];
    insert(1, blackboxDown);
    insert(1, blackboxUp);
}
function onSongStart(){
    if (curSong == 'my-amazing-world'){
        FlxTween.tween(blackboxDown, {y: 625}, 5);
        FlxTween.tween(blackboxUp, {y: - 925}, 5);
    }
    if (curSong == 'retcon'){
        FlxTween.tween(blackboxDown, {y: 625}, 2.5);
        FlxTween.tween(blackboxUp, {y: - 925}, 2.5);
    }
}
function stepHit(){
    if (curSong == 'my-amazing-world'){
        switch(curStep){
            case 252, 1080, 1816, 2144:
                FlxTween.tween(blackboxDown, {y: 900}, 2);
                FlxTween.tween(blackboxUp, {y: - 1000}, 2);
            
            case 512, 1280, 2080, 2688:
                FlxTween.tween(blackboxDown, {y: 625}, 1);
                FlxTween.tween(blackboxUp, {y: - 925}, 1);
        }
    }

    if (curSong == 'retcon'){
        switch(curStep){
            case 125:
                FlxTween.tween(blackboxDown, {y: 900}, 2);
                FlxTween.tween(blackboxUp, {y: - 1000}, 2);
        }
    }

    if (curSong == 'childs-play'){
        switch(curStep){
            case 1200:
                FlxTween.tween(blackboxDown, {y: 625}, 2.5);
                FlxTween.tween(blackboxUp, {y: - 925}, 2.5);
        }
    }

    if (curSong == 'suffering-siblings'){
    if (curStep == 3776){
        camGame.alpha = 0.0001;
    }
    if (curStep == 1 || curStep == 768 || curStep == 1408 || curStep == 2336 || curStep == 2448 || curStep == 2976){
        FlxTween.tween(blackboxDown, {y: 625}, 0.2, {ease: FlxEase.quadInOut});
        FlxTween.tween(blackboxUp, {y: - 925}, 0.2, {ease: FlxEase.quadInOut});
    }
    if (curStep == 1696){
        FlxTween.tween(blackboxDown, {y: 625}, 0.4, {ease: FlxEase.quadInOut});
        FlxTween.tween(blackboxUp, {y: - 925}, 0.4, {ease: FlxEase.quadInOut});
    }
    if (curStep == 2400){
        FlxTween.tween(blackboxDown, {y: 900}, 0.4, {ease: FlxEase.quadInOut});
        FlxTween.tween(blackboxUp, {y: - 1000}, 0.4, {ease: FlxEase.quadInOut});
    }
    if (curStep == 2374 || curStep == 2432){
        FlxTween.tween(blackboxDown, {y: 500}, 0.2, {ease: FlxEase.quadInOut});
        FlxTween.tween(blackboxUp, {y: - 800}, 0.2, {ease: FlxEase.quadInOut});
    }
    if (curStep == 384 || curStep == 1024 || curStep == 1664 || curStep == 1952 || curStep == 2720){
        FlxTween.tween(blackboxDown, {y: 900}, 0.2, {ease: FlxEase.quadInOut});
        FlxTween.tween(blackboxUp, {y: - 1000}, 0.2, {ease: FlxEase.quadInOut});
    }}
}