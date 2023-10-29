import openfl.geom.ColorTransform;
function onEvent(e) {
    if (e.event.name == "AppleFilter"){
        if (e.event.params[0] == true){
        boyfriend.color = FlxColor.BLACK;
        dad.color = FlxColor.BLACK;
        gf.color = FlxColor.BLACK;
        }
    }
}