class Powerup extends Enemy {

  int state; //what powerup is it

  Powerup() {
    super();
    int state = 0;
  }

  //power between 1 to 5
  Powerup(int power) {
    super();
    state = power;
  }

  void coloring() {
    if (state == 1) {
      c = color(0, 0, 225);
    }
    if (state == 2) {
      c = color(0, 225, 225);
    }
    if (state == 3) {
      c = color(225, 0, 127);
    }
    if (state == 4) {
      c = color(0, 225, 0);
    }
    if (state == 5) {
      c = color(225, 225, 0);
    }
  }
}