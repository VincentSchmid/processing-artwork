import java.util.List;
import java.util.LinkedList;


class BaseShape implements CustomShape {
    protected List<PVector> points = new LinkedList<PVector>();
    private int current_index = 0;
    private int last_index = 0;
    private boolean close_shape = true;
    public color shape_color;
    public float shape_opacity;
    public boolean shape_filled = true;
    public boolean line_drawing;
    public int line_width;

    public BaseShape(BaseShape baseShape) {
        this.close_shape = baseShape.close_shape;
        this.shape_color = baseShape.shape_color;
        this.shape_opacity = baseShape.shape_opacity;
        this.shape_filled = baseShape.shape_filled;
        this.line_drawing = baseShape.line_drawing;
        this.line_width = baseShape.line_width;

        this.points = new LinkedList<PVector>();
        for (PVector point : baseShape.points) {
            this.points.add(new PVector(point.x, point.y));
        }
    }
    
    public BaseShape(color shape_color, float opacity, boolean close_shape) {
        this.shape_color = shape_color;
        this.shape_opacity = opacity;
        this.close_shape = close_shape;
        shape_filled = true;
        line_drawing = !close_shape;
        line_width = 1;
    }
    
    public void init() {
        current_index = 0;
    }
    
    public void add_point(int x, int y) {
        add_point(new PVector(x, y));
    }
    
    public void add_point(float x, float y) {
        add_point(new PVector(x, y));
    }
    
    public void add_point(PVector point) {
        insert(last_index, point);
    }
    
    public boolean has_next() {
        return current_index < points.size();
    }
    
    public PVector next() {
        if (current_index >= points.size()) {
            return null;
        }
        
        return points.get(current_index++);
    }
    
    public void insert_and_step(PVector new_point) {
        insert(current_index - 1, new_point);
        current_index++;
    }
    
    public void remove_current() {
        remove_at_index(current_index - 1);
}
    
    public void remove_at_index(int index) {
        current_index--;
        last_index--;
        
        points.remove(index);
    }
    
    public void insert(int index, PVector new_point) {
        last_index++;
        
        if (points.isEmpty() && close_shape) {
            points.add(new PVector(new_point.x, new_point.y));
        }
        
        points.add(index, new_point);
    }
    
    public void draw_shape() {
        draw_shape_param(close_shape ? CLOSE : OPEN);
    }
    
    public void draw_dots() {
        for (PVector vector : points) {
            ellipse(vector.x, vector.y, 10, 10); 
        }
    }
    
    public void translate(float x, float y) {
        for (PVector vector : points) {
            vector.x += x;
            vector.y += y;
        }
    }
    
    public void scale_shape(float x, float y, PVector center) {
        for (PVector vector : points) {
            vector.x = (vector.x - center.x) * x + center.x;
            vector.y = (vector.y - center.y) * y + center.y;
        }
    }

    public void rotate_shape(float angle, PVector center) {
        for (PVector vector : points) {
            vector.x = (vector.x - center.x) * cos(angle) - (vector.y - center.y) * sin(angle) + center.x;
            vector.y = (vector.x - center.x) * sin(angle) + (vector.y - center.y) * cos(angle) + center.y;
        }
    }

    public void set_color(color new_color) {
        shape_color = new_color;
    }

    public CustomShape copy() {
        return new BaseShape(this);
    }
    
    protected void draw_shape_param(int param) {

        if (shape_filled) {
            fill(shape_color, map(shape_opacity, 0, 1, 0, 255));
        } else {
            noFill();
        }

        if (line_drawing) {
            stroke(shape_color, map(shape_opacity, 0, 1, 0, 255));
            strokeWeight(line_width);
        } else {
            noStroke();
        }
        
        beginShape();
        
        for (PVector vector : points) {
            vertex(vector.x, vector.y); 
        }
        
        endShape(param);
    }
    
    public void print_debug_info() {
        System.out.println("BaseShape");
        System.out.println("points: " + points.size());
        System.out.println("current_index: " + current_index);
        System.out.println("last_index: " + last_index);
        System.out.println("close_shape: " + close_shape);
        System.out.println("shape_color: " + shape_color);
        System.out.println("shape_opacity: " + shape_opacity);
    }
}
