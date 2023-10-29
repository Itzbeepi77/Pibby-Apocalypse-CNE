// to make it really not messy on the main script by sepperating it
import openfl.geom.Rectangle;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import flixel.FlxG;

public function getRating(accuracy:Float):String {
    if (accuracy < 0) {
        return "?";
    }
    for (rating in ratingStuff) {
        if (accuracy < rating[1]) {
            return rating[0];
        }
    }
    return ratingStuff[ratingStuff.length - 1][0];
}

function create() {
    
if (FlxG.save.data.hudShit){
switch (hud){

case 1:// W.I hud style 
    timeTxt = new FlxText(0, 9.5, 400, "X:XX", 32);
    timeTxt.setFormat(Paths.font("vcr.ttf"), 16, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    timeTxt.scrollFactor.set();
    timeTxt.alpha = 0;
    timeTxt.borderColor = 0xFF000000;
    timeTxt.borderSize = 2;
    timeTxt.screenCenter(FlxAxes.X);

    difficultTxt = new FlxText(0, 35, 400, "", 22);
    difficultTxt.setFormat(Paths.font("vcr.ttf"), 24, dad.iconColor, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    difficultTxt.scrollFactor.set();
    difficultTxt.alpha = 1;
    difficultTxt.borderColor = 0xFF000000;
    difficultTxt.borderSize = 2;
    difficultTxt.antialiasing = true;
    difficultTxt.screenCenter(FlxAxes.X);

    timeBarBG = new FlxSprite();
    timeBarBG.x = timeTxt.x;
    timeBarBG.y = timeTxt.y + (timeTxt.height);
    timeBarBG.scale.x = 3.3;
    timeBarBG.alpha = 0;
    timeBarBG.scrollFactor.set();
    timeBarBG.color = FlxColor.BLACK;
    timeBarBG.loadGraphic(Paths.image("psychTimeBar"));
    //timeBarBG.visible = false;

    timeBar = new FlxBar(timeBarBG.x + 4, timeBarBG.y - 32, FlxBar.FILL_LEFT_TO_RIGHT, Std.int(timeBarBG.width - 8), Std.int(timeBarBG.height - 8), Conductor, 'songPosition', 0, 1);
    timeBar.scrollFactor.set();
    timeBar.createFilledBar(dad.iconColor,boyfriend.iconColor); 
if (!coloredTimeB) {
    timeBar.createFilledBar(0xFF000000,FlxColor.WHITE);
}
    timeBar.numDivisions = 400; //Toned it down to 400 to see what it would look like.
    timeBar.alpha = 0;
    timeBar.scale.x = 3.3;
    timeBar.scale.y = 1.4;
    timeBar.antialiasing = true;
    timeBar.value = Conductor.songPosition / Conductor.songDuration;
    
    //add(timeBarBG);
    insert(100, timeBarBG);
    add(timeBar);
    insert(members.indexOf(iconP2)+5, timeTxt);
    add(difficultTxt);
    songTxt = new FlxText(35, (timeBarBG.y - 25), 0, curSong, 24);
    songTxt.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    songTxt.scrollFactor.set();
    songTxt.borderSize = 3;
    songTxt.antialiasing = true;

    scoreSideTxt = new FlxText(40, (songTxt.y + 280), 0, "Score: 0",21);
    scoreSideTxt.setFormat(Paths.font("vcr.ttf"), 21, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    scoreSideTxt.borderSize = 3;
    scoreSideTxt.antialiasing = true;
    // trace(scoreSideTxt.height);

    missTxt = new FlxText(40, (scoreSideTxt.y - 35), 0, "Miss: 0",21);
    missTxt.setFormat(Paths.font("vcr.ttf"), 21, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    missTxt.borderSize = 3;
    missTxt.antialiasing = true;
    //missTxt.screenCenter(FlxAxes.X);
    // trace(missesTxt.height);

    ratingTxt = new FlxText(40, (missTxt.y - 35), 0, "Acc: -", 21);
    ratingTxt.setFormat(Paths.font("vcr.ttf"), 21, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    ratingTxt.borderSize = 3;
    ratingTxt.antialiasing = true;

    sickTxt = new FlxText(FlxG.width - 140, (ratingTxt.y + 110), 0, "Sicks: 0", 21);
    sickTxt.setFormat(Paths.font("vcr.ttf"), 21, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    sickTxt.borderSize = 3;
    sickTxt.antialiasing = true;
    //sickTxt.screenCenter(FlxAxes.X);

    goodTxt = new FlxText(FlxG.width - 140, (sickTxt.y - 35), 0, "Goods: 0", 21);
    goodTxt.setFormat(Paths.font("vcr.ttf"), 21, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    goodTxt.borderSize = 3;
    goodTxt.antialiasing = true;
    //goodTxt.screenCenter(FlxAxes.X);

    badTxt = new FlxText(FlxG.width - 140, (goodTxt.y - 35), 0, "Bads: 0", 21);
    badTxt.setFormat(Paths.font("vcr.ttf"), 21, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    badTxt.borderSize = 3;
    badTxt.antialiasing = true;
    //badTxt.screenCenter(FlxAxes.X);

    shitTxt = new FlxText(FlxG.width - 140, (badTxt.y - 35), 0, "Shits: 0", 21);
    shitTxt.setFormat(Paths.font("vcr.ttf"), 21, FlxColor.WHITE, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    shitTxt.borderSize = 3;
    shitTxt.antialiasing = true;
    //shitTxt.screenCenter(FlxAxes.X);
    add(songTxt);
    add(scoreSideTxt);
    add(missTxt);
    add(ratingTxt);
    add(sickTxt);
    add(goodTxt);
    add(badTxt);
    add(shitTxt);

    songTxt.cameras = [camHUD];
    scoreSideTxt.cameras = [camHUD];
    missTxt.cameras = [camHUD];
    ratingTxt.cameras = [camHUD];
    sickTxt.cameras = [camHUD];
    goodTxt.cameras = [camHUD];
    badTxt.cameras = [camHUD];
    shitTxt.cameras = [camHUD];

    timeBarBG.x = timeBar.x - 4;
    timeBarBG.y = timeBar.y - 4;

    timeBar.cameras = [camHUD];
    timeBarBG.cameras = [camHUD];
    timeTxt.cameras = [camHUD];
    difficultTxt.cameras = [camHUD];
    
case 0:// default
    timeTxt = new FlxText(0, 19, 400, "X:XX", 32);
    timeTxt.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    timeTxt.scrollFactor.set();
    timeTxt.alpha = 0;
    timeTxt.borderColor = 0xFF000000;
    timeTxt.borderSize = 2;
    timeTxt.screenCenter(FlxAxes.X);

    hudTxt = new FlxText(0, 685, FlxG.width, "Score: 0 | Misses: 0 | Rating: ?");
    hudTxt.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    hudTxt.borderSize = 1.25;
    hudTxt.screenCenter(FlxAxes.X);

    timeBarBG = new FlxSprite();
    timeBarBG.x = timeTxt.x;
    timeBarBG.y = timeTxt.y + (timeTxt.height / 4);
    timeBarBG.alpha = 0;
    timeBarBG.scrollFactor.set();
    timeBarBG.color = FlxColor.BLACK;
    timeBarBG.loadGraphic(Paths.image("psychTimeBar"));

    timeBar = new FlxBar(timeBarBG.x + 4, timeBarBG.y + 4, FlxBar.FILL_LEFT_TO_RIGHT, Std.int(timeBarBG.width - 8), Std.int(timeBarBG.height - 8), Conductor, 'songPosition', 0, 1);
    timeBar.scrollFactor.set();
    timeBar.createFilledBar(0xFF000000,dad.iconColor);
if (!coloredTimeB) {
    timeBar.createFilledBar(0xFF000000,FlxColor.WHITE);
}
    timeBar.numDivisions = 400; //Toned it down to 400 to see what it would look like.
    timeBar.alpha = 0;
    timeBar.value = Conductor.songPosition / Conductor.songDuration;
    add(timeBarBG);
    add(timeBar);
    add(timeTxt);

    timeBarBG.x = timeBar.x - 4;
    timeBarBG.y = timeBar.y - 4;

    hudTxt.cameras = [camHUD];
    timeBar.cameras = [camHUD];
    timeBarBG.cameras = [camHUD];
    timeTxt.cameras = [camHUD];
}}
}