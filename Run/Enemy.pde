class Enemy{
  
  float x,y,dx,dy, rand, rad;
  color c;
  
  Enemy(){
    x = random(width);
    y = random(height);
    rand = (random(3));
    dx = -(rand);
    dy = (rand);
    rad = 5;
    c = color(255,0,0);
  }
  
  void update(){
    fill(c);
    ellipse(x,y,rad,rad);
    move();
  }
  
  void move(){
    x += dx;
    y += dy;
  }
}
