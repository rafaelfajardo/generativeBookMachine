/*
 *  A Machine for making books
 *  in Processing 3.3.6
 *  with one word per page (this will be upgraded)
 *  capable of creating a title page from data/ante.txt
 *  capable of creating body text from data/body.txt
 *  capable of creating a colophon from data/colophon.txt
 *  using the Work Sans typeface family
 *  
 *  It depends on Processing.PDF to create multipage output
 *
 *  It wants to create a code drawing on every page, that function is still in broken
 *  using curves and vertices instead of turtles
 *  depends on Palette class
 *  can depend on Spline class
 *  can depend on Turtle class
 */

import processing.pdf.*; // enables the ability to render PDFs
int pageCount = 64; // a constant, should be non-zero and divisible by 4
String[] anteMatter; // an array to hold front matter words, title page e.g.
String[] bodyMatter; // an array to hold body matter words, text e.g.
String[] colophonMatter; // an array to hold colophon words, credits and printing methods e.g.
String myColor; // a string placeholder for a color value
PFont [] f = new PFont [10]; // an array to hold 10 fonts
String fileTitle = "testbook_"+year()+"-"+nf(month(),2)+"-"+nf(day(),2)+"-"+nf(hour(),2)+"-"+nf(minute(),2)+"-"+nf(second(),2)+".pdf"; //generates a file named "test book" with today's date in YYYY MM DD HH MM SS format in the filename
//Palette spectrum = new Palette(); // need to create a Palette object in order to use the member methods
//Spline catmull; // invoke a spline called catmull
Palette paletteBox = new Palette(); //palette for Box
Turtle [] turtlesBox = new Turtle [128]; //number of turtles of type Box

void setup(){
   size (396, 612, PDF, fileTitle); // create an arbitrary sized square composition, use PDF renderer and save to a file titled book+datestamp+timestamp
   //72 dpi is the default
   // 396 x 612 = 5.5" x 8.5"
   // can I manipulate the pixel density?
   //pixelDensity(displayDensity()); // give access to full density available via the graphics card, important for retina-display Apple devices. may not be crucial on other technologies. seems to be breaking the generation of the PDF
   // load the string arrays
   anteMatter = loadStrings("ante.txt");// load the contents of the file ante.txt into an array
   bodyMatter = loadStrings("body.txt"); // load the contents of the file body.txt into an array
   colophonMatter = loadStrings("colophon.txt"); // load the contents of the file colophon.txt into an array
   // load the f[] array with font weight from lightest to heaviest
   f[0] = createFont("WorkSansHairline-Regular.ttf", height/10, true); // load a font into a place in the font array f[]
   f[1] = createFont("WorkSans-Thin.ttf", height/10, true); // load a font into a place in the font array f[]
   f[2] = createFont("WorkSans-ExtraLight.ttf", height/10, true); // load a font into a place in the font array f[]
   f[4] = createFont("WorkSans-Light.ttf", height/10, true); // load a font into a place in the font array f[]
   f[4] = createFont("WorkSans-Regular.ttf", height/10, true); // load a font into a place in the font array f[]
   f[5] = createFont("WorkSans-Medium.ttf", height/10, true); // load a font into a place in the font array f[]
   f[6] = createFont("WorkSans-SemiBold.ttf", height/10, true); // load a font into a place in the font array f[]
   f[7] = createFont("WorkSans-Bold.ttf", height/10, true); // load a font into a place in the font array f[]
   f[8] = createFont("WorkSans-ExtraBold.ttf", height/10, true); // load a font into a place in the font array f[]
   f[9] = createFont("WorkSans-Black.ttf", height/10, true); // load a font into a place in the font array f[]
   textAlign(CENTER); // choose to center the line of text
   background (255); // choose to work with a white background

  // create a set of turtlesBox
  for (int i = 0; i < turtlesBox.length; i++){
    float newX = random(width/8+10, width*7/8-10 );
    float newY = random(height/8+10, height+7/8-10 );
    int   newW = 1;
    color newC = paletteBox.GetColor(); // get a color from the Palette
    //color newC = color(random(255),random(255)); // random grey and alpha
    float newA = random (0,45);
    turtlesBox [i] = new Turtle ( newX,
                               newY,
                               newW,
                               newC,
                               newA,
                               true);
  }
   
   
   println("setup complete"); // give feedback through the console that setup has completed
}
 
