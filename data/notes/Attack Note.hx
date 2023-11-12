var singDir = ["LEFT", "DOWN", "UP", "RIGHT"];
function onNoteHit(note:NoteHitEvent){
    var curNotes = note.noteType;

    switch(curNotes){
        case "Attack Note":
            boyfriend.playAnim("sing" + singDir[note.direction] + "shoot", true);
            dad.playAnim("sing" + singDir[note.direction], true);
            note.cancelAnim();
    }
}