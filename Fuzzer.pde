import java.util.function.Function;


static class Fuzzer {
  public static sketch_220417c context;
  public static List<CustomShape> shapes = new ArrayList<CustomShape>();
    
  public static void growShape(BaseShape shape, 
    float min_dist,
    float max_dist,
    float min_rot,
    float max_rot,
    float min_offset,
    float max_offset,
    int iteration) {
      
    shape.init();
    PVector prev_point;
    PVector next_point = shape.next();
    
    while(shape.has_next()) {
      prev_point = next_point;
      next_point = shape.next();
      float dist = prev_point.dist(next_point);
      float rnd_rotation = context.random(min_rot, max_rot);
      float rnd_distance = context.random(min_dist, max_dist);
      float rnd_offset = context.random(min_offset, max_offset);
      
      BaseLine bl = Helpers.line_on_line(prev_point, next_point, rnd_offset, rnd_rotation, dist * rnd_distance);
      //testShape.add_point(bl.end_point);
      shape.insert_and_step(bl.end_point);
    }
    
    if (iteration > 1) {
      growShape(shape, min_dist, max_dist, min_rot, max_rot, min_offset, max_offset, iteration - 1);
    }
  }

  public static void layer_processing(Function<BaseShape, BaseShape> func, BaseShape shape, float opacity, int count) {
    for (int i = 0; i < count; i++) {
      BaseShape current_shape = func.apply(context.new BaseShape(shape));
      current_shape.shape_opacity = opacity;
      shapes.add(0, current_shape);
    }
  }
}
