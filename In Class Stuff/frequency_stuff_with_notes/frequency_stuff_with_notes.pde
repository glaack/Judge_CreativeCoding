import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
Oscil wave1;
Oscil wave2;

//int[] scale = {60 C, 62 D, 63 Eb, 65 F, 67 G, 68 Ab, 70 Bb, 72 C}; //C Minor scale
//int[] scale = {60 C, 62 D, 64 E, 65 F, 67 G, 69 A, 71 B, 72 C}; //C Major scale
int[] scale = {60, 63, 65, 72, 48, 67, 68, 63, 60, 58, 70, 72, 67, 62, 63, 60};
int whichnote = 0;

void setup()
{
  size(512,512);
  minim = new Minim(this);
  out = minim.getLineOut();
  
  wave1 = new Oscil( 440., 0.6, Waves.SINE );
  wave2 = new Oscil ( 440., 0.6, Waves.SINE );
  wave1.patch( out );
  wave2.patch( out );
}
void draw()
{
    frameRate(4);
    //int pitch = int(random(60, 72));
    int pitch1 = scale[whichnote];
    //int pitch2 = sacle[(whichnote+7) % scale.length];
    int pitch2 = scale[int(random(scale.length))];
    //wave.setFrequency( map(mouseX, 0, width, 100, 1000) );
    wave1.setFrequency(mtof(pitch1));
    wave2.setFrequency(mtof(pitch2)*2.);
    wave1.setAmplitude( map(mouseY, 0, height, 0., 1.) );
    
    whichnote=(whichnote+1) % scale.length;
  }
  
float mtof(int note)
{
  return (440. * exp(0.057762265 * (note - 69.)));
}
