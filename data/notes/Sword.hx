var singDir = ["LEFT", "DOWN", "UP", "RIGHT"];
function onNoteHit(note:NoteHitEvent){
    var curNotes = note.noteType;

    switch(curNotes){
        case "Sword":
            if (curSong == "no-hero-remix"){
            strumLines.members[1].characters[1].playAnim("dodge", true);
            } else {
                boyfriend.playAnim("dodge", true);
            }
            note.cancelAnim();
            camHUD.shake(0.008, 0.04);
            FlxG.sound.play(Paths.sound("slice"));
    }
}