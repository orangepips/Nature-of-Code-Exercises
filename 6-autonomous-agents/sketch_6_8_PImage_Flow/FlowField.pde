// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Flow Field Following

class FlowField {
  float increment = 0.01;
  // The noise function's 3rd argument, a global variable that increments once per cycle
  float zoff = 0.0;  
  // We will increment zoff differently than xoff and yoff
  float zincrement = 0.001;
  
  // A flow field is a two dimensional array of PVectors
  PVector[][] field;
  int cols, rows; // Columns and Rows
  int resolution; // How large is each "cell" of the flow field

  FlowField(int r) {
    resolution = r;
    // Determine the number of columns and rows based on sketch's width and height
    cols = width/resolution;
    rows = height/resolution;
    field = new PVector[cols][rows];
    generate();
  }

  void generate() {
    float xoff = 0.0; // Start xoff at 0
  
    for (int x = 0; x < cols; x++) {
      xoff += increment;   // Increment xoff 
      float yoff = 0.0;   // For every xoff, start yoff at 0
      for (int y = 0; y < rows; y++) {
        yoff += increment; // Increment yoff
        float theta = map(noise(xoff,yoff,zoff),0,1,0,TWO_PI);
        field[x][y] = new PVector(cos(theta),sin(theta));
      }
    }
    
    zoff += zincrement;
  }

  // Draw every vector
  void display() {    
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(field[i][j],i*resolution,j*resolution,resolution-2);
      }
    }
   //drawVector(field[0][0],0*resolution,0*resolution,resolution/2); 
  }
  
  // Renders a vector object 'v' as an arrow and a position 'x,y'
  void drawVector(PVector v, float x, float y, float scayl) {
    PImage img = createImage(int(scayl), int(scayl), ARGB);
    img.loadPixels();
    
    for (int i = 0; i < img.pixels.length; i++) {
      //float alpha = 255;
      int xpos = int(i % scayl);
      //int ypos = floor(i / scayl);      
      img.pixels[i] = color(0, 90, 102, map(xpos, 0, scayl, 0, 255)); 
    }
    
    pushMatrix();
    //float arrowsize = 4;
    // Translate to position to render vector
    translate(x,y);
    
    //stroke(0,100);
    // Call vector heading function to get direction (note that pointing to the right is a heading of 0) and rotate
    rotate(v.heading());
    image(img, 1, 1);
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    //float len = v.mag()*scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    //line(0,0,len,0);
    //line(len,0,len-arrowsize,+arrowsize/2);
    //line(len,0,len-arrowsize,-arrowsize/2);
    
    popMatrix();
  }

  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution,0,cols-1));
    int row = int(constrain(lookup.y/resolution,0,rows-1));
    return field[column][row].get();
  }


}