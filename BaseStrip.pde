class BaseStrip extends BaseShape {
    public float strip_width;
    private Arrangement arrangement;
    private Function<CustomShape, CustomShape> func;
    
    BaseStrip(BaseStrip baseStrip) {
        super(baseStrip);
        this.strip_width = baseStrip.strip_width;
        this.arrangement = new Arrangement();
        this.func = baseStrip.func;
    }

    BaseStrip(color base_strip_color, float opacity, float strip_width) {
        super(base_strip_color, opacity, false);
        arrangement = new Arrangement();
        this.strip_width = strip_width;
    }

    public void setFunc(Function<CustomShape, CustomShape> func) {
        this.func = func;
    }
    
    private void convert() {
        current_index = 0;
        PVector current_point = next();
        PVector next_point;
        
        while(has_next()) {
            next_point = next();

            PVector center_point = Helpers.point_on_line(current_point, next_point, 0.5);
            PVector delta = PVector.sub(next_point, current_point);
            arrangement.add(new BaseRect(shape_color, shape_opacity, center_point.x, center_point.y, delta.heading(), strip_width, delta.mag()));

            if (has_next()) {
                current_point = prev();
            }
        }
    }

    public CustomShape copy() {
        return new BaseStrip(this);
    }

    public void draw_shape() {
        convert();
        if (func != null) {
           arrangement.map(func);
        }
        arrangement.draw_shape();
    }
}
