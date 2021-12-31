class PlayerCar extends Car { ////////////플레이어 자동차 클래스( Car 클래스 상속)
  
  PlayerCar() {
    wid = 100;
    hei = 200;
    type = 0;
    isDead=false;
    x = width/2;
    y = height/2;
    velocity = 20;
    carImage = loadImage("PlayerCar.png");
  }
  ///////////////////////////플레이어 자동차 움직임 함수
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
  boolean hitTest(Car enemy) {///////////////적 자동차와의 히트 판정, 벽과의 히트 판정
    int ex = enemy.getCarPositionX();
    int ey = enemy.getCarPositionY();
    if (dist(x, y, ex, ey)<55 || ey+enemy.hei/2 > y-45&& ey-enemy.hei/2<y+45 && ex+enemy.wid/2>x-30 && ex-enemy.wid/2<x+30  ||x>width-100 || x<100 || y>height || y<0) {
      isDead=true;
    }
    return isDead;
  }
}
