public class Walker
{
 public PVector velocity = new PVector();
 public PVector acc = new PVector();
 
 public float velocityLimit = 10;
 
 // uses the old template from the paint splatter exercise (just for rand)
    float standardDeviation = 300;
    float mean = 0;

    float gaussian = randomGaussian();
  
    float x = standardDeviation * gaussian + mean;
    float y = random(-Window.windowHeight, Window.windowHeight);
    
 // position
 public PVector position = new PVector(x, y);
 
    float size = int(random(0, 50));
    
    int r = int(random(0, 256));
    int g = int(random(0, 256));
    int b = int(random(0, 256));
    int a = int(random(10, 101));
 
 public void update()
 {
   this.velocity.add(this.acc);
   this.velocity.limit(velocityLimit);
   this.position.add(this.velocity);
 }
 
 public void render(float x, float y)
 {
   noStroke();
   fill(r, g, b, a);
   circle(x, y, size);
 }
 
 public void checkWindows()
 {
   if(position.x > Window.right)
   {
     this.position.x = Window.left;
   }
      if(position.x < Window.left)
   {
     this.position.x = Window.right;
   }
      if(position.y > Window.top)
   {
     this.position.y = Window.bottom;
   }
      if(position.y < Window.bottom)
   {
     this.position.y = Window.top;
   }
 }
}
