Walker walker[] = new Walker[300]; 

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 
  for (int i = 0; i <walker.length; i++)
  {
    walker[i] = new Walker();
  }

}

PVector mousePos()
{
 float xMouse = mouseX - Window.windowWidth;
 float yMouse = -(mouseY - Window.windowHeight);
 return new PVector(xMouse, yMouse);
}

void draw()
{
  background(0);
    
  PVector mouse = mousePos();

  for (int i = 0; i <walker.length; i++)
  {
    
    
    PVector direction = PVector.sub(mouse, walker[i].position);
    walker[i].acc = direction.normalize().mult(0.2);
    
    walker[i].render(walker[i].position.x, walker[i].position.y);
    walker[i].update();
  }
}

// Vector Motion 101
// 1) Add velocity to position
// 2) Draw the obj at position

// get the direction 
// normalize the direction
// assign direction to the acceleration
// mult by 0.2
