import java.util.*;

class Pilot {

  //instance vars;
  Stack<Boolean> lives;
  int numLives;
  color col;
  float x;
  float y;
  float lx;
  float ly;
  float easing = .10;
  ArrayList<PVector> trail;
  //should change based on position of the pilot ball
  int trailSize = 19;
  PVector circlePosition;
  PVector currTrail;
  PVector prevTrail;

  //default constructor
  Pilot() {
    col = color(48, 139, 206, 140);
    lives = new Stack<Boolean>();
    lives.push(true);
    lives.push(true);
    lives.push(true);
    numLives = 3;
    x = mouseX;
    y = mouseY;
    lx = mouseX;
    ly = mouseY;
    trail = new ArrayList<PVector>();
    circlePosition = new PVector(width*.5, width*.5);
  }



  //drag segment
  void dragsegment() {
    float targetX = mouseX;
    float dx = targetX - x;
    x+= dx;
    float targetY = mouseY;
    float dy = targetY - y;
    y+= dy;
    fill(col);
    ellipse(x, y, 17, 17);
    line(x,y,x,y);
  }//end dragsegment()

  void dragtrail() {
    int trailLength;
    circlePosition = new PVector(mouseX, mouseY);
    trail.add(circlePosition);
    trailLength = trail.size()-2;

    for (int i = 0; i < trailLength; i++) {
      PVector currTrail = trail.get(i);
      PVector prevTrail = trail.get(i+1);      
      stroke(col);
      strokeWeight(2);
      line(currTrail.x, currTrail.y, 
        prevTrail.x, prevTrail.y);
    }

    if (trailLength >= trailSize) {
      trail.remove(0);
    }
  }// end dragtrail()

//visual representation of lives
  void draglives(){
    for(boolean b: lives){
      if(b == true){
        float xpos  =  mouseX;
        float Dx = xpos - lx;
        float ypos = mouseY;
        float Dy = ypos - ly;
        lx += Dx * easing;
        ly += Dy * easing;
        ellipse(lx, ly, 10, 10);
        String l = numLives + "";
        text(l, lx, ly);
      }
    }
  }
  
  void dragtext(){  
    for(boolean b: lives){
      if(b == true){
        float xpos  =  mouseX;
        float Dx = xpos - lx;
        float ypos = mouseY;
        float Dy = ypos - ly;
        lx += Dx * easing;
        ly += Dy * easing;
        String l = numLives + "";
        text(l, lx, ly);
        fill(255,0,0);
      }
    }
  }
  
    


}//end class
