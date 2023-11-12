function onEvent(e){
    if (events.name == "Cam Bopping") {
        camZoomingInterval = e.event.params[0];
        camZoomingStrength = e.event.params[1];
    }
}