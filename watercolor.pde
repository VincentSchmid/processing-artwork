List<CustomShape> toDraw = new ArrayList<CustomShape>();
Arrangement shapes = new Arrangement();
BaseShape testShape = new BaseShape(color(0, 0, 0), 1.0, false);

color a = #FA3B38;
color b = #A754DE;
color c = #699CF5;
color d = #54DEB0;
color e = #A5FF61;
color bg = #FCF4E8;

void setup() {
    Helpers.context = this;
    Fuzzer.context = this;
    Arranger.context = this;
    
    size(880, 660);
    
    BaseRect r = new BaseRect(width/2-100, height/2, 400, 300, a, 1);
    BaseRect g = new BaseRect(width/2, height/2, 100, 300, d, 1);
    BaseRect b = new BaseRect(width/2+100, height/2, 400, 300, c, 1);
    BaseShape s = new BaseShape(e, 1 , true);
    BaseLine l = new BaseLine(new PVector(0, 0), new PVector(width/2, height/2+100), e, 1.0, 10);
    
    shapes.add(r);

    shapes.add(b);
    shapes.add(g);
    shapes.add(l);

    //shapes.scale_shape(.2, new PVector(0, 0));

    //Arrangement gridResult = Arranger.grid(shapes, 5, 5, 880.0, 660.0);
    
    //println(gridResult.shapes);
    toDraw.add(shapes);
    //toDraw.add(gridResult);
    
    println("done");
    // shapes.addAll(Fuzzer.getFuzzyShape(r, .1, .4, -.1, PI / 10, .3, .7, 4, Fuzzer.FuzzType.RELATIVE));
    // shapes.addAll(Fuzzer.getFuzzyShape(b, .1, .4, -.1, PI / 10, .3, .7, 4, Fuzzer.FuzzType.RELATIVE));
    // shapes.addAll(Fuzzer.getFuzzyShape(g));
}

void fuzzy_shape() {
  BaseShape shapeA = new BaseShape(c, 1, true);
  BaseShape shapeB = new BaseShape(d, 1, true);
  
  shapeA = Helpers.polygon(shapeA, width / 2, height / 2, 100, 5);
  shapeA = Fuzzer.growShape(shapeA, 0,.5, -PI, -.2,.2,.7, 1, Fuzzer.FuzzType.RELATIVE);
  
  shapes.add(Fuzzer.getFuzzyShape(shapeA));
  shapes.add(Fuzzer.getFuzzyShape(shapeB));
}
        
void draw() {
    background(bg);

    for (CustomShape drawnShape : toDraw) {
        drawnShape.draw_shape();
    }
    
    testShape.draw_dots();
}
