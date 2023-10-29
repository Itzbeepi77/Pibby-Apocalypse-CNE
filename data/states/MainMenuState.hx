function create(){
    FlxG.mouse.visible = true;
    //FlxG.mouse.load('mouse');
    //FlxG.mouse.useSystemCursor = true;

    bg = new FlxSprite(-30, 0).loadGraphic(Paths.image("pibymenu/BACKGROUND"));
    //bg.screenCenter();
    //bg.scale.set(0.3, 0.3);
    add(bg);

    FlxG.sound.playMusic(Paths.music("freakyMenu"));

    window.title = "CodenameEngine: PibbyApocalypse - Main Menu";

}

function postCreate(){
    magenta.destroy();
    FlxG.camera.followLerp = 0;
}

function postUpdate() {

    FlxG.camera.scroll.x = FlxG.camera.scroll.y=0;
    FlxG.camera.scroll.set();

    state.menuItems.members[0].scale.set(0.7, 0.7); // freeplay
    state.menuItems.members[1].scale.set(0.7, 0.7);// options
    state.menuItems.members[2].scale.set(0.7, 0.7);// options

    state.menuItems.members[0].offset.set(400, 40); // freeplay
    state.menuItems.members[1].offset.set(-250, 200);// donate
    state.menuItems.members[2].offset.set(-300, -220);// options
}