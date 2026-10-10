void main() {
  try {
    breedMoreLlamas();
  } catch (e) {
    print('Error: $e'); // Önce istisnayı ele al.
  } finally {
    cleanLlamaStalls(); // Sonra temizlik yap.
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
