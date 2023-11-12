import openfl.geom.ColorTransform;
// don't ever try to change it
var blackBG = new FlxSprite();
function postCreate(){
	blackBG.makeGraphic(6000, 6000, FlxColor.BLACK);
	blackBG.x = "-490";
	blackBG.y = "-490";
    blackBG.alpha = 0.0001;
	insert(members.indexOf(gf)-1, blackBG);
}
function onEvent(e) {
    if (e.event.name == "AppleFilter-Alt"){
        switch (curSong){
            default:
                if (e.event.params[0] == true || e.event.params[0] == null){
                    //FlxTween.tween(blackBG, {alpha: 1}, e.event.params[1], {ease: FlxEase.quadInOut});
                    blackBG.alpha = 1;
                    for (chars in [boyfriend,dad,gf]){
                        chars.setColorTransform();
                        chars.colorTransform.redMultiplier = 1;
                        chars.colorTransform.blueMultiplier = 1;
                        chars.colorTransform.greenMultiplier = 1;
                        chars.colorTransform.alphaMultiplier = 1;
                        chars.colorTransform.redOffset = 255;
                        chars.colorTransform.blueOffset = 255;
                        chars.colorTransform.greenOffset = 255;
                        chars.colorTransform.alphaOffset = 0;
                        chars.dirty = true;
                    }
                } else if (e.event.params[0] == false){
                    blackBG.alpha = 0.0001;
                    for (chars in [boyfriend,dad,gf]){
                        chars.setColorTransform();
                        chars.colorTransform.redMultiplier = 1;
                        chars.colorTransform.blueMultiplier = 1;
                        chars.colorTransform.greenMultiplier = 1;
                        chars.colorTransform.alphaMultiplier = 1;
                        chars.colorTransform.redOffset = 0;
                        chars.colorTransform.blueOffset = 0;
                        chars.colorTransform.greenOffset = 0;
                        chars.colorTransform.alphaOffset = 0;
                        chars.dirty = true;
                    }
                }

            case "childs-play":
                if (e.event.params[0] == true || e.event.params[0] == null){
                    //FlxTween.tween(blackBG, {alpha: 1}, e.event.params[1], {ease: FlxEase.quadInOut});
                    blackBG.alpha = 1;
                    for (chars in [boyfriend,dad]){
                        chars.setColorTransform();
                        chars.colorTransform.redMultiplier = 1;
                        chars.colorTransform.blueMultiplier = 1;
                        chars.colorTransform.greenMultiplier = 1;
                        chars.colorTransform.alphaMultiplier = 1;
                        chars.colorTransform.redOffset = 255;
                        chars.colorTransform.blueOffset = 255;
                        chars.colorTransform.greenOffset = 255;
                        chars.colorTransform.alphaOffset = 0;
                        chars.dirty = true;
                    }
                } else if (e.event.params[0] == false){
                    blackBG.alpha = 0.0001;
                    for (chars in [boyfriend,dad]){
                        chars.setColorTransform();
                        chars.colorTransform.redMultiplier = 1;
                        chars.colorTransform.blueMultiplier = 1;
                        chars.colorTransform.greenMultiplier = 1;
                        chars.colorTransform.alphaMultiplier = 1;
                        chars.colorTransform.redOffset = 0;
                        chars.colorTransform.blueOffset = 0;
                        chars.colorTransform.greenOffset = 0;
                        chars.colorTransform.alphaOffset = 0;
                        chars.dirty = true;
                    }
                }
        }
    }
}