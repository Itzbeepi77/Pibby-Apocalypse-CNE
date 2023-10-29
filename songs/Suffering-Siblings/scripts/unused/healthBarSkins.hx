function create() {
    bar = new FlxSprite(healthbar.x, healthbar.y);
    bar.frames = Paths.getSparrowAtlas('PA Stuff/healthbar/iconbar');
    bar.animation.addByPrefix('bar1', 'Icons Bar', 24, true);
    bar.updateHitbox();
    bar.alpha = 0;
    bar.antialiasing = true;
    bar.updateHitbox();
    add(bar);
    bar.animation.play('bar1', true, false, 0);
}