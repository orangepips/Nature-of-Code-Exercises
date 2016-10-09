// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A list for all of our rectangles
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;

Box2DProcessing box2d;

void setup() {
  size(640,360);

  box2d = new Box2DProcessing(this);
  //box2d.setGravity(0, -10);
  box2d.createWorld();
  
  boxes = new ArrayList<Box>();
}

void draw() {
  background(255);
  
  box2d.step();

  // When the mouse is clicked, add a new Box object
  if (mousePressed) {
    Box p = new Box();
    boxes.add(p);
  }

  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }
}