function create(){
    window.title = "Pibby: Apocalypse - Credits Menu";
    FlxG.mouse.visible = true;
    FlxG.sound.playMusic(Paths.music("creditsMenu"));

    bg = new FlxSprite(0, 0).loadGraphic(Paths.image("pacredits/bg"));
    bg.screenCenter();
    bg.scale.set(1, 1);
    bg.scrollFactor.set();
    add(bg);
}
function postCreate(){
    magenta.destroy();
}