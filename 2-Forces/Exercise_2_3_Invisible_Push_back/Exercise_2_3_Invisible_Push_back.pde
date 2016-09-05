// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover[] movers = new Mover[20];

void setup() {
  size(640,360);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,4),0,0); 
  }
}

void draw() {
  background(255);
  
  for (int i = 0; i < movers.length; i++) {

    PVector wind = new PVector(0.01,0);
    PVector gravity = new PVector(0,0.1);
    
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    pushBack(movers[i]);
    
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }

}

void pushBack(Mover mover) {
  float maxPushBack = 0.2;
  float xMiddle = width/2;
  float yMiddle = height/2;
  
  float xForce = -1 * map((mover.position.x - xMiddle) / xMiddle, -1, 1, -maxPushBack, maxPushBack);
  float yForce = -1 * map((mover.position.y - yMiddle) / yMiddle, -1, 1, -maxPushBack, maxPushBack);
  
  //println(mover.position, (mover.position.x - xMiddle), (mover.position.y - yMiddle), xForce, yForce);
  mover.applyForce(new PVector(xForce, yForce));
}