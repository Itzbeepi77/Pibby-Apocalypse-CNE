function onEvent(eventEvent) {
    if (eventEvent.event.name == "Zoom") {
            //defaultCamZoom = eventEvent.event.params[0];
            FlxTween.num(defaultCamZoom, eventEvent.event.params[0], eventEvent.event.params[1], {ease: FlxEase.circOut}, function(v:Float) {
                defaultCamZoom  = v;
            });
    }
}