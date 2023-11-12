import hxvlc.flixel.FlxVideo;
var curVideo = null;

public function playVid(vid:String) {
    curVideo = new FlxVideo();
    curVideo.onEndReached.add(curVideo.dispose);
    var path = Paths.file("songs/" + PlayState.SONG.meta.name.toLowerCase() + "/" + vid + '.mp4'); // songs/current-song/vid.mp4
    curVideo.play(Assets.getPath(path));
}

function update() {
    if (curVideo != null) {canPause = false;
    } else {canPause = true;} // doesn't fuckin work
}
function onDestroy() {curVideo.destroy();}