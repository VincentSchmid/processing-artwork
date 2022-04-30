class BaseRect extends BaseShape {
  // constructor center angle width height
  public BaseRect(color shape_color, float opacity, float center_x, float center_y, float angle_rad, float width, float length) {
    super(shape_color, opacity, true);
    add_point(new PVector(-width/2, -length/2).rotate(angle_rad + HALF_PI).add(new PVector(center_x, center_y)));
    add_point(new PVector(width/2, -length/2).rotate(angle_rad + HALF_PI).add(new PVector(center_x, center_y)));
    add_point(new PVector(width/2, length/2).rotate(angle_rad + HALF_PI).add(new PVector(center_x, center_y)));
    add_point(new PVector(-width/2, length/2).rotate(angle_rad + HALF_PI).add(new PVector(center_x, center_y)));
  }

  public BaseRect(float x, float y, float width, float height, color shape_color, float opacity) {
    super(shape_color, opacity, true);
    add_point(x-width/2, y-height/2);
    add_point(x-width/2, y+height/2);
    add_point(x+width/2, y+height/2);
    add_point(x+width/2, y-height/2);
  }
}
