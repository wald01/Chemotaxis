Zombies [] bob;
Human a;

float oldMouseX;
float  oldMouseY;
int[] xCoor, yCoor;
void setup()   
{ 
  size(400, 400);
  background(210);
  bob = new Zombies[10];
  xCoor = new int[bob.length];
  yCoor = new int[bob.length];
  for (int i = 0; i< bob.length; i++) {
    xCoor[i] = (int)(Math.random()*290)+i*5;
    yCoor[i] = (int)(Math.random()*290)+i*5;
    bob[i] = new Zombies(xCoor[i], yCoor[i]);
  }
  a = new Human();
  a.show();
}   
void draw() {    
  //move and show the bacteria   
  oldMouseX = mouseX;
  oldMouseY = mouseY;
  for (int i = 0; i < bob.length; i++ ) {
    bob[i].show();
  if(mouseX > xCoor[i]){
    bob[i].move();
  }

  }

}  

void mouseMoved() {

  a.clear(oldMouseX, oldMouseY);
  a.show();
}


class Zombies {     
  int myX, myY;
  int myColor; //variations of green
  int mySize;
  Zombies(int x, int y) {
    myX = x;
    myY = y;
    myColor = color((int)(Math.random()*10)+70, (int)(Math.random()*120)+90, (int)(Math.random()*20)+90);
    //myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    mySize = (int)(Math.random()*18)+12;
  }
  void move(){
  myX =
  myY =
  }
  void show() {
    //noStroke();
    fill(myColor);
    ellipse(myX, myY, mySize, mySize);
  }
}    //end of class
//cursor where the virus is at
//or bacteria moves towards mouse and white blood cells move towards bacteria
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
  void clear(float oldMouseX, float oldMouseY) {
    stroke(210);

    fill(210);
    ellipse(oldMouseX, oldMouseY, 20, 20);
    fill(210);
  }
}


// end of class
