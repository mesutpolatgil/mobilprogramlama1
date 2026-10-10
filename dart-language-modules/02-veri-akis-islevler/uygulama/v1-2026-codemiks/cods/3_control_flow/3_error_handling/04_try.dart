void main() {
  try {
    breedMoreLlamas();
  } on OutOfLlamasException {
    buyMoreLlamas();
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
