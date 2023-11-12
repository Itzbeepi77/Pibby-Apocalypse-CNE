// for noteType stuff
// NO TOUCHIES MAFAKA >:(
import StringTools;

public var singDir = ["LEFT", "DOWN", "UP", "RIGHT"];
function onNoteHit(note){

    var curNotes = note.noteType;

    //if (!PlayState.opponentMode) {

    switch(curNotes) {
            
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
function onNoteCreation(e) {
    var curNotes = e.noteType;
    var note = e.note;

    switch (curNotes) {
        case "Glitch Note", "Second Char Glitch":// ye
        if (!FlxG.save.data.shaderShit){
            note.shader = glitches2;
        }
    }
}
function onPlayerHit(note:NoteHitEvent) {
    if (PlayState.opponentMode){
    if (note.note.prevNote == null || note.note.isSustainNote) return;
    if (note.note.prevNote.noteData == note.note.noteData) return;
    if (note.note.prevNote.mustPress == note.note.mustPress && note.note.prevNote.strumTime == note.note.strumTime){
    //if (note.note.strumTime == note.note.prevNote.strumTime) {
        camera.shake(0.04, 0.02);
        camHUD.shake(0.04, 0.1);
        shakes();
    }}
}
function onDadHit(note:NoteHitEvent) {
    if (!PlayState.opponentMode){
    if (note.note.prevNote == null || note.note.isSustainNote) return;
    if (note.note.prevNote.noteData == note.note.noteData) return;
    if (note.note.prevNote.mustPress == note.note.mustPress && note.note.prevNote.strumTime == note.note.strumTime){
    //if (note.note.strumTime == note.note.prevNote.strumTime) {
        camera.shake(0.04, 0.02);
        camHUD.shake(0.04, 0.1);
        shakes();
    }}
}