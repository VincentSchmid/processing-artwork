List<CustomShape> shapes = new ArrayList<CustomShape>();
BaseShape testShape = new BaseShape(color(0, 0, 0), 1.0, false);

color a = #FA3B38;
color b = #A754DE;
color c = #699CF5;
color d = #54DEB0;
color e = #A5FF61;
color bg = #FCF4E8;

void setup()
{
  Helpers.context = this;
  Fuzzer.context = this;
  
  size(880, 660);
  background(bg);
  noStroke();
  
  BaseShape shpe = new BaseShape(c, 1.0, true);
  shapes.add(shpe);
  
  polygon(shpe, width/2, height/2, 200, 3);
  Fuzzer.growShape(shpe, 0, .5, -PI, -.2, .2, .7, 7);
}

void polygon(BaseShape shape, float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    shape.add_point(sx, sy);
  }
}

void draw() {
  for (CustomShape customShape : shapes) {
    customShape.draw_shape();
  }
  
  testShape.draw_dots();
}
