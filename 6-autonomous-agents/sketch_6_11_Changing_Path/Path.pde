// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Path Following

class Path {
  float increment = 0.01;
  // The noise function's 3rd argument, a global variable that increments once per cycle
  float zoff = 0.0;  
  // We will increment zoff differently than xoff and yoff
  float zincrement = 0.02; 

  // A Path is an arraylist of points (PVector objects)
  ArrayList<PVector> points;
  // A path has a radius, i.e how far is it ok for the boid to wander off
  float radius;

  Path() {
    // Arbitrary radius of 20
    radius = 20;
    points = new ArrayList<PVector>();
    noiseDetail(8,0.65f);
  }

  // Add a point to the path
  void addPoint(float x, float y) {
    PVector point = new PVector(x, y);
    points.add(point);
  }
  
  PVector getStart() {
     return points.get(0);
  }

  PVector getEnd() {
     return points.get(points.size()-1);
  }

  void shiftPoints() {
    float xoff = 0.0; // Start xoff at 0
    float yoff = 0.0;
    
    for (int i = 1; i < points.size() - 1; i++) {
      float shift = map(noise(xoff,yoff,zoff), 0, 1, -.5, .5);
      xoff += increment;    
      yoff += increment;
      PVector point = points.get(i);
      point.x += (point.x + shift + radius >= width || point.x + shift + radius <= 0 ? -10 : 1) * shift;
      point.y += (point.y + shift + radius >= height || point.y + shift + radius <= 0 ? -10 : 1) * shift;
      
      //point.x += shift;
      //point.y += shift;
    }
    zoff += zincrement;
  }


  // Draw the path
  void display() {
    // Draw thick line for radius
    stroke(175);
    strokeWeight(radius*2);
    noFill();
    beginShape();
    for (PVector v : points) {
      vertex(v.x, v.y);
    }
    endShape();
    // Draw thin line for center of path
    stroke(0);
    strokeWeight(1);
    noFill();
    beginShape();
    for (PVector v : points) {
      vertex(v.x, v.y);
    }
    endShape();
    shiftPoints();
  }
}