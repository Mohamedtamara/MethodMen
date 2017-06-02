import java.util.*;

// states
final int stateGame  = 0; // consts
final int statePause = 1;
int state;    // current 
int difficulty;    //difficulty
int level;  //what level you're on
PImage img;
PImage img2;
Pilot pilot;
ArrayList<Enemy> badDudes;
long time;

void setup() {
  size(800, 600);
  background(0);
  frameRate(60);
  state = statePause; 
  img = loadImage("start1.jpg");
  img2 = loadImage("start2.jpg");
  difficulty = 10;
  level = 1;
  pilot = new Pilot();
  //size 100 because why not
  badDudes = new ArrayList<Enemy>(100);
  time = millis();
}


void draw() {
  //playing with the module increases # of enemies. (DIFFICULTY!!!!)
  if (frameCount % difficulty == 0) {
    badDudes.add(new Enemy());
  }
  //let's start the game
  if (state == statePause) {
    //the spacey background
    initstartscreen();
    //was it g or p?
    keypressed();
  } else {
    clear();
    //was it g or p?
    keypressed();
    //this applies to every bad dude out there
    for (int i = badDudes.size() -1; i >= 0; i--) {
      Enemy test = badDudes.get(i);
      test.update();
      //did the enemy hit the wall?
      if (wallcollision(test)) {
        //die
        badDudes.remove(test);
      }
      //did the player hit the wall?
      if (wallcollision(pilot)) {
        //die
        setup();
        return;
      }
      //did the player hit an enemy?
      if (collision( pilot, test )) {
        pilot.numLives--;
        pilot.lives.pop();
        badDudes.remove(test);
        //if the player is dead, restart
        if (pilot.lives.isEmpty()) {
          setup();
          return;
        }
      }
    }
    //pilot things
    pilot.dragsegment();
    pilot.dragInit();
    pilot.dragtrail();
    pilot.draglives();
    pilot.dragtext();
    String s = "Level " + level;
    text(s, 100, 20);
    //int time = millis();
    difficulty();
  }
}//end draw()

//which key was pressed
void keypressed() {
  if (key == 'p') {
    state = statePause;
  } else if (key == 'g') {
    state = stateGame;
  }
}

//the start screen
void initstartscreen() {
  int s = second();
  if (s%2 == 1) {
    image(img, 0, 0);
  } else {
    image(img2, 0, 0);
  }
}

//collision between the player and an enemy
boolean collision(Pilot a, Enemy b) {
  float tag = dist(a.x, a.y, b.x, b.y);
  if (tag <= 13) {
    return true;
  }
  return false;
}

//did you get that powerup?
boolean collision(Pilot a, Powerup b) {
  float tag = dist(a.x, a.y, b.x, b.y);
  if (tag <= 13) {
    return true;
    stateChange(a,b);
  }
  return false;
}

//start the powerup
void stateChange(Pilot a, Powerup b){
  a.state = b.state;
}

//collision between an enemy and the wall
boolean wallcollision(Enemy one) {
  if (one.x < 0 || one.y > height) {
    return true;
  }  
  return false;
}

//collision between the player and the wall
boolean wallcollision(Pilot one) {
  if (one.x <= 1 || one.x >= width-1 || one.y <= 1 || one.y >= height-1) {
    return true;
  }
  return false;
}

void difficulty() {
  float temp = millis() - time;
  if (temp >= 10000) {
    difficulty--;
    level++;
    time = millis();
  }
}