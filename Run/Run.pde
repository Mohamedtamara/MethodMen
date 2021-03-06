import java.util.*;

// states
final int stateGame  = 0; // consts
final int statePause = 1;
int state;    // current 
int difficulty;    //difficulty
int level;  //what level you're on
int score; //what your score is
PImage img;
PFont font;
PImage img2;
Pilot pilot;
ArrayList<Enemy> badDudes;
ArrayList<Powerup> goodDudes;
boolean isInvincible;
long time;
int m;

void setup() {
  size(800, 600);
  background(0);
  frameRate(60);
  state = statePause; 
  img = loadImage("start1.jpg");
  img2 = loadImage("start2.jpg");
  difficulty = 10;
  level = 1;
  score = 0;
  m = 0;
  pilot = new Pilot();
  isInvincible = false;
  badDudes = new ArrayList<Enemy>();
  goodDudes = new ArrayList<Powerup>();
  time = millis();
}


void draw() {
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
    //playing with the module increases # of enemies. (DIFFICULTY!!!!)
    if (frameCount % difficulty == 0) {
      badDudes.add(new Enemy());
    }
    if (frameCount % 300==0) {
      goodDudes.add(new Powerup());
    }
    //this applies to every good dude out there 
    for (int g =  goodDudes.size() - 1; g >= 0; g--) {
      Powerup power = goodDudes.get(g);
      power.update();
      //did the powerup hit the wall?
      if (wallcollision(power)) {
        //die
        goodDudes.remove(power);
      }
      //did the player hit the powerup?
      if (collision(pilot, power)) {
        if (power.getState() == 1 ) {
          addLife(pilot);
          goodDudes.remove(power);
        } else if (power.getState() == 2) {
          for (Enemy e : badDudes) {
            slowdown(e);
          }
          goodDudes.remove(power);
        } else {
          for (Enemy e : badDudes) {
            mini(e);
          }
          goodDudes.remove(power);
        }
      }
    }

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
    int r = second();
    if (r % 1 == 0) {
      m+=1;
    }
    String t = "Score: " + (m*.50);
    String s = "Level: " + level;
    String x = "Time: " + (m/60) + "s";
    textSize(22);
    text(s, 10, 20);
    fill(0, 255, 255);
    text(t, 120, 20);
    fill(0, 255, 255);
    text(x, 300, 20);
    fill(0, 255, 255);
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
  if (tag <= 17) {
    return true;
  }
  return false;
}

/*
//start the powerup
 void stateChange(Pilot a, Powerup b){
 a.state = b.state;
 }
 */

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

//collision between powerup and the wall
boolean wallcollision(Powerup one) {
  if (one.x < 0 || one.y > height) {
    return true;
  }  
  return false;
}

//POWERUP METHODS

//add a life to the pilot
void addLife(Pilot a) {
  a.lives.push(true);
  a.numLives ++;
}

//reverse direction of enemies
void slowdown(Enemy e) {
  e.lx= -1;
  e.ly= 1;
}


//reduce radius of enemies
void mini(Enemy e) {
  e.rad = 10;
}

//invincible pilot
void invincible(Pilot a, Enemy e) {
  while (isInvincible) {
    stroke(204, 102, 0);
    if (collision(a, e)) {
      a.lives.push(true);
    }
  }
}



void difficulty() {
  float temp = millis() - time;
  if (temp >= 10000) {
    difficulty--;
    level++;
    if (difficulty == 0) {
      difficulty = 1;
      level = 10;
      return;
    }
    time = millis();
  }
}