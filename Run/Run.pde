Pilot pilot;
Enemy[] badDudes;

void setup(){
  size(600,600);
  background(0);
  frameRate(60);
  pilot = new Pilot();
  badDudes = new Enemy[100];
  for (int i = 0; i < badDudes.length; i++){
    badDudes[i] = new Enemy();
  }
}


void draw(){
  clear();
  for (int i = 0; i < badDudes.length; i++){
    badDudes[i].update();
  }
  pilot.dragsegment();
  pilot.dragtrail();
}