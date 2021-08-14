public class Liquid
{
  public float x, y;
  public float horizon, depth;
  public float cd;
  
  public Liquid(float x, float y, float horizon, float depth, float cd)
  {
    this.x = x;
    this.y = y;
    this.horizon = horizon;
    this.depth = depth;
    this.cd = cd;
  }
  
  public void render()
  {
    noStroke();
    fill(28, 250, 190, 50);
    
    beginShape();
    vertex(x - horizon, y, 0);
    vertex(x + horizon, y, 0);
    vertex( x + horizon, y + depth, 0);
    vertex(x - horizon, y + depth, 0);
    endShape();
  }
  
  public boolean isCollidingWith(Walker walker)
  {
    PVector pos = walker.position;
    return pos.x > this.x - this.horizon && 
            pos.x < this.x + this.horizon &&
              pos.y < this.y;
  }
  
  public PVector calcDragForce(Walker walker)
  {
    // drag magnitude is coefficient of drag * speed^2
    float speed = walker.velocity.mag();
    float dragMag = this.cd * speed * speed;
    
    // dir is inverse of velocity 
    PVector dragForce = walker.velocity.copy().mult(-1);
    
    // scale acc to mag
    dragForce.normalize().mult(dragMag);
    
    return dragForce;
  }
}
