class Powerup{
  
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
    state = 0;
  }
  
  Powerup(int power){
    state = power;
  }


  //update method
  void update() {
    if (state == 1) { //lives
      c = color(0, 0, 225);
      textSize(rad);
      text("L", x, y);
    }
    if (state == 2) { //slow time
      c = color(0, 225, 225);
      textSize(rad);
      text("T", x, y);
    }
    if (state == 3) { //mini
      c = color(225, 0, 127);
      textSize(rad);
      text("M", x, y);
    }
    if (state == 4) { //invincibility
      c = color(0, 225, 0);
      textSize(rad);
      text("I", x, y);
    }
    if (state == 5) { //gravity
      c = color(225, 225, 0);
      textSize(rad);
      text("G", x, y);
    }
    fill(c);
    stroke(0);
    ellipse(x, y, rad, rad);
    move();
  }
  

  //how the powerup moves
  void move() {
    x += lx;
    y += ly;
  }
}
