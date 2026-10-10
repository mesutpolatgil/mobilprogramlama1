void main() {
  // Bir record içinde birden çok değer döndürür:
  (String name, int age) userInfo(Map<String, dynamic> json) {
    return (json['name'] as String, json['age'] as int);
  }

  final json = <String, dynamic>{'name': 'Dash', 'age': 10, 'color': 'blue'};

  // Konumsal alanlı bir record deseniyle ayrıştırır:
  var (name, age) = userInfo(json);

  /* Şuna denktir:
    var info = userInfo(json);
    var name = info.$1;
    var age  = info.$2;
  */
}
