void main() {
  var charCodes = [68, 97, 114, 116];
  var buffer = StringBuffer();

  // Fonksiyon tear-off'u
  charCodes.forEach(print);

  // Metot tear-off'u
  charCodes.forEach(buffer.write);

  print(buffer);
}
