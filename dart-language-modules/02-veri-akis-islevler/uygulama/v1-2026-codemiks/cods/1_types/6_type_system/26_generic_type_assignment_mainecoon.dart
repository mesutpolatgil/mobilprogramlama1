import '../../_ortak/hayvanlar.dart';


void main() {
  List<MaineCoon> myMaineCoons = [MaineCoon(), MaineCoon()];
  List<Cat> myCats = myMaineCoons;
  print(myCats.length);
}
