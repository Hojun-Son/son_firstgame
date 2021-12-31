class PoliceCar extends Car {/////////////경찰차 클래스 (자동차 클래스 상속)
  int cnt;
  
  PoliceCar(int tx) {
    wid = 100;
    hei = 200;
    cnt = 0;
    x= tx;
    y=height;
    velocity = 30;
    carImage = loadImage("PoliceCar.png");
    isDead = false;
  }
  
  
  
  
}
