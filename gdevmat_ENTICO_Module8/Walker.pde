public class Walker
{
 public PVector velocity = new PVector();
 public PVector acc = new PVector();
 
 public float velocityLimit = 10;
 public float gravConstant = 1;
 public float mass = 1;
 
 // uses the old template from the paint splatter exercise (just for rand)
    float standardDeviation = 300;
    float mean = 0;

    float gaussian = randomGaussian();
  
    float x = standardDeviation * gaussian + mean;
    float y = random(-Window.windowHeight, Window.windowHeight);
    
 // position
 public PVector position = new PVector(x, y);
 
    float size = int(random(20, 200));
    float a = int(random(0,256));
    
   // putting this here because I just wanted to see how it would look like
   // also shifting colours nice
   float r = 255, g = 0, b = 200;

 
 public void applyForce(PVector force)
 {
   PVector f = PVector.div(force, this.mass);
   this.acc.add(f); 
 }
  
 public void update()
 {
   this.velocity.add(this.acc);
   this.velocity.limit(velocityLimit);
   this.position.add(this.velocity);
 }
 
 public void render()
 {
   // all the same colour but they change colours every sec or so
   float red = map(noise(r), 0, 1, 0, 255);
   float green = map(noise(g), 0, 1, 0, 255);
   float blue = map(noise(b), 0, 1, 0, 255);
   stroke(150);
   fill(red, green, blue, a);
   circle(position.x, position.y, size);
   
  r += 0.01f;
  g += 0.01f;
  b += 0.01f;
 }
 
 public PVector calcAttraction(Walker walker)
 {
   PVector force = PVector.sub(this.position, walker.position);
   float distance = force.mag();
   force.normalize();
   
   // why does (100, 1) work
   distance = constrain(distance, 1, 5);
   
   float strength = (this.gravConstant * this.mass * walker.mass) / (distance * distance);
   force.mult(strength);
   
   return force;
 }
}
