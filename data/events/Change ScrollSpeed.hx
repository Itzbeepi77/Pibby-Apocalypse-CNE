function onEvent(eventEvent) {
    if (eventEvent.event.name == "Change ScrollSpeed") {
        FlxTween.tween(PlayState.instance, {scrollSpeed: eventEvent.event.params[0]}, eventEvent.event.params[1]);
    }
}