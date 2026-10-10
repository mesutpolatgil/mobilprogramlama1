void main() {
  if (isRaining()) {
    you.bringRainCoat();
  } else if (isSnowing()) {
    you.wearJacket();
  } else {
    car.putTopDown();
  }
}

bool isRaining() => false;
bool isSnowing() => true;

class Person {
  void bringRainCoat() => print('Yağmurluk alındı.');
  void wearJacket() => print('Mont giyildi.');
}

class Car {
  void putTopDown() => print('Tavan açıldı.');
}

final you = Person();
final car = Car();
