class Palette {
  String inColor; 
  int numColors = 6; // integer number of colors in this palette
  color [] col = new color [numColors]; // array to hold the colors in the palette

  /*
   *
   *  Palette class was originally built with default constructors
   *  I would like to make set of constructors that could be addressed by a string (I think)
   *
   *  I have built a number of the palettes using Adobe's Kuler online color tool
   *  the different palettes here are commented out so that only one is active at any time
   *  use the multi-line comment symbols to deactivate the current palette and 
   *  remove the multi-line comment symbols to activate another palette
   *  only one palette can be active at a time or an error will occur
   *
   *  there is a getColor() call at the bottom that returns a random color from the palette array
   *
   */


 /* 
  // blues
  Palette() {
    // Kuler shades of (0, 76, 127)
    col [0] = color (0, 76, 127);
    col [1] = color (0, 122, 203);
    col [2] = color (0, 61, 101);
    // analagous colors
    col [3] = color (7, 17, 140);
    col [4] = color (7, 55, 150);
    col [5] = color (0, 76, 127);
    col [6] = color (7, 130, 150);
    col [7] = color (7, 140, 122);
    // monchormatic 
    col [8] = color (0, 122, 203);
    col [9] = color (44, 107, 148);
    col [10] = color (0, 76, 127);
    col [11] = color (61, 146, 203);
    col [12] = color (0, 46, 76);
    // compound
    col [13] = color (18, 30, 178);
    col [14] = color (92, 102, 229);
    col [15] = color (0, 76, 127);
    col [16] = color (140, 82, 35);
    col [17] = color (178, 66, 18);
    // triad
    col [18] = color (20, 130, 203);
    col [19] = color (140, 50, 14);
    col [20] = color (0, 76, 127);
    col [21] = color (76, 75, 8);
    col [22] = color (203, 202, 10);
    //
    col [23] = color (0, 76, 127);
  }
*/ 



  /*
  // grey with random transparencies
  Palette(){
    for (int i = 0; i < numColors; i++){
    col [i] = color (128, random(128,255)); 
    }
  }
   */

  /*
  // sepias & yellows, maybe
  // change numColors for this palette to 20
  Palette(){
    col [0] = color (0,0,0,random(128,255));
    col [1] = color (255,255,255, random(128,255));
    col [2] = color (128, 0, 0,random(255));
    col [3] = color (128,random(10),random(10),random(255));
    col [4] = color (128,random(20),random(20),random(255));
    col [5] = color (128,random(30),random(30),random(255));
    col [6] = color (128,random(40),random(40),random(255));
    col [7] = color (127, 90, 8,random(255));
    col [8] = color (255,199,74,random(255));
    col [9] = color (255,181,15,random(255));
    col [10] = color (127,105,56,random(255));
    col [11] = color (204,145,12,random(255));
    col [12] = color (0,255,255, random(255));
    col [13] = color (0,128,128, random(255));
    col [14] = color (random(10),128,128,random(255));
    col [15] = color (random(20),128,128,random(255));
    col [16] = color (random(30),128,128,random(255));
    col [17] = color (random(40),128,128,random(255));
    col [18] = color (128,128,0,random(255));
    col [19] = color (128,128,random(40),random(255));
  }
  */

//  /* 
  // yellows to brown
  // change numColors for this palette to 6
  Palette(){  
    col [0] = color (127, 90, 8,random(255));
    col [1] = color (255,199,74,random(255));
    col [2] = color (255,181,15,random(255));
    col [3] = color (127,105,56,random(255));
    col [4] = color (204,145,12,random(255));
    col [5] = color (255,255,255, random(255));
  }
//  */

  /*
  // greens ? maybe cyans
  // change numColors for this palette to 6
  Palette(){
    col [0] = color (0, 32, 0,random(255));
    col [1] = color (random(30),160,random(30),random(255));
    col [2] = color (random(60),200,random(60),random(255));
    col [3] = color (random(90),225,random(90),random(255));
    col [4] = color (random(120),255,random(120),random(255));
    col [5] = color (255,255,255, random(255));
  }
  */

  /*
  //brick reds, sepias, maybe
  // change numColors for this palette to 7
  Palette(){
    col [0] = color (128, 0, 0,random(255));
    col [1] = color (128,random(10),random(10),random(255));
    col [2] = color (128,random(20),random(20),random(255));
    col [3] = color (128,random(30),random(30),random(255));
    col [4] = color (128,random(40),random(40),random(255));
    col [5] = color (255,255,255, random(128,255));
    col [6] = color (0,0,0,random(128,255));
  }
  */

