// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Example demonstrating distance joints 
// A bridge is formed by connected a series of particles with joints

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

// A reference to our box2d world
Box2DProcessing box2d;

// A list for all of our rectangles
ArrayList<Pair> bridge;

ArrayList<Box> boxes;

void setup() {
  size(640,360);
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  // Create ArrayLists	
  bridge = new ArrayList<Pair>();
  boxes = new ArrayList<Box>();
  
  Particle prior = new Particle(0, height / 2, 0, BodyType.STATIC);  
  for (int x = int(prior.r); x < width; ) {
    Particle particle = new Particle(x, height / 2);
    Pair pair = new Pair(prior, particle);
    bridge.add(pair);
    prior = particle;
    x += pair.len;
  }  
  bridge.add(new Pair(prior, new Particle(width, height / 2, 0, BodyType.STATIC)));  
}

void draw() {
  background(255);

  // We must always step through time!
  box2d.step();

  for (Pair pair: bridge) {
    pair.display();
  }
  
  for (Box box: boxes) {
    box.display();
  }
  

  fill(0);
  text("Click mouse to create falling boxes.",10,20);
}

void mousePressed() {
   Box b = new Box(mouseX,mouseY);
   boxes.add(b);
}