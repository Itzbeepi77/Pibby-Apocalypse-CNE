public function scrollSpeedTween(value:String, duration:String){
    FlxTween.tween(PlayState.instance, {scrollSpeed: value}, duration);
}