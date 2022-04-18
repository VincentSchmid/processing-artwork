static class Helpers {
  public static watercolor context;
  
  public static BaseLine line_on_line(PVector pointA,
                                      PVector pointB,
                                      float interploate_amount,
                                      float angle_rad,
                                      float line_length) {
    PVector start_point = PVector.lerp(pointA, pointB, interploate_amount);
    PVector dest_point = pointB.copy()
                               .sub(start_point)
                               .normalize()
                               .mult(line_length)
                               .rotate(angle_rad)
                               .add(start_point);
                 
    return context.new BaseLine(start_point, dest_point);
  }
  
  public static BaseShape polygon(BaseShape shape, float x, float y, float radius, int npoints) {
    BaseShape new_shape = (BaseShape) shape.copy();
    float angle = TWO_PI / npoints;
    for (float a = 0; a < TWO_PI; a += angle) {
        float sx = x + cos(a) * radius;
        float sy = y + sin(a) * radius;
        new_shape.add_point(sx, sy);
    }

    return new_shape;
}
}
