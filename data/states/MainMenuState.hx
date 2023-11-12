var blackboxUp = new FunkinSprite();

var blackboxDown = new FunkinSprite();
function postCreate(){
    FlxG.mouse.visible = true;
    //FlxG.mouse.load('mouse');
    //FlxG.mouse.useSystemCursor = true;

    back = new FlxSprite(-170, -80).loadGraphic(Paths.image("pibymenu/BACKGROUND"));
	back.antialiasing = true;
	back.updateHitbox();
	back.active = false;
    back.scale.set(0.8,0.7);
	back.scrollFactor.set();
    insert(1, back);

    blackboxDown.makeGraphic(FlxG.width * 20, 1000,  0xFF000000);
    blackboxDown.y = 600;

    blackboxUp.makeGraphic(FlxG.width * 20, 1000,  0xFF000000);
    blackboxUp.y -= 900;
    insert(1, blackboxDown);
    insert(1, blackboxUp);

    FlxG.sound.playMusic(Paths.music("freakyMenu"));

    window.title = "Pibby: Apocalypse - Main Menu";
    
    magenta.destroy();
    FlxG.camera.followLerp = 0;

    for(e in state.menuItems){
        e.scale.x = e.scale.y = 0.425;
        e.scrollFactor.set();
        e.updateHitbox();
    }

}

function update(elapsed){
    if (controls.LEFT_P)
        changeItem(-1);

    if (controls.RIGHT_P)
        changeItem(1);
}

function postUpdate() {

    FlxG.camera.scroll.x = FlxG.camera.scroll.y=0;
    FlxG.camera.scroll.set();
    
    state.menuItems.members[0].offset.set(400, 40); // freeplay
    state.menuItems.members[1].offset.set(-250, 200);// donate
    state.menuItems.members[2].offset.set(-300, -220);// options
}