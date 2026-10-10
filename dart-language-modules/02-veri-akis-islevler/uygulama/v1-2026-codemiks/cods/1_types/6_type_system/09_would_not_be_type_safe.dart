import '../../_ortak/hayvanlar.dart';


void main() {
  Animal a = Cat();
  a.chase(Alligator()); // Ne tip açısından ne de kedi açısından güvenli.
}
