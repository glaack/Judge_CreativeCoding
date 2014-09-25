
float r1 = 0.;
float r2 = 0.;
float r3 = 0.;

PImage img;

PFont thefont;


float xpos, ypos, zpos;
float xstep, ystep, zstep;
float masterrotate = 0.;
float mstep;

void setup()
{
  
  thefont = loadFont("Helvetica-90.vlw"); //loads font
  textFont(thefont);
  textAlign(CENTER);
  textSize(90);
  
  size(800, 600, OPENGL); // 3-D mode
  sphereDetail(20); // quality of sphere

  ypos = height/2;
  xpos = width/2;
  zpos = 0;
  
  //img = loadImage("Lithium.png");
}

void draw()
{
  lights(); // gimme some lights
  background(255, 255, 255);
  
  noFill();
  stroke(0);
  rect(width/2, height/2, 450, 450);
  rectMode(CENTER);
  //image(img, 170, 80);

  noStroke();
  
  text("3", 580, 160);
  
  text("Li", 230, 505);

  // CAMERA
  translate(xpos, ypos, zpos); // move center to where my mouse is
  rotate(masterrotate, 0, 0, 1);

  fill(0,100,140);
  sphere(30); // draw big sphere
  
  
  // electron1
  pushMatrix(); // go up one level
  rotate(r1, 0, 0, 1);
  translate(0, 100, 0); // offset by 100 points on the x
  sphere(5); // draw the sphere
  popMatrix(); // go down a level

  // electron2
  pushMatrix(); // go up one level
  rotate(r2, 0, 0, 1);
  translate(0, 100, 0); // offset by 100 points on the x
  sphere(5); // draw the sphere
  popMatrix(); // go down a level

  // electron3
  pushMatrix(); // go up one level
  rotate(r1, 0, 1, 0);
  translate(0, 0, 150); // offset by 150 points on the z
  sphere(5); // draw the sphere
  popMatrix(); // go down a level

  r1 = r1 + 0.1;
  r2 = r1 + 3.14;
  //r3 = r3 + 0.275;

  xpos+=xstep;
  ypos+=ystep;
  zpos+=zstep;
  masterrotate+=mstep;
}
void keyPressed()
{
  if (keyCode==UP) {
    ystep=-5;
  }
  if (keyCode==DOWN) {
    ystep=5;
  }
  if (keyCode==LEFT) {
    xstep=-5;
  }
  if (keyCode==RIGHT) {
    xstep=5;
  }
  if (key=='='||key=='+')
  {
    zstep=5;
  }
  if (key=='-')
  {
    zstep-=5;
  }
  if (key=='r')
  {
    xpos = width/2;
    ypos = height/2;
    zpos = 0;
    masterrotate = 0;
  }
  if (key=='s')
  {
    mstep = 0.1;
  }
}


void keyReleased()
{
  if (keyCode==UP) {
    ystep=0;
  }
  if (keyCode==DOWN) {
    ystep=0;
  }
  if (keyCode==LEFT) {
    xstep=0;
  }
  if (keyCode==RIGHT) {
    xstep=0;
  }
  if (key=='='||key=='+')
  {
    zstep=0;
  }
  if (key=='-')
  {
    zstep=0;
  }
  if (key=='s')
  {
     mstep=0; 
  }
}

//I played around with your "planets" code to make this atom one.

