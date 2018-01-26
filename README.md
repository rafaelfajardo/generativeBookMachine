# generativeBookMachine
a sketch in Processing 3.3.6 that generates paginated books from .txt files.
this first commit is a working generative book sketch with the following dependencies: 
the existence of a data folder (or sub-directory) containing
three text files; “ante.txt”, “body.txt”, and “colophon.txt”
fonts from the “Work Sans” family (Open Type License)
and importing of the PDF generating library for Processing, which itself depends upon iText.
It also depends upon three classes:
Turtle which depends on Palette. 
Turtle implements a turtle graphics capability and 
Palette allows the creation of an array of colors. 
And the third class is Spline which will attempt to allow the creation of vector parametric code drawings on each page
