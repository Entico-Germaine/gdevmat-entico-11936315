class PerlinWalker
{
  float x;
  float y; 
  float tx = 0, ty = 1000;
  float s = 5;
  //keeping it this way bc I like the palette this generates
  //for a more "rainbow" gradient, just make sure g && b != 0
  float r = 255, g = 0, b = 0;
  
 void render() 
 {
  float scale = map(noise(s), 0, 1, 5, 150);
  float red = map(noise(r), 0, 1, 0, 255);
  float green = map(noise(g), 0, 1, 0, 255);
  float blue = map(noise(b), 0, 1, 0, 255);
  
  noStroke();
  fill(red, green, blue);
  circle(x, y, scale);
  
  s += 0.01f;
  r += 0.01f;
  g += 0.01f;
  b += 0.01f;
 }
 
 void perlinWalk()
 {
   x = map(noise(tx), 0, 1, -640, 640);
   y = map(noise(ty), 0, 1, -360, 360);
   
   tx += 0.01f;
   ty += 0.01f;
 }

}
