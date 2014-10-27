//


import ddf.minim.*;

AudioPlayer player;
Minim minim;//audio context



int NUMSINES = 40; // how many of these things can we do at once?
float[] sines = new float[NUMSINES]; // an array to hold all the current angles
float rad; // an initial radius value for the central sine
int i; // a counter variable

// play with these to get a sense of what's going on:
float fund = 0.001; // the speed of the central sine
float ratio = 0.7; // what multiplier for speed is each additional sine?
int alpha = 50; // how opaque is the tracing system

boolean trace = false; // are we tracing?


void setup()
{
  size(800, 600, P3D); // OpenGL mode
  
  minim = new Minim(this);
  player = minim.loadFile("campfire.mp3", 2048);

  rad = height/4.; // compute radius for central circle
  background(255); // clear the screen

  for (int i = 0; i<sines.length; i++)
  {
    sines[i] = TAU; // start EVERYBODY facing NORTH
  }
}

void draw()
{

  if (!trace) background(255); // clear screen if showing geometry
  if (!trace) {
    stroke(40, 140, 40, 255); // black pen
    noFill(); // don't fill
  }  

  // MAIN ACTION
  pushMatrix(); // start a transformation matrix
  translate(width/2, height/2); // move to middle of screen

  for (i = 0; i<sines.length; i++) // go through all the sines
  {
    float erad = 0; // radius for small "point" within circle... this is the 'pen' when tracing
    // setup tracing
    if (trace) {
      stroke(0, 155, 155*(float(i)/sines.length), alpha); // blue
      fill(0, 0, 255, alpha/2); // also, um, blue
      erad = 6.0*(1.0-float(i)/sines.length); // pen width will be related to which sine
    }
    float radius = rad/(i+1); // radius for circle itself
    rotateX(sines[i]); // rotate circle
    rotateZ(sines[i]);
    if (!trace) rect(0, 0, radius*3, radius*2); // if we're simulating, draw the sine
    pushMatrix(); // go up one level
    translate(0, radius); // move to sine edge
    if (!trace) rect(0, 0, 5, 5); // draw a little circle
    if (trace) rect(0, 0, erad, erad); // draw with erad if tracing
    popMatrix(); // go down one level
    translate(0, radius-20); // move into position for next sine
    sines[i] = (sines[i]+(fund+(fund*i*ratio)))%TWO_PI; // update angle based on fundamental
  }
  popMatrix(); // pop down final transformation
}




void keyReleased()
{
  if (key==' ') {
    trace = !trace;
    player.play();
    background(255);
  }
}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
