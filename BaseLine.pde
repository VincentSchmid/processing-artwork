class BaseLine extends BaseShape {
    float line_width;
    PVector start_point;
    PVector end_point;

    public BaseLine(PVector start_point, PVector end_point) {
        super(color(0), 1.0, false);
        this.start_point = start_point;
        this.end_point = end_point;
        this.line_width = 1.0f;
        add_point(start_point);
        add_point(end_point);
    }

    public BaseLine(PVector start_point, PVector end_point, color line_color, float opacity, int line_width) {
        super(line_color, opacity, false);
        this.start_point = start_point;
        this.end_point = end_point;
        this.line_width = line_width;
        add_point(start_point);
        add_point(end_point);
    }
    
    @Override
    public void draw_shape() {
        stroke(shape_color, map(shape_opacity, 0, 1, 0, 255));
        strokeWeight(line_width);

        beginShape();
        
        for (PVector vector : points) {
            vertex(vector.x, vector.y); 
        }
        
        endShape();
    }
}
