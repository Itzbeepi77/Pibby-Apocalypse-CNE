var singDir = [
    ["LEFT", "DOWN", "UP", "RIGHT"]
];
function onDadHit(note:NoteHitEvent){
    if (!PlayState.opponentMode){
        strumLines.members[1].characters[0].animation.play("sing" + singDir[direction] + "dodge");
    } else {
        strumLines.members[1].characters[0].animation.play("sing" + singDir[direction] + "dodge");
    } 
}
function onPlayerHit(note:NoteHitEvent){
    if (PlayState.opponentMode){
        strumLines.members[1].characters[0].animation.play("sing" + singDir[direction] + "dodge");
    } else {
        strumLines.members[1].characters[0].animation.play("sing" + singDir[direction] + "dodge");
    } 
}