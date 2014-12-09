float ny = 0; // where is our y offset into the perlin noise
int whichline = 0; // which line are we showing
int whichframe = 0;

PFont f1; // this is the data structure for a font in processing

String[] alicelines;
float[] chary; // this is the y positions of all the characters

void setup()
{
  size(1000, 800);

  // type stuff
  f1 = loadFont("KannadaMN-Bold-255.vlw"); // this loads the font
  textFont(f1); // this tells processing which font to use
  textAlign(LEFT); // draw from left

  alicelines = loadStrings("aliceinwonderland.txt");
  println(alicelines.length);

  whichline = picknewline();

  while (alicelines[whichline].length ()<1)
  {
    whichline = picknewline();
  }
      chary = new float[alicelines[whichline].length ()];
    for (int i = 0; i<chary.length; i++)
    {
      chary[i] = 1;
    }

  
}


void draw()
{
  background(0);
  fill(255);
  stroke(255);


  float y = height/2;
 

  textFont(f1);

  float[] charsize = new float[alicelines[whichline].length()];

  float x = 0;
  for (int i = 0; i<alicelines[whichline].length (); i++)
  {
    float n = map(0.0, 1.0, 9., 10., 48.);
    textSize(n);
    charsize[i] = n;
    x+= textWidth(alicelines[whichline].charAt(i));
    
  }
  float thescale = width/x;
  x = 0;
  for (int i = 0; i<alicelines[whichline].length (); i++)
  {
    textSize(charsize[i]*thescale);
    text(alicelines[whichline].charAt(i), x, chary[i]);
    x+= textWidth(alicelines[whichline].charAt(i));
    chary[i]+=random(0, 0);
  }



  whichframe++;
  if (whichframe > 60)
  {
    //whichline = picknewline();
    whichline = (whichline+1)%alicelines.length;

    while (alicelines[whichline].length ()<1)
    {
      whichline = picknewline();
    }

    chary = new float[alicelines[whichline].length ()];
    for (int i = 0; i<chary.length; i++)
    {
      chary[i] = 90;
    }

    whichframe = 0;
  }
}

int picknewline()
{
  return(int(random(0, alicelines.length)));
}

void keyReleased()
{
}

void mousePressed()
{
}

void mouseReleased()
{
}

