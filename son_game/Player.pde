class Player {///////////////////플레이어 클래스  //<>//
  int x, y;
  int velocity;
  PImage playerImage;
  boolean isDead;
  boolean hasSword;
  Player() {////////////////플레이어 생성
    x=50;
    y=50;
    playerImage = loadImage("player.png");
    isDead = false;
    hasSword = false;
    velocity=5;
  }
///////////////////////플레이어 움직임 함수
  void moveRight() {
    x+=velocity;
  }

  void moveLeft() {
    x-=velocity;
  }

  void moveUp() {
    y-=velocity;
  }

  void moveDown() {
    y+=velocity;
  }

  int getPlayerPositionX() {  ///////플레이어 x 좌표 게터
    return x;
  }
  int getPlayerPositionY() {  ///////플레이어 y 좌표 게터
    return y;
  }

  void paint() {/////////////플레이어 그리기

    image(playerImage, x, y);
  }
  void hitTest(Enemy enemy) {//////////////////적과의 히트 판정
    int ex = enemy.getEnemyPositionX();
    int ey = enemy.getEnemyPositionY();
    if (dist(ex, ey, x, y)<10) {
      if (!hasSword) /////////////아이템 없으면 죽음
        isDead=true;
      else {
        enemy.isDead=true;////////////////아이템있으면 적이 죽음
        score+=200;
      }
    }
  }
  void hitTest(Item item) {////////////////아이템 획득 판정
    int ix = item.getItemPositionX();
    int iy = item.getItemPositionY();
    if (dist(ix, iy, x, y)<30 && hasSword==false) {
      hasSword=true;
      score+=1000;///////////////아이템 획득하면 점수 1000점+
      playerImage = loadImage("playerS.png");///////////////아이템 획득 후 플레이어 이미지 변경
    }
  }
  boolean checkAlive() { ////////////플레이어 생존 판정
    return isDead;
  }
  boolean checkSword() {/////////////플레이어 아이템 판정
    return hasSword;
  }
}
