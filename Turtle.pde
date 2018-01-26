class Turtle {
  /*
  This Turtle class was authored by Scott Leutenegger 
  with some modifications by Rafael Fajardo
  
  Turtle class similar to classic turtle graphics
  Angles by user are in degrees, 0..360, remember y is reversed in Processing
  
  To create a turtle:   Turtle t = new( X, Y, width, color, angle, penDown) 
      where X,Y are the desired initial location, width is the width of the line, color
      is the color of the line, angle is the direction the turtle is pointed, and penDown
      is true if you want to initial set the pen down and false otherwise.
      
  The following methods are available:
  
  Move( distance ) => moves the turtle "distance" pixels in the direction it is pointing.  If the 
       turtle's pen is set down it leaves a line, else not.
  Turn( degrees ) => turns the direction of the turtle by "degrees" degrees
  MoveTo(x,y) => Picks the turtle up and moves to the new location without leaving a line regardless
       of whether the pen is down
  SetColor(color) => sets the line color to the input value
  SetWidth( width ) => sets the line width to "width"
  SetAngle (angle) => sets the angle
  PenUp() =>  raises the pen
  PenDown() => lowers the pen
  GetX() => returns x value
  GetY() => returns y value
  */
  
   float curX, curY ;
   int curWidth ;
   color curColor;
   float curAngle ;
   boolean penDown ;
   
   
   Turtle() {
     curX= 100 ;
     curY = 100 ;
     curWidth = 3 ;
     curColor = color(255,255,0) ;
     curAngle = 90 ;
     penDown = true ;
   }
   
   
   Turtle(float inX, float inY, int inWidth, color inColor, float inAngle, boolean inDown) {
     curX= inX ;
     curY = inY ;
     curWidth = inWidth ;
     curColor = inColor ;
     curAngle = inAngle ;
     penDown = inDown ;
   }
   
   void MoveTo(float newX, float newY){ curX = newX; curY = newY ;}
   void SetColor( color inColor) { curColor = inColor ;}
   void SetWidth( int inWidth) {curWidth = inWidth;}
   void PenUp() { penDown = false ;}
   void PenDown() {penDown = true ;}
   
   
   void SetAngle(float inAngle) { 
     curAngle = inAngle ;
     // keep the angle as a value 0..360
     while (curAngle > 360) 
       curAngle = curAngle - 360 ;
     while (curAngle < 0)
       curAngle = curAngle + 360 ;
   }
   
   void Move(float inDistance) {   
   // moves the input distance in the direction currently pointed, if pen is down leave a trail
     float newX= curX + inDistance * cos( curAngle / 360 * 2 * PI) ;
     float newY= curY + inDistance * sin( curAngle / 360 * 2 * PI) ;
     if (penDown) {
       strokeWeight(curWidth) ;
       stroke(curColor) ;
       line(curX,curY,newX,newY) ;
     }
     curX = newX ;
     curY = newY ;

   }
   
   void Turn(float inDegrees) { 
     curAngle += inDegrees ;
     // keep the angle as a value 0..360
     while (curAngle > 360) 
       curAngle = curAngle - 360 ;
     while (curAngle < 0)
       curAngle = curAngle + 360 ;
   }

   float GetX (){return curX;}
   float GetY (){return curY;}
}