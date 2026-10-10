void main() {
  var json = <String, Object?>{'name': 'Dash', 'age': 10};
  var (name, age) = userInfo(json);
  print('$name $age');
}

(String, int) userInfo(Map<String, Object?> json) {
  return (json['name'] as String, json['age'] as int);
}