void draw(){
  background(255); // (re)paint the white background
  
  PGraphicsPDF pdf = (PGraphicsPDF) g;  // Get the renderer. I am presuming that it should appear before the "pdf.nextPage();" command, and only once in the draw() loop.

  if (frameCount == 1){ // if this is the first frame of the "draw" loop then render the front matter
    println("front matter"); // provide feedback through the console that the front matter is being rendered
    for ( int i = 0; i < anteMatter.length; i++){ // loop through the front matter array
      fill(0); // choose to fill the font with black, can use another color
      textFont(f[4]); // choose the font for use on the title page, the array index value should be 0-9 if you haven't made any changes to the font array above
      textSize(height/(20*(i+1))); // the size of the font will change with each pass through the loop
      text(anteMatter[i], width/2, height/8+(i*height/8)); // render the text contained in the anteMatter array to the screen
    }
    pdf.nextPage(); //when we've completed the front matter the start making the next PDF page
  }
  if (frameCount > 1 && frameCount < pageCount){ // if the frame is between 1 and the total number of pages then execute this section that renders the body of the book
    println("body page no. " + frameCount); //provide feedback through the console that page number XX is about to be rendered
    // this section makes a code drawing on the page:
    // make a bunch of horizontal lines with the vertices rather than rendered pixels
    //for ( int i = height/8; i < height*7/8; i++){ // choosing to divide the composition into 8 vertical units and leave a border above and below that are 1/8
      //fill( spectrum.GetColor()); // "fill" is for shapes, not strokes
      //strokeWeight( int (random(10,20))); // set thickness of the line
      //stroke(spectrum.GetColor()); // grab a random color from the palette
      //rect(width/8,height/8,width*6/8,height*6/8); // make a rectangle of color

      //catmull = new Spline (random (width/8, width*6/8), i ); // this needs fixing
 
      
      //the following line may not be working
      //f(500, 4); // call the function that draws a snowflake with a turtle recursively, defined below. The name "f" may be confusing
      
      /* //I've commented out this part because it wasn't ready for prime-time
      beginShape(LINES); // create a vector line defined by two end point vertices
        vertex (random(width/8, width/8+20),i); // first vertex is on the left side of page, within a margin
        vertex (random(width*7/8-20, width*7/8),i); // second vertex is on right side of page, within a margin
       endShape(); // end of shape
       */
    //}
    
    /* //I've commented out this part because it wasn't ready for prime-time
    // make a few vertical lines with vertices
    for ( int i = width/8; i < width*7/8; i = i + int(random(1,10)) ){
      strokeWeight(1);
      stroke(spectrum.GetColor());
      beginShape(LINES);
        vertex(i, random(height/8, height/4));
        vertex(i, random(height*3/4, height*7/8));
      endShape();
    }
    
    */
    
  //cycle through all the turtlesBox
  for (int i = 0; i < turtlesBox.length; i++){    
    //if x and y  of a turtle are within the canvas
    if ((turtlesBox [i].GetX() < width*7/8 + 2)
      &&(turtlesBox [i].GetX() > width/8 - 2 )
      &&(turtlesBox [i].GetY() < height*7/8 + 2)
      &&(turtlesBox [i].GetY() > height/8 - 2 )){
        //each turtle will make a circle, in turn
        for (int j = 0; j < 360; j++){
          turtlesBox [i].Move ( .1f ); // move forward a bit
          turtlesBox [i].Turn ( 1 ); // turn a bit
        }
    }
    // if a turtle finds itself outside the canvas, then bring them back in
    else {
      turtlesBox [i].PenUp();
      turtlesBox [i].MoveTo (  random(width/8+10, width*7/8-10),
                               random(height/8+10, height*7/8-10)  );
      turtlesBox [i].PenDown();
    }
    // move each turtle to a new place
      turtlesBox [i].PenUp();
      turtlesBox [i].MoveTo (  random(width/8+10, width*7/8-10),
                               random(height/8+10, height*7/8-10)  );
      turtlesBox [i].PenDown();
  }
     
    
    
    
    //==============================
    //This part prepares to render text on top of the code drawing
    fill(255); // fill this font with white so that it's visible on top of the code drawing
    textFont(f[8]); // choose the font from the array, array index should be 0-9 if you haven't changed the font array above
    textSize(height/10); // the size of the font will be 1/10th the height of the page
    text(bodyMatter[int(random(bodyMatter.length))],width/2,height/2); // render a random line from the body text array to the center of the page  
    fill(0); // fill the next bit of text with black, it will be in the margin so it will be against a white background
    textFont(f[1]); // choose a font from the array, array index should be 0-9 if you haven't changed the font array above
    textSize(height/50); // choose size for this bit of text to be 1/50th of the height of the page, this will be small, that's okay
    text(frameCount, width/2, height*9/10); // render this bit of text to the lower margin, it is the page number, hence frameCount
    pdf.nextPage(); // when we've completed rendering this page of the body then start making the next page of the PDF
    
  }
  if (frameCount == pageCount) { // if the frame count in the draw loop has reached the page count we defined in setup then render the colophon
    println("colophon page no. " + frameCount); //feedback sent to the console
    fill(0);
    textFont(f[2]); // choose which font to use from the array defined in setup, the index number will be 0-9 if you haven't changed the array above
    textSize(height/40); // the height of the font will be 1/40th the height of the page
    text(fileTitle, width/2, height/10); // render the file name to the page so it's part of the colophon
    for ( int i = 0; i < colophonMatter.length; i++){ // loop though all of the lines in the colophon array
      fill(0);
      textFont(f[2]); // choose the font for this colophon line, a number between 0-9 if you haven't made any changes
      textSize(height/40); // the heigth of the font for this line will be 1/40th the height of the page
      text(colophonMatter[i], width/2, height/8+(i*height/8)); // render the line of text from the colophon array calculating the vertical position as a fraction of the height and the index number of the loop, the default is to allow a 1/8th of the page height margin above and below 
    }
    println("done");// provide feedback to the console that the job is done
    exit(); // end execution of the sketch because we have finished rendering the colophon which is the last page of the book. this may also be necessary to close the PDF file
  }
}
//==============================
// create a function called f that should render a snowflake with a turtle
void f (float length, int depth ){  // found on http://www.algorithm.co.il/blogs/computer-science/fractals-in-10-minutes-no-6-turtle-snowflake/
        //def f(length, depth):
   if (depth == 0){
     // move turtle forward  forward(length);
   }
   else{
     f(length/3, depth-1);
     // turn turtle  right(60);
     f(length/3, depth-1);
     // turn turtle   left(120);
     f(length/3, depth-1);
     // turn turtle   right(60);
     f(length/3, depth-1);
   }
 
}