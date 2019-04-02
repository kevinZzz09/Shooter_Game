class Ship extends Projectile {
  ArrayList<Projectile> bullets;
  int maxHP, HP;
  
  Ship(float tx, float ty, float tvx, float tvy, float tsize, int tmh, int td) {
    super(tx, ty, tvx, tvy, tsize, td);
    maxHP = tmh;
    HP = maxHP;
    bullets = new ArrayList<Projectile>();
  }
  
  void update() {
    super.update();
    updateB();
  }
  
  void updateB() {
    ArrayList<Projectile> remove = new ArrayList<Projectile>();
    
    for (Projectile b : bullets) {
      b.update();
      if (b.outOfBounds())
        remove.add(b);
    }
    
    bullets.removeAll(remove);
  }
  
  void collisions(Ship c) { //Checks if a ship's bullets hit ship c
    ArrayList<Projectile> remove = new ArrayList<Projectile>();
    
    for (Projectile b : bullets) {
      if (b.collides(c)) {
        c.hit(b);
        remove.add(b);
      }
    }
    
    bullets.removeAll(remove);
    
    if (this.collides(c)) {
      this.HP = 0;
      c.HP = 0;
    }
  }
  
  void display() {
    super.display();
    displayB();
  }
  
  void displayB() {
    for (Projectile b : bullets)
      b.display();
  }
  
  void shoot(float x, float y, float xv, float yv) {
    Projectile b = new Projectile(x, y, xv, yv, 10, damage);
    bullets.add(b);
  }
  
  void hit(Projectile b) { //When a ship is hit by a bullet b
    HP -= b.damage;
  }
  
  boolean destroyed() {
    return HP <= 0;
  }
}
