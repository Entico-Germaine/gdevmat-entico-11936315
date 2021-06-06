void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan( PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

PerlinWalker paint = new PerlinWalker();

void draw()
{
  paint.perlinWalk();
  paint.render();
}
