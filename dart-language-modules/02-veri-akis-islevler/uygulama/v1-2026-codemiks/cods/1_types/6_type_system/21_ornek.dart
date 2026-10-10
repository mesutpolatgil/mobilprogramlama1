// Not: Bu örnek bilerek statik analiz hatası verir (myInt.whatever).


(X, Y) f<X extends Iterable<Y>, Y>(X x) => (x, x.first);

void main() {
  var (myList, myInt) = f([1]);
  myInt.whatever; // Derleme zamanı hatası, `myInt`'in tipi `int`.

  var (mySet, myString) = f({'Hello!'});
  mySet.union({}); // Çalışır, `mySet`'in tipi `Set<String>`.
}
