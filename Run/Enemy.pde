class Enemy {

  float x, y, dx, dy, rand, rad;
  color c;

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
    dx = -(rand);
    dy = rand;
    rad = random(5) + 5;
    c = color(255, 0, 0);
  }

  void update() {
    fill(c);
    ellipse(x, y, rad, rad);
    move();
  }

  void move() {
    x += dx;
    y += dy;
  }
}