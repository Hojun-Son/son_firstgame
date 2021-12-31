class GameOver extends Stage{////////////게임오버 클래스 (스테이지 클래스 상속)
  PImage overScreen;
  GameOver(){
    overScreen = loadImage("dead.jpg");
    Restart=false;
  }
  void draw(){
    fill(255,0,0);
    image(overScreen, width/2,height/2 ,width,height);
    text("score: "+ score, 0, 100);////////////////점수
    textSize(30);
  
  }
  void keyPressed(){
    score=0; //////////점수 초기화
    Restart=true;///////////////키누르면 재시작
  }
  void keyReleased(){}
  
}
