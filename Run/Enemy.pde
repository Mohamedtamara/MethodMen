class Enemy{
  
  float x,y,dx,dy,rad;
  color c;
  
  Enemy(){
    int whichWay = (int)random(2);
    if (whichWay == 0){
      x = random(width);
      y = 0;
    }
    if (whichWay == 1){
      y = random(height);
      x = width;
    }
    dx = -(random(3) + .5);
    dy = -(dx);
    rad = 5;
    c = color(255,0,0);
  }
  
  void update(){
    ellipse(x,y,rad,rad);
    move();
  }
  
  void move(){
    x += dx;
    y += dy;
  }
}
  
  