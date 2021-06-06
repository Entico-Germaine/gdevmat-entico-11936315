int frame = 0;

void setup ()
{
  size (1280, 720, P3D);
  camera (0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background (255);
}

void draw()
{
  float standardDeviation = 150;
  float mean = 0;
  
  float sdSize = 40;
  float mSize = 0;

  float gaussian = randomGaussian();
  float gaussianSize = randomGaussian();
  
  float x = standardDeviation * gaussian + mean;
  float y = random(-360, 360);
  float size = sdSize * gaussianSize + mSize;
  
  int r = int(random(0, 256));
  int g = int(random(0, 256));
  int b = int(random(0, 256));
  int a = int(random(10, 101));
  
  noStroke();
  fill(r, g, b, a);
  circle(x, y, size);
  
  frame++;
  
  if (frame == 300)
  {
    background(255);
    frame = 0;
  }
}
