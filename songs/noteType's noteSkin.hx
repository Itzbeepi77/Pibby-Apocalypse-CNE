function onNoteCreation(e) {
    var curNotes = e.noteType;
    var note = e.note;

    switch (curNotes) {
        case "Glitch Note" | "Second Char Glitch":// ye
            note.shader = glitches2;
    }
}