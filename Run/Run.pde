Pilot pilot;

void setup(){
  size(600,600);
  background(0);
  pilot = new Pilot();
  frameRate(60);
  
}


void draw(){
  clear();
  pilot.dragsegment();
  
}
