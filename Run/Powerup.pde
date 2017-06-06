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
    state = (int)(random(5) + 1);
  }



  //update method
  void update() {
    stroke(0);
    ellipse(x, y, 20, 20);
    if (state == 1) { //lives
      textSize(20);
      text("L", x, y);
      fill(0);
      c = color(0, 0, 225);
    }
    if (state == 2) { //slow time
      textSize(20);
      text("T", x, y);
      fill(0);

      c = color(0, 225, 225);
    }
    if (state == 3) { //mini
      textSize(20);
      text("M", x, y);
      fill(0);

      c = color(225, 0, 127);
    }
    if (state == 4) { //invincibility
      textSize(20);
      text("I", x, y);
      fill(0);

      c = color(0, 225, 0);
    }
    if (state == 5) { //gravity
      textSize(20);
      text("G", x, y);
      fill(0);

      c = color(225, 225, 0);
    }
    fill(c);

    move();
  }


  //how the powerup moves
  void move() {
    x += lx;
    y += ly;
  }
}
