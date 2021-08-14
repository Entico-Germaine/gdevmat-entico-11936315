Walker planets[] = new Walker[11];

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for(int i = 0; i < planets.length; i++)
  {
    planets[i] = new Walker();
    
    planets[i].mass = int(random(10, 50));
    planets[i].size = planets[i].mass * 3;
  }

}

void draw()
{
  background (0);
  
  for(int i = 0; i < planets.length; i++)
  { 
    planets[i].render();
    planets[i].update();
    
     for(int j =0; j < i; j++)
     {       
       if (i != j)
       {        
        planets[i].applyForce(planets[j].calcAttraction(planets[i]));
        planets[j].applyForce(planets[i].calcAttraction(planets[j]));
       }
    }
  }
}
