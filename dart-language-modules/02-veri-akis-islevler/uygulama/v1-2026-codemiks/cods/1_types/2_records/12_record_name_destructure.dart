({String name, int age}) userInfo(Map<String, dynamic> json) {
  return (name: json['name'] as String, age: json['age'] as int);
}

void main() {
  final json = <String, dynamic>{'name': 'Dash', 'age': 10};
  // İsimli alanlı bir record deseniyle ayrıştırır:
  final (:name, :age) = userInfo(json);
  print('$name $age');
}
