function playAnims(charToSwitch:String, anims:String) {
    switch (charToSwitch) {
        case "dad":
            dad.playAnim("'" + anims + "'");

        case "bf":
            boyfriend.playAnim("'" + anims + "'");

        case "gf":
            gf.playAnim("'" + anims + "'");
    }
}