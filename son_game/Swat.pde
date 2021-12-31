class Swat extends Car{
  int cnt;
  
  Swat(int tx) {
    wid = 150;
    hei = 300;
    cnt = 0;
    x= tx;
    y=height;
    velocity = 30;
    carImage = loadImage("Swat.png");
    isDead = false;
  }
  
}
