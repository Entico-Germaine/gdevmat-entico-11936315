void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  background(0);
}

Walker footsteps = new Walker(); 

void draw()
{
  footsteps.moveAndBounce();
  //footsteps.randomWalk();
  //footsteps.walkerBiased();
  
  // The render function is the same as for the walker, so it changes colour-
  // every frame
  footsteps.render();
}
