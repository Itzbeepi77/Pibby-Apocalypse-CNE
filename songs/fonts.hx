function postUpdate(elapsed) {
    switch (curSong){
    case 'forgotten-world' | 'retcon' | 'my-amazing-world' | 'childs-play':
        FlxG.state.forEachOfType(FlxText, text -> text.font = Paths.font("Gumball.ttf"));
    case 'mindless' | 'blessed-by-swords' | 'brotherly-love' | 'suffering-siblings' | 'come-along-with-me' | 'what-am-i':
        FlxG.state.forEachOfType(FlxText, text -> text.font = Paths.font("Finn.ttf"));
    }
}