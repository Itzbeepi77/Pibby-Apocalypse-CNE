function create(){
    FlxG.mouse.visible = true;
    //FlxG.sound.playMusic(Paths.music("creditsmenu"));

    bg = new FlxSprite(0, 0).loadGraphic(Paths.image("pacredits/bg"));
    bg.screenCenter();
    bg.scale.set(1, 1);
    add(bg);
}
function postCreate(){
    magenta.destroy();
}