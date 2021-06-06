void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan( PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

Walker footsteps = new Walker(); 

void draw()
{
  footsteps.render();
  footsteps.walkerBiased();
  footsteps.randomWalk();
  
  if (footsteps.x > 640 || footsteps.y > 360 ||
    footsteps.x < -640 || footsteps.y < -360)
  {
    background(0);
    footsteps.x = 0;
    footsteps.y = 0;
  }
}
