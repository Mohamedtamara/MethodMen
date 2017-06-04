class Enemy {

  float x, y, lx, ly, rand, rad;
  color c;

  //default constructor
  Enemy() {
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
    rad = 8 + (int)(Math.random() * 10); 
    c = color(255, 0, 0);
  }

  //update method
  void update() {
    fill(c);
    stroke(0);
    ellipse(x, y, rad, rad);
    move();
  }

  //how the enemy moves
  void move() {
    x += lx;
    y += ly;
  }
}
