//a
public var allStrums = [];
public var allStrumsX = [];
function postCreate() {
    for (i in playerStrums.members) {allStrums.push(i); allStrumsX.push(i.x);}
    for (i in cpuStrums.members) {allStrums.push(i); allStrumsX.push(i.x);}

    trace(allStrumsX);
}

public function shakes(){
    for (i in cpuStrums.members){
    FlxTween.tween(i, {y: 50 * Math.random(i.y -2.5, i.y +5)}, 0.01, {ease: FlxEase.quadInOut});
    }
}