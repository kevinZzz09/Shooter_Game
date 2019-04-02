class Enemy extends Ship {
  int enemyType, count;
  PImage sprite1 = loadImage("enemy1.png"), sprite2 = loadImage("enemy2.png"), sprite3 = loadImage("enemy3.png");
  
  Enemy(float tx, float ty, float tvx, float tvy, float tsize, int tmh, int td, int tet) {
    super(tx, ty, tvx, tvy, tsize, tmh, td);
    maxHP = tmh;
    enemyType = tet;
    count = 0;
  }
  
  void display() {
    displayB();
    stroke(0);
    fill(color(255, 255, 255));
    pushMatrix();
    translate(location.x, height - location.y);
    rectMode(RADIUS);
    switch (enemyType) {
    case 1:
      image(sprite1, -size * 2, -size * 3, size * 4, size * 6);
      break;
    case 2:
      image(sprite2, -size * 2, -size * 2, size * 4, size * 4);
      break;
    case 3:
      image(sprite3, -size * 2, -size * 2, size * 4, size * 4);
      break;
    }
    popMatrix();
  }
  
  void shoot() {
    switch (enemyType) {
    case 1:
      super.shoot(location.x + size / 4, location.y, 0, -4);
      super.shoot(location.x - size / 4, location.y, 0, -4);
      break;
    case 2:
      super.shoot(location.x + size / 4, location.y - size, 4, -4);
      super.shoot(location.x, location.y - size, 0, -4);
      super.shoot(location.x - size / 4, location.y - size, -4, -4);
      break;
    case 3:
      super.shoot(location.x, location.y, 0, -6);
      super.shoot(location.x, location.y, 0, 2);
      super.shoot(location.x, location.y, 4, -2);
      super.shoot(location.x, location.y, -4, -2);
    }
  }
  
  void update() {
    super.update();
    count = (count + 1) % 60;
    if (count == 0 || count == 9 || count == 19)
      shoot();
  }
}
