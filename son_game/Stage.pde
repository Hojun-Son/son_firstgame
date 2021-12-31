abstract class Stage{/////////////스테이지 클래스
  boolean isEnd;
  boolean isClear;
  boolean Restart;
  
  abstract void draw();
  abstract void keyPressed();
  abstract void keyReleased();
  boolean checkEnd(){
    return isEnd;
  }
  boolean checkClear(){
    return isClear;
  }
}
