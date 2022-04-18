import java.util.List;
import java.util.LinkedList;


class BaseShape implements CustomShape {
 private List<PVector> points = new LinkedList<PVector>();
 private int current_index = 0;
 private int last_index = 0;
 private boolean close_shape = true;
 public color shape_color;
 public float shape_opacity;

 public BaseShape(BaseShape baseShape) {
  this.points = baseShape.points;
  this.close_shape = baseShape.close_shape;
  this.shape_color = baseShape.shape_color;
  this.shape_opacity = baseShape.shape_opacity;
 }
 
 public BaseShape(color shape_color, float opacity, boolean close_shape) {
   this.shape_color = shape_color;
   this.shape_opacity = opacity;
   this.close_shape = close_shape;
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
   insert(current_index-1, new_point);
   current_index++;
 }
 
  public void remove_current() {
   remove_at_index(current_index-1);
 }
 
 public void remove_at_index(int index) {
   current_index--;
   last_index--;
   
   points.remove(index);
 }
 
 public void insert(int index, PVector new_point) {
   last_index++;
   
   if (points.isEmpty() && close_shape) {
     points.add(new_point);
   }
   
   points.add(index, new_point);
 }
 
 public void draw_shape() {
   draw_shape_param(CLOSE);
 }
 
 public void draw_dots() {
   for(PVector vector : points) {
    ellipse(vector.x, vector.y, 10, 10); 
   }
 }
 
 protected void draw_shape_param(int param) {
   fill(shape_color);
   beginShape();
   
   for(PVector vector : points) {
     vertex(vector.x, vector.y); 
   }
   
   endShape(param);
 }
}
