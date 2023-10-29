//a
import StringTools;

function onPlayerHit(note:NoteHitEvent) {
    if (PlayState.opponentMode){
    if (note.note.isSustainNote) return;
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
    if (note.note.isSustainNote) return;
    if (note.note.prevNote.noteData == note.note.noteData) return;
    if (note.note.prevNote.mustPress == note.note.mustPress && note.note.prevNote.strumTime == note.note.strumTime){
    //if (note.note.strumTime == note.note.prevNote.strumTime) {
        camera.shake(0.04, 0.02);
        camHUD.shake(0.04, 0.1);
        shakes();
    }}
}