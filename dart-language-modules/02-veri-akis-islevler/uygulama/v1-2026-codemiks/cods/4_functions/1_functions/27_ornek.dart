void foo() {} // Üst düzey bir fonksiyon

class A {
  static void bar() {} // Statik bir metot
  void baz() {} // Bir örnek (instance) metodu
}

void main() {
  Function x;

  // Üst düzey fonksiyonları karşılaştırma.
  x = foo;
  assert(foo == x);

  // Statik metotları karşılaştırma.
  x = A.bar;
  assert(A.bar == x);

  // Örnek metotlarını karşılaştırma.
  var v = A(); // A'nın 1. örneği
  var w = A(); // A'nın 2. örneği
  var y = w;
  x = w.baz;

  // Bu closure'lar aynı örneğe (#2) başvurur,
  // bu yüzden eşittirler.
  assert(y.baz == x);

  // Bu closure'lar farklı örneklere başvurur,
  // bu yüzden eşit değildirler.
  assert(v.baz != w.baz);
}
