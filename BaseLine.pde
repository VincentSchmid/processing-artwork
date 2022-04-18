class BaseLine implements CustomShape {
  PVector start_point;
  PVector end_point;
  
  public BaseLine(PVector start_point, PVector end_point) {
    this.start_point = start_point;
    this.end_point = end_point;
  }
  
  public void draw_shape() {
    line(start_point.x, start_point.y, end_point.x, end_point.y);
  }
}
