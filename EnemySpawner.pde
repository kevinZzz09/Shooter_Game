class Spawner {
  ArrayList<Enemy> enemies;
  int count, spawnRate, eSpawned;
  
  Spawner() {
    enemies = new ArrayList<Enemy>();
    count = 0;
    spawnRate = 60;
    eSpawned = 0;
  }
  
  void update(Player p) {
    if (count % spawnRate == 0) {
      if (random(1) < 0.3 + spawnRate / 100.0) {
        Enemy e = new Enemy(random(15, width), height, 0, -2, 15, 50, 1, 1);
        enemies.add(e);
      }
      else {
        Enemy e = new Enemy(random(15, width), height, 0, -2, 20, 30, 1, 2);
        enemies.add(e);
      }
      
      if (random(1) < 0.1) {
        Enemy e = new Enemy(random(15, width), height, 0, -2, 15, 70, 1, 3);
        enemies.add(e);
      }
      eSpawned++;
      
      if (eSpawned % 10 == 0 && spawnRate > 10)
        spawnRate--;
    }
    count++;
    
    ArrayList<Enemy> remove = new ArrayList<Enemy>();
    
    for (Enemy e : enemies) {
      e.update();
      e.display();
      e.collisions(p);
      if (e.destroyed() || e.outOfBounds())
        remove.add(e);
      if (e.destroyed())
        p.points += 100 * e.enemyType;
    }
    
    enemies.removeAll(remove);
  }
}
