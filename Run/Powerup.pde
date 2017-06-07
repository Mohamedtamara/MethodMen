class Powerup {

  int state; //which powerup is it(1-5)
  float x, y, lx, ly, rand, rad;
  color c;

  //default constructor
  Powerup() {
    int whichWayb = (int)random(2);
    if (whichWayb == 0) {
      x = random(width);
      y = 0;
    }
    if (whichWayb == 1) {
      x = width;
      y = random(height);
    }
    rand = (random(3) + .5);
    lx = -(rand);
    ly = rand;
    rad = 20;
    state = 1 + (int)(Math.random() * 3);
  }



  //update method
  void update() {
    stroke(0);
    ellipse(x, y, 20, 20);
    if (state == 1) { //lives
      textSize(20);
      fill(255);
      text("L", x, y);
      c = color(0, 0, 225);
    }
    if (state == 2) { //slow time
      textSize(20);
      fill(255);
      text("T", x, y);
      c = color(0, 225, 225);
    }
    if (state == 3) { //mini
      textSize(20);
      fill(255);
      text("M", x, y);
      c = color(225, 0, 127);
    }
    fill(c);
    move();
  }
  //getting the state of the powerup
  int getState(){
    return state;
  }


  //how the powerup moves
  void move() {
    x += lx;
    y += ly;
  }
}
