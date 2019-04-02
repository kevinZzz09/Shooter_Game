Player p;
Spawner s;
boolean gameOver;
PImage cursorImg, Background;

void setup() {
  //fullScreen();
  size(1280, 720);
  char[] temp = {'w', 's', 'a', 'd', ' '}; //up, down, left, right, shoot
  p = new Player(20, temp);
  s = new Spawner();
  cursorImg = loadImage("Crosshair_Cursor.png");
  Background = loadImage("background.jpg");
  gameOver = false;
}

void draw() {
  background(Background);
  if (gameOver) {
    background(0);
    text("GAME OVER, YOUR SCORE WAS " + p.points, (width - textWidth("GAME OVER, YOUR SCORE WAS " + p.points)) / 2, height / 2);
    text("PRESS 'G' TO REPLAY", (width - textWidth("PRESS 'G' TO REPLAY")) / 2, height / 2 + 30);
    if (keyPressed && (key == 'G' || key == 'g')) {
      gameOver = false;
      char[] temp = {'w', 's', 'a', 'd', ' '}; //up, down, left, right, shoot
      p = new Player(20, temp);
      s = new Spawner();
    }
  }
  else {
    cursor(cursorImg, 15, 15);
    p.move();
    p.update(s.enemies);
    p.display();
    s.update(p);
    if (p.HP <= 0)
      gameOver = true;
    textSize(25);
    text("Health: " + p.HP + " / " + p.maxHP, 10, 20);
    text("Points: " + p.points, 10, 50);
    textSize(15);
    text("W, A, S, D to move", width - textWidth("W, A, S, D to move"), 20);
    text("Space to shoot", width - textWidth("Space to Shoot"), 40);
    text("Move cursor to aim", width - textWidth("Move cursor to aim"), 60);
    text("Escape to exit", width - textWidth("Escape to exit"), 80);
  }
  
  if (frameCount % 150 == 0 && p.HP < p.maxHP)
    p.HP++;
  
  if (p.points / 1000 >= (p.maxHP - 20) / 5 + 1)
    p.maxHP += 5;
}

void keyPressed() {
  p.buttonPressed();
}

void keyReleased() {
  p.buttonReleased();
}
