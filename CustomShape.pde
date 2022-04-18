interface CustomShape {
  public void draw_shape();
  public void translate(float x, float y);
  public void scale_shape(float scale, PVector center);
  public void rotate_shape(float angle, PVector center);
  public CustomShape copy();
  public void print_debug_info();
}
