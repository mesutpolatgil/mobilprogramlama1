class A<X extends A<X>> {}

class B extends A<B> {}

class C extends B {}

void f<X extends A<X>>(X x) {}

void main() {
  f(B()); // Sorun yok.

  // Sorun yok. Sınırlar kullanılmadan, en iyi tahmine dayanan çıkarım
  // `C`'nin `A<C>`'nin alt tipi olmadığını gördükten sonra başarısız olurdu.
  f(C());

  f<B>(C()); // Sorun yok.
}
