function postCreate(){
    FlxG.mouse.visible = true;

    window.title = "Pibby: Apocalypse - WARNING!!!";

    titleAlphabet.y = disclaimer.y - 120;
    disclaimer.screenCenter();
    disclaimer.text = "This engine is still in a alpha state. That means majority of the features are either buggy or unfinished. If you find any bugs, please report them to the Codename Engine GitHub.\n\nAlso, this port has some stuff that can be sensitive to some people. Such as gore, flashing, etc.\nthere's a setting of it on the menu options.\n\n\nPress ENTER to continue.";
}