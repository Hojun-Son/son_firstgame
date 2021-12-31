abstract class Car {///////////자동차 클래스 (추상 클래스)
  boolean isDead;
  int type;
  int x, y;
  int wid, hei;
  int velocity;
  PImage carImage;
  int cnt;

  void move(){
    y-=velocity;////////////자동차 속도
  }
  void paint(){////////////자동차 그리기
    image(carImage, x, y,wid,hei);
  }
  int getCarPositionX() {  //////////자동차 x좌표
    return x;
  }
  int getCarPositionY() {  /////////////자동차 y좌표
    return y;
  }
  boolean checkDead(){
    return isDead;
  }
  void checkPosition(){///////////////자동차가 화면에서 사라지면 다시 밑에서 나오게 3회반복
    if(y<-500 && cnt<3){
      y=height;
      cnt++;
      x+=100*cnt;/////적 자동차 등장 시  간격 조정
    }
    if(cnt>=3){//////////////3회넘어가면
      enemyCount++;//////////다른 자동차
      isDead = true;
      cnt=0;
      
    }
  }
}
