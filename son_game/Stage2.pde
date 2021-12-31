int enemyCount=0;
class Stage2 extends Stage {
  int N;

  PImage road, road2, road3;


  Car player;
  Car[] police = new Car[4];
  Stage2() {
    player= new PlayerCar();
    for (int i=0; i<4; ++i) {
      police[i] = new PoliceCar(200+i*200);
    }

    road=loadImage("road.png");
    road2=loadImage("road2.png");
    road3=loadImage("road3.png");
  }

  @Override
    void draw() {


    smooth(); 
    image(road, width/2, height/2, width, height); 
    N++; 
    if (N%3==1) image(road, width/2, height/2, width, height); 
    if (N%3==2) image(road2, width/2, height/2, width, height); 
    if (N%3==3) image(road3, width/2, height/2, width, height);
    player.paint();
    for (int i=0; i<4; ++i) {
      police[i].paint();
      police[i].move();
      police[i].checkPosition();
      ((PlayerCar)player).hitTest(police[i]);
      if (police[i].checkDead()) {
        police[i] = new Swat(200+i*200);
      }
    }
    if (player.checkDead()) {
      isEnd=true;
    }
    if (u==1)
      ((PlayerCar)player).moveUp();

    if (d==1)
      ((PlayerCar)player).moveDown();

    if (l==1)
      ((PlayerCar)player).moveLeft();

    if (r==1)
      ((PlayerCar)player).moveRight();
    fill(255, 0, 0);
    text("score: "+ score, 0, 100);
    textSize(30);
    score++;
  }

  @Override
    void keyPressed() {
    if (keyCode == UP) { 
      u=1;
    } 
    if (keyCode == DOWN) { 
      d=1;
    } 
    if (keyCode == LEFT) { 
      l=1;
    } 
    if (keyCode == RIGHT) { 
      r=1;
    }
  }


  @Override
    void keyReleased() {
    if (keyCode == UP) { 
      u=0;
    } 
    if (keyCode == DOWN) { 
      d=0;
    } 
    if (keyCode == LEFT) { 
      l=0;
    } 
    if (keyCode == RIGHT) { 
      r=0;
    }
  }
}
