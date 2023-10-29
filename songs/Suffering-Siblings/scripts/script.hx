var blackboxDown = new FlxSprite();
var blackboxUp = new FlxSprite();
var tweens:Array<FlxTween> = [];

function update() {
    if(curCameraTarget == 0){
        defaultCamZoom = 0.85;
    }
    if(curCameraTarget == 1){
        defaultCamZoom = 1.0;
    }
    if(curCameraTarget == 2){
        defaultCamZoom = 0.9;
    }
    if(curCameraTarget == 3){
        defaultCamZoom = 1.0;
        /*for (i in 0...4){
        strumLines.members[0].members[i].alpha = 0.5;
        }
        for (i in 0...4){
        strumLines.members[3].members[i].alpha = 1;
        }*/
    }
    if (curStep == 2080){
        curCameraTarget = -1;
        defaultCamZoom = 0.6;
        camFollow.x = 1700;
    }
}
function create(){
    remove(strumLines.members[0].characters[0]);
	remove(strumLines.members[3].characters[0]);

	add(strumLines.members[3].characters[0]);
	add(strumLines.members[0].characters[0]);
}