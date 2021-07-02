void setup()
{
 camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 size(1080, 720, P3D);
}

PVector mousePos()
{
 //Deleted the /2 bc that would mean we're dividing the window by 2 twice.
 float x = mouseX - Window.windowWidth;
 float y = -(mouseY - Window.windowHeight);
 return new PVector(x, y);
}

void draw()
{
  background(0);
  
  strokeWeight(20);
  stroke(255, 0, 0, 90);
  
  // red glow
  PVector mouse = mousePos();
  
  mouse.normalize().mult(300);
 
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
  
  // white core
  strokeWeight(7);
  stroke(255, 255, 255);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
  
  // dark grey handle
  strokeWeight(20);
  stroke(49, 51, 43);
  line(0, 0, mouse.x/5, mouse.y/5);
  line(0, 0, -mouse.x/5, -mouse.y/5);
  
  // print magnitude of one side of the lightsaber
  // includes the handle
  println(mouse.mag());
}
