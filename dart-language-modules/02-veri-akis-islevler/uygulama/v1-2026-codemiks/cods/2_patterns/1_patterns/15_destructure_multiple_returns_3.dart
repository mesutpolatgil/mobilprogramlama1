void main() {
  final (:name, :age) =
      getData(); // Örneğin, return (name: 'doug', age: 25);
  print('$name $age');
}

({String name, int age}) getData() => (name: 'doug', age: 25);
