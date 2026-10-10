void main() {
  for (var charCode in '+;7a'.codeUnits) {
    String token;
    // Burada slash, star, comma, semicolon vb. sabit değişkenlerdir...
    switch (charCode) {
      case slash || star || plus || minus: // Mantıksal-veya deseni
        token = operator(charCode);
      case comma || semicolon: // Mantıksal-veya deseni
        token = punctuation(charCode);
      case >= digit0 && <= digit9: // İlişkisel ve mantıksal-ve desenleri
        token = number();
      default:
        print('${String.fromCharCode(charCode)}: Invalid');
        continue;
    }
    print(token);
  }
}

const slash = 0x2F, star = 0x2A, plus = 0x2B, minus = 0x2D;
const comma = 0x2C, semicolon = 0x3B;
const digit0 = 0x30, digit9 = 0x39;

String operator(int c) => 'operatör ${String.fromCharCode(c)}';
String punctuation(int c) => 'noktalama ${String.fromCharCode(c)}';
String number() => 'sayı';
