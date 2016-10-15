// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A soft pendulum (series of connected springs)

class Chain {

  // Chain properties
  float stringLength;  // length between points
  int numPointsW;      // How many points
  int numPointsH;      // How many points
  float strength;      // Strength of springs
  
  // This list is redundant since we can ask for physics.particles, but in case we have many of these
  // it's a convenient to keep track of our own list
  Particle particles[][];

  // Some variables for mouse dragging
  PVector offset = new PVector();
  boolean dragged = false;

  // Chain constructor
  Chain(float l, int w, int h, float s) {
    particles = new Particle[w][h];

    stringLength = l;
    numPointsW = w;
    numPointsH = h;
    strength = s;
    float startW = (width - l*w) / 2;    

    // Here is the real work, go through and add particles to the chain itself
    for(int i=0; i < numPointsW; i++) {      
      for(int j=0; j < numPointsH; j++) {
        Particle particle = new Particle(startW + i * stringLength, j*stringLength);

        // Redundancy, we put the particles both in physics and in our own ArrayList
        physics.addParticle(particle);
        particles[i][j] = particle;
        if (i != 0) {
          Particle previous = particles[i - 1][j];
          VerletSpring2D spring = new VerletSpring2D(particle,previous,stringLength,strength);
          physics.addSpring(spring);
        }
        if (j != 0) {
          Particle previous = particles[i][j-1];
          VerletSpring2D spring = new VerletSpring2D(particle,previous,stringLength,strength);
          physics.addSpring(spring);
        }
      }      
    }
    
        //Particle previous = particles.get(i-1);
        //VerletSpring2D spring = new VerletSpring2D(particle,previous,len,strength);
        //// Add the spring to the physics world
        //physics.addSpring(spring);
    // pin the top left and right particles 
    particles[0][0].lock();
    particles[numPointsW - 1][0].lock();
  }

  // Draw the chain
  void display() {
    // Draw line connecting all points    
    noFill();
    for (int i = 0; i < numPointsW; i++) {
      beginShape();
      stroke(0);
      strokeWeight(2);
      for (int j = 0; j < numPointsH; j++) {
        Particle p = particles[i][j];        
        vertex(p.x, p.y);        
      } 
      endShape();    
    }
    
    for (int i = 0; i < numPointsH; i++) {
      beginShape();
      stroke(0);
      strokeWeight(2);
      for (int j = 0; j < numPointsW; j++) {
        Particle p = particles[j][i];        
        vertex(p.x, p.y);        
      } 
      endShape();    
    }    
  }
}