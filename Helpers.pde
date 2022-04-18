static class Helpers {
  public static sketch_220417c context;
  
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
}
