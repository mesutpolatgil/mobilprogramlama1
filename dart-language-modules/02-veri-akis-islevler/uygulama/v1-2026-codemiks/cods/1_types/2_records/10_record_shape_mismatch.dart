void main() {
  ({int x, int y, int z}) point = (x: 1, y: 2, z: 3);
  ({int r, int g, int b}) color = (r: 1, g: 2, b: 3);

  print(point == color); // 'false' yazdırır. Lint: İlgisiz tipler üzerinde eşitlik.
}
