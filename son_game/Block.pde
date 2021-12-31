class Block { ///////////////////벽 클래스
  int x; 
  int y; 
  int h; 
  int w;

  Block(int tx, int ty, int th, int tw) { ///////////벽 생성자
    x=tx; 
    y=ty; 
    h=th; 
    w=tw;
  }
  void paint() { //////////벽 그리기
    fill(100); 
    rect(x, y, w, h);
  }

  void collision(Player player) {///////////벽 플레이어 충돌 판정
    right_collision = false;
    left_collision = false;
    up_collision = false;
    down_collision = false;
    int px = player.getPlayerPositionX();
    int py = player.getPlayerPositionY();
    if (dist(px+15, py, x, py)<6 && py+15>y && py-15<y+h) {
      right_collision=true;
      r=0;
    }
    if (dist(px-15, py, x+w, py)<6 && py+15>y && py-15<y+h) {
      left_collision=true;
      l=0;
    }
    if (dist(px, py-20, px, y+h)<6 && px+15>x && px-15<x+w) {
      up_collision=true;
      u=0;
    }
    if (dist(px, py+20, px, y)<6 && px+15>x && px-15<x+w) {
      down_collision=true;
      d=0;
    }
  }
}
