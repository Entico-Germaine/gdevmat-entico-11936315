public class Walker
{
  public PVector position = new PVector(-500, 200);
  public PVector velocity = new PVector();
  public PVector acc = new PVector();
  
  public float velocityLimit = 10;
  public float mass = 5;
  public float size = 1; 
    
    int r = int(random(0, 256));
    int g = int(random(0, 256));
    int b = int(random(0, 256));

  public void applyForce(PVector force)
  {
   PVector f = PVector.div(force, this.mass);
   //this.acc = force; // because A =F 
   this.acc.add(f); // force accumulation, like the velocity
  }

  public void update()
  {
   this.velocity.add(this.acc); // velocity accumulation
   this.velocity.limit(velocityLimit);
   this.position.add(this.velocity);
   this.acc.mult(0); // resets acc every frame
  }
 
  public void render()
  {
   stroke(255);
   fill(r, g, b, 90);
   circle(position.x, position.y, size);
  }
  
  void checkEdges()
  {    
    if (position.x > Window.right || 
            position.x < Window.left)
    {
      velocity.x *= -1;
    }
    if (position.y > Window.top || 
            position.y < Window.bottom)
    {
      velocity.y *= -1;
    }
  }

}
