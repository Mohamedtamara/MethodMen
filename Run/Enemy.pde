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
    dx = -(random(3));
    dy = (random(3));
    rad = 5;
    c = color(255,0,0);
  }
  
  update(){
    ellipse(x,y,rad,rad);
    move();
  }
  
  move(){
    x += dx;
    y += dy;
  }
  
  