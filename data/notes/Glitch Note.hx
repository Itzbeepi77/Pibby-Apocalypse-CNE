// for noteType stuff
// NO TOUCHIES MAFAKA >:(
import StringTools;

var singDir = ["LEFT", "DOWN", "UP", "RIGHT"];
function onNoteHit(note){

    var curNotes = note.noteType;

    switch(curNotes) {

    case "Glitch Note":
        camera.shake(0.008, 0.04);
        camHUD.shake(0.008, 0.04);
        trace("GLITCH");
        shakes();
    }
}