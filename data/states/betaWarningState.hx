var disclaimer:FunkinText;

function create(){
    FlxG.mouse.visible = true;

    window.title = "CodenameEngine: PibbyApocalypse - WARNING!!!";
    
    disclaimer = new FunkinText(16, titleAlphabet.y + titleAlphabet.height + 10, FlxG.width - 32, "", 32);
    disclaimer.alignment = CENTER;
    disclaimer.applyMarkup("This modpack has some *uncomfortalbe stuff* you can turn it off inside options menu or don't play this mod.",
        [
            new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF4444), "*")
        ]
    );
    add(disclaimer);
}