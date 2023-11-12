import openfl.geom.ColorTransform;

var whiteBG = new FlxSprite();
function create()
{
	whiteBG.makeGraphic(12000, 12000, FlxColor.WHITE);
	whiteBG.x = "-1020";
	whiteBG.y = "-580";
    whiteBG.alpha = 0.0001;
    whiteBG.scrollFactor.set();
	insert(2, whiteBG);

    nhcutscene.cameras = [camHUD];
    nhcutscene.scrollFactor.set();
    nhcutscene.active = false;

    strumLines.members[1].characters[1].alpha = 0.0001;
    strumLines.members[1].characters[2].alpha = 0.0001;
    
    strumLines.members[0].characters[1].alpha = 0.0001;
    strumLines.members[0].characters[2].alpha = 0.0001;
}
function badApple(turn:String){
    if (turn == "on"){
        whiteBG.alpha = 1;
        boyfriend.color = 0x0000000;
        dad.color = 0x0000000;
        iconP1.color = 0x0000000;
        iconP2.color = 0x0000000;

    }
    if (turn == "off"){
        whiteBG.alpha = 0.0001;
        boyfriend.color = 0xFFFFFFF;
        dad.color = 0xFFFFFFF;
        iconP1.color = 0xFFFFFFF;
        iconP2.color = 0xFFFFFFF;
    }
}
function stepHit(){
    if (curSong == "no-hero-remix"){
    if (curStep == 8){
        nhcutscene.active = true;
    }
    if (curStep == 32){
        badApple("on");
        nhcutscene.alpha = 0.0001;
        camHUD.flash();
    }
    if (curStep == 192){
        badApple("off");
        strumLines.members[0].characters[0].alpha = 0.0001;
        strumLines.members[1].characters[0].alpha = 0.0001;
        strumLines.members[0].characters[1].alpha = 1;
        strumLines.members[1].characters[1].alpha = 1;
        camHUD.flash();
    }
    if (curStep == 464){
        camHUD.flash();
        strumLines.members[1].characters[1].alpha = 0.0001;
        strumLines.members[1].characters[2].alpha = 1;
        
        strumLines.members[0].characters[1].alpha = 0.0001;
        strumLines.members[0].characters[2].alpha = 1;
        bg.alpha = 0.0001;
        bgNh.alpha = 1;
    }
    if (curStep == 592){
        camHUD.flash();
        strumLines.members[1].characters[1].alpha = 1;
        strumLines.members[1].characters[2].alpha = 0.0001;
        
        strumLines.members[0].characters[1].alpha = 1;
        strumLines.members[0].characters[2].alpha = 0.0001;
        bg.alpha = 1;
        bgNh.alpha = 0.0001;
    }}
}