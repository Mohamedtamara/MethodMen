import java.util.*;

class Pilot {

  //instance vars;
  Stack<Boolean> lives;
  color col;
  float x;
  float y;
  ArrayList<PVector> trail;
  //should change based on position of the pilot ball
  int trailSize = 50;
  PVector circlePosition;

  //default constructor
  Pilot() {
    col = color(48, 139, 206, 140);
    lives = new Stack<Boolean>();
    x = mouseX;
    y = mouseY;
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
}//end class