// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Additive Blending

// This example demonstrates a "glow" like effect using
// additive blending with a Particle system.  By playing
// with colors, textures, etc. you can achieve a variety
// of looks.

ParticleSystem ps;

PImage img;

void setup() {
  size(640, 360, P2D);

  // Create an alpha masked image to be applied as the particle's texture
  img = loadImage("texture.png");

  ps = new ParticleSystem(0, new PVector(width/2, 50));
}

void draw() {

  /*
  blendMode(ADD);  
  background(0);
  */
  /*
  blendMode(SUBTRACT);  
  background(255);
  */
  /*
  blendMode(LIGHTEST);  
  background(0);
  */
  /*
  blendMode(DARKEST);  
  background(255);
  */
  /*
  blendMode(DIFFERENCE);  
  background(0);
  */
  /*
  blendMode(EXCLUSION);  
  background(0);
  */
  blendMode(MULTIPLY);  
  background(255);
  
  ps.run();
  for (int i = 0; i < 10; i++) {
    ps.addParticle();
  }
}