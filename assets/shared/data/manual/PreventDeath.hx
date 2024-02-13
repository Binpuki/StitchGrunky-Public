function onCreatePost()
{
    game.healthBar.visible = false;
    game.iconP1.visible = false;
    game.iconP2.visible = false;

    game.canReset = false;
}

function onUpdate(elasped:Float)
{
    game.health = 2;
}