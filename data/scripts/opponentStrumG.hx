import funkin.game.HudCamera;
import funkin.backend.scripting.events.NoteHitEvent;

public var glitchNotesForBF = true;
public var glitchNotesForDad = true;
var glitches = new CustomShader("individualGlitches Missingno");
/**
 * UI
 */
function onStrumCreation(event) {
	if (event.player == 1 && !glitchNotesForBF) return;
	if (event.player == 2 && !glitchNotesForBF) return;
	if (event.player == 0 && !glitchNotesForDad) return;
	
	var strum = event.strum;

	if (!FlxG.save.data.shaderShit){
	strum.shader = glitches;
	}
}
function onSongStart(){
	switch(curSong){
		case "come-along-with-me" | "forgotten-world":
			glitches.binaryIntensity = 1;
	}
}
function update(){
	switch(curSong){
		default :
		if (curBeat % 1 == 0 && !FlxG.save.data.shaderShit){
			tweenchrom = FlxTween.num(10, 2, 0.025, {ease: FlxEase.sineInOut}, function(val:Float) {
				glitches.binaryIntensity = val;
			});
		}
	}
}