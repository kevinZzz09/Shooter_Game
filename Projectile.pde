class Projectile {
  protected PVector location, velocity;
  protected float size;
  protected int damage;
  
  Projectile(float tx, float ty, float tvx, float tvy, float tsize, int td) {
    location = new PVector(tx, ty);
    velocity = new PVector(tvx, tvy);
    size = tsize;
    damage = td;
  }
  
  void update() {
    location.add(velocity);
  }
  
  void display() {
    stroke(0);
    fill(255, 0, 0);
    pushMatrix();
    translate(0, height);
    scale(1, -1);
    ellipse(location.x, location.y, size, size);
    popMatrix();
  }
  
  boolean outOfBounds() {
    return location.x > width || location.x < 0 || location.y > height || location.y < 0;
  }
  
  boolean collides(Ship c) { //Checks if a bullet collides with ship c
    return !(this.location.x - this.size / 2 > c.location.x + c.size || 
             this.location.y - this.size / 2 > c.location.y + c.size || 
             this.location.x + this.size / 2 < c.location.x - c.size || 
             this.location.y + this.size / 2 < c.location.y - c.size);
  }
}
