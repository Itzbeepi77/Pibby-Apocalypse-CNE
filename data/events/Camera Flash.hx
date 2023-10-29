import Reflect;

function onEvent(eventEvent) {
    if (eventEvent.event.name == "Camera Flash")
        (Reflect.getProperty(PlayState.instance, eventEvent.event.params[2])).flash(eventEvent.event.params[0], eventEvent.event.params[1], null, true);
}