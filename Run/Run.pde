import java.util.*;

Pilot pilot;
ArrayList<Enemy> badDudes;

void setup() {
  size(600, 600);
  background(0);
  frameRate(60);
  pilot = new Pilot();
  badDudes = new ArrayList<Enemy>(100);
  for (int i = 0; i < 100; i++) {
    badDudes.add(new Enemy());
  }
}


void draw() {
  clear();
  Enemy test = badDudes.get(0);
  test.update();
  if (collision( pilot, test )) {
    pilot.numLives--;
    pilot.lives.pop();
    badDudes.remove(0);
    if (pilot.lives.isEmpty()) {
      exit();
    }
  }
  pilot.dragsegment();
  pilot.dragtrail();
  pilot.draglives();
  pilot.dragtext();
}

boolean collision(Pilot a, Enemy b) {
  float isis = dist(a.x, a.y, b.x, b.y);
  if (isis <= 2) {
    return true;
  }
  return false;
}