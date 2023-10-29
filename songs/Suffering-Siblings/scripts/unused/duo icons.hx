var pibby:HealthIcon;
var jake:HealthIcon;

function createPost() {
  pibby = new HealthIcon("pibby-playable", true);
  pibby.y = healthBar.y - (iconP1.height / 2);
  pibby.cameras = [camHUD];
  pibby.health = health;
  insert(members.indexOf(healthBar)+1, pibby);
  
  jake = new HealthIcon("jake", false);
  jakeIcons.y = healthBar.y - (iconP1.height / 2);
  jake.cameras = [camHUD];
  jake.health = health;
  insert(members.indexOf(healthBar)+1, jake);
}