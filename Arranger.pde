static class Arranger {
  public static watercolor context;
  public static Arrangement grid(CustomShape shape, int col_count, int row_count, float width, float height) {
    Arrangement arr = context.new Arrangement();
    float col_width = width / col_count;
    float row_height = height / row_count;

    for (int i = 0; i < col_count; i++) {
      for (int j = 0; j < row_count; j++) {
        CustomShape newShape = shape.copy();
        newShape.translate(i * col_width, j * row_height);
        arr.add(newShape);
      }
    }
    return arr;
  }
}
