T first<T>(List<T> ts) {
  // Biraz ön hazırlık ya da hata kontrolü yap, sonra...
  T tmp = ts[0];
  // Ek kontrol ya da işlem yap...
  return tmp;
}

void main() {
  print(first<String>(['a', 'b']));
}
