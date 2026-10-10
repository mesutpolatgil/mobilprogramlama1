X max<X extends Comparable<X>>(X x1, X x2) => x1.compareTo(x2) > 0 ? x1 : x2;

void main() {
  // Bu özellikle `max<num>(3, 7)` olarak çıkarılır, özellik olmadan başarısız olur.
  max(3, 7);
}
