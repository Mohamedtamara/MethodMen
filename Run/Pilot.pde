import java.util.*;

class Pilot{
  
  //instance vars;
  Stack<Boolean> lives;
  color col;
  float x;
  float y;
  
  //default constructor
  Pilot(){
    col = color(48,139,206,140);
    lives = new Stack<Boolean>();
    x = mouseX;
    y = mouseY;
  }
  
  
  
  //drag segment
  void dragsegment(){
    float targetX = mouseX;
    float dx = targetX - x;
    x+= dx;
    float targetY = mouseY;
    float dy = targetY - y;
    y+= dy;
    ellipse(x,y, 25,25);
  }

}
