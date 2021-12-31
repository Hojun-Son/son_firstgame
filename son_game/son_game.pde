
Stage stage;
void setup() {
  imageMode(CENTER);
  size(1200, 1000);
  stage= new Stage1();
}
void draw() {
  
  stage.draw();
  if (stage.checkEnd()) { ///////////스테이지 게임오버 
    stage=new GameOver();
  }
  if(stage.checkClear()){////////////스테이지 클리어
    stage = new Stage2();
  }
  if(stage.Restart){//////////////스테이지 재시작
    stage = new Stage1();
  }
}
void keyPressed() {
  stage.keyPressed();
}
void keyReleased() {
  stage.keyReleased();
}
