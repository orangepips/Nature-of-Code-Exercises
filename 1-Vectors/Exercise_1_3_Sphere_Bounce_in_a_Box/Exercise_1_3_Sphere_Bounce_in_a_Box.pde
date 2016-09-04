int BOX_SIZE = 300;
int SPHERE_SIZE = 100;
int offset = (BOX_SIZE/2-SPHERE_SIZE/2);
PVector location = new PVector(0, 0, 0);
PVector velocity = new PVector(getRandom(), getRandom(), getRandom());

void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(0);
  drawBox();
  drawSphere();
}

void drawBox() {
  pushMatrix();
  translate(width/2, height/2, 0);
  stroke(255);
  rotateX(PI/2);
  rotateZ(-PI/6);
  noFill();
  
  box(BOX_SIZE);
  popMatrix();
}

void drawSphere() {
  int x = width/2 - offset;
  int y = height/2 - offset;
  int z = -offset;
  
  pushMatrix();
  translate(x + location.x, y + location.y, z + location.z);
  stroke(255);
  rotateX(PI/2);
  rotateZ(-PI/6);
  noFill();  
  sphere(SPHERE_SIZE);
  
  // boundary detection
  println(location.x, location.y, location.z);
  
  if (location.x < 0 || location.x >= BOX_SIZE - offset) {
    velocity.x = -velocity.x;
  }
  if (location.y < 0 || location.y >= BOX_SIZE - offset) {
    velocity.y = -velocity.y;
  }
  if (location.z > 0 || location.z <= (BOX_SIZE - offset) * -1) {
    velocity.z = -velocity.z;
  }
  
  location.add(velocity);
  
  popMatrix();  
}

int getRandom() {
  return int(random(-3, 3)); 
}