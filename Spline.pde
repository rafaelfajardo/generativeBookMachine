class Spline {

  // member variables for Spline
  float x1;
  float x2;
  float y1;
  float y2;
  color inCol;

  // constructor to initialize default Spline
  // 
  Spline(){
    x1= random(width/4,width/2);
    x2= random(width/2,width*3/4);
    y1= random(height/4,height*3/4);
    y2= random(height/4,height*3/4);
    inCol = color(0,255,0);
  }
  
  Spline(float inX, float inY){
    noFill();
    //stroke(inCol); // declare color before invoking/constructing Spline?
    strokeWeight(int(random(1,3)));
    beginShape();
      curveVertex(inX, inY);
      curveVertex(inX+random(10,20), inY+random(10,20));
      curveVertex(inX+random(30,40), inY-random(10,20));
    endShape();
  }
  
  void MakeFuzz(){
    strokeWeight(1);
    stroke(inCol);
    beginShape(LINES);
      vertex (x1,y1);
      vertex (x2,y2);
     endShape();
  }

}