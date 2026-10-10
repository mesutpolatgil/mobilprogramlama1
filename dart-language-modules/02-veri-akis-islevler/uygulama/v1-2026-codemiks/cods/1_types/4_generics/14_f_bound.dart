abstract interface class Comparable<T> {
  int compareTo(T o);
}

int compareAndOffset<T extends Comparable<T>>(T t1, T t2) =>
    t1.compareTo(t2) + 1;

class A implements Comparable<A> {
  @override
  int compareTo(A other) => /*...uygulama...*/ 0;
}

int useIt = compareAndOffset(A(), A());

void main() {
  print(useIt);
}
