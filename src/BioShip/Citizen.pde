class Citizen {
  // Member Variable
  int x, y, health, hitPoints, speed;
  boolean isHit;
  PImage r1;
  
  // Constructor
  Citizen(int x, int y) {
    this.x = x;
    this.y = y;
    health = 100;
    hitPoints = 100;
    speed = int(random(1, 5));
    isHit = false;
    
    if (random(2) > 1) {
      r1 = loadImage("cShip.png");
    } else {
      r1 = loadImage("cShip.png");
    }
  }
  
  // Member Methods
  void display() {
    pushMatrix();
    translate(x, y);
    scale(1, -1);
    imageMode(CENTER);
    image(r1, 0, 0, 75, 75);
    popMatrix();
  }
  
  void move() {
    y = y + speed;
  }

  boolean isOffScreen() {
    if (y > height + 50) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean isHit(Ship s) {
    float d = dist(x, y, s.x, s.y);
    if (d < 50) {
      return true;
    } else {
      return false;
    }
  }
}
