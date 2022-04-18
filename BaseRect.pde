class BaseRect extends BaseShape {
  public BaseRect(float x, float y, float width, float height, color shape_color, float opacity) {
    super(shape_color, opacity, true);
    add_point(x-width/2, y-height/2);
    add_point(x-width/2, y+height/2);
    add_point(x+width/2, y+height/2);
    add_point(x+width/2, y-height/2);
  }
}
