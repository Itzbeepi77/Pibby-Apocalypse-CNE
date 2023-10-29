import funkin.game.cutscenes.VideoCutscene;
import hxcodec.flixel.FlxVideo;

isStoryMode = true;

function stepHit(){
    if (curStep == 1182){
        playCutscenes = true;
        startCutscene("mid-", function() close());
    }
}