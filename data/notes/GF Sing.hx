var singDir = ["LEFT", "DOWN", "UP", "RIGHT"];
function onNoteHit(note:NoteHitEvent){
    var curNotes = note.noteType;

    switch(curNotes){
    case "GF Sing":
        gf.playAnim("sing" + singDir[note.direction], true);
        note.cancelAnim();
        note.healthGain += 0.002;
    }
}