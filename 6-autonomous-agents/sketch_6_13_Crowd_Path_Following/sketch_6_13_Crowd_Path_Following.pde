// Using this variable to decide whether to draw all the stuff
boolean debug = true;

// A path object (series of connected points)
Path path;

int displacement = 50;
ArrayList<Vehicle> vehicles;

void setup() {
  size(640, 360);
  // Call a function to generate new Path object
  newPath();

  // Each vehicle has different maxspeed and maxforce for demo purposes
  //car1 = new Vehicle(new PVector(0, height/2), 2, 0.04);
  //car2 = new Vehicle(new PVector(0, height/2), 3, 0.1);
  
  mousePressed();
}

void draw() {
  background(255);
  // Display the path
  path.display();
  
  for (Vehicle v : vehicles) {
    // Path following and separation are worked on in this function
    v.separate(vehicles);
    // Call the generic run method (update, borders, display, etc.)
    v.follow(path);
    v.run();
  }
  
  // Instructions
  fill(0);
  text("Hit space bar to toggle debugging lines.\nClick the mouse to generate a new path.", 10, height-30);
}

void newPath() {
  // A path is a series of connected points
  // A more sophisticated path might be a curve
  
  
  path = new Path();
  path.addPoint(displacement, displacement);
  path.addPoint(displacement, height-displacement);
  path.addPoint(width/2, height-displacement*2);
  path.addPoint(width-displacement, height-displacement);
  path.addPoint(width-displacement, displacement);
  path.addPoint(displacement, displacement);
  //path.addPoint(-20, height/2);
  //path.addPoint(random(0, width/2), random(0, height));
  //path.addPoint(random(width/2, width), random(0, height));
  //path.addPoint(width+20, height/2);
}

public void keyPressed() {
  if (key == ' ') {
    debug = !debug;
  }
}

public void mousePressed() {
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 20; i++) {
    vehicles.add(new Vehicle(new PVector(random(width), random(height)), random(5), random(5)));
  }
}