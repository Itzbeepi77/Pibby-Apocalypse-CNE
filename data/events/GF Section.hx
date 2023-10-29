var singDir = ["LEFT", "DOWN", "UP", "RIGHT"];
function onEvent(e){
    curCameraTarget = e.event.params[0];
}
function onNoteHit(e){
    var curNotes = e.noteType;

    if (events.name == "GF Section" || events.name == "GF_Section") {
    if (events.params[1] || events.params[1] == null){
    if (curNotes == null){
        e.cancelAnim();
        gf.playAnim("sing" + singDir[e.direction], true);
    }}}
}