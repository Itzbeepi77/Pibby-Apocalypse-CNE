// for noteType stuff
// NO TOUCHIES MAFAKA >:(
public var singDir = ["LEFT", "DOWN", "UP", "RIGHT"];
function onNoteHit(note){

    var curNotes = note.noteType;

    //if (!PlayState.opponentMode) {

    switch(curNotes) {

    case "GF Sing":
        gf.playAnim("sing" + singDir[note.direction], true);
        note.cancelAnim();
            
    case "Second Char Sing":
        strumLines.members[3].characters[0].playAnim("sing" + singDir[note.direction], true);
        note.cancelAnim();

    case "Second Char Glitch":
        strumLines.members[3].characters[0].playAnim("sing" + singDir[note.direction], true);
        camera.shake(0.008, 0.04);
        camHUD.shake(0.008, 0.04);
        trace("GLITCH");
        shakes();
        note.cancelAnim();

    case "Glitch Note":
        camera.shake(0.008, 0.04);
        camHUD.shake(0.008, 0.04);
        trace("GLITCH");
        shakes();
    }

    if (curNotes == "No Anim Note" || curNotes == "No Animation"){
        note.cancelAnim();
        trace("HI :]");
    }
}
function onPlayerHit(e){
    
    var curNotes = e.noteType;

    switch(curNotes) {
    
    case null:
        if (curSong == 'retcon' && e.mustHit && !PlayState.opponentMode){healthBar.createFilledBar(colouredBar, colouredBarB);}// changing healthColors

    case "GF Sing":
        gf.playAnim("sing" + singDir[e.direction], true);
        e.cancelAnim();
        if (curSong == 'retcon' && e.mustHit && !PlayState.opponentMode){healthBar.createFilledBar(colouredBar, colouredBarG);}// changing healthColors
    }
}
function onDadHit(e){
    
    var curNotes = e.noteType;

    switch(curNotes) {
    
    case null:
        if (curSong == 'retcon' && e.mustHit && PlayState.opponentMode){healthBar.createFilledBar(colouredBar, colouredBarB);}// changing healthColors

    case "GF Sing":
        gf.playAnim("sing" + singDir[e.direction], true);
        e.cancelAnim();
        if (curSong == 'retcon' && e.mustHit && PlayState.opponentMode){healthBar.createFilledBar(colouredBar, colouredBarG);}// changing healthColors
    }
}