Particle [] star;
//OddballParticle red;
void setup()
{
  background(30, 10, 40);
  size(500, 500);
  star = new Particle[100];
  star[0] = new OddballParticle();
  for (int i = 1; i < star.length; i++) {
   star[i] = new Particle(); 
  }
  //red = new OddballParticle();
}
void draw()
{
  for (int i = 0; i < star.length; i++) {
  star[i].show();
  star[i].flow();
  }
  //red.show();
  //red.flow();
} 
void mousePressed() {
  star[0].reset();
  star[0].flow();
}

class Particle
{
  int myC, myO, myWidth, myHeight;
  double myAngle, mySpeed, myX, myY;
  Particle() {
    myC = color((int)(Math.random()*255)+1);
    myO = 50;
    myX = myY = 250;
    myWidth = myHeight = 8;
    mySpeed = (Math.random()*3)+1;
    myAngle = (Math.random()*2*Math.PI);
  }
  void show() {
   fill(myC);
   ellipse((float)myX, (float)myY, myWidth, myHeight);
  }
  void flow() {
   myX += (Math.cos(myAngle)*mySpeed);
   myY += (Math.sin(myAngle)*mySpeed);
   if ((myX<0 || myX>500) && (myY<0 || myY>500)) {
     myX -= (Math.cos(myAngle)*mySpeed);
     myY -= (Math.sin(myAngle)*mySpeed);
   }
  }
  void reset() {
    myX = myY = 250;
    myWidth = myHeight = 8;
    mySpeed = (Math.random()*3)+1;
    myAngle = (Math.random()*2*Math.PI);
  }
}

class OddballParticle extends Particle //inherits from Particle
{
  OddballParticle(){
    myC = color(250, 10, 10);
    myO = 50;
    myX = myY = 250;
    myWidth = myHeight = 8;
    mySpeed = (Math.random()*2)+1;
    myAngle = (Math.random()*2*Math.PI);
  }
}
