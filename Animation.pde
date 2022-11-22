class Animation{
  int timer;
  int curFrame;
  int totalFrame;
  PImage[]frames;
  //PImage[]frames = new PImage []
  Animation(int size, String filename) 
  {
  timer = 0;
  curFrame = 0;
  totalFrame = size; frames = new PImage [size];
  for(int i = 0; i < size; i++){
  //The frames array at the current index will be equal to the file name of the same current index
  frames[i]=loadImage("Pics/"+ filename + i + ".png");
  }
}
  
  void animate() {
    timer++;
    if(timer > 10)
    {curFrame++;
    if(curFrame >= totalFrame)
      curFrame = 0;
     timer = 0; 
    }
  }
  
  void display(int x, int y, int dir){
   animate();
   if (dir == 1)
   {
      image (frames [curFrame], x, y); 
   }
   else flip(x,y);
  }
  
  void flip(int x, int y){
    pushMatrix();
    scale(-1,1);
    int w = frames[curFrame].width;
    image (frames [curFrame], -x-w, y); 
    popMatrix();
  }
  
  
  
  
  
  
  
 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
