//for this project we're using Keystone which is a video projection mapping library 
//for Processing. Basically, it allows you to warp your Processing sketches onto any 
//flat surface by using corner pin keystoning. 

import deadpixel.keystone.*;

// here we use the Keystone class to create a keystoned surface. 
Keystone ks;

//The class CornerPinSurface is a simple corner pin "keystoned" surface, which can be 
//distorted to an arbitrary shape by moving its four corners. Here this is the test run
// so we will make only three surfaces, onto which we will attribute 3 images.

CornerPinSurface surface1;
CornerPinSurface surface2;
CornerPinSurface surface3;

// calling the PGraphics class gives us rendering contexts for our images
PGraphics offscreen1;
PGraphics offscreen2;
PGraphics offscreen3;

// calling the PImage class to create our our three 'test' images 
PImage a;
PImage b;
PImage c;

void setup() {

  // we need a 3D renderer for this so we will make the 3rd param P3D 
  size(1300, 800, P3D);

  ks = new Keystone(this);

// setting up the rendering contexts within each surface 
  offscreen1 = createGraphics(200, 200, P3D);
  surface1 = ks.createCornerPinSurface(200, 200, 20);
  surface1.moveTo(0, 0);

  offscreen2 = createGraphics(200, 200, P3D);
  surface2 = ks.createCornerPinSurface(200, 200, 20);
  surface2.moveTo(100, 0);

  offscreen3 = createGraphics(200, 200, P3D);
  surface3 = ks.createCornerPinSurface(200, 200, 20);
  surface3.moveTo(200, 0);

// loading our images  
  a = loadImage("A.jpg");
  b = loadImage("B.jpg");
  c = loadImage("C.jpg");
}

void draw() {

  PVector surface1Mouse = surface1.getTransformedMouse();
  PVector surface2Mouse = surface2.getTransformedMouse();
  PVector surface3Mouse = surface3.getTransformedMouse();


  offscreen1.beginDraw();
  offscreen1.background(255);
  offscreen1.image(a, 0, 0);
  offscreen1.endDraw();

  offscreen2.beginDraw();
  offscreen2.background(255);
  offscreen2.image(b, 0, 0);
  offscreen2.endDraw();

  offscreen3.beginDraw();
  offscreen3.background(255);
  offscreen3.image(c, 0, 0);
  offscreen3.endDraw() ;


  background(0);

// rendering each context to each surface 
  surface1.render(offscreen1);
  surface2.render(offscreen2);
  surface3.render(offscreen3);
}

void keyPressed() {
  switch(key) {
    // switches on/off corner pins on each surface 
  case 'c':

    ks.toggleCalibration();
    break;

  case 'l':
    ks.load();
    break;

  case 's':
    ks.save();
    break;
  }
}