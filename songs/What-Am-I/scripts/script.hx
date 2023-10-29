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
}