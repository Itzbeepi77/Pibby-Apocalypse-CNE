//a
public var allStrums = [];
public var allStrumsX = [];
function postCreate() {
    for (i in playerStrums.members) {allStrums.push(i); allStrumsX.push(i.x);}
    for (i in cpuStrums.members) {allStrums.push(i); allStrumsX.push(i.x);}

    trace(allStrumsX);
}

public function shakes(){

    // scrapped
    /*var a = playerStrums.members[0];
    FlxTween.tween(a, {x: 50 * Math.random(726, 746)}, 0.01, {ease: FlxEase.quadInOut});
    var b = playerStrums.members[1];
    FlxTween.tween(b, {x: 50 * Math.random(838, 858)}, 0.01, {ease: FlxEase.quadInOut});
    var c = playerStrums.members[2];
    FlxTween.tween(c, {x: 50 * Math.random(950, 970)}, 0.01, {ease: FlxEase.quadInOut});
    var d = playerStrums.members[3];
    FlxTween.tween(d, {x: 50 * Math.random(1062, 1082)}, 0.01, {ease: FlxEase.quadInOut});

    var f = cpuStrums.members[0];
    FlxTween.tween(f, {x: 50 * Math.random(96 -10, 96 +10)}, 0.01, {ease: FlxEase.quadInOut});
    var g = cpuStrums.members[1];
    FlxTween.tween(g, {x: 50 * Math.random(208 -10, 208 +10)}, 0.01, {ease: FlxEase.quadInOut});
    var h = cpuStrums.members[2];
    FlxTween.tween(h, {x: 50 * Math.random(320 -10, 320 +10)}, 0.01, {ease: FlxEase.quadInOut});
    var l = cpuStrums.members[3];
    FlxTween.tween(l, {x: 50 * Math.random(432 -10, 432 +10)}, 0.01, {ease: FlxEase.quadInOut});*/


    for (i in cpuStrums.members){
    FlxTween.tween(i, {y: 50 * Math.random(i.y -10, i.y +10)}, 0.01, {ease: FlxEase.quadInOut});
    }
    
    for (i in playerStrums.members){
        FlxTween.tween(i, {y: 50 * Math.random(i.y -10, i.y +10)}, 0.01, {ease: FlxEase.quadInOut});
    }
}