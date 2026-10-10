typedef ListMapper<X> = Map<X, List<X>>;
Map<String, List<String>> m1 = {}; // Uzun hali.
ListMapper<String> m2 = {}; // Aynı şey, ama daha kısa ve net.

void main() {
  print(m1);
  print(m2);
}
