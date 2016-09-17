float theta = 33.0;
float thetaRad = radians(theta);
float gravity = 1.0;
float mass = 1.0;
float f_coeff = 0.75; // Note that the magnitude of the friction force is equal to the normal force.

float hypotenuse = 300;
float opposite = sin(thetaRad) * hypotenuse;
float adjacent = cos(thetaRad) * hypotenuse;

// http://thecraftycanvas.com/library/online-learning-tools/physics-homework-helpers/incline-force-calculator-problem-solver/
float weight = mass * gravity;
float normal = weight * cos(thetaRad);
float downhill = weight * sin(thetaRad);
float friction = f_coeff * normal; 
float applied = downhill - ( friction > downhill ? downhill * .999 : friction); 

float boxLen = 20;

void setup() {
  size(400, 400);
}

float x3;
float y3;

float velocity = 0;
float xPos = -boxLen;
float yPos = -boxLen;

void draw() {
   background(255);
   drawIncline();   
   translate(x3, y3);
   rotate(-thetaRad);
   fill(255, 0, 0);   
   if (xPos <= -hypotenuse) {
     xPos = -hypotenuse;
     noLoop(); 
   }
   rect(xPos, yPos, boxLen, boxLen);
   velocity += applied;
   xPos -= velocity;
   println(velocity, xPos);
}

void drawIncline() {
  // http://www.themathpage.com/atrig/solve-right-triangles.htm
  float x1 = (width - adjacent) / 2;
  float y1 = (height + opposite) / 2;
  float x2 = x1 + adjacent;
  float y2 = y1;
  x3 = x2;
  y3 = y2 - opposite;
  noStroke();
  fill(0, 255, 0);
  triangle(x1, y1, x2, y2, x3, y3);  
}