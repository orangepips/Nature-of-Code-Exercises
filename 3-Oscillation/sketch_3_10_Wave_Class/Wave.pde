class Wave {
 int distanceX;
 int startX; 
 int startY;
 int _width;
 int _height;
 float startAngle;
 float angleVelocity;
 float theta;
 
 float angle; 
 
 Wave(int _distanceX, int _startX, int _startY, int __width, int __height, float _startAngle, float _angleVelocity, float _theta) {
   distanceX = _distanceX;
   startX = _startX;
   startY = _startY;
   _width = __width;
   _height = __height;
   startAngle = _startAngle;
   angleVelocity = _angleVelocity;
   theta = _theta;
 }
 
  void display() {
    startAngle += theta;
    angle = startAngle;
    
    for (int x = startX; x <= startX + _width; x += distanceX) {      
      float y = map(sin(angle), -1, 1, distanceX * 4, startY + _height);
      stroke(0);
      fill(255,0,255,50);
      strokeWeight(2);
      println(angle, x, y);
      ellipse(x,y,distanceX*4,distanceX*4);
      angle += angleVelocity;
    }
  }
}