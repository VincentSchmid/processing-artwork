class BaseStripT extends BaseShape {
  public float strip_width;

  private List<PVector> left_points;
  private List<PVector> right_points;
  private Function<CustomShape, CustomShape> func;

  BaseStripT(color base_strip_color, float opacity, float strip_width) {
    super(base_strip_color, opacity, false);
    this.strip_width = strip_width;
    left_points = new ArrayList<PVector>();
    right_points = new ArrayList<PVector>();
  }

  private void convert() {
    current_index = 0;
    PVector current_point = next();
    PVector next_point;

    while(has_next()) {
      next_point = next();
      // add two points tangential to current_point and next_point
      PVector p1 = Helpers.line_on_line(current_point, next_point, 0, HALF_PI, strip_width / 2).end_point;
      PVector p2 = Helpers.line_on_line(current_point, next_point, 0, -HALF_PI, strip_width / 2).end_point;
      left_points.add(p1);
      right_points.add(p2);

      if (has_next()) {
        current_index--;
        current_point = next();
      }
      else {
        p1 = Helpers.line_on_line(next_point, current_point, 0, -HALF_PI, strip_width / 2).end_point;
        p2 = Helpers.line_on_line(next_point, current_point, 0, HALF_PI, strip_width / 2).end_point;
        left_points.add(p1);
        right_points.add(p2);
      }
    }
    //reverse right_points
    points = left_points;
    //reverse right_points
    List<PVector> reversed_right_points = new ArrayList<PVector>();
    for (int i = right_points.size() - 1; i >= 0; i--) {
      reversed_right_points.add(right_points.get(i));
    }
    points.addAll(reversed_right_points);
  }

  public void setFunc(Function<CustomShape, CustomShape> func) {
        this.func = func;
    }

  public void draw_shape() {
        convert();
        if (func != null) {
            Arrangement arr = (Arrangement) func.apply(this);
            arr.draw_shape();
        } else {
            super.draw_shape();
        }
        
  }
}
