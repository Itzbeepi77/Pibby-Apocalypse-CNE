/**
** DON'T TOUCH ANY OF THIS BUT. IF YOU KNOW HOW TO CODE YOU ARE SAFE :]
** Some changes and also the ui script is sepperated so you will be easier to see it
** and some of additional
** again.. DON'T TOUCHIES >:[
**/
import openfl.geom.Rectangle;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import flixel.FlxG;
import flixel.FlxCamera;
import funkin.backend.FunkinSprite;
import funkin.game.HealthIcon;

public var colouredBar = (dad != null && dad.xml != null && dad.xml.exists("color")) ? CoolUtil.getColorFromDynamic(dad.xml.get("color")) : 0xFFFFFFFF;
public var colouredBarG = (gf != null && gf.xml != null && gf.xml.exists("color")) ? CoolUtil.getColorFromDynamic(gf.xml.get("color")) : 0xFFFFFFFF;
public var colouredBarB = (boyfriend != null && boyfriend.xml != null && dad.xml.exists("color")) ? CoolUtil.getColorFromDynamic(boyfriend.xml.get("color")) : 0xFFFFFFFF;
// timeBarBG for uhh well uhhmm you will see it in gameplay
public var timeBarBG:FlxSprite;

// timeBar uhh well you know, you know it..
public var timeBar:FlxBar;

// timeTxt for like how many time for the song lenght
public var timeTxt:FlxText;

// this is for the difficulty name on curSong when you you choose W.I hudStyle (1)
public var difficultTxt:FlxText;

// this is for info stuff when you choose the Psych hudStyle (0)
public var hudTxt:FlxText;

// misses indicator for W.I hudStyle (1)
public var missTxt:FlxText;

// score indicator for W.I hudStyle (1)
public var scoreSideTxt:FlxText;

// rating indicator for W.I hudStyle (1)
public var ratingTxt:FlxText;

// song name for W.I hudStyle (1)
public var songTxt:FlxText;

// sicks indicator for W.I hudStyle (1)
public var sickTxt:FlxText;

// goods indicator for W.I hudStyle (1)
public var goodTxt:FlxText;

// bads indicator for W.I hudStyle (1)
public var badTxt:FlxText;

// shits indicator for W.I hudStyle (1)
public var shitTxt:FlxText;

// hudTxtTween for Psych hudStyle (0)
public var hudTxtTween:FlxTween;

// the rest of the Psych hudStyle (1)
public var ratingFC:String = "FC";
public var ratingStuff:Array<Dynamic> = [
    ['You Suck!', 0.2], //From 0% to 19%
    ['Shit', 0.4], //From 20% to 39%
    ['Bad', 0.5], //From 40% to 49%
    ['Bruh', 0.6], //From 50% to 59%
    ['Meh', 0.69], //From 60% to 68%
    ['Nice', 0.7], //69%
    ['Good', 0.8], //From 70% to 79%
    ['Great', 0.9], //From 80% to 89%
    ['Sick!', 1], //From 90% to 99%
    ['Perfect!!', 1] //The value on this one isn't used actually, since Perfect is always "1"
];

// ratings for both of the hudStyle's
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
var CNlogo = new FunkinSprite();
public var jake = new FlxSprite();// jake icon
public var jake2 = new FlxSprite();// jake icon
public var hud:Int = FlxG.save.data.hudStyle; // this is for hud style just like W.I mod
public var camHUD2:FlxCamera;// extra cams for some reason's
public var camHUD3:HudCamera;// extra cams2 for some reason's
public var coloredTimeB = Options.colorHealthBar;// for timeBar color's when you checked the colorHealthBar options
public var camMoving:Bool = true;
public var gfIcons:HealthIcon;// gfIcons icons
public var bar:FlxSprite;// finn & jake bars

// the shaders
public var glitches2 = new CustomShader("individualGlitches Missingno");
public var mawVHS = new CustomShader("MAWVHS");
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

