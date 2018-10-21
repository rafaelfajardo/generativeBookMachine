generativeBookMachine

a sketch in Processing 3.3.6 that generates paginated books from .txt files.

this first commit is a working generative book sketch with the following dependencies: 
1. the existence of a data folder (or sub-directory) containing
1.1. three text files; “ante.txt”, “body.txt”, and “colophon.txt”
1.2. fonts from the “Work Sans” family (Open Type License)
1.3. and importing of the PDF generating library for Processing, which itself depends upon iText.

2. It also depends upon three classes:
2.1. Turtle which depends on Palette. 
     Turtle implements a turtle graphics capability and 
2.2. Palette allows the creation of an array of colors. 
2.3. And the third class is Spline 
     which will attempt to allow the creation of vector parametric code drawings on each page 
     which currently does NOT function and has either been commented out or deleted
