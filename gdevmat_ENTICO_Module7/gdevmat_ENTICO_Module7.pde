Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker walker[] = new Walker[11];

PVector wind = new PVector (0.1, 0);

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0); 
 
  int posX = 0;
  int size = 100;
  for (int i = 0; i < walker.length; i++)
  {
    walker[i] = new Walker();
    posX = 2 * (Window.windowHeight / walker.length) * (i-(walker.length / 2));
    walker[i].position = new PVector(posX, 300);
    // have to be careful with size and mass as this can break the code apparently
    walker[i].size = size - (i * i);
    walker[i].mass = walker[i].mass -  i;
  }

}

void draw()
{
  background(100, 100, 130);

  for (int i = 0; i < walker.length; i++)
  {
    walker[i].render();
    walker[i].update(); 
  
    PVector gravity = new PVector(0, -0.15 * walker[i].mass); // F*M
    walker[i].applyForce(gravity);
    walker[i].applyForce(wind);
    walker[i].applyFriction();
  
    if (walker[i].position.y <= Window.bottom)
    {
      walker[i].position.y = Window.bottom;
      walker[i].velocity.y *= -1;
    }
  
    if (ocean.isCollidingWith(walker[i]))
    {
      PVector dragForce = ocean.calcDragForce(walker[i]);
      walker[i].applyForce(dragForce);
    }
    
    // doesn't bounce, moves to the other side of the screen
    // because I don't really like the bouncing it does when it gets stuck in the corner
    if (walker[i].position.x > Window.right)
    {
      walker[i].position.x = Window.left;
    }
  }

   ocean.render();
}
