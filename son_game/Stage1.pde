boolean right_collision, left_collision, up_collision, down_collision;
int u, d, l, r;
int score=0;
class Stage1 extends Stage {//////////////////스테이지1 클래스(스테이지 클래스 상속)
  Player character;
  Enemy[] enemy = new Enemy[4];/////////////적 배열
  Block[] b = new Block[5];//////////////맵 배열
  Item sword;

  Stage1() {
    sword = new Item();
    isEnd=false;
    character=new Player();
    enemy[0] = new Enemy(900, 50);///////////////////적들 위치
    enemy[1] = new Enemy(300, 200);
    enemy[2] = new Enemy(900, 450);
    enemy[3] = new Enemy(700, 800);
    b[0] = new Block(0, 200, 600, 100);/////////////////벽 위치
    b[1] = new Block(500, 200, 200, 200);
    b[2] = new Block(400, 700, 270, 200);
    b[3] = new Block(1000, 400, 200, 200);
    b[4] = new Block(500, 400, 400, 20);
    noStroke();
    right_collision = false;//////////////벽과의 충돌 판정
    left_collision = false;
    up_collision = false;
    down_collision = false;
  }
  //<>//
  @Override////////////가상 메소드 구체화(부모 클래스 가져옴)
    void draw() {
    fill(255,0,0);
    background(255);
    text("EXIT",width-100,height-100);////////////////출구 표시
    textSize(30);
    text("score: "+ score, 0, 100);
    textSize(30);
    
 
    for (int i=0; i<5; ++i) {
      b[i].paint();
    }

    if(character.checkAlive()){
      isEnd = true;
    }
    if (!character.checkSword())
      sword.paint();
    character.paint();
    for (int i=0; i<4; ++i) {
      if (!enemy[i].isDead) {
        enemy[i].paint();
        enemy[i].checkPlayerDist(character);
        enemy[i].moveToPlayer();
        character.hitTest(enemy[i]);
      }
    }
    character.hitTest(sword);
    for (int i=0; i<5; ++i) {
      b[i].collision(character);
    }
    if (u==1)
      character.moveUp();

    if (d==1)
      character.moveDown();

    if (l==1)
      character.moveLeft();

    if (r==1)
      character.moveRight();
  }
  @Override 
    void keyPressed() {
    if (keyCode == UP && up_collision == false) { 
      u=1;
    } 
    if (keyCode == DOWN && down_collision == false) { 
      d=1;
    } 
    if (keyCode == LEFT && left_collision == false) { 
      l=1;
    } 
    if (keyCode == RIGHT && right_collision == false) { 
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
  @Override
  boolean checkClear(){ //////////////스테이지1 클리어 판정
    if(dist(character.x,character.y,width,height)<200){
      isClear = true;
      score+=500;//////////////스테이지1 클리어하면 500점+
    }
    return isClear;
  }
}
