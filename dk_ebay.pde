PImage img;
PImage backgroundImg;
Ladder[]ladders;
Player player;

void loadLadders () {
  ladders = new Ladder [6];
  ladders [0]= new Ladder (450, 400, 32, 64);
  ladders [1]= new Ladder (225, 321, 32, 64);
  ladders [2] = new Ladder (405, 245, 32, 64);
  ladders [3]= new Ladder (200, 170, 32, 64);
  ladders [4]= new Ladder (450, 91, 32, 64);
  ladders [5] = new Ladder (290, 39, 32, 64);
}

void setup()
{
  size(640, 530); 
  img = loadImage("Pics/idle0.png");
  backgroundImg = loadImage("Pics/level1-background.jpg");
  player = new Player(300, 428, 50, 37); 
  loadLadders ();
}


void draw()
{
  update(); 
  background(25, 25, 50);
  image(backgroundImg, 0, 0);
  for (int i = 0; i < 6; i++) {
    ladders[i].drawLadder ();
  }
  player.drawPlayer();
}


void update()
{
  player.Move(); // move the player
}


void keyPressed()
{
  println(keyCode);

  if (keyCode == 68)
  { 
    player.facingRight=true;
    player.xSpeed = 1;
  }
  if (keyCode == 65)
  { 
    player.facingRight=false;
    player.xSpeed = -1;
  }


  if (keyCode == 32 && player.ySpeed==0)
  {
    player.isJumping=true;
    player.ySpeed = -1;
    player.myTimer = 0;
  }
  if (keyCode == 87)
  {
    player.ySpeed = -1;
  }
if (keyCode == 83)
  {
    player.ySpeed = 1;
  }

}


void keyReleased()
{
  println(keyCode); 

  if (keyCode == 68)
  {
    player.xSpeed = 0;
  }

  if (keyCode == 65)
  {
    player.xSpeed = 0;
  }
  if (keyCode == 32) 
  {
    if (keyCode == 87)
  {
    player.ySpeed = 0;
  }
if (keyCode == 83)
  {
    player.ySpeed = 0;
  }
  }
}
