// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

int elements = 5;

// Mover object
Bob bobs[] = new Bob[elements];

// Spring object
Spring springs[] = new Spring[elements];

void setup() {
  size(640,360);
  // Create objects at starting position
  // Note third argument in Spring constructor is "rest length"
  //spring = new Spring(width/2,10,100); 
  for (int i = 0; i < elements; i++) {
    bobs[i] = new Bob(random(width), random(height));
    springs[i] = new Spring(0, 0, 100);
  }
}

void draw()  {
  background(255); 
  // Apply a gravity force to the bob
  PVector gravity = new PVector(0,2);
  for (int i = 0; i < elements; i++) {
    bobs[i].applyForce(gravity);
    // Connect the bob to the spring (this calculates the force)
    int nextBobIdx = i == elements - 1 ? 0 : i + 1;
    springs[i].anchor = bobs[nextBobIdx].position;
    springs[i].connect(bobs[i]);
    springs[i].connect(bobs[nextBobIdx]);
    // Constrain spring distance between min and max
    springs[i].constrainLength(bobs[i], 30, 200);
  }

  for (int i = 0; i < elements; i++) {
    bobs[i].checkEdges();
    // update bob
    bobs[i].update();
    // If it's being dragged
    bobs[i].drag(mouseX,mouseY);
    // draw everything
    springs[i].displayLine(bobs[i]);
    bobs[i].display();
    springs[i].display();
  }
  
  fill(0);
  text("click on bob to drag",10,height-5);
}


// For mouse interaction with bob

void mousePressed()  {
  for (int i = 0; i < elements; i++) {
    bobs[i].clicked(mouseX,mouseY);
  }
}

void mouseReleased()  {
  for (int i = 0; i < elements; i++) {
    bobs[i].stopDragging(); 
  }
}