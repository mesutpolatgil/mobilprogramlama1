void main() {
  try {
    breedMoreLlamas();
  } on OutOfLlamasException {
    // Belirli bir istisna
    buyMoreLlamas();
  } on Exception catch (e) {
    // İstisna olan diğer her şey
    print('Unknown exception: $e');
  } catch (e) {
    // Tip belirtilmemiş, hepsini yakalar
    print('Something really unknown: $e');
  }
}

class OutOfLlamasException implements Exception {}

var llamas = 0;

void breedMoreLlamas() {
  if (llamas == 0) throw OutOfLlamasException();
  llamas++;
}

void buyMoreLlamas() {
  llamas += 2;
  print('Lama satın alındı: $llamas');
}

void cleanLlamaStalls() => print('Ahırlar temizlendi.');
