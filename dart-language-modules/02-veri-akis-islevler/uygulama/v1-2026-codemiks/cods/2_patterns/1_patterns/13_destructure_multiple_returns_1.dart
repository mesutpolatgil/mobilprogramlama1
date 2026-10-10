void main() {
  var json = <String, Object?>{'name': 'Dash', 'age': 10};
  var info = userInfo(json);
  var name = info.$1;
  var age = info.$2;
  print('$name $age');
}

(String, int) userInfo(Map<String, Object?> json) {
  return (json['name'] as String, json['age'] as int);
}
