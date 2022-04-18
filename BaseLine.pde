class BaseLine extends BaseShape {
    PVector start_point;
    PVector end_point;

    public BaseLine(PVector start_point, PVector end_point) {
        super(color(0), 1.0, false);
        init(start_point, end_point, 1);
    }

    public BaseLine(PVector start_point, PVector end_point, color line_color, float opacity, int line_width) {
        super(line_color, opacity, false);
        init(start_point, end_point, line_width);
    }

    private void init(PVector start_point, PVector end_point, int line_width) {
        this.start_point = start_point;
        this.end_point = end_point;
        this.line_width = line_width;
        this.shape_filled = false;
        this.line_drawing = true;
        add_point(start_point);
        add_point(end_point);
    }
}
