import proocessing.video.*;
Movie mov;
void setup(){
  size(640,480);
  background(0);
  mov = new Movie(this, "duck.mp4");
  mov.play();
  mov.jump(0);
}

void draw(){
  if (mov.available()) {
    mov.read();
  }
  image (mov, 0, 0, width, height);
}
