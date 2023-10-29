var singDir = ["LEFT", "DOWN", "UP", "RIGHT"];
function onPlayerMiss(note){
    var curNotes = note.noteType;

    switch(curNotes){
        case "Glitch":
            if (!PlayState.opponentMode){note.cancel();}
    }
    deleteNote(note.note);
}
function onPlayerHit(note){
    /*strumLine.onHit.add(function(e:NoteHitEvent) {
        trace("hello");
    });*/

    var curNotes = note.noteType;

    switch(curNotes){
        case "Glitch":
            if (!PlayState.opponentMode){note.cancel(); note.cancelAnim();
            if (curSong == "no-hero-remix"){strumLines.members[1].characters[1].playAnim("hurt", true);
            strumLines.members[1].characters[2].playAnim("sing" + singDir[note.direction] + "miss", true);
            boyfriend.playAnim("sing" + singDir[note.direction] + "miss", true);
        } else {
            boyfriend.playAnim("hurt", true);
        }
        note.showSplash = true;
        if (!note.note.isSustainNote) {
            note.healthGain -= 0.45;
        } else note.healthGain = 0;}
    }
}
function onNoteCreation(e) {
    var curNotes = e.noteType;
    var note = e.note;

    switch (curNotes) {
        case "Glitch":
            e.noteSprite = "notes/noteType/GlitchNOTE";
            e.noteScale = 0.7;
			note.updateHitbox();
            note.splash = "GlitchSplash"; // Set the splash
            if (PlayState.opponentMode){e.mustHit = true;}
            if (!PlayState.opponentMode) {e.mustHit = false;
            note.earlyPressWindow = 0;
			note.latePressWindow = 0.2;
            }
    }
}