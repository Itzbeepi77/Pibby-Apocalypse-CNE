/**
** DON'T TOUCH ANY OF THIS BUT, IF YOU KNOW HOW TO CODE YOU ARE SAFE :]
**/
import openfl.geom.Rectangle;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import flixel.FlxG;
import flixel.FlxCamera;
import funkin.backend.FunkinSprite;
import funkin.backend.FunkinText;
import funkin.game.HealthIcon;

public var colouredBar = (dad != null && dad.xml != null && dad.xml.exists("color")) ? CoolUtil.getColorFromDynamic(dad.xml.get("color")) : 0xFFFFFFFF;
public var colouredBarG = (gf != null && gf.xml != null && gf.xml.exists("color")) ? CoolUtil.getColorFromDynamic(gf.xml.get("color")) : 0xFFFFFFFF;
public var colouredBarB = (boyfriend != null && boyfriend.xml != null && boyfriend.xml.exists("color")) ? CoolUtil.getColorFromDynamic(boyfriend.xml.get("color")) : 0xFFFFFFFF;

// this is for the difficulty name on curSong
public var difficultTxt:FunkinText;

// song name
public var songTxt:FunkinText;

// ratings
var sicks:Int = 0;
var goods:Int = 0;
var bads:Int = 0;
var shits:Int = 0;
// in Psych style is for the rating like how good you are when hitting the notes.
// in W.I style is for how much you hitting the notes and it shows how good you are.

public var bfIntro:Character;

public var pibbyIntro:Character;

public var black = new FlxSprite();

public var countNum = new FlxSprite();

var CNlogo = new FunkinSprite();// nope I'm not gonna add aslogo since it kinda made the cn logo dissappeared

public var jake = new FlxSprite();// jake icon

public var jake2 = new FlxSprite();// jake icon

public var camHUD2:FlxCamera;// extra cams for some reasons

public var camHUD3:HudCamera;// extra cams2 for some reasons

public var coloredTimeB = Options.colorHealthBar;// for timeBar color's when you checked the colorHealthBar options

public var camMoving:Bool = true;

public var gfIcons:HealthIcon;// gfIcons icons

public var bar:FlxSprite;// finn & jake bars

// the shaders
public var glitches2 = new CustomShader("individualGlitches Missingno");
public var chromaticAberration = new CustomShader("ChromaticAbberation");
public var chromaticAberrationHUD = new CustomShader("ChromaticAbberationHUD");

// camera Angle move when playing left and right anims
var camAngle = 0;

// introSounds
introSounds = ['PA/1', 'PA/2', 'PA/3', 'PA/go'];

// for 3,2,1,GO images, I made it null since the thingy is animated
introSprites = [null, null, null, null];

// how long does the intro thingy ends
introLength = 6;

function postCreate() {

    FlxG.mouse.visible = false;

    FlxG.cameras.add(camHUD3 = new HudCamera(), false);
    camHUD3.bgColor = FlxColor.TRANSPARENT;

    FlxG.cameras.add(camHUD2 = new FlxCamera(), false);
    camHUD2.bgColor = FlxColor.TRANSPARENT;

    difficultTxt = new FunkinText(0, 35, 400, "", 22);
    difficultTxt.setFormat(Paths.font("vcr.ttf"), 24, dad.iconColor, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    difficultTxt.scrollFactor.set();
    difficultTxt.alpha = 1;
    difficultTxt.borderColor = 0xFF000000;
    difficultTxt.borderSize = 2;
    difficultTxt.antialiasing = true;
    difficultTxt.screenCenter(FlxAxes.X);
    difficultTxt.shader = glitches2;

    add(difficultTxt);
    songTxt = new FunkinText(35, 10, 0, curSong, 24);
    songTxt.setFormat(Paths.font("vcr.ttf"), 24, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    songTxt.scrollFactor.set();
    songTxt.borderSize = 3;
    songTxt.antialiasing = true;
    insert(members.indexOf(iconP1)+3, songTxt);

    songTxt.cameras = [camHUD];
    difficultTxt.cameras = [camHUD];
    difficultTxt.text = "[" + PlayState.difficulty + "]";

    if (curSong == "what-am-i"){
    var dad2nd = strumLines.members[3].characters[0];
    var dad3rd = strumLines.members[4].characters[0];

    remove(dad);
    remove(dad2nd);
    remove(dad3rd);

    add(dad3rd);
    add(dad2nd);
    add(dad);

    dad2nd.x = dad.x + 50;

    dad3rd.y = dad2nd.y - 150;
    dad3rd.x = dad2nd.x - 250;
    }
    
    CNlogo = new FunkinSprite(675, 360);
    CNlogo.loadGraphic(Paths.image("cnlogo"));
    CNlogo.scrollFactor.set();
    CNlogo.setGraphicSize(Std.int(CNlogo.width * 0.18));
    CNlogo.alpha = 0.5;
    add(CNlogo);
    //insert(24, CNlogo);
        
    CNlogo.cameras = [camHUD2];
    CNlogo.zoomFactor = 0;
    
    gfIcons = new HealthIcon(gf.icon!=null?gf.icon:gf.curCharacter, true);
    gfIcons.visible = false;
    gfIcons.cameras = [camHUD];
    gfIcons.health = health;
	insert(members.indexOf(healthBar) + 3, gfIcons);
    
    bar = new FlxSprite(190, 490);
    bar.frames = Paths.getSparrowAtlas('PA Stuff/healthbar/iconbar');
    bar.animation.addByPrefix('bar1', 'Icons Bar0', 24, true);
    bar.scrollFactor.set();
    bar.updateHitbox();
    bar.alpha = 1;
    bar.antialiasing = true;
    bar.cameras = [camHUD];
	insert(members.indexOf(iconP1)-2, bar);
    bar.animation.play('bar1', true, false, 0);
    if (curSong == "mindless"){
        bar.alpha = 0.0001;
    }
    if (curSong == 'retcon' || curSong == 'my-amazing-world'){
        bar.visible = false;
    }
    if (!downscroll){
        bar.y = 580;
    }
    
    countNum = new FlxSprite(350, 200);// countdown numbers thingys
    countNum.frames = Paths.getSparrowAtlas('Numbers');
    countNum.animation.addByPrefix('1', '1', 24, false);
    countNum.animation.addByPrefix('2', '2', 24, false);
    countNum.animation.addByPrefix('3', '3', 24, false);
    countNum.animation.addByPrefix('Go', 'Go', 24, false);
    countNum.updateHitbox();
    countNum.alpha = 0.0001;
    countNum.cameras = [camHUD3];
    countNum.antialiasing = true;
	insert(members.indexOf(boyfriend)+1, countNum);
    
	bfIntro = new Character(0, 0, "bfIntro", true);
	bfIntro.alpha = 0.0001;
	insert(members.indexOf(boyfriend)+1, bfIntro);
    
	pibbyIntro = new Character(0, 0, "pibbyIntro", false);
	pibbyIntro.alpha = 0.0001;
	insert(members.indexOf(gf)+1, pibbyIntro);

    switch(curSong){
        case "forgotten-world", "come-along-with-me", 'mindless', "my-amazing-world":
            black.makeGraphic(6000, 6500, FlxColor.BLACK);
            black.y = "-100";
            black.alpha = 1;
            black.cameras = [camHUD];
            insert(1, black);

        case "no-hero-remix":
            camMoving = false;

        case 'suffering-siblings', 'blessed-by-swords', 'brotherly-love', 'what-am-i', 'retcon':
            camHUD.visible = false;// for the countdown thingy
    }

    switch (curSong){
    case 'forgotten-world', 'retcon', 'my-amazing-world', 'childs-play':
        FlxG.state.forEachOfType(FlxText, text -> text.font = Paths.font("Gumball.ttf"));
        songTxt.font =  Paths.font("Gumball.ttf");
    case 'mindless', 'blessed-by-swords', 'brotherly-love', 'suffering-siblings', 'come-along-with-me', 'what-am-i':
        FlxG.state.forEachOfType(FlxText, text -> text.font = Paths.font("Finn.ttf"));
        songTxt.font =  Paths.font("Finn.ttf");
    }

    window.title = "Pibby: Apocalypse - Now Playing | " + curSong + " | " + "DIFFICULTY: " + "< " + PlayState.difficulty + " >";

    healthBar.scale.set(0.65, 3);
    healthBarBG.scale.set(0.65, 2.5);
    healthBarBG.y -= 15;
    healthBarBG.x -= 400;
    healthBar.y -= 15;
    healthBar.x -= 400;

    // positioning the intro bf & intro pibby
    bfIntro.x = boyfriend.x;
    bfIntro.y = boyfriend.y;
    pibbyIntro.x = gf.x;
    pibbyIntro.y = gf.y;
    
    if (downscroll){
        CNlogo.y = -120;
    } else {
        CNlogo.y = 360;
    }
    
    if (!downscroll){
        difficultTxt.y = 540;
        songTxt.y = 680;
    }

    if (curSong == "come-along-with-me"){// scaling part
        if (boyfriend.curCharacter == "newbf"){
            boyfriend.scale.set(0.8,0.8);
        }
        if (dad.curCharacter == "finn-sword-shad"){
            dad.scale.set(0.8,0.8);
        }
    }

    if (curSong == 'mindless'){
        iconP1.visible = false;
        iconP2.visible = false;
    }

    if (curSong == "forgotten-world"){
    for (i in [missesTxt, accuracyTxt, scoreTxt]) {
        i.visible = false;
    }}

    // glitch strum shits
    switch(boyfriend.curCharacter){
        case "gumball", "finn-R", "darwin-fw", "dad", "gumball", "finn-R", "jake", "finn-slash", "finn-sword":
            if (!FlxG.save.data.shaderShit){
                for (i in playerStrums.members){
                    i.shader = glitches2;
                }
            }

        case "finn-sword-shad", "finncawm", "finncawm_reveal", "finnanimstuff", "finn-hurt", "badfinn", "midfin", "finnfalse":
            if (!FlxG.save.data.shaderShit){
                for (i in playerStrums.members){
                    i.shader = glitches2;
                }
            }
    }
    switch(dad.curCharacter){
        case "gumball", "finn-R", "darwin-fw", "dad", "gumball", "finn-R", "jake", "finn-slash", "finn-sword":
            if (!FlxG.save.data.shaderShit){
                for (i in cpuStrums.members){
                    i.shader = glitches2;
                }
            }

        case "finn-sword-shad", "finncawm", "finncawm_reveal", "finnanimstuff", "finn-hurt", "badfinn", "midfin", "finnfalse":
            if (!FlxG.save.data.shaderShit){
                for (i in cpuStrums.members){
                    i.shader = glitches2;
                }
            }
    }

	/*if (!FlxG.save.data.shaderShit){
        camGame.addShader(chromaticAberration);
        camHUD.addShader(chromaticAberrationHUD);
    }*/

}
function onSongStart() {

    switch(curSong){
        case 'forgotten-world':
            FlxTween.tween(black, {alpha: 0.0001}, 22, {ease: FlxEase.sineInOut});

        case 'my-amazing-world':
            FlxTween.tween(black, {alpha: 0.0001}, 11, {ease: FlxEase.sineInOut});

        case 'childs-play':
            camera.flash(FlxColor.BLACK, 26);
            curCameraTarget = 0;
            bfIntro.alpha = 0.0001;// to remove it after the countdown ends
            boyfriend.alpha = 1;

        case 'suffering-siblings', 'brotherly-love', 'blessed-by-swords', 'what-am-i':
            bfIntro.alpha = 0.0001;// to remove it after the countdown ends
            boyfriend.alpha = 1;
            pibbyIntro.alpha = 0.0001;// to remove it after the countdown ends
            gf.alpha = 1;
    }
    if (curSong == 'come-along-with-me'){
        FlxTween.tween(black, {alpha: 0.0001}, 8, {ease: FlxEase.sineInOut});
        boyfriend.alpha = 0.0001;// idk why, but it doesn't worked so I had to do this also don't touch it mafaka >:(
        gf.alpha = 0.0001;
        gf.visible = false;
    }
    if (curSong == 'mindless'){
        FlxTween.tween(black, {alpha: 0.0001}, 0.5, {ease: FlxEase.sineInOut});
    }
    if (curSong == 'suffering-siblings'){
        camera.flash(FlxColor.BLACK, 10);
        camMoving = false;
        curCameraTarget = -1;
        defaultCamZoom = 0.6;
        camera.zoom = 0.6;
        camFollow.setPosition(1700, 900);
    }
    if (curSong == 'what-am-i'){
        camera.flash(FlxColor.BLACK, 10);
    }
    if (curSong == 'brotherly-love' || curSong == 'blessed-by-swords' || curSong == 'what-am-i'){// yea fuck it also do not change any of this stuff
        camMoving = true;
        curCameraTarget = 0;
    }
    if (curSong == 'blessed-by-swords'){
        boyfriend.alpha = 0.5;
    }
    if (curSong == 'retcon'){
        camera.flash(FlxColor.BLACK, 10);
        curCameraTarget = 0;
        bfIntro.alpha = 0.0001;// to remove it after the countdown ends
        boyfriend.alpha = 1;
    }
    countNum.alpha = 0.0001;// hides the numbers thingy when countdown ends


}
function update(elapsed:Float) {

    if (!FlxG.save.data.shaderShit){
        tweenchrom = FlxTween.num(5, 1, 0.025, {ease: FlxEase.quadIn}, function(val:Float) {
            glitches2.binaryIntensity = val;
        });
    }
}
function stepHit(){
    // uhh
    if (curSong == "childs-play"){
        if (curStep == 416){
            for (i in cpuStrums.members){
                i.shader = glitches2;
            }
            
        }
        if (curStep == 2192){
            FlxTween.tween(camera, {zoom: 2}, 10, {ease: FlxEase.sineInOut});
        }
    }
    if (curSong == 'retcon'){
        if (curStep == 1){
        FlxTween.tween(camera, {zoom: 0.7}, 18, {
            ease: FlxEase.sineInOut,
            onComplete:
            new FlxTimer().start(18, function(tmr){
            defaultCamZoom = 0.7;})
        });

        if (curStep == 1420){
            camera.shake(0.04, 0.1);
            camHUD.shake(0.04, 0.1);
        }
    }}
    if (curSong == "come-along-with-me"){
        if (curStep == 384 || curStep == 1560){
            if (!FlxG.save.data.shaderShit) dad.shader = glitches2;
        }
        if (curStep == 384){
            if (!FlxG.save.data.shaderShit){
                for (i in cpuStrums.members){
                    i.shader = glitches2;
                }
            }
        }
        if (curStep == 1568){
            if (!FlxG.save.data.shaderShit) dad.shader = null;
        }
        if (curStep == 2432){
            camHUD.visible = false;
        }
        if (curStep == 1787){
            boyfriend.angle = 180;
            boyfriend.x = 770;
            boyfriend.y = -700;
            dad.x = 100;
            dad.y = 300;
        }
        if (curStep == 1792){
            downscroll = false;
            boyfriend.cameras = [camHUD];
            dad.cameras = [camHUD];
            FlxTween.tween(dad, {y: 100}, 1, {ease: FlxEase.quadInOut});
            FlxTween.tween(boyfriend, {y: -500}, 1, {ease: FlxEase.quadInOut});
        }
    }

    if (curSong == "suffering-siblings"){
        switch(curStep){
            case 128, 160, 192, 256, 384, 448, 504, 512, 576, 640, 704, 768, 832, 896, 960, 1024, 1088, 1280, 1408, 1472:
                camGame.flash();
            case 1536, 1600, 2080, 2336, 2368, 2400, 2464, 2528, 2592, 2656, 2720, 2784, 2848, 2912, 2976, 3008, 3040, 3104, 3168:
                camGame.flash();
            case 3224, 3296, 3648:
                camGame.flash();
            case 3232:
                camGame.flash(FlxColor.WHITE, 1.2);
            case 3360, 3392:
                camHUD.flash();
            case 1152:
                camGame.flash(FlxColor.BLACK, 2.5);
            case 1664:
                camGame.flash(FlxColor.BLACK, 10);
                camHUD.flash();
        }

        if (curStep == 3776){
            camGame.alpha = 0.0001;
        }

        if (curStep == 128){
            camMoving = true;
        }
    }

    if (curSong == "mindless"){
        if (curStep == 340){
            FlxTween.tween(bar, {alpha: 1}, 0.5);
        }
    }

    if (curSong == "forgotten-world"){
        if (curStep == 1442){
            for (i in playerStrums.members){
                i.shader = glitches2;
            }
        }
    }
}
function postUpdate(){
    if (curSong == 'retcon' || curSong == 'my-amazing-world' || curSong == 'childs-play'){
    iconP1.x = 440;
    iconP2.x = 0;
    healthBar.alpha = 1;
    healthBarBG.alpha = 1;
    } else {
        healthBar.alpha = 0.0001;
        healthBarBG.alpha = 0.0001;
        iconP1.x = 620;
        iconP2.x = 520;
    }
    if (curSong == 'retcon'){
    gfIcons.x = iconP1.x + 80;
    gfIcons.y = iconP1.y + 20;
    } else {
        gfIcons.x = iconP1.x;
        gfIcons.y = iconP1.y;
    }

    // for icon glitching when they lose
    if (!FlxG.save.data.shaderShit){
    if (health < 0.4) {// bf
        iconP1.shader = glitches2;
      } else {
        iconP1.shader = null;
    }

    if (health < 0.2){// gf
        gfIcons.shader = glitches2;
    } else {
        gfIcons.shader = null;
    }

    if (health > 1.6) {// opponent
        iconP2.shader = glitches2;
        jake2.shader = glitches2;
      } else {
        iconP2.shader = null;
        jake2.shader = null;
    }}
    if (curSong == 'retcon') {gfIcons.scale.set(0.7, 0.7);} else {gfIcons.scale.set(iconP1.scale.x, iconP1.scale.y);}
    if (curSong == "suffering-siblings"){
        gfIcons.x = 950;
    }
    
    switch(curSong){// switching Icon's when camera is focused on gf
        case "my-amazing-world":
            if (curCameraTarget == 2){
			if (!PlayState.opponentMode) {
                iconP1.visible = false;
                gfIcons.visible = true;
			}} else if (curCameraTarget == 1){
                iconP1.visible = true;
                gfIcons.visible = false;
            }

        case 'retcon':
            gfIcons.visible = true;

        case "blessed-by-swords":
            iconP1.visible = false;
            gfIcons.visible = true;

        case "what-am-i":
            jake.visible = true;

        case "suffering-siblings":
            gfIcons.visible = true;
            jake.visible = true;
        
        case "forgotten-world" | "childs-play" | "come-along-with-me" | "no-hero-remix":// bar.
            bar.visible = false;
            bar.alpha = 0.0001;
    }

    //umm
    if (curSong == "come-along-with-me" || curSong == "forgotten-world"){
            iconP1.visible = false;
            iconP2.visible = false;
    }
    
    if (camMoving){
    switch (strumLines.members[curCameraTarget].characters[0].getAnimName()) {
        case "singLEFT": 
        camFollow.x -= 20;
        camAngle = -1;
        case "singDOWN": 
        camFollow.y += 20;
        case "singUP": 
        camFollow.y -= 20;
        case "singRIGHT": 
        camFollow.x +=20;
        camAngle = 1;
    }
    if (camAngle != 0) {camAngle = (lerp(camAngle, 0, 0.088));}
    camera.angle = (lerp(camera.angle, camAngle, 0.088));
    }

    /*if (curBeat % 4 == 0 && camZooming && !FlxG.save.data.shaderShit){
        tweenchrom = FlxTween.num(0.4, 0, 0.5, {ease: FlxEase.sineInOut}, function(val:Float) {
            chromaticAberration.amount = val;
        });
        tweenchrom = FlxTween.num(0.2, 0, 0.5, {ease: FlxEase.sineInOut}, function(val:Float) {
            chromaticAberrationHUD.amount = val;
        });
    }*/

    
}
function onPlayerHit(note:NoteHitEvent) {
    // Idfk

    if (FlxG.save.data.ratingHUD){
    PlayState.instance.comboGroup.cameras = [camHUD];
    comboGroup.x = 560;
    comboGroup.y = 120;
    }

    var rates = note.rating;

    switch(rates){
        case "sick":
            sicks++;
        case "good":
            goods++;
        case "bad":
            bads++;
        case "shit":
            shits++;
    }

    var curNotes = note.noteType;

    switch(curNotes){

        case "Both Char Sing":
            if (!PlayState.opponentMode){
            boyfriend.playAnim("sing" + singDir[note.direction], true);
            gf.playAnim("sing" + singDir[note.direction], true);
            note.cancelAnim();
            } else {
                dad.playAnim("sing" + singDir[note.direction], true);
                strumLines.members[3].characters[0].playAnim("sing" + singDir[note.direction], true);
                note.cancelAnim();
            }
    }
}
function onDadHit(note:NoteHitEvent) {
    
    if (!FlxG.save.data.healthShit){
        if (PlayState.opponentMode) {if (health < 1.9) {health += 0.017;}// for healthdrain when you play in opponentMode
    } else {
        switch(dad.curCharacter) {
            case "dad", "gumball", "finn-R", "jake", "finn-slash", "finn-sword", "finn-sword-shad", "finncawm", "finncawm_reveal", "finncawm_start_new", "finnanimstuff", "finn-hurt":
                if (!FlxG.save.data.healthShit) {if (health > 0.1) {health -= 0.017;}}
            }
        }
    }

    var curNotes = note.noteType;

    switch(curNotes){

        case "Both Char Sing":
            if (PlayState.opponentMode){
                boyfriend.playAnim("sing" + singDir[note.direction], true);
                gf.playAnim("sing" + singDir[note.direction], true);
                note.cancelAnim();
            } else {
                dad.playAnim("sing" + singDir[note.direction], true);
                strumLines.members[3].characters[0].playAnim("sing" + singDir[note.direction], true);
                note.cancelAnim();
            }
    }
}