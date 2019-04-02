class Player extends Ship {
  private boolean[] keys;
  private char[] inputs; //up, down, left, right, shoot
  private PVector mDirection;
  private int points;
  private PImage sprite = loadImage("player_sprite.png");
  
  Player(float tsize, char[] tinputs) {
    super(width / 2, 20, 0, 0, tsize, 20, 10);
    inputs = tinputs;
    keys = new boolean[inputs.length];
    mDirection = new PVector(mouseX, height - mouseY);
    mDirection.sub(location);
    mDirection.normalize();
    points = 0;
  }
  
  void update(ArrayList<Enemy> ens) {
    super.update();
    
    mDirection = new PVector(mouseX, height - mouseY);
    mDirection.sub(location);
    mDirection.normalize();
    
    for (Enemy e : ens) {
      collisions(e);
    }
    
    //Checks if the character is within bounds
    if (location.x < size)
      location.x = size;
    if (location.x > width - size)
      location.x = width - size;
    if (location.y < size)
      location.y = size;
    if (location.y > height - size)
      location.y = height - size;
  }
  
  void move() {
    //Resets velocity
    setV(0, 0);
    
    //Changes velocity based on which keys are pressed down
    if (keys[0]) {
      setV(velocity.x, 8);
    }
    if (keys[1]) {
      setV(velocity.x, -8);
    }
    if (keys[2]) {
      setV(-8, velocity.y);
    }
    if (keys[3]) {
      setV(8, velocity.y);
    }
    if (keys[4]) {
      if (frameCount % 5 == 0) {
        super.shoot(location.x, location.y, mDirection.x * 20, mDirection.y * 20);
      }
    }
  }
  
  void setV(float tvx, float tvy) {
    velocity = new PVector(tvx, tvy);
  }
  
  //buttonPressed and buttonReleased keeps track of which keys are pressed to allow for multiple presses at the same time
  void buttonPressed() {
    for (int i = 0; i < keys.length; i++)
      if (key == inputs[i])
        keys[i] = true;
  }
  
  void buttonReleased() {
    for (int i = 0; i < keys.length; i++)
      if (key == inputs[i])
        keys[i] = false;
  }
  
  void display() {
    pushMatrix();
    translate(location.x, height - location.y);
    rotate(PI / 2 - mDirection.heading());
    image(sprite, -size, - size, size * 2, size * 2);
    popMatrix();
    super.displayB();
  }
}
