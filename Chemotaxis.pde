Zombies [] bob;
Human a;

int oldMouseX;
int oldMouseY;
//float [] oldCoorX;
//float [] oldCoorY;
//float [] oldSize;
int[] xCoor, yCoor, sizes;
void setup()   
{ 
  size(400, 400);
  background(210);
  bob = new Zombies[10];
  xCoor = new int[bob.length];
  yCoor = new int[bob.length];
  sizes = new int[bob.length];
  //oldCoorX = new float[bob.length];
  //oldCoorY = new float[bob.length];
  for (int i = 0; i< bob.length; i++) {
    xCoor[i] = (int)(Math.random()*290)+i*5;
    yCoor[i] = (int)(Math.random()*290)+i*5;
    sizes[i] = (int)(Math.random()*18)+12;
    //oldCoorX[i] = xCoor[i];
    //oldCoorY[i] = yCoor[i];
    bob[i] = new Zombies(xCoor[i], yCoor[i], sizes[i]);
  }
  a = new Human();
  a.show();
}   
void draw() {    
  //move and show the bacteria   
  background(210);
  oldMouseX = mouseX;
  oldMouseY = mouseY;
  for (int i = 0; i < bob.length; i++ ) {
    //bob[i].clear(xCoor[i],yCoor[i],size[i]);
    bob[i].show();
    if (mouseX > xCoor[i])
      bob[i].moveXRight();
    else if (mouseY > yCoor[i])
      bob[i].moveYDown();
    else if (mouseX < xCoor[i])
      bob[i].moveXLeft();
    else if(mouseY < yCoor[i]) //doesn't really work
      bob[i].moveYUp();
    else if(xCoor[i] > 400) //
      bob[i].moveXLeft();
    else if(xCoor[i] < 0)
      bob[i].moveXRight(); //
  }
}


void mouseMoved() {

  //a.clear(oldMouseX, oldMouseY);  used this to clear the trail
  a.show();
}


class Zombies {     
  int myX, myY;
  int myColor; //variations of green
  int mySize;
  Zombies(int x, int y, int size) {
    myX = x;
    myY = y;
    myColor = color((int)(Math.random()*10)+70, (int)(Math.random()*120)+90, (int)(Math.random()*20)+90);
    //myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    mySize = size;
  }
  void moveXRight() {
    myX += (int)(Math.random()*5)+1;
  }
  void moveXLeft() {
    myX -= (int)(Math.random()*5)+1;
  }
  void moveYDown() {
    myY += (int)(Math.random()*5)+1;
  }
  void moveYUp() {
    myY -= (int)(Math.random()*5)+1;
  }
  void show() {
    //noStroke();
    fill(myColor);
    ellipse(myX, myY, mySize, mySize);
  }
  void clear(int xCoor, int yCoor, int size) { //used this to clear the trail but its not needed anymore
    fill(210);
    ellipse(xCoor+myX, yCoor+myY, size, size);
  }
}    // end of class

class Human {
  int myX, myY;
  int myColor;

  Human() {

    myColor = color(255, 229, 204);
  }
  void show() {
    noStroke();
    fill(myColor);
    ellipse(mouseX, mouseY, 20, 20);
    fill(210);
  }
  void clear(int oldMouseX, int oldMouseY) { // used this to clear the trail but not needed anymore
    stroke(210);

    fill(210);
    ellipse(oldMouseX, oldMouseY, 20, 20);
    fill(210);
  }
}    // end of class
