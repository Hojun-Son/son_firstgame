//////// 적 클래스
class Enemy {
  int x, y;          // 적 좌표
  int velocity;      // 적 속도
  PImage enemyImage;  // 적 이미지
  boolean isDead;    // 사망판정
  boolean aroundPlayer; // 플레이어 인접 판정
  int u, d, r, l;
  Enemy(int tx, int ty) { //적 생성자
    x=tx;
    y=ty;
    velocity = 3;
    isDead = false;
    enemyImage = loadImage("enemy.png");
    aroundPlayer = false;
  }
  void paint() {//////////적 그리기
    image(enemyImage, x, y);
  }
  void moveRight() {///////////적 움직임 방향 함수
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
  int getEnemyPositionX() {  
    return x;
  }
  int getEnemyPositionY() {  
    return y;
  }
  void checkPlayerDist(Player player) {  //////// player 객체 인접 판정
    int px = player.getPlayerPositionX();
    int py = player.getPlayerPositionY();
    int distance = int(dist(x, y, px, py)); ///////// 플레이어, 적 거리
    if (distance < 180)
      aroundPlayer = true;

    if (aroundPlayer) {////////////플레이어와 적이 인접하면
      if (x<=px) {
        r=1;
        l=0;
      }
      if (x>=px) {
        l=1;
        r=0;
      }
      if (y<=py) {
        d=1;
        u=0;
      }
      if (y>=py) {
        u=1;
        d=0;
      }
    }
  }
  void moveToPlayer() {/////////////적이 플레이어에게 다가옴
    if (r==1) {
      moveRight();
    }
    if (l==1) {
      moveLeft();
    }
    if (u==1) {
      moveUp();
    }
    if (d==1) {
      moveDown();
    }
  }
}
