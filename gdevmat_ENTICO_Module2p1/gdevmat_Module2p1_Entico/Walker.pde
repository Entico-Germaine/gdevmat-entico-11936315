class Walker
{
  float x;
  float y; 
 
 void render() 
 {
  int r = int(random(256)); // fill rgb
  int g = int(random(256)); // fill rgb
  int b = int(random(256)); // fill rgb
  int a = int(random(50, 101)); // fill a

  fill(r, g ,b, a);
  noStroke();
  circle(x, y, 30);
 }
 
 void randomWalk()
 {
   int move = int(random(8)); // move
   
   //west
   if (move == 0) 
   {
     x-=15;
   }
   //east
   else if (move==1) 
   {
     x+=15;
   }
   //north
   else if (move==2) 
   {
     y+=15;
   }
   //south
   else if (move==3) 
   {
     y-=15;
   }
   
   //north-west
   if (move == 0) 
   {
     x-=5;
     y+=5;
   }
   //north-east
   else if (move==1) 
   {
     x+=5;
     y+=5;
   }
   //south-west
   else if (move==2) 
   {
     x-=5;
     y-=5;
   }
   //south-east
   else if (move==3) 
   {
     x+=5;
     y-=5;
   }
 }
 
 void walkerBiased()
 {
  int moveBias = int(random(101)); // move
  
  // north 
  if (moveBias <= 25) 
  {
    y += 15;
  }
  // south 
    if (moveBias <= 50) 
  {
    y -= 15;
  }
  // west 
    if (moveBias <= 60) 
  {
    x -= 15;
  }
  // east
    if (moveBias <= 70)
  {
    x += 15;
  }
    // north-east
    if (moveBias <= 80)
  {
    x += 5;
    y += 5;
  }
    // south-east
    if (moveBias <= 90)
  {
    x += 5;
    y -= 5;
  }
    // north-west
    if (moveBias <= 95)
  {
    x -= 5;
    y += 5;
  }
      // south-west
    else
  {
    x -= 5;
    y -= 5;
  }
  
 }

}
