String urlStem = "http://maps.googleapis.com/maps/api/streetview?";

PImage[] imgs;
int numHeadings = 4;
float zoom = 1.8;
PShader polar;

String lat="42.36234924163794";
String lng="-71.0873794555664";
int fov = 120;
int w = 400;
int h = 400;

void setup() {
  imgs = new PImage[numHeadings];
  int heading = 0;
  for (int i = 0; i < numHeadings; i++) {
     println(heading);
    String url = (urlStem + "size=" + w +"x"+h + "&location="+ lat +"," + lng +"&fov="+fov+ "&heading="+heading+"&sensor=false");
    heading += (int)(360.0/numHeadings);
    imgs[i] = loadImage(url, "png");
  }

  size(w*2, h*2, P2D);
  polar = loadShader("cartopol.frag");
}

void draw() {
  shader(polar);
  for(int y = 0; y < 2; y++){
      for(int x = 0; x < 2; x++){
        int i = x + y*2;       
        image(imgs[i], x*w, y*h, w, h);
      }
  }
}

