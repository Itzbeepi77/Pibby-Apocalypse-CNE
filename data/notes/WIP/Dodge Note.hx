var singDir = ["LEFT", "DOWN", "UP", "RIGHT"];
function onNoteHit(note:NoteHitEvent){
    var curNotes = note.noteType;

    switch(curNotes){
    case "Dodge Note":
        boyfriend.playAnim("sing" + singDir[note.direction] + "dodge", true);
        note.cancelAnim();
    }
}