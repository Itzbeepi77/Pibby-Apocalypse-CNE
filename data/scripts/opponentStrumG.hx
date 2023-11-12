import funkin.game.HudCamera;
import funkin.backend.scripting.events.NoteHitEvent;

public var glitchNotesForBF = true;
public var glitchNotesForDad = true;
var glitches = new CustomShader("individualGlitches Missingno");
//var random = FlxG.random.float(2.5, 5);
//var random2 = FlxG.random.float(3, 7);
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
function update(){
	switch(curSong){
		default :
		if (!FlxG.save.data.shaderShit){
			tweenchrom = FlxTween.num(5, 2.5, 0.05, {ease: FlxEase.sineInOut}, function(val:Float) {
				glitches.binaryIntensity = val;
			});
		}
	}
}