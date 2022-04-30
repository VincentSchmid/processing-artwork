class BaseStrip extends BaseShape {
    public float strip_width;
    private Arrangement arrangement;
    
    BaseStrip(color base_strip_color, float opacity, float strip_width) {
        super(base_strip_color, opacity, false);
        arrangement = new Arrangement();
        this.strip_width = strip_width;
    }
    
    public void convert() {
        current_index = 0;
        PVector current_point = next();
        PVector next_point;
        
        while(has_next()) {
            println("current_point: " + current_point);
            next_point = next();

            PVector center_point = Helpers.point_on_line(current_point, next_point, 0.5);
            PVector delta = PVector.sub(next_point, current_point);
            arrangement.add(new BaseRect(shape_color, shape_opacity, center_point.x, center_point.y, delta.heading(), strip_width, delta.mag()));

            if (has_next()) {
                current_point = prev();
            }
        }
    }

    public void draw_shape() {
        arrangement.draw_shape();
    }
}
