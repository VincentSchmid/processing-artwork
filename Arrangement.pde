class Arrangement implements CustomShape {
    public List<CustomShape> shapes;

    public Arrangement() {
        shapes = new ArrayList<>();
    }

    public Arrangement(Arrangement arrangement) {
        shapes = new ArrayList<>();
        for (CustomShape shape : arrangement.shapes) {
            shapes.add(shape.copy());
        }
    }

    public void add(CustomShape shape) {
        shapes.add(shape);
    }

    public void add(List<CustomShape> shapes) {
        shapes.addAll(shapes);
    }

    public void add(Arrangement arrangement) {
        shapes.addAll(arrangement.shapes);
    }

    public void translate(float x, float y) {
        for (CustomShape shape : shapes) {
            shape.translate(x, y);
        }
    }

    public void scale_shape(float scale, PVector center) {
        for (CustomShape shape : shapes) {
            shape.scale_shape(scale, center);
        }
    }

    public void rotate_shape(float angle, PVector center) {
        for (CustomShape shape : shapes) {
            shape.rotate_shape(angle, center);
        }
    }

    public void draw_shape() {
        for (CustomShape shape : shapes) {
            shape.draw_shape();
        }
    }

    public CustomShape copy() {
        return new Arrangement(this);
    }

    public void print_debug_info() {
        for (CustomShape shape : shapes) {
            shape.print_debug_info();
        }
    }
}
