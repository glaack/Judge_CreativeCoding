PImage cat;

float w, h;

float s = 1;

void setup()
{
  size(1600,1067);
  background(0);
  cat = loadImage("BIGGERBOB.JPG");
  w = cat.width;
  h = cat.height;
  
}


void draw()
{
  fill(0,0,0,10);
  rect(0,0,width,height);
  blend(cat, mouseX, 0, mouseY, height, mouseX, 0, mouseY, height, BLEND);
}
