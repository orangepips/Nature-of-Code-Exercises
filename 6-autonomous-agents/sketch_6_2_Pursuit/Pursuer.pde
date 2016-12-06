class Pursuer extends Vehicle {
  PVector other_last_position;
  PVector last_position;
  
  Pursuer(float x, float y) {
    super(x, y);
    this.maxspeed = 5;
    c = color(0, 0, 255); 
  }
  
  void move(Vehicle other) {
    
    // http://stackoverflow.com/a/2249237/470838
    if (other_last_position == null) {
      other_last_position = other.position.copy();      
      return;
    }
    
    PVector other_velocity = PVector.sub(other.position, other_last_position);
    //println("other_velocity:\t" + other_velocity);
    other_last_position = other.position.copy();
    
    float a = pow(other_velocity.x, 2) + pow(other_velocity.y, 2) - pow(velocity.mag(), 2);
    // println(this.velocity, this.velocity.mag());    
    float b = 2 * (other_velocity.x * (other.position.x - position.x) + other.position.y * (other.position.y - position.y)); 
    float c = pow(other.position.x - position.x, 2) + pow(other.position.y - position.y, 2);
    float disc = pow(b, 2) - 4 * a * c;
    
    if (Double.isNaN(disc) || disc < 0) {
      seek(other.position);
      return; 
    }
    
    float t1 = (-b + sqrt(disc)) / (2 * a);
    float t2 = (-b - sqrt(disc)) / (2 * a);
        
    float t;
    if (t1 > 0 && t2 > 0) {
      t = min(t1, t2);
    } else if (t1 > 0) {
      t = t1;
    } else {
      t = t2;
    }
    
    PVector aim = new PVector(0, 0);
    println("t:\t" + t);
    aim.x = t * other_velocity.x + other.position.x;
    aim.y = t * other_velocity.y + other.position.y;
    
    seek(aim);
  }
}