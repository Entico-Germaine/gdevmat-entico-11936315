int frames = 0;
Debris planets [] = new Debris [300];
Debris bHole = new Debris();

void setup()
{
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 size(1080, 720, P3D);
 
 // initializes the planets once
  for (int i = 0; i < planets.length; i++)
  {
    planets[i] = new Debris();
  }
}

// For the blackHole to follow the cursor
PVector mousePos()
{
 float xMouse = mouseX - Window.windowWidth;
 float yMouse = -(mouseY - Window.windowHeight);
 return new PVector(xMouse, yMouse);
}

void draw()
{
  background(0);
  
  // for the cursor
  PVector mouse = mousePos();
  
  // runs the code through the array
  for (int i = 0; i < planets.length; i++)
  {
    PVector direction = PVector.sub(mouse, planets[i].debris);
    planets[i].debris.add(direction.normalize().mult(5));
    
    planets[i].renderPlanet(planets[i].debris.x, planets[i].debris.y);
  }
  
  // render blackHole
  bHole.renderHole(mouse.x, mouse.y);
  
  frames++;
  
  // resets once the condition is met
  if (frames >= 150)
  {
    frames = 0;
    setup();
  }
}
