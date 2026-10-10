void main() {
  Object? data = {
    'user': ['Lily', 13],
  };

  if (data case {'user': [String name, int age]}) {
    print('User $name is $age years old.');
  }
}
