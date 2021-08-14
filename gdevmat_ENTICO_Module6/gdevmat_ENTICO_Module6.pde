Walker myBalls[] = new Walker[9];
int scale = 100;
PVector wind = new PVector(0.2, 0);

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  Reset();
}

void Reset()
{
  int posY = 0;
    
   for (int i = 0; i < myBalls.length; i++)
  {
    myBalls[i] = new Walker();
    
    posY = 2 * (Window.windowHeight / myBalls.length) * (i-(myBalls.length / 2));
    myBalls[i].position = new PVector(Window.left, posY);
    
    // had to tweak previous forumla because it was the other way around
    myBalls[i].size = scale - (i * i);
    myBalls[i].mass = myBalls[i].mass -  i;
  }
}

void Render()
{
  //render line
  for (int i = -Window.heightPx; i < Window.heightPx; i++)
  {
    circle(0, i, 5);
  }
  
  for (int i = 0; i < myBalls.length; i++)
  {
    myBalls[i].applyFriction();
    myBalls[i].applyForce(wind);

    myBalls[i].render();
    myBalls[i].update();
  
    myBalls[i].applyBrakes();
  }
}

void draw()
{ 
  background(0);
  Render();
  
  if (mousePressed)
  {
    background(0);
    Reset();
  }
}