function create() {
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

    FlxG.cameras.add(camHUD3 = new HudCamera(), false);
    camHUD3.bgColor = FlxColor.TRANSPARENT;

    FlxG.cameras.add(camHUD2 = new FlxCamera(), false);
    camHUD2.bgColor = FlxColor.TRANSPARENT;

    CNlogo = new FunkinSprite(675, 360);
    CNlogo.loadGraphic(Paths.image("cnlogo"));
    CNlogo.scrollFactor.set();
	CNlogo.setGraphicSize(Std.int(CNlogo.width * 0.18));
    CNlogo.alpha = 0.5;
    add(CNlogo);
    //insert(24, CNlogo);

    CNlogo.cameras = [camHUD2];
    CNlogo.zoomFactor = 0;
    
    bar = new FlxSprite(190, 490);
    bar.frames = Paths.getSparrowAtlas('PA Stuff/healthbar/iconbar');
    bar.animation.addByPrefix('bar1', 'Icons Bar0', 24, true);
    bar.scrollFactor.set();
    bar.updateHitbox();
    bar.alpha = 1;
    bar.antialiasing = true;
    bar.cameras = [camHUD];
    add(bar);
    bar.animation.play('bar1', true, false, 0);
    
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
	bfIntro.visible = false;
	insert(members.indexOf(boyfriend)+1, bfIntro);
    
	pibbyIntro = new Character(0, 0, "pibbyIntro", false);
	pibbyIntro.alpha = 0.0001;
	insert(members.indexOf(gf)+1, pibbyIntro);

    switch(curSong){
        case "forgotten-world" | "come-along-with-me" | 'mindless':
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
    
    if (curSong == "mindless"){
        bar.alpha = 0.0001;
    }
    
	if (!FlxG.save.data.shaderShit){
        camGame.addShader(chromaticAberration);
        camHUD.addShader(chromaticAberrationHUD);
    }

	importScript("songs/extra scripts/HUDstyle");

	importScript("data/scripts/opponentStrumG");
	glitchNotesForBF = false;

}
function onSongStart() {

    if (FlxG.save.data.hudShit && hud == 0 || hud == 1) {
    if (timeBar != null) {
        FlxTween.tween(timeBar, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
    }
    if (timeBarBG != null) {
        FlxTween.tween(timeBarBG, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
    }
    if (timeTxt != null) {
    FlxTween.tween(timeTxt, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
    }}

    switch(curSong){
        case 'forgotten-world':
            FlxTween.tween(black, {alpha: 0.0001}, 22, {ease: FlxEase.sineInOut});

        case 'my-amazing-world':
            camera.flash(FlxColor.BLACK, 6.5);
            curCameraTarget = 0;
            bfIntro.visible = false;// to remove it after the countdown ends
            boyfriend.alpha = 1;

        case 'childs-play':
            camera.flash(FlxColor.BLACK, 26);
            curCameraTarget = 0;
            bfIntro.visible = false;// to remove it after the countdown ends
            boyfriend.alpha = 1;

        case 'suffering-siblings', 'brotherly-love', 'blessed-by-swords', 'what-am-i':
            bfIntro.visible = false;// to remove it after the countdown ends
            boyfriend.alpha = 1;
            pibbyIntro.alpha = 0.0001;// to remove it after the countdown ends
            gf.alpha = 1;
    }
    if (curSong == 'come-along-with-me'){
        FlxTween.tween(black, {alpha: 0.0001}, 8, {ease: FlxEase.sineInOut});
        boyfriend.alpha = 0.0001;// idk why, but it doesn't worked so I had to do this also don't touch it mafaka >:(
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
    if (curSong == 'retcon'){
        camera.flash(FlxColor.BLACK, 10);
        curCameraTarget = 0;
        bfIntro.visible = false;// to remove it after the countdown ends
        boyfriend.alpha = 1;
    }
    countNum.alpha = 0.0001;// hides the numbers thingy when countdown ends


}
function update(elapsed:Float) {

    if (curCameraTarget == 1){
        for (i in [missesTxt, accuracyTxt, scoreTxt]) {
            i.color = colouredBarB;
        }
    } else if (curCameraTarget == 2){
        for (i in [missesTxt, accuracyTxt, scoreTxt]) {
            i.color = colouredBarG;
        }
    }

    if (FlxG.save.data.hudShit){
    if (hud == 0 || hud == 1){

    if (hud == 0){
    if (curCameraTarget == 1){
        for (i in [hudTxt]) {
            i.color = colouredBarB;
        }
    } else if (curCameraTarget == 2){
        for (i in [hudTxt]) {
            i.color = colouredBarG;
        }
    }}

    var pos = Math.max(Conductor.songPosition, 0);
    var timeNow = Math.floor(pos / 60000) + ":" + CoolUtil.addZeros(Std.string(Math.floor(pos / 1000) % 60), 2);
    var length = Math.floor(inst.length / 60000) + ":" + CoolUtil.addZeros(Std.string(Math.floor(inst.length / 1000) % 60), 2);
    if (inst != null && timeBar != null && timeBar.max != inst.length) {
        timeBar.setRange(0, Math.max(1, inst.length));
    }

    if (inst != null && timeTxt != null) {
        if (hud == 0){
        var timeRemaining = Std.int((inst.length - Conductor.songPosition) / 1000);
        var seconds = CoolUtil.addZeros(Std.string(timeRemaining % 60), 2);
        var minutes = Std.int(timeRemaining / 60);
        timeTxt.text = minutes + ":" + seconds;
        } else if (hud == 1){
        timeTxt.text = timeNow + " / " + length;
        difficultTxt.text = "[" + PlayState.difficulty + "]";
        }
    }
    var acc = FlxMath.roundDecimal(Math.max(accuracy, 0) * 100, 2);
    var rating:String = getRating(accuracy);
    if (songScore > 0 || acc > 0 || misses > 0) {
        if (hud == 0) hudTxt.text = "Score: " + songScore + " - Misses: " + misses +  " - Rating: " + rating + " (" + acc + "%)" + " - " + ratingFC;
    else if (hud == 1){
        scoreSideTxt.text = "Score: " + songScore;
        ratingTxt.text = "Acc: " + " (" + acc + "%)";
        missTxt.text = "Miss: " + misses;
        }
    }
    if (hud == 1){
    if (shits > 0 || bads > 0 || goods > 0 || sicks > 0) {
        shitTxt.text = "Shits: " + shits;
        badTxt.text = "Bads: " + bads;
        goodTxt.text = "Goods: " + goods;
        sickTxt.text = "Sicks: " + sicks;
    }}
    }}

    if (downscroll){
        CNlogo.y = -120;
    } else {
        CNlogo.y = 360;
    }
    if (!downscroll){
        bar.y = 580;
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
    if (curSong == 'retcon' || curSong == 'my-amazing-world'){
        bar.visible = false;
    }
}
function stepHit(){
    // uhh
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
        if (curStep == 384){
            dad.shader = glitches2;
        }
        if (curStep == 2432){
            camHUD.visible = false;
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

        if (curStep == 128){
            camMoving = true;
        }
    }

    if (curSong == "mindless"){
        if (curStep == 340){
            FlxTween.tween(bar, {alpha: 1}, 0.5);
        }
    }
}
function postUpdate(){
    if (curSong == 'retcon'){
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
    gfIcons.cameras = iconP1.cameras;
    gfIcons.health = health;
    if (curSong == 'retcon') {gfIcons.scale.set(0.7, 0.7);} else {gfIcons.scale.set(iconP1.scale.x, iconP1.scale.y);}
    if (curSong == "suffering-siblings"){
        gfIcons.x = 950;
    }

    // for icon glitching when they lose
    //if (!FlxG.save.data.shaderShit){
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
    }//}

    //umm
    if (curSong == "come-along-with-me" || curSong == "forgotten-world"){
            iconP1.visible = false;
            iconP2.visible = false;
            iconP1.alpha = 0.0001;
            iconP2.alpha = 0.0001;
    }
    

    if (FlxG.save.data.hudShit){
    if (curSong == "forgotten-world" && hud == 1){
        scoreSideTxt.visible = false;
        missTxt.visible = false;
        ratingTxt.visible = false;
    }
    if (curSong == "forgotten-world" && hud == 0){
        hudTxt.visible = false;
    }}
    
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

    if (curBeat % 4 == 0 && camZooming && !FlxG.save.data.shaderShit){
        tweenchrom = FlxTween.num(0.4, 0, 0.5, {ease: FlxEase.sineInOut}, function(val:Float) {
            chromaticAberration.amount = val;
        });
        /*tweenchrom = FlxTween.num(0.2, 0, 0.5, {ease: FlxEase.sineInOut}, function(val:Float) {
            chromaticAberrationHUD.amount = val;
        });*/
        chromaticAberrationHUD.amount = lerp(1, 0, 0.7);
    }

    if (FlxG.save.data.hudShit){
    if (!downscroll && hud == 1){
        timeTxt.y = 570;
        difficultTxt.y = 540;
        timeBar.y = 710;
        songTxt.y = 680;

        ratingTxt.y = 630;
        missTxt.y = 605;
        scoreSideTxt.y = 580;

        sickTxt.y = 570;
        goodTxt.y = 600;
        badTxt.y = 630;
        shitTxt.y = 660;
    }}

    if (FlxG.save.data.ratingHUD){
    PlayState.instance.comboGroup.cameras = [camHUD];
    comboGroup.x = 560;
    comboGroup.y = 120;
    }

    window.title = "CodenameEngine: Pibby Apocalypse: Now Playing | " + curSong + " | " + "DIFFICULTY: " + "< " + PlayState.difficulty + " >";
    
    if (FlxG.save.data.hudShit){
    if (hud == 0){
    ratingFC = 'Clear';
    if(misses < 1) {
		if (bads > 0 || shits > 0) ratingFC = 'FC';
		else if (goods > 0) ratingFC = 'GFC';
		else if (sicks > 0) ratingFC = 'SFC';
	}
	else if (misses < 10) ratingFC = 'SDCB';
    }}
    
}
function onPlayerHit(note:NoteHitEvent) {
    
    if (FlxG.save.data.hudShit){
    if (note.note.isSustainNote) return;

    if(!note.isSustainNote && hud == 0){
        if(hudTxtTween != null) {
            hudTxtTween.cancel();
        }
        hudTxt.scale.x = 1.075;
        hudTxt.scale.y = 1.075;
        hudTxtTween = FlxTween.tween(hudTxt.scale, {x: 1, y: 1}, 0.2, {
            onComplete: function(twn:FlxTween) {
                hudTxtTween = null;
            }
        });
    
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
    }}

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
    
    // for healthdrain when you play in opponentMode
    if (PlayState.opponentMode) {if (health < 1.9) {health += 0.017;}}
    else {if (health > 0.1) {health -= 0.017;}}

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
function postCreate() {
    healthBar.scale.set(0.65, 3);
    healthBarBG.scale.set(0.65, 2.5);
    healthBarBG.y -= 15;
    healthBarBG.x -= 400;
    healthBar.y -= 15;
    healthBar.x -= 400;

    gfIcons = new HealthIcon(gf.icon!=null?gf.icon:gf.curCharacter, true);
    gfIcons.visible = false;
	insert(members.indexOf(healthBar) + 1, gfIcons);

    // positioning the intro bf & intro pibby
    bfIntro.x = boyfriend.x;
    bfIntro.y = boyfriend.y;
    pibbyIntro.x = gf.x;
    pibbyIntro.y = gf.y;

    if (curSong == 'mindless'){
        iconP1.visible = false;
        iconP2.visible = false;
    }
    if (curSong == "forgotten-world"){
    for (i in [missesTxt, accuracyTxt, scoreTxt]) {
        i.visible = false;
    }}

    if (FlxG.save.data.hudShit){
    for (i in [missesTxt, accuracyTxt, scoreTxt]) {
        i.visible = false;
    }
    if (downscroll && hud == 0) {
        hudTxt.y = 605;
    } 
    if (hud == 0){
    add(hudTxt);
    }}
}