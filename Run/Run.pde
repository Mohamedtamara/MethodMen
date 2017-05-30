import java.util.*;

// states
final int stateGame  = 0; // consts
final int statePause = 1;
int state = statePause;    // current 
PImage img;
PImage img2;
Pilot pilot;
ArrayList<Enemy> badDudes;

void setup() {
  size(600, 600);
  background(0);
  frameRate(60);
  img = loadImage("start1.jpg");
  img2 = loadImage("start2.jpg");
  pilot = new Pilot();
  badDudes = new ArrayList<Enemy>(100);
  for (int i = 0; i < 100; i++) {
    badDudes.add(new Enemy());
  }
}


void draw() {
  if(state == statePause){
    initstartscreen();
    keypressed();
  }
  else{
    clear();
    keypressed();
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
  }

void keypressed(){
  if(key == 'p'){
    state = statePause;
  }
  else if(key == 'g'){
    state = stateGame;
  }
}



void initstartscreen(){
  int s = second();
  if(s%2 == 1){
    image(img,0,0);
  }
  else{
    image(img2, 0, 0);
  }
}
    

boolean collision(Pilot a, Enemy b) {
  float isis = dist(a.x, a.y, b.x, b.y);
  if (isis <= 2) {
    return true;
  }
  return false;
}
