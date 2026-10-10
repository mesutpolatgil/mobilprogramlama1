import '../../_ortak/hayvanlar.dart';


void main() {
  List<Animal> myAnimals = <Cat>[Cat(), MaineCoon()];
  List<Cat> myCats = myAnimals as List<Cat>;
  print(myCats.length);
}
