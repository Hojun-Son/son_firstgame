class Item{//////////아이템 클래스
  int x,y;
  PImage itemImage;
  
  Item(){///////////아이템 생성
    x=50;
    y=900;
    itemImage = loadImage("sword.png");
  }
  
  void paint(){//////////아이템 그리기
    image(itemImage, x, y);
  }
  int getItemPositionX() {  //////플레이어 x 좌표 게터
    return x;
  }
  int getItemPositionY() {  //////플레이어 y 좌표 게터
    return y;
  }
  
  
  
}
