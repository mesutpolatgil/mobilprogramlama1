void main() {
  Object? data = {
    'user': ['Lily', 13],
  };

  if (data is Map<String, Object?> && data.containsKey('user')) {
    var user = data['user'];
    if (user is List<Object?> &&
        user.length == 2 &&
        user[0] is String &&
        user[1] is int) {
      var name = user[0] as String;
      var age = user[1] as int;
      print('User $name is $age years old.');
    }
  }
}
