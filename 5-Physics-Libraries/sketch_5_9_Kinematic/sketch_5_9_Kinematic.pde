// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Basic example of controlling an object with the mouse (by attaching a spring)

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A reference to our box2d world
Box2DProcessing box2d;

// A list we'll use to track fixed objects
ArrayList boundaries;

// Just a single box this time
Box box;

float timeX = random(0, 1000);
float timeY = random(0, 1000);
float increment = .02;

PVector fakeMouse; 
float fakeMouseX;
float fakeMouseY;

boolean fakeMousePressed = false;

void setup() {
  size(640,360);
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  fakeMouse = new PVector(random(10, width-10), random(10, height-10));

  // Make the box
  box = new Box(width/2,height/2);

  // Add a bunch of fixed boundaries
  boundaries = new ArrayList();
  boundaries.add(new Boundary(width/2,height-5,width,10,0));
  boundaries.add(new Boundary(width/2,5,width,10,0));
  boundaries.add(new Boundary(width-5,height/2,10,height,0));
  boundaries.add(new Boundary(5,height/2,10,height,0));
}

void draw() {
  background(255);

  // We must always step through time!
  box2d.step();
  
  if (box.contains(fakeMouse.x, fakeMouse.y) && !fakeMousePressed) {
    fakeMousePressed = true;         
  }
  
  if (fakeMousePressed && random(1) < .7) {    
    moveFakeMouseWithNoise();
    box.update(fakeMouse);
  } else if (fakeMousePressed) {        
    fakeMousePressed = false;
  } else {    
    moveFakeMouseTowardBox();
  }  
  
  stroke(255);
  fill(255, 0, 0, 128);
  ellipse(fakeMouse.x, fakeMouse.y, 20, 20);

  // Draw the boundaries
  for (int i = 0; i < boundaries.size(); i++) {
    Boundary wall = (Boundary) boundaries.get(i);
    wall.display();
  }

  // Draw the box
  box.display();
  // Draw the spring (it only appears when active)  
}

void moveFakeMouseWithNoise() {
  int movement = 12;
  PVector fakeMouseMovement = new PVector();
  fakeMouseMovement.x += map(noise(timeX), 0, 1, -movement, movement);
  fakeMouseMovement.y += map(noise(timeY), 0, 1, -movement, movement);
  
  fakeMouse.add(fakeMouseMovement);
  fakeMouse.x = constrain(fakeMouse.x, 10, width - 10);
  fakeMouse.y = constrain(fakeMouse.y, 10, height - 10);
  timeX += increment;
  timeY += increment;
}

void moveFakeMouseTowardBox() {
  fakeMouse.sub(PVector.sub(fakeMouse, box.loc).normalize().mult(2));        
}