float ny = 0; // where is our y offset into the perlin noise
int whichline = 0; // which line are we showing
int whichframe = 0;

PFont f1; // this is the data structure for a font in processing

String[] danteLines;

int voiceIndex;
int voiceSpeed;

void setup()
{
  size(1000, 600);
  
  voiceSpeed = 350;
  
  // type stuff
  f1 = loadFont("AvenirNext-Bold-100.vlw");
  textFont(f1); // this tells processing which font to use
  textAlign(LEFT); // draw from left

  danteLines = loadStrings("inferno.txt");
  println(danteLines.length);

  whichline = 0;
}


void draw()
{
  background(214,202,161);
  fill(54,44,33);
  stroke(35,35,35);

  float y = height/2;
 
  textFont(f1);

  float[] charsize = new float[danteLines[whichline].length()];

  float x = 0;
  for (int i = 0; i<danteLines[whichline].length(); i++)
  {
    float n = map(0.0, 1.0, 9., 10., 48.);
    textSize(n);
    charsize[i] = n;
    x+= textWidth(danteLines[whichline].charAt(i));
  }
  float thescale = width/x;
  x = 0;
  for (int i = 0; i<danteLines[whichline].length (); i++)
  {
    textSize(charsize[i]*thescale);
    text(danteLines[whichline].charAt(i), x, height/2 + textAscent()/2);
    x+= textWidth(danteLines[whichline].charAt(i));
  }



  whichframe++;
  if (whichframe > 200)
  {

    whichframe = 0;
  }
  
  

}

int picknextline()
{
   return((whichline+1)%danteLines.length); 
}


int pickpreviousline()
{
   return((whichline-1)%danteLines.length); 
}

int skipalot()
{
  return((whichline+150)%danteLines.length);
}

int backalot()
{
  return((whichline-150)%danteLines.length);
}


void keyReleased()
{
  //whichline = picknextline();
  //TextToSpeech.say(danteLines[whichline], TextToSpeech.voices[voiceIndex], voiceSpeed);
    
    
    
    if (key=='.')
    {
      whichline = picknextline();
      TextToSpeech.say(danteLines[whichline], TextToSpeech.voices[voiceIndex], voiceSpeed);
    }
    
        if (key==',')
    {
      whichline = pickpreviousline();
      TextToSpeech.say(danteLines[whichline], TextToSpeech.voices[voiceIndex], voiceSpeed);
    }

        if (key=='s')
    {
      whichline = skipalot();
      TextToSpeech.say(danteLines[whichline], TextToSpeech.voices[voiceIndex], voiceSpeed);
    }
    
            if (key=='w')
    {
      whichline = backalot();
      TextToSpeech.say(danteLines[whichline], TextToSpeech.voices[voiceIndex], voiceSpeed);
    }
}







// the text to speech class
import java.io.IOException;

static class TextToSpeech extends Object {

  // Store the voices, makes for nice auto-complete in Eclipse

  // male voices
  static final String ALEX = "Alex";
  static final String BRUCE = "Bruce";
  static final String FRED = "Fred";
  static final String JUNIOR = "Junior";
  static final String RALPH = "Ralph";

  // female voices
  static final String AGNES = "Agnes";
  static final String KATHY = "Kathy";
  static final String PRINCESS = "Princess";
  static final String VICKI = "Vicki";
  static final String VICTORIA = "Victoria";

  // novelty voices
  static final String ALBERT = "Albert";
  static final String BAD_NEWS = "Bad News";
  static final String BAHH = "Bahh";
  static final String BELLS = "Bells";
  static final String BOING = "Boing";
  static final String BUBBLES = "Bubbles";
  static final String CELLOS = "Cellos";
  static final String DERANGED = "Deranged";
  static final String GOOD_NEWS = "Good News";
  static final String HYSTERICAL = "Hysterical";
  static final String PIPE_ORGAN = "Pipe Organ";
  static final String TRINOIDS = "Trinoids";
  static final String WHISPER = "Whisper";
  static final String ZARVOX = "Zarvox";

  // throw them in an array so we can iterate over them / pick at random
  static String[] voices = {
    ALEX, BRUCE, FRED, JUNIOR, RALPH, AGNES, KATHY,
    PRINCESS, VICKI, VICTORIA, ALBERT, BAD_NEWS, BAHH,
    BELLS, BOING, BUBBLES, CELLOS, DERANGED, GOOD_NEWS,
    HYSTERICAL, PIPE_ORGAN, TRINOIDS, WHISPER, ZARVOX
  };

  // this sends the "say" command to the terminal with the appropriate args
  static void say(String script, String voice, int speed) {
    try {
      Process p = Runtime.getRuntime().exec(new String[] {"say", "-v", voice, "[[rate " + speed + "]]" + script});
      /*try {
        p.waitFor(); // uncomment this to pause and wait for program to finish
      }
      catch(InterruptedException e) {
      }*/
    }
    catch (IOException e) {
      System.err.println("IOException");
    }
  }

  // Overload the say method so we can call it with fewer arguments and basic defaults
  static void say(String script) {
    // 200 seems like a resonable default speed
    say(script, ALEX, 100);
  }
}
