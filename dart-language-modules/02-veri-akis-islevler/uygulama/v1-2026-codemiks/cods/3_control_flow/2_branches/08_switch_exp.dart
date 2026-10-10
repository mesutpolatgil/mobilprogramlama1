void main() {
  for (var charCode in '+;7'.codeUnits) {
    String token;
    token = switch (charCode) {
      slash || star || plus || minus => operator(charCode),
      comma || semicolon => punctuation(charCode),
      >= digit0 && <= digit9 => number(),
      _ => throw FormatException('Invalid'),
    };
    print(token);
  }
}

const slash = 0x2F, star = 0x2A, plus = 0x2B, minus = 0x2D;
const comma = 0x2C, semicolon = 0x3B;
const digit0 = 0x30, digit9 = 0x39;

String operator(int c) => 'operatör ${String.fromCharCode(c)}';
String punctuation(int c) => 'noktalama ${String.fromCharCode(c)}';
String number() => 'sayı';
