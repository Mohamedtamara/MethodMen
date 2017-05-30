import java.util.*;

// states
final int stateGame  = 0; // consts
final int statePause = 1;
int state;    // current 
PImage img;
PImage img2;
Pilot pilot;
ArrayList<Enemy> badDudes;

void setup() {
  size(600, 600);
  background(0);
  frameRate(60);
  state = statePause; 
  img = loadImage("start1.jpg");
  img2 = loadImage("start2.jpg");
  pilot = new Pilot();
  badDudes = new ArrayList<Enemy>(100);
}


void draw() {
  //playing with the module increases # of enemies. (DIFFICULTY!!!!)
  if (frameCount%10 == 0) {
    badDudes.add(new Enemy());
  }
  if (state == statePause) {
    initstartscreen();
    keypressed();
  } else {
    clear();
    keypressed();
    for (int i = badDudes.size() -1; i >= 0; i--) {
      Enemy test = badDudes.get(i);
      test.update();
      if (wallcollision(test)) {
        badDudes.remove(test);
      }
      if (wallcollision(pilot)) {
        setup();
        return;
      }
      if (collision( pilot, test )) {
        pilot.numLives--;
        pilot.lives.pop();
        badDudes.remove(test);
        if (pilot.lives.isEmpty()) {
          setup();
          return;
        }
      }
    }
      pilot.dragsegment();
      pilot.dragtrail();
      pilot.draglives();
      pilot.dragtext();
    }
  }

void keypressed() {
  if (key == 'p') {
    state = statePause;
  } else if (key == 'g') {
    state = stateGame;
  }
}

void initstartscreen() {
  int s = second();
  if (s%2 == 1) {
    image(img, 0, 0);
  } else {
    image(img2, 0, 0);
  }
}

boolean collision(Pilot a, Enemy b) {
  float tag = dist(a.x, a.y, b.x, b.y);
  if (tag <= 13) {
    return true;
  }
  return false;
}

boolean wallcollision(Enemy one) {
  if (one.x < 0 || one.y > height) {
    return true;
  }  
  return false;
}

boolean wallcollision(Pilot one) {
  if (one.x <= 1 || one.x >= width-1 || one.y <= 1 || one.y >= height-1) {
    return true;
  }
  return false;
}