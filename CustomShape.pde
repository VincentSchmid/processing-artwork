interface CustomShape {
  public void draw_shape();
  public void translate(float x, float y);
  public void scale_shape(float x, float y, PVector center);
  public void rotate_shape(float angle, PVector center);
  public void set_color(color new_color);
  public CustomShape copy();
  public void print_debug_info();
}
