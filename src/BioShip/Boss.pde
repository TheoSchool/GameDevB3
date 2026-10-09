class Boss {
  float x, y;
  int health;
  PImage bossImg;

  Boss(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    health = 5000; 
    bossImg = loadImage("boss.png"); 
  }

  void display() {
    imageMode(CENTER);
    if (bossImg != null) {
      image(bossImg, width / 2, height / 4, width, height / 2);
    } else {
      // Fallback red rectangle if the image isn't loaded yet
      fill(200, 0, 0);
      rectMode(CENTER);
      rect(width / 2, height / 4, width, height / 2);
    }
  }

  void move() {
    x = width / 2;
    y = height / 4;
  }

  boolean isHit(Laser l) {
    return l.y <= height / 2 && l.x >= 0 && l.x <= width;
  }
}
