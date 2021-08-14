public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acc = new PVector();
  
  public float velocityLimit = 10;
  public float mass = 10;
  public float size = 1; 
  public float mew = 0.01f;
    
    int r = int(random(0, 256));
    int g = int(random(0, 256));
    int b = int(random(0, 256));

  public void applyForce(PVector force)
  {
   PVector f = PVector.div(force, this.mass);
   this.acc.add(f); 
  }
  
  public void applyFriction()
  {
    // Friction = -1 * mew * NormalForce * velocity
    float normalF = 1; 
    float frictionMag = this.mew * normalF;
    PVector friction = this.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMag);
    
    applyForce(friction);
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
  
  void applyBrakes()
  {    
    if (position.x > 0)
    {
      this.mew = 0.4f;
    }
  }

}
