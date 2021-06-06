void setup ()
{
  size (1280, 720, P3D);
  camera (0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  frameRate(60);
}

void draw ()
{
  background (0);

  drawCPlane();
  drawItemOne();
  drawItemTwo();
  drawItemThree();
}

void drawCPlane()
{
  strokeWeight(2);
  color white = color (255, 255, 255);
  fill(white); 
  stroke(white);

  line (0, 300, 0, -300);
  line (300, 0, -300, 0);

  strokeWeight(1);
  for (int i = -300; i <= 300; i += 10)
  {
    line (-5, i, 5, i);
    line (i, 5, i, -5);
  }
}

void drawItemOne ()
{
  strokeWeight(1);
  color white = color (255, 199, 50);
  fill(white); 
  stroke(white);
  
  // f(x) = x^2 - 15x - 3 
  for (float i = -300; i <= 300; i += 0.1)
  {
    circle (i, (float)Math.pow(i, 2) + (15*i) -3, 5);
  }
}

void drawItemTwo ()
{
  strokeWeight(1);
  color purple = color (100, 0, 255);
  fill(purple); 
  stroke(purple);
  
  //f(x) = -5x + 30  
    for (int i = -300; i <= 300; i++)
  {
    circle (i, (i*-5 + 30), 5);
  }
}

void drawItemThree ()
{
  color green = color (0, 255, 150);
  fill(green); 
  stroke(green);
  
  float amplitude = 40;
  // Not sure if the frequency is right here because I get almost the same wave everytime I change the number
  float frequency = 120;
  float moveX = -300;
  
  for (float i = 0; i <= 360; i+= 0.1)
  {
    circle ((float)Math.cos(frequency) * moveX, (float)Math.sin(i) * amplitude, 5);
    moveX++;
  }
}
