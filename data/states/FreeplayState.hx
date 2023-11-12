import flixel.util.FlxColor;
import flixel.util.FlxAxes;
import flixel.text.FlxTextBorderStyle;
import FreeplayState;

var chromaticAberration = new CustomShader("ChromaticAbberation");

var boxPage:FlxSprite;

var weekBg:String = "Mindless";
var currentWeek:String;
var freeplayText:FlxText;
// var indexs:Array = [5, 9, 15];

function create() {
    // boxPage = new FlxSprite(scoreText.x - 7, 100).makeGraphic(600, 600, 0xFF000000);
    // boxPage.updateHitbox();
    // boxPage.alpha = 0.6;
    // add(boxPage);
    //     for (i in 0...weeks.length) {
    //     var text:FlxText = new FlxText(scoreText.x - 7, i * 40, 200, weeks[i] + " ");
    //     text.setFormat("fonts/freeplay.ttf", 25, FlxColor.WHITE, "CENTER");
    //     text.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2);
    //     text.antialiasing = true;
    //     add(text);
    // }
    FlxG.sound.playMusic(Paths.music("fpmenu"));
    FlxG.camera.addShader(chromaticAberration);

    vignette = new FlxSprite(0, 0).loadGraphic(Paths.image("gradient"));
    vignette.screenCenter();
    vignette.scale.set(1, 1);
    add(vignette);

    stageBox = new FlxSprite(0, 0).loadGraphic(Paths.image("menus/fpmenu/stageBox"));
    stageBox.screenCenter();
    stageBox.scale.set(1, 1);
    insert(members.indexOf(bg)+1, stageBox);
    
    bgGlitch = new FlxSprite(0, 0);
    bgGlitch.frames = Paths.getSparrowAtlas("menus/fpmenu/background");
    bgGlitch.animation.addByPrefix('idle', 'background idle', 24, true);
    bgGlitch.scrollFactor.set();
    bgGlitch.screenCenter();
    bgGlitch.scale.set(1,1);
    bgGlitch.antialiasing = true;
    insert(members.indexOf(stageBox)-1, bgGlitch);
    bgGlitch.animation.play('idle', true);

    scoreText.alpha = 0.0001;
    coopText.y = scoreText.y + 36;

    scoreBG.alpha = 0.0001;

}

function postCreate() {
    diffText.destroy();

    freeplayText = new FlxText(490, 5, 700);
    freeplayText.setFormat("fonts/vcr.ttf", 25, FlxColor.WHITE, "CENTER");
    freeplayText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2);
    freeplayText.antialiasing = true;
    add(freeplayText);
}

function postUpdate() {
    // trace(songs[curSelected].name + " || " + currentWeek);
    window.title = "Pibby: Apocalypse - FreePlay | " + songs[curSelected].name + " | " + "DIFFICULTY: " + "< " + PlayState.difficulty + " >";

    CoolUtil.loadAnimatedGraphic(bg, Paths.image("menus/fpmenu/stage/" + weekBg));
    freeplayText.text = "Current week: " + currentWeek;

    switch(songs[curSelected].name) {

        case "Blessed-By-Swords" | "Brotherly-Love" | "Suffering-Siblings":
            currentWeek = "Adventure Time";
            weekBg = "Suffering Siblings";

        case "Mindless":
            currentWeek = "Adventure Time";
            weekBg = "Mindless";

        case "Come-Along-With-Me":
            currentWeek = "Come Along With Me..";
            weekBg = "Come Along With Me";

        case "No-Hero-Remix":
            currentWeek = "FUCK YOU BOY...";
            weekBg = "Mindless";

        case "My-Amazing-World":
            currentWeek = "The Amazing Wolrd Of Gumball";
            weekBg = "My Amazing World";

        case "Retcon":
            currentWeek = "The Amazing Wolrd Of Gumball";
            weekBg = "Retcon";

        case "Forgotten-World":
            currentWeek = "The Amazing Wolrd Of Gumball";
            weekBg = "Forgotten World";

        case "Childs-Play":
            currentWeek = "The Amazing Wolrd Of Gumball";
            weekBg = "Child's Play";

        default:
            currentWeek = "some other week";
            weekBg = "Mindless";
    }
    // if (FlxG.keys.justPressed.E && curSelected != null) {
    //     changeSelection(3);
    // }

    // else if (FlxG.keys.justPressed.Q && curSelected != null) {
    //     changeSelection(-3);
    // }
    changeSelection( (FlxG.keys.justPressed.Q ? -3 : 0) + (FlxG.keys.justPressed.E ? 3 : 0) );
}
function beatHit(curBeat) {
        chromaticAberration.amount = 0.5;
        FlxG.camera.zoom += 0.090;
        FlxTween.tween(FlxG.camera, { zoom: 1 }, 0.2);
}
