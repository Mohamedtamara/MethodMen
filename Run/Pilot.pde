import java.util.*;

class Pilot {

  //instance vars;
  Stack<Boolean> lives;
  int state; //what powerup it has
  int numLives;
  color col;
  float x,y,lx,ly;
  float easing = .10;
  ArrayList<PVector> trail;
  
  //init tail
  ArrayList<PVector> trailInit;
  //should change based on position of the pilot ball
  int trailSizeInit = 10;
  PVector circlePositionInit;
  PVector currTrailInit;
  PVector prevTrailInit;
  
  //should change based on position of the pilot ball
  //second part of tail
  int trailSize = 19;
  PVector circlePosition;
  PVector currTrail;
  PVector prevTrail;

  //default constructor
  Pilot() {
    col = color(48, 139, 206, 140);
    lives = new Stack<Boolean>();
    for (int i = 0; i < 100; i++)
      lives.push(true);
    numLives = 100;
    x = 300;
    y = 300;
    lx = mouseX;
    ly = mouseY;
    trail = new ArrayList<PVector>();
    trailInit = new ArrayList<PVector>();
    circlePosition = new PVector(width*.5, width*.5);
    circlePositionInit = new PVector(width*.7, width*.7);
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
    line(x, y, x, y);
  }//end dragsegment()
  
  //dragInit()
  void dragInit() {
    int trailLengthInit;
    circlePositionInit = new PVector(mouseX, mouseY);
    trailInit.add(circlePositionInit);
    trailLengthInit = trailInit.size()-2;

    for (int i = 0; i < trailLengthInit; i++) {
      PVector currTrailInit = trailInit.get(i);
      PVector prevTrailInit = trailInit.get(i+1);      
      stroke(255);
      strokeWeight(3);
      line(currTrailInit.x, currTrailInit.y, 
        prevTrailInit.x, prevTrailInit.y);
    }

    if (trailLengthInit >= trailSizeInit) {
      trailInit.remove(0);
    }
  }// end dragInit()
  
  

  //dragtrail()
  void dragtrail() {
    int trailLength;
    circlePosition = new PVector(mouseX , mouseY );
    trail.add(circlePosition);
    trailLength = trail.size()-2;

    for (int i = 0; i < trailLength; i++) {
      PVector currTrail = trail.get(i);
      PVector prevTrail = trail.get(i+1);      
      stroke(col);
      strokeWeight(3);
      line(currTrail.x, currTrail.y, 
        prevTrail.x, prevTrail.y);
    }

    if (trailLength >= trailSize) {
      trail.remove(0);
    }
  }// end dragtrail()

  //visual representation of lives
  void draglives() {
    for (boolean b : lives) {
      if (b == true) {
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
  }//end draglives()

  //text to show the # of lives
  void dragtext() {  
    for (boolean b : lives) {
      if (b == true) {
        float xpos  =  mouseX;
        float Dx = xpos - lx;
        float ypos = mouseY;
        float Dy = ypos - ly;
        lx += Dx * easing;
        ly += Dy * easing;
        String l = numLives + "";
        fill(255, 0, 0);
        text(l, lx, ly);
      }
    }
  }//end dragtext()
}//end class