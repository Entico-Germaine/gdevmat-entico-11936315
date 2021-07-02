class Walker
{
  PVector position = new PVector();
  PVector speed = new PVector(5, 8);
 
 void render() 
 {
  int r = int(random(256)); // fill rgb
  int g = int(random(256)); // fill rgb
  int b = int(random(256)); // fill rgb
  int a = int(random(50, 101)); // fill a

  fill(r, g ,b, a);
  noStroke();
  circle(position.x, position.y, 50);
 }
 
 void randomWalk()
 {
   int move = int(random(8)); // move
   
   //west
   if (move == 0) 
   {
     position.x-=15;
   }
   //east
   else if (move==1) 
   {
     position.x+=15;
   }
   //north
   else if (move==2) 
   {
     position.y+=15;
   }
   //south
   else if (move==3) 
   {
     position.y-=15;
   }
   
   //north-west
   if (move == 0) 
   {
     position.x-=5;
     position.y+=5;
   }
   //north-east
   else if (move==1) 
   {
     position.x+=5;
     position.y+=5;
   }
   //south-west
   else if (move==2) 
   {
     position.x-=5;
     position.y-=5;
   }
   //south-east
   else if (move==3) 
   {
     position.x+=5;
     position.y-=5;
   }
 }
 
 void walkerBiased()
 {
  int moveBias = int(random(101)); // move
  
  // north 
  if (moveBias <= 25) 
  {
    position.y += 15;
  }
  // south 
    if (moveBias <= 50) 
  {
    position.y -= 15;
  }
  // west 
    if (moveBias <= 60) 
  {
    position.x -= 15;
  }
  // east
    if (moveBias <= 70)
  {
    position.x += 15;
  }
    // north-east
    if (moveBias <= 80)
  {
    position.x += 5;
    position.y += 5;
  }
    // south-east
    if (moveBias <= 90)
  {
    position.x += 5;
    position.y -= 5;
  }
    // north-west
    if (moveBias <= 95)
  {
    position.x -= 5;
    position.y += 5;
  }
      // south-west
    else
  {
    position.x -= 5;
    position.y -= 5;
  }
   
 }
 
 // for the walker flushes like in the original walker module
 // call when using randomWalker and walkerBiased
 void flushWalker()
 {
  if (footsteps.position.x > Window.right || footsteps.position.x < Window.left)
  {
    background(0);
    footsteps.position.x = 0;
  }
  if (footsteps.position.y > Window.top || footsteps.position.y < Window.bottom)
  {
    background(0);
    footsteps.position.y = 0;
  }
 }
 
 void moveAndBounce()
 {
   background(0);
   
   position.add(speed);
     
  if (footsteps.position.x > Window.right || footsteps.position.x < Window.left)
  {
    speed.x *= -1;
  }
  if (footsteps.position.y > Window.top || footsteps.position.y < Window.bottom)
  {
    speed.y *= -1;
  }
 }

}
