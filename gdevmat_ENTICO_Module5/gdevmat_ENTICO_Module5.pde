Walker myBalls[] = new Walker[11];

PVector wind = new PVector (0.2, 0);
PVector gravity = new PVector (0, -0.7); 
int scale = 20;

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < myBalls.length; i++)
  {
    myBalls[i] = new Walker();
    myBalls[i].size = scale * i;
    myBalls[i].mass = myBalls[i].mass *  i; // multiplying by size will make it heavier
  }
}


void draw()
{
  background(0);
  
  for (int i = 0; i < myBalls.length; i++)
  {
    myBalls[i].render();
    myBalls[i].update();
    
    myBalls[i].applyForce(wind);
    myBalls[i].applyForce(gravity);
    myBalls[i].checkEdges();
  }
}
