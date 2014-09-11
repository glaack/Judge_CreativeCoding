float r, g, b, x1, y1, x2, y2;

PImage hookerheels;

void setup()
{
  
  size(1000, 800);
  background(0, 0, 0);
  hookerheels = loadImage("CartmanInverted.jpg");
  image(hookerheels, 0, 0, width, height);
  
}

void draw()
{
  r = random(25, 255);
  g = random(25, 255);
  b = random(25, 255);
  
  
    if(mousePressed)
  {
    float d = sqrt((pmouseX-mouseX)*(pmouseX-mouseX) + (pmouseY-mouseY)*(pmouseY-mouseY));
   d = d*5;
    
    fill(r, g, b);
    stroke(r, g, b);
    strokeWeight(d/4);
    line(pmouseX, pmouseY, mouseX, mouseY);
 
  } 
}

void keyPressed()
{
   background(0);
   image(hookerheels, 0, 0, width, height);
   
}

