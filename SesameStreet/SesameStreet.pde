import ddf.minim.*; // this loads the minim library
import ddf.minim.ugens.*; // this loads more stuff out of the minim library

Minim minim; // this is the audio engine
AudioOutput out; // this represents the output (speakers)
Oscil wave; // this is an oscillator

//int[] scale = {60, 62, 63, 65, 67, 68, 70, 72};
//int[] scale = {60, 57, 53, 57, 60, 65, 69, 67, 65, 57, 59, 60};
int[] scale = {72, 72, 69, 65, 65, 0, 65, 67, 69, 69, 0, 72, 72, 69, 65, 65, 0, 72, 72, 69, 65, 65, 0, 65, 0, 65, 67, 67, 71, 71, 71, 72, 72, 74, 74, 74, 0, 72, 74, 75, 74, 72, 69, 67, 67, 0, 0, 67, 69, 70, 70, 67, 67, 60, 72, 72, 72, 72, 72, 0, 0, 0, 0, 0, 0};
              //suuuuu-ny dayyyyyyys, sweep-in the        clouds a-wayyyyyyyyy  onnnn my wayyyyyy      to    where the aiiiiiiiir isssssss sweeeeeeet,   can you tell me how to geeeeet,          how to geeet to    sesame streeeeeeeeeeeeeeet?
int whichnote = 0;

//72, 62, 60, 0, 62, 63, 62, 60, 69, 67, 67, 67, 0, 67, 69, 70, 69, 67, 72, 72, 0, 72, 72, 0, 72, 72, 0, 0, 0, 0

void setup()
{
  size(512, 512);
  // initialize the minim and out objects
  minim = new Minim(this); // start the audio engine
  out   = minim.getLineOut(); // sets the output to your laptop output

  wave = new Oscil( 440., 0.6, Waves.SINE ); // this sets up the oscillator
  wave.patch( out ); // this plugs into the speakers
}

// draw is run many times
void draw()
{
  frameRate(4);
  //wave.setFrequency( map(mouseX, 0, width, 100, 1000) );
  int pitch = scale[whichnote];
  wave.setFrequency(mtof(pitch));
  wave.setAmplitude( map(mouseY, 0, height, 1., 0.) );
  
  whichnote = (whichnote+1) % scale.length;
}

float mtof(int note) // mtof
{
  return (440. * exp(0.057762265 * (note - 69.)));
}

