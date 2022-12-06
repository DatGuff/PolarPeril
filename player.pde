class Player {
  boolean facingRight;
  int xSpeed;
  int ySpeed;
  int myTimer;
  boolean onLadder;
  boolean isJumping;
  Animation idle;
  Animation walk;
  Animation jump;
  int y, x, w, h;

  Player(int x, int y, int w, int h) {

    xSpeed = 0;
    ySpeed = 0;
    this.x = x; 
    this.y = y;
    this.w = w;
    this.h = h;
    idle = new Animation(3, "idle");
    walk = new Animation(6, "walk");
    jump = new Animation(2, "jump");
  }
  void Move()
  { 
    y += ySpeed;
    if (isJumping)
      jump ();
    else {
      for (int i = 0; i < 6; i ++) {
        onLadder = checkLadder(ladders[i]);
        if (onLadder) break;
      }
      if (!onLadder) {
        ySpeed = 0;
      } else { 
        xSpeed = 0;
      }
    }
    if ((x >= 65 && xSpeed <= -1)||(x <= 535 && xSpeed >= 1))
    {
      x += xSpeed;
    }
  }
  void drawPlayer()
  {
    if (xSpeed == 1) {
      if (ySpeed!=0)
        jump.display(x, y, 1);
      else walk.display (x, y, 1);
    } else if (xSpeed == -1) {
      if (ySpeed!=0)
        jump.display(x, y, -1);
      else walk.display (x, y, -1);
    } else if (xSpeed == 0) {
      if (facingRight) {
        idle.display(x, y, 1);
      } else {
        idle.display(x, y, -1);
      }
    }
  }

  void jump () {
    if (myTimer >= 30) {
      if (ySpeed < 0) {
        ySpeed = 1;
      } else {
        ySpeed = 0; 
        isJumping=false;
      }
      myTimer = 1;
    } else myTimer ++;
  }



  boolean checkLadder (Ladder B) {
    int ladderYoffset; 
    ladderYoffset=15;
    if (ySpeed<0) {
      if (x +20  > B.x && x + w-20< B.x + B.w && y + h > B.y && y < B.y +B.h) {

        return true;
      }
    }
    if (ySpeed>0) {
      if (x +20  > B.x && x + w-20< B.x + B.w && y + h > B.y-ladderYoffset && y+h < B.y +B.h) {  
        return true;
      }
    }
    if (ySpeed==0) {
      if (x +20  > B.x && x + w-20< B.x + B.w && y + h > B.y+ladderYoffset && y+h < B.y +B.h-ladderYoffset) {  
        return true;
      }
    }


    return false;
  }
}
