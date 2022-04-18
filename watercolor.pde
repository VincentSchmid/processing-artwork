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

    colored_dotted_lines();
}

void colored_dotted_lines() {
    // 880x660

    color[] colors = new color[] {a, b, c, d, e};

    // COLOR BARS

    BaseRect g = new BaseRect(width/2, height/2, 600, 900, d, 1);

    shapes.add(Fuzzer.growShape(g, .1, .4, -.1, PI / 10, .3, .7, 3, Fuzzer.FuzzType.RELATIVE));
    shapes.scale_shape(.1, .2, new PVector(50, 0));
    Arrangement gridResult = Arranger.grid(shapes, 12, 1,width, height);
    gridResult.translate(-80, 265);
    gridResult.scale_shape(1.2, 5, new PVector(width/2, height/2));

    for (int i = 0; i < gridResult.shapes.size(); ++i) {
        ((Arrangement) gridResult.shapes.get(i)).set_color(colors[i % colors.length]);
    }

    toDraw.add(gridResult);

    // HORIZONTAL LINES

    BaseLine l = new BaseLine(new PVector(0, 0), new PVector(width, 0), bg, 1, 15);
    BaseShape fuzzedLine = Fuzzer.growShape(l, .01, .3, PI/2, -PI / 2, .3, .7, 3, Fuzzer.FuzzType.RELATIVE);
    Arrangement fuzzedArr = Fuzzer.getFuzzyShape(fuzzedLine, .01, .1, -.1, PI / 10, .4, .6, 2, Fuzzer.FuzzType.RELATIVE);
    Arrangement fuzzedLineArr = Arranger.grid(fuzzedArr, 1, 30, width, height * 2);
    fuzzedLineArr.translate(0, -height);

    toDraw.add(fuzzedLineArr);

    // DRAWING

     single_draw();
}

void fuzzy_shape() {
  BaseShape shapeA = new BaseShape(c, 1, true);
  BaseShape shapeB = new BaseShape(d, 1, true);
  
  shapeA = Helpers.polygon(shapeA, width / 2, height / 2, 100, 5);
  shapeA = Fuzzer.growShape(shapeA, 0,.5, -PI, -.2,.2,.7, 1, Fuzzer.FuzzType.RELATIVE);
  
  shapes.add(Fuzzer.getFuzzyShape(shapeA));
  shapes.add(Fuzzer.getFuzzyShape(shapeB));

  toDraw.add(shapes);

   single_draw();
}

void single_draw() {
    background(bg);

    for (CustomShape drawnShape : toDraw) {
        drawnShape.draw_shape();
    }

    testShape.draw_dots();

    save("test_output_" + random(1000000, 9999999) + ".png");
}