  /*
  // Kuler monochromatic avacado greens
  // set numColors for this palette to 24
  Palette(){
    col [0] = color (128,128,0,255);
    col [1] = color (144,144,43,255);
    col [2] = color (71,71,0,255);
    col [3] = color (198,198,60,255);
    col [4] = color (198,198,0,255);
    // Kuler shades of avacado green
    col [5] = color (128,128,0,255);
    col [6] = color (64,64,0,255);
    col [7] = color (204,204,0,255);
    col [8] = color (141,141,0,255);
    col [9] = color (102,102,0,255);
    // black and white
    col [10] = color (0,0,0,255);
    col [11] = color (255,255,255,255);
    // as above with translucencies
    col [12] = color (128,128,0,random(255));
    col [13] = color (144,144,43,random(255));
    col [14] = color (71,71,0,random(255));
    col [15] = color (198,198,60,random(255));
    col [16] = color (198,198,0,random(255));
    // Kuler shades of avacado green
    col [17] = color (128,128,0,random(255));
    col [18] = color (64,64,0,random(255));
    col [19] = color (204,204,0,random(255));
    col [20] = color (141,141,0,random(255));
    col [21] = color (102,102,0,random(255));
    // black and white
    col [22] = color (0,0,0,random(255));
    col [23] = color (255,255,255,random(255));
  }
  */

  /*
  Palette(){
    // Kuler colors analagous to grey 128,128,128
    // set numColors for this palette to 24
    col [0] = color (128,128,128,random(255));
    col [1] = color (141,131,127,random(255));
    col [2] = color (151,138,136,random(255));
    col [3] = color (151,136,143,random(255));
    col [4] = color (141,127,141,random(255));
    // Kuler colors complementary to 128,128,128
    col [5] = color (51,46,46,random(255));
    col [6] = color (41,51,44,random(255));
    col [7] = color (204,204,205,random(255));
    // Kuler colors in a triad with 128,128,128
    col [8] = color (141,141,127,random(255));
    col [9] = color (69,74,77,random(255));
    col [10] = color (184,197,204,random(255));
    // Kuler colors in a compound of/with 128,128,128
    col [11] = color (179,166,161,random(255));
    col [12] = color (230,165,138,random(255));
    col [13] = color (106,141,106,random(255));
    col [14] = color (167,179,161,random(255));
    // Kuler colors that are shades of 128,128,128
    col [15] = color (64,64,64,random(255));
    col [16] = color (102,102,102,random(255));
    col [17] = color (141,141,141,random(255));
    col [18] = color (204,204,204,random(255));
    // Kuler colors that form a monochromatic palette with 128,128,128
    col [19] = color (149,104,104,random(255));
    col [20] = color (204,143,143,random(255));
    col [21] = color (77,77,77,random(255));
    // black and white with transparencies
    col [22] = color (0,0,0,random(255));
    col [23] = color (255,255,255,random(255));
  }
  */

  /*
  // set numColors for this palette to 5
  Palette(){
    col [0] = color (231,255,228);
    col [1] = color (209,232,188);
    col [2] = color (247,255,196);
    col [3] = color (232,229,185);
    col [4] = color (255,248,216);
  }
  */

  /*
  // set numColors for this palette to 5
  Palette(){
    // https://color.adobe.com/cool-pop-colors-color-theme-7557343/
    col [0] = color (204,153, 79);
    col [1] = color (153,139,110);
    col [2] = color (255,147, 98);
    col [3] = color (202,255,234);
    col [4] = color (157,204,172);
  }
  */

  /*
  Palette(){
    // RGB to simulate CMYK
    // set numColors for this palette to 5
    col [0] = color (  0,  0,  0,random(255)); //K
    col [1] = color (  0,255,255,random(255)); //C
    col [2] = color (255,  0,255,random(255)); //M
    col [3] = color (255,255,  0,random(255)); //Y
    col [4] = color (255,255,255,random(255)); //W
  }
  */

  /*
  // set numColors for this palette to 5
  Palette(){
    // varying degrees of random colors, trying to limit to web safe
    col [0] = color (int(random(1,16))*16,int(random(1,16))*16,int(random(1,16))*16,int(random(1,16))*16);
    col [1] = color (int(random(1,16))*16,int(random(1,16))*16,int(random(1,16))*16);
    col [2] = color (int(random(1,16))*16,int(random(1,16))*16,255);
    col [3] = color (int(random(1,16))*16,255,255);
    col [4] = color (255,255,255);
  }
   */



  color GetColor () {
    return col [ int(random(0, numColors))];
  }
}
