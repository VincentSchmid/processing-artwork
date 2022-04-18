import java.util.function.Function;


static class Fuzzer {
    public enum FuzzType {RELATIVE, ABSOLUTE};
    public static watercolor context;
    
    
    public static Arrangement getFuzzyShape(BaseShape polygon, float min_dist,
        float max_dist,
        float min_rot,
        float max_rot,
        float min_offset,
        float max_offset,
        int iteration,
        FuzzType fuzzType) {

        Function<BaseShape, BaseShape> growfunc = getParamerizedGrowShape(min_dist, max_dist, min_rot, max_rot, min_offset, max_offset, iteration, fuzzType);
        return layer_processing(growfunc, polygon, 0.1, 100);
    }
    
    public static Arrangement getFuzzyShape(BaseShape polygon) {
        return getFuzzyShape(polygon, 0, .5, -PI, 0, .2, .7, 7, FuzzType.RELATIVE);
    }

    public static BaseShape growShape(BaseShape shape, 
        float min_dist,
        float max_dist,
        float min_rot,
        float max_rot,
        float min_offset,
        float max_offset,
        int iteration,
        FuzzType fuzzType) {
        
        BaseShape new_shape = (BaseShape) shape.copy();
        new_shape.init();
        PVector prev_point;
        PVector next_point = new_shape.next();
        
        while(new_shape.has_next()) {
            prev_point = next_point;
            next_point = new_shape.next();
            float dist = prev_point.dist(next_point);
            float rnd_rotation = context.random(min_rot, max_rot);
            float rnd_distance = context.random(min_dist, max_dist);
            rnd_distance = fuzzType == FuzzType.RELATIVE ? rnd_distance * dist : rnd_distance;
            float rnd_offset = context.random(min_offset, max_offset);
            
            BaseLine bl = Helpers.line_on_line(prev_point, next_point, rnd_offset, rnd_rotation, rnd_distance);
            
            new_shape.insert_and_step(bl.end_point);
        }
        
        if (iteration > 1) {
            new_shape = growShape(new_shape, min_dist, max_dist, min_rot, max_rot, min_offset, max_offset, iteration - 1, fuzzType);
        }
        
        return new_shape;
    }
    
    public static Function<BaseShape, BaseShape> getParamerizedGrowShape(float min_dist,
        float max_dist,
        float min_rot,
        float max_rot,
        float min_offset,
        float max_offset,
        int iteration,
        FuzzType fuzzType) {
        return shape -> 
        growShape(shape, min_dist, max_dist, min_rot, max_rot, min_offset, max_offset, iteration, fuzzType);
    };
    
    public static Arrangement layer_processing(Function<BaseShape, BaseShape> func, BaseShape shape, float opacity, int count) {
        Arrangement result = context.new Arrangement();
        
        for (int i = 0; i < count; i++) {
            BaseShape current_shape = func.apply(shape);
            current_shape.shape_opacity = opacity;
            result.add((CustomShape) current_shape);
        }

        return result;
    }
}
