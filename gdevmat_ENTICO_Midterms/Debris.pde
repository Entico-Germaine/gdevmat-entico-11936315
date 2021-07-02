class Debris
{  
  // uses the old template from the paint splatter exercise
    float standardDeviation = 300;
    float mean = 0;

    float gaussian = randomGaussian();
  
    float x = standardDeviation * gaussian + mean;
    float y = random(-Window.windowHeight, Window.windowHeight);
    
    // x and y values that should be accessed by the program:
    PVector debris = new PVector(x, y);
    
    float size = int(random(0, 50));
    
    int r = int(random(0, 256));
    int g = int(random(0, 256));
    int b = int(random(0, 256));
    int a = int(random(10, 101));

  void renderPlanet(float x, float y)
  {
    noStroke();
    fill(r, g, b, a);
    circle(x, y, size);
  }
  
  void renderHole(float x, float y)
  {
    noStroke();
    fill(255, 255, 255);
    circle(x, y, 50);
  }

}
