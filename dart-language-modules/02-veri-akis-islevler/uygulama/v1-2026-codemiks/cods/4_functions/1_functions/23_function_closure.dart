/// Fonksiyonun argümanına [addBy] ekleyen
/// bir fonksiyon döndürür.
Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

void main() {
  // 2 ekleyen bir fonksiyon oluştur.
  var add2 = makeAdder(2);

  // 4 ekleyen bir fonksiyon oluştur.
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);
}
