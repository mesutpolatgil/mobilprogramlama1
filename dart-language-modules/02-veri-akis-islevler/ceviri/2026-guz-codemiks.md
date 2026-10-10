> **Uyarı:** Bu içerik, SCÜ Şarkışla UBYO Mobil Programlama I dersi kapsamında tamamen eğitim amaçlı çevrilmiş ve derlenmiştir. Orijinal dokümantasyon kaynakları (dart.dev, docs.flutter.dev) kendi orijinal lisanslarına (BSD-3-Clause, CC-BY 4.0) tabidir. Bu çalışmanın hiçbir ticari amacı yoktur.

# Dart Dil Rehberi: Veri, Akış ve İşlevler

**Mobil Programlama I · 2. Takım (codemiks)** · Konu: Types, Patterns, Control flow, Functions

Bu belge, [dart.dev](https://dart.dev/language) dokümantasyonunun ilgili bölümlerinin Türkçe çevirisidir. Kod örneklerinin çalıştırılabilir halleri `uygulama/v1-2026-codemiks/cods/` klasöründedir.

## İçindekiler

- **Tipler** (Types)
  - Yerleşik tipler
  - Record'lar
  - Koleksiyonlar
  - Generic'ler
  - Typedef'ler
  - Dart tip sistemi
- **Desenler** (Patterns)
  - Desenler
  - Desen tipleri
- **Kontrol akışı** (Control flow)
  - Döngüler
  - Dallanmalar
  - Hata yönetimi
- **Fonksiyonlar** (Functions)
  - Fonksiyonlar

---

# Tipler (Types)

## Yerleşik tipler

*Dart'ın desteklediği tipler hakkında bilgi.* · Kaynak: <https://dart.dev/language/built-in-types>

Dart dili aşağıdakiler için özel destek sunar:

- [Sayılar](https://dart.dev/language/built-in-types#numbers) (`int`, `double`)
- [String'ler](https://dart.dev/language/built-in-types#strings) (`String`)
- [Boolean'lar](https://dart.dev/language/built-in-types#booleans) (`bool`)
- [Record'lar](https://dart.dev/language/records) (`(value1, value2)`)
- [Fonksiyonlar](https://dart.dev/language/functions#function-types) (`Function`)
- [Listeler](https://dart.dev/language/collections#lists) (`List`, *dizi (array)* olarak da bilinir)
- [Set'ler](https://dart.dev/language/collections#sets) (`Set`)
- [Map'ler](https://dart.dev/language/collections#maps) (`Map`)
- [Rune'lar](https://dart.dev/language/built-in-types#runes-and-grapheme-clusters) (`Runes`; çoğunlukla `characters`
  API'si ile değiştirilir)
- [Sembol'ler](https://dart.dev/language/built-in-types#symbols) (`Symbol`)
- `null` değeri (`Null`)

Bu destek, literal'ler kullanarak nesne oluşturabilmeyi de kapsar.
Örneğin `'this is a string'` bir string literal'idir,
`true` ise bir boolean literal'idir.

Dart'ta her değişken bir nesneye (bir *sınıfın (class)* örneğine) başvurduğu için
değişkenleri genellikle *yapıcılar (constructor)* ile başlatabilirsiniz. Yerleşik tiplerin
bazılarının kendi yapıcıları vardır. Örneğin bir map oluşturmak için
`Map()` yapıcısını kullanabilirsiniz.

Bazı başka tiplerin de Dart dilinde özel rolleri vardır:

- `Object`: `Null` dışındaki tüm Dart sınıflarının üst sınıfı (superclass).
- `Enum`: Tüm enum'ların üst sınıfı.
- `Future` ve `Stream`: [Asenkron programlamada](https://dart.dev/language/async) kullanılır.
- `Iterable`: [for-in döngülerinde](https://dart.dev/libraries/dart-core#iteration) ve
  senkron [üreteç (generator) fonksiyonlarında](https://dart.dev/language/functions#generators) kullanılır.
- `Never`: Bir ifadenin değerlendirilmesinin asla başarıyla
  tamamlanamayacağını belirtir.
  Çoğunlukla her zaman istisna fırlatan fonksiyonlarda kullanılır.
- `dynamic`: Statik kontrolü kapatmak istediğinizi belirtir.
  Genellikle bunun yerine `Object` ya da `Object?` kullanmalısınız.
- `void`: Bir değerin hiçbir zaman kullanılmadığını belirtir.
  Çoğunlukla dönüş tipi olarak kullanılır.

`Object`, `Object?`, `Null` ve `Never` sınıflarının
sınıf hiyerarşisinde özel rolleri vardır.
Bu roller hakkında bilgi için [Understanding null safety](https://dart.dev/null-safety/understanding-null-safety#top-and-bottom) sayfasına bakın.

### Sayılar

Dart'ta sayılar iki çeşittir:

**[`int`](https://api.dart.dev/dart-core/int-class.html)**

[Platforma bağlı olarak](https://dart.dev/resources/language/number-representation)
64 biti aşmayan tam sayı değerleri.
Yerel (native) platformlarda değerler
-2<sup>63</sup> ile 2<sup>63</sup> - 1 arasında olabilir.
Web'de tam sayılar JavaScript sayıları
(kesirli kısmı olmayan 64 bit kayan noktalı değerler)
olarak temsil edilir ve -2<sup>53</sup> ile 2<sup>53</sup> - 1 arasında olabilir.

**[`double`](https://api.dart.dev/dart-core/double-class.html)**

IEEE 754 standardında tanımlandığı şekliyle 64 bit (çift duyarlıklı)
kayan noktalı sayılar.

`int` ve `double`, [`num`](https://api.dart.dev/dart-core/num-class.html) tipinin alt tipleridir.
num tipi +, -, / ve * gibi temel operatörleri içerir;
`abs()`, `ceil()` ve `floor()`
gibi metotlar da burada bulunur.
(>> gibi bit düzeyi operatörler `int` sınıfında tanımlıdır.)
Aradığınız şey num ve alt tiplerinde yoksa
[`dart:math`](https://api.dart.dev/dart-math/dart-math-library.html)
kütüphanesinde olabilir.

Tam sayılar ondalık noktası olmayan sayılardır. Tam sayı literal'i
tanımlamaya birkaç örnek:

```dart
var x = 1;
var hex = 0xDEADBEEF;
```

Bir sayı ondalık nokta içeriyorsa double'dır. Double literal'i
tanımlamaya birkaç örnek:

```dart
var y = 1.1;
var exponents = 1.42e5;
```

Bir değişkeni num olarak da tanımlayabilirsiniz. Bu durumda değişken
hem tam sayı hem de double değer alabilir.

```dart
num x = 1; // x hem int hem de double değer alabilir
x += 2.5;
```

Tam sayı literal'leri gerektiğinde otomatik olarak double'a çevrilir:

```dart
double z = 1; // double z = 1.0 ile aynıdır.
```

Bir string'i sayıya çevirmek ya da tersini yapmak şöyle olur:

```dart
// String -> int
var one = int.parse('1');
assert(one == 1);

// String -> double
var onePointOne = double.parse('1.1');
assert(onePointOne == 1.1);

// int -> String
String oneAsString = 1.toString();
assert(oneAsString == '1');

// double -> String
String piAsString = 3.14159.toStringAsFixed(2);
assert(piAsString == '3.14');
```

`int` tipi geleneksel bit kaydırma (`<<`, `>>`,
`>>>`),
tümleyen (`~`), AND (`&`), OR (`|`) ve XOR (`^`) operatörlerini tanımlar.
Bunlar bit alanlarındaki bayrakları değiştirmek ve maskelemek için kullanışlıdır.
Örneğin:

```dart
assert((3 << 1) == 6); // 0011 << 1 == 0110
assert((3 | 4) == 7); // 0011 | 0100 == 0111
assert((3 & 4) == 0); // 0011 & 0100 == 0000
```

Daha fazla örnek için
[bit düzeyi ve kaydırma operatörleri](https://dart.dev/language/operators#bitwise-and-shift-operators)
bölümüne bakın.

Sayı literal'leri derleme zamanı sabitleridir (compile-time constant).
Birçok aritmetik ifade de, işlenenleri sayı sonucu veren
derleme zamanı sabitleri olduğu sürece
derleme zamanı sabitidir.

```dart
const msPerSecond = 1000;
const secondsUntilRetry = 5;
const msUntilRetry = secondsUntilRetry * msPerSecond;
```

Daha fazla bilgi için [Numbers in Dart](https://dart.dev/resources/language/number-representation) sayfasına bakın.

Uzun sayı literal'lerini daha okunur hale getirmek için
bir ya da daha fazla alt çizgiyi (`_`) basamak ayırıcı olarak kullanabilirsiniz.
Birden fazla basamak ayırıcı, daha üst düzey gruplamaya izin verir.

```dart
var n1 = 1_000_000;
var n2 = 0.000_000_000_01;
var n3 = 0x00_14_22_01_23_45; // MAC adresi
var n4 = 555_123_4567; // ABD telefon numarası
var n5 = 100__000_000__000_000; // yüz milyon milyon!
```

> **Sürüm notu:**
>
> Basamak ayırıcıları kullanmak en az 3.6 [dil sürümü](https://dart.dev/language/versioning) gerektirir.

### String'ler

Bir Dart string'i (`String` nesnesi) UTF-16 kod birimlerinden oluşan bir dizi tutar.
String oluşturmak için
tek ya da çift tırnak kullanabilirsiniz:

```dart
var s1 = 'Single quotes work well for string literals.';
var s2 = "Double quotes work just as well.";
var s3 = 'It\'s easy to escape the string delimiter.';
var s4 = "It's even easier to use the other delimiter.";
```

Bir ifadenin değerini string içine
`${`*`ifade`*`}` şeklinde yerleştirebilirsiniz. İfade bir tanımlayıcıysa
`{}` kısmını atlayabilirsiniz. Bir nesneye karşılık gelen string'i elde etmek için Dart,
nesnenin `toString()` metodunu çağırır.

```dart
var s = 'string interpolation';

assert(
  'Dart has $s, which is very handy.' ==
      'Dart has string interpolation, '
          'which is very handy.',
);
assert(
  'That deserves all caps. '
          '${s.toUpperCase()} is very handy!' ==
      'That deserves all caps. '
          'STRING INTERPOLATION is very handy!',
);
```

> **Not:**
>
> `==` operatörü iki nesnenin eşdeğer olup olmadığını test eder.
> İki string aynı kod birimi dizisini içeriyorsa
> eşdeğerdir.

String'leri yan yana yazılmış string literal'leriyle ya da `+`
operatörüyle birleştirebilirsiniz:

```dart
var s1 =
    'String '
    'concatenation'
    " works even over line breaks.";
assert(
  s1 ==
      'String concatenation works even over '
          'line breaks.',
);

var s2 = 'The + operator ' + 'works, as well.';
assert(s2 == 'The + operator works, as well.');
```

Çok satırlı bir string oluşturmak için
tek ya da çift tırnakla üçlü tırnak kullanın:

```dart
var s1 = '''
You can create
multi-line strings like this one.
''';

var s2 = """This is also a
multi-line string.""";
```

Başına `r` ekleyerek "ham" (raw) bir string oluşturabilirsiniz:

```dart
var s = r'In a raw string, not even \n gets special treatment.';
```

Bir string içinde Unicode karakterlerin nasıl ifade edileceği için
[Rune'lar ve grafem kümeleri](https://dart.dev/language/built-in-types#runes-and-grapheme-clusters) bölümüne bakın.

String literal'leri, içine yerleştirilen her ifade
null ya da sayı, string veya boolean değer veren bir derleme zamanı sabiti olduğu sürece
derleme zamanı sabitidir.

```dart
// Bunlar const bir string içinde çalışır.
const aConstNum = 0;
const aConstBool = true;
const aConstString = 'a constant string';

// Bunlar const bir string içinde ÇALIŞMAZ.
var aNum = 0;
var aBool = true;
var aString = 'a string';
const aConstList = [1, 2, 3];

const validConstString = '$aConstNum $aConstBool $aConstString';
// const invalidConstString = '$aNum $aBool $aString $aConstList';
```

String kullanımı hakkında daha fazla bilgi için
[Strings and regular expressions](https://dart.dev/libraries/dart-core#strings-and-regular-expressions) sayfasına göz atın.

### Boolean'lar

Dart'ta boolean değerleri temsil etmek için `bool` adlı bir tip vardır. Yalnızca iki
nesne bool tipindedir: `true` ve `false` boolean literal'leri.
İkisi de derleme zamanı sabitidir.

Dart'ın tip güvenliği nedeniyle
`if (booleanOlmayanDeger)` ya da
`assert (booleanOlmayanDeger)` gibi kodlar yazamazsınız.
Bunun yerine değerleri şu şekilde açıkça kontrol edin:

```dart
// Boş string kontrolü.
var fullName = '';
assert(fullName.isEmpty);

// Sıfır kontrolü.
var hitPoints = 0;
assert(hitPoints == 0);

// null kontrolü.
var unicorn = null;
assert(unicorn == null);

// NaN kontrolü.
var iMeantToDoThis = 0 / 0;
assert(iMeantToDoThis.isNaN);
```

### Rune'lar ve grafem kümeleri

Dart'ta [rune'lar](https://api.dart.dev/dart-core/Runes-class.html) bir string'in Unicode kod noktalarını sunar.
Kullanıcının algıladığı karakterleri, yani
[Unicode (genişletilmiş) grafem kümelerini (grapheme cluster)](https://unicode.org/reports/tr29/#Grapheme_Cluster_Boundaries)
görüntülemek ya da değiştirmek için
[characters paketini](https://pub.dev/packages/characters) kullanabilirsiniz.

Unicode, dünyadaki tüm yazı sistemlerinde kullanılan her harf, rakam
ve sembol için benzersiz bir sayısal değer tanımlar.
Dart string'i UTF-16 kod birimlerinden oluşan bir dizi olduğundan,
bir string içinde Unicode kod noktalarını ifade etmek
özel bir sözdizimi gerektirir.
Bir Unicode kod noktasını ifade etmenin olağan yolu
`\uXXXX` biçimidir; burada XXXX 4 basamaklı onaltılık (hex) bir değerdir.
Örneğin kalp karakteri (♥) `♥` şeklinde yazılır.
4'ten fazla ya da az onaltılık basamak belirtmek için
değeri süslü parantez içine alın.
Örneğin gülen emoji (😆) `\u{1f606}` şeklinde yazılır.

Tek tek Unicode karakterleri okumanız ya da yazmanız gerekiyorsa
characters paketinin String üzerinde tanımladığı
`characters` getter'ını kullanın.
Dönen [`Characters`](https://pub.dev/documentation/characters/latest/characters/Characters-class.html)
nesnesi, string'in grafem kümelerinden
oluşan bir dizi halidir.
characters API'sinin kullanımına bir örnek:

```dart
import 'package:characters/characters.dart';

void main() {
  var hi = 'Hi 🇩🇰';
  print(hi);
  print('The end of the string: ${hi.substring(hi.length - 1)}');
  print('The last character: ${hi.characters.last}');
}
```

Çıktı, ortamınıza bağlı olarak aşağı yukarı şöyle görünür:

```console
$ dart run bin/main.dart
Hi 🇩🇰
The end of the string: ???
The last character: 🇩🇰
```

characters paketiyle string'leri işleme hakkında ayrıntılar için
paketin [örneğine](https://pub.dev/packages/characters/example) ve [API referansına](https://pub.dev/documentation/characters)
bakın.

### Sembol'ler

Bir [`Symbol`](https://api.dart.dev/dart-core/Symbol-class.html) nesnesi,
bir Dart programında tanımlanmış bir operatörü ya da tanımlayıcıyı temsil eder.
Sembol kullanmanız hiç gerekmeyebilir; ancak tanımlayıcılara isimleriyle başvuran
API'ler için çok değerlidirler, çünkü küçültme (minification) tanımlayıcı isimlerini
değiştirir ama tanımlayıcı sembollerini değiştirmez.

Bir tanımlayıcının sembolünü almak için bir sembol literal'i kullanın. Bu, tanımlayıcının
önüne `#` koymaktan ibarettir:

```text
#radix
#bar
```

Sembol literal'leri derleme zamanı sabitleridir.


## Record'lar

*Dart'taki record veri yapısının özeti.* · Kaynak: <https://dart.dev/language/records>

> **Sürüm notu:**
>
> Record'lar en az 3.0 [dil sürümü](https://dart.dev/language/versioning) gerektirir.

Record'lar anonim, değiştirilemez (immutable), birleşik bir tiptir. Diğer [koleksiyon tipleri](https://dart.dev/language/collections) gibi
birden fazla nesneyi tek bir nesnede toplamanızı sağlarlar. Diğer koleksiyon
tiplerinden farklı olarak record'lar sabit boyutlu, heterojen ve tiplidir.

Record'lar gerçek değerlerdir; onları değişkenlerde saklayabilir,
iç içe kullanabilir, fonksiyonlara geçirip fonksiyonlardan döndürebilir
ve list, map, set gibi veri yapılarında saklayabilirsiniz.

### Record sözdizimi

*Record ifadeleri*, parantez içine alınmış, virgülle ayrılmış
isimli ya da konumsal (positional) alan listeleridir:

```dart
var record = ('first', a: 2, b: true, 'last');
```

*Record tip belirtimleri* (type annotation), parantez içine alınmış, virgülle ayrılmış tip listeleridir.
Record tip belirtimlerini dönüş tiplerini ve parametre tiplerini tanımlamak için kullanabilirsiniz.
Örneğin aşağıdaki `(int, int)` ifadeleri record tip belirtimleridir:

```dart
(int, int) swap((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
```

Record ifadelerindeki ve tip belirtimlerindeki alanlar,
fonksiyonlardaki [parametre ve argümanların](https://dart.dev/language/functions#parameters) işleyişini yansıtır.
Konumsal alanlar doğrudan parantezin içine yazılır:

```dart
// Değişken tanımında record tipi belirtimi:
(String, int) record;

// Bir record ifadesiyle başlat:
record = ('A string', 123);
```

Bir record tip belirtiminde isimli alanlar, tüm konumsal alanlardan sonra,
süslü parantezle ayrılmış tip-isim çiftlerinden oluşan bir bölüme yazılır. Bir record
ifadesinde ise isimler her alan değerinden önce, ardından iki nokta gelecek şekilde yazılır:

```dart
// Değişken tanımında record tipi belirtimi:
({int a, bool b}) record;

// Bir record ifadesiyle başlat:
record = (a: 123, b: true);
```

Bir record tipindeki isimli alanların isimleri,
[record'un tip tanımının](https://dart.dev/language/records#record-types), yani *şeklinin (shape)* bir parçasıdır.
İsimli alanlarının isimleri
farklı olan iki record farklı tiptedir:

```dart
({int a, int b}) recordAB = (a: 1, b: 2);
({int x, int y}) recordXY = (x: 3, y: 4);

// Derleme hatası! Bu record'lar aynı tipte değil.
// recordAB = recordXY;
```

Bir record tip belirtiminde *konumsal* alanlara da isim verebilirsiniz; ancak
bu isimler yalnızca belgeleme amaçlıdır ve record'un tipini etkilemez:

```dart
(int a, int b) recordAB = (1, 2);
(int x, int y) recordXY = (3, 4);

recordAB = recordXY; // Sorun yok.
```

Bu, bir [fonksiyon tanımında ya da fonksiyon typedef'inde](https://dart.dev/language/functions#function-types)
konumsal parametrelerin isimleri olabilmesine,
ama bu isimlerin fonksiyonun imzasını etkilememesine benzer.

Daha fazla bilgi ve örnek için
[Record tipleri](https://dart.dev/language/records#record-types) ve [Record eşitliği](https://dart.dev/language/records#record-equality) bölümlerine göz atın.

### Record alanları

Record alanlarına yerleşik getter'lar üzerinden erişilir. Record'lar değiştirilemez
olduğu için alanların setter'ı yoktur.

İsimli alanlar aynı isimde getter'lar sunar. Konumsal alanlar ise isimli alanlar atlanarak
`$<konum>` isimli getter'lar sunar:

```dart
var record = ('first', a: 2, b: true, 'last');

print(record.$1); // 'first' yazdırır
print(record.a); // 2 yazdırır
print(record.b); // true yazdırır
print(record.$2); // 'last' yazdırır
```

Record alanlarına erişimi daha da kolaylaştırmak için
[Desenler](https://dart.dev/language/patterns#destructuring-multiple-returns) sayfasına göz atın.

### Record tipleri

Tek tek record tipleri için bir tip tanımı yoktur.
Record'lar alanlarının tiplerine göre yapısal olarak tiplendirilir.
Bir record'un *şekli* (alanlarının kümesi, alanların tipleri
ve varsa isimleri) record'un tipini benzersiz şekilde belirler.

Bir record'daki her alanın kendi tipi vardır. Aynı record içinde alan tipleri
farklı olabilir. Tip sistemi, record'dan hangi noktada erişilirse erişilsin
her alanın tipini bilir:

```dart
(num, Object) pair = (42, 'a');

var first = pair.$1; // Statik tip `num`, çalışma zamanı tipi `int`.
var second = pair.$2; // Statik tip `Object`, çalışma zamanı tipi `String`.
```

Aynı alan kümesine sahip record'lar oluşturan, birbiriyle ilgisiz iki kütüphane düşünün.
Kütüphaneler birbirine bağlı olmasa da tip sistemi
bu record'ların aynı tipte olduğunu anlar.

> **İpucu:**
>
> Bir record şekli için benzersiz bir tip tanımlayamasanız da
> okunabilirlik ve yeniden kullanım için tip takma adları (type alias) oluşturabilirsiniz.
> Bunu nasıl ve ne zaman yapacağınızı öğrenmek için
> [Record'lar ve typedef'ler](https://dart.dev/language/records#records-and-typedefs) bölümüne göz atın.

### Record eşitliği

İki record aynı *şekle* (alan kümesine) sahipse
ve karşılık gelen alanları aynı değerleri taşıyorsa eşittir.
İsimli alanların *sırası* record'un şeklinin bir parçası olmadığından, isimli
alanların sırası eşitliği etkilemez.

Örneğin:

```dart
(int x, int y, int z) point = (1, 2, 3);
(int r, int g, int b) color = (1, 2, 3);

print(point == color); // 'true' yazdırır.
```

```dart
({int x, int y, int z}) point = (x: 1, y: 2, z: 3);
({int r, int g, int b}) color = (r: 1, g: 2, b: 3);

print(point == color); // 'false' yazdırır. Lint: İlgisiz tipler üzerinde eşitlik.
```

Record'lar, alanlarının yapısına göre `hashCode` ve `==` metotlarını
otomatik olarak tanımlar.

### Birden çok değer döndürme

Record'lar, fonksiyonların bir arada paketlenmiş birden çok değer döndürmesini sağlar.
Dönen record'daki değerleri almak için
[desen eşleştirme](https://dart.dev/language/patterns#destructuring-multiple-returns) ile
değerleri yerel değişkenlere [ayrıştırın (destructure)](https://dart.dev/language/patterns#destructuring).

```dart
// Bir record içinde birden çok değer döndürür:
(String name, int age) userInfo(Map<String, dynamic> json) {
  return (json['name'] as String, json['age'] as int);
}

final json = <String, dynamic>{'name': 'Dash', 'age': 10, 'color': 'blue'};

// Konumsal alanlı bir record deseniyle ayrıştırır:
var (name, age) = userInfo(json);

/* Şuna denktir:
  var info = userInfo(json);
  var name = info.$1;
  var age  = info.$2;
*/
```

Bir record'u [isimli alanlarını](https://dart.dev/language/records#record-fields) kullanarak,
iki nokta `:` sözdizimiyle de ayrıştırabilirsiniz. Bu konuyu
[Desen tipleri](https://dart.dev/language/pattern-types#record) sayfasında daha ayrıntılı okuyabilirsiniz:

```dart
({String name, int age}) userInfo(Map<String, dynamic> json)
// ···
// İsimli alanlı bir record deseniyle ayrıştırır:
final (:name, :age) = userInfo(json);
```

Bir fonksiyondan record olmadan da birden çok değer döndürebilirsiniz,
ancak diğer yöntemlerin dezavantajları vardır.
Örneğin bir sınıf oluşturmak çok daha uzun sürer; `List` ya da `Map`
gibi diğer koleksiyon tiplerini kullanmak ise tip güvenliğini kaybettirir.

> **Not:**
>
> Record'ların birden çok değer döndürme ve heterojen tip özellikleri,
> farklı tipteki future'ların paralel çalıştırılmasını mümkün kılar. Bunu
> [`dart:async` dokümantasyonunda](https://dart.dev/libraries/dart-async#handling-errors-for-multiple-futures) okuyabilirsiniz.

### Basit veri yapıları olarak record'lar

Record'lar yalnızca veri tutar. İhtiyacınız sadece buysa,
yeni bir sınıf tanımlamaya gerek kalmadan
hemen kullanıma hazırdırlar ve kullanımları kolaydır.
Hepsi aynı şekle sahip veri demetlerinden (tuple) oluşan basit bir liste için
*record listesi* en doğrudan temsildir.

Örneğin şu "buton tanımları" listesini ele alalım:

```dart
final buttons = [
  (
    label: "Button I",
    icon: const Icon(Icons.upload_file),
    onPressed: () => print("Action -> Button I"),
  ),
  (
    label: "Button II",
    icon: const Icon(Icons.info),
    onPressed: () => print("Action -> Button II"),
  )
];
```

Bu kod, ek bir tanıma ihtiyaç duymadan doğrudan yazılabilir.

#### Record'lar ve typedef'ler

Record tipinin kendisine bir isim vermek için [typedef](https://dart.dev/language/typedefs) kullanmayı seçebilir
ve tam record tipini yazmak yerine bu ismi kullanabilirsiniz.
Bu yöntem, listedeki mevcut girdilerin hiçbirinde null değer olmasa bile
bazı alanların null olabileceğini (`?`) belirtmenize olanak tanır.

```dart
typedef ButtonItem = ({String label, Icon icon, void Function()? onPressed});
final List<ButtonItem> buttons = [
  // ...
];
```

Record tipleri yapısal tipler olduğundan, `ButtonItem` gibi bir isim vermek
yalnızca yapısal tipe başvurmayı kolaylaştıran bir takma ad oluşturur:
`({String label, Icon icon, void Function()? onPressed})`.

Tüm kodunuzun record tipine takma adıyla başvurması, ileride record'un
uygulamasını her başvuruyu güncellemeye gerek kalmadan değiştirmeyi kolaylaştırır.

Kod, verilen buton tanımlarıyla basit sınıf örnekleriyle
çalışır gibi çalışabilir:

```dart
List<Container> widget = [
  for (var button in buttons)
    Container(
      margin: const EdgeInsets.all(4.0),
      child: OutlinedButton.icon(
        onPressed: button.onPressed,
        icon: button.icon,
        label: Text(button.label),
      ),
    ),
];
```

Hatta ileride metot eklemek için record tipini bir sınıf tipine çevirmeye bile karar verebilirsiniz:

```dart
class ButtonItem {
  final String label;
  final Icon icon;
  final void Function()? onPressed;
  ButtonItem({required this.label, required this.icon, this.onPressed});
  bool get hasOnPressed => onPressed != null;
}
```

Ya da bir [extension type'a](https://dart.dev/language/extension-types):

```dart
extension type ButtonItem._(({String label, Icon icon, void Function()? onPressed}) _) {
  String get label => _.label;
  Icon get icon => _.icon;
  void Function()? get onPressed => _.onPressed;
  ButtonItem({required String label, required Icon icon, void Function()? onPressed})
      : this._((label: label, icon: icon, onPressed: onPressed));
  bool get hasOnPressed => _.onPressed != null;
}
```

Ve ardından buton tanımları listesini o tipin yapıcılarını kullanarak oluşturabilirsiniz:

```dart
final List<ButtonItem> buttons =  [
  ButtonItem(
    label: "Button I",
    icon: const Icon(Icons.upload_file),
    onPressed: () => print("Action -> Button I"),
  ),
  ButtonItem(
    label: "Button II",
    icon: const Icon(Icons.info),
    onPressed: () => print("Action -> Button II"),
  )
];
```

Bunların hepsi, yine o listeyi kullanan kodu değiştirmeye gerek kalmadan yapılır.

Bir tipi değiştirmek, onu kullanan kodun varsayımlarda bulunmamaya
çok dikkat etmesini gerektirir. Bir tip takma adı, onu başvuru olarak kullanan kod için
takma adı verilen değerin bir record olduğuna dair hiçbir koruma ya da garanti sunmaz.
Extension type'lar da çok az koruma sunar.
Tam soyutlama ve kapsüllemeyi yalnızca bir sınıf sağlayabilir.


## Koleksiyonlar

*Dart'taki farklı koleksiyon tiplerinin özeti.* · Kaynak: <https://dart.dev/language/collections>

Dart'ta list, set ve map [koleksiyonları](https://dart.dev/libraries/dart-core#collections) için yerleşik destek vardır.
Koleksiyonların içerdiği tipleri ayarlamak hakkında daha fazla bilgi için
[Generic'ler](https://dart.dev/language/generics) sayfasına göz atın.

### Listeler

Neredeyse her programlama dilinde belki de en yaygın koleksiyon
*dizi (array)*, yani sıralı nesne grubudur. Dart'ta diziler
[`List`](https://api.dart.dev/dart-core/List-class.html) nesneleridir, bu yüzden çoğu kişi onlara kısaca
*liste* der.

Dart list literal'leri, köşeli parantez (`[]`) içine alınmış,
virgülle ayrılmış elemanlardan oluşur. Her eleman
genellikle bir ifadedir. İşte basit bir Dart listesi:

```dart
var list = [1, 2, 3];
```

> **Not:**
>
> Dart, `list`'in tipini `List<int>` olarak çıkarır. Bu listeye tam sayı olmayan
> nesneler eklemeye çalışırsanız analizci ya da çalışma zamanı hata verir. Daha fazla
> bilgi için [tip çıkarımı](https://dart.dev/language/type-system#type-inference) konusunu okuyun.

Bir Dart koleksiyon literal'inde son elemandan sonra virgül koyabilirsiniz.
Bu *sondaki virgül (trailing comma)* koleksiyonu etkilemez,
ancak kopyala-yapıştır hatalarını önlemeye yardımcı olabilir.

```dart
var list = ['Car', 'Boat', 'Plane',];
```

Listelerde indeksleme sıfırdan başlar: 0 ilk elemanın indeksi,
`list.length - 1` ise son elemanın indeksidir.
Bir listenin uzunluğunu `.length` özelliğiyle alabilir,
elemanlarına da indis operatörüyle (`[]`) erişebilirsiniz:

```dart
var list = [1, 2, 3];
assert(list.length == 3);
assert(list[1] == 2);

list[1] = 1;
assert(list[1] == 1);
```

Derleme zamanı sabiti olan bir liste oluşturmak için
list literal'inin önüne `const` ekleyin:

```dart
var constantList = const [1, 2, 3];
// constantList[1] = 1; // Bu satır hataya yol açar.
```

Listeler hakkında daha fazla bilgi için
[`dart:core` dokümantasyonunun](https://dart.dev/libraries/dart-core#lists) Lists bölümüne bakın.

### Set'ler

Dart'ta set, benzersiz elemanlardan oluşan sırasız bir koleksiyondur.
Dart'ta set desteği, set literal'leri ve
[`Set`](https://api.dart.dev/dart-core/Set-class.html) tipiyle sağlanır.

İşte bir set literal'i ile oluşturulmuş basit bir Dart set'i:

```dart
var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
```

> **Not:**
>
> Dart, `halogens`'in tipini `Set<String>` olarak çıkarır. Set'e yanlış
> tipte bir eleman eklemeye çalışırsanız analizci ya da çalışma zamanı hata verir.
> Daha fazla bilgi için
> [tip çıkarımı](https://dart.dev/language/type-system#type-inference) konusunu okuyun.

Boş bir set oluşturmak için önünde tip argümanı olan `{}` kullanın
ya da `{}`'i `Set` tipinde bir değişkene atayın:

```dart
var names = <String>{};
// Set<String> names = {}; // Bu da çalışır.
// var names = {}; // Set değil, map oluşturur.
```

> **Set mi, map mi?:**
>
> Map literal'lerinin sözdizimi set literal'lerininkine
> benzer. Map literal'leri daha önce geldiği için `{}` varsayılan olarak `Map`
> tipindedir. `{}` üzerindeki ya da atandığı değişkendeki tip belirtimini
> unutursanız Dart `Map<dynamic, dynamic>` tipinde bir nesne oluşturur.

Var olan bir set'e `add()` ya da `addAll()` metotlarıyla eleman ekleyin:

```dart
var elements = <String>{};
elements.add('fluorine');
elements.addAll(halogens);
```

Set'teki eleman sayısını almak için `.length` kullanın:

```dart
var elements = <String>{};
elements.add('fluorine');
elements.addAll(halogens);
assert(elements.length == 5);
```

Derleme zamanı sabiti olan bir set oluşturmak için
set literal'inin önüne `const` ekleyin:

```dart
final constantSet = const {
  'fluorine',
  'chlorine',
  'bromine',
  'iodine',
  'astatine',
};
// constantSet.add('helium'); // Bu satır hataya yol açar.
```

Set'ler hakkında daha fazla bilgi için
[`dart:core` dokümantasyonunun](https://dart.dev/libraries/dart-core#sets) Sets bölümüne bakın.

### Map'ler

Bir map'te her eleman bir anahtar-değer (key-value) çiftidir. Bir çiftteki her anahtar
bir değerle ilişkilidir; hem anahtarlar hem de değerler
herhangi bir tipte nesne olabilir. Aynı değer birden çok farklı anahtarla
ilişkilendirilebilse de her anahtar yalnızca bir kez bulunabilir.
Dart'ta map desteği, map literal'leri ve
[`Map`](https://api.dart.dev/dart-core/Map-class.html)
tipiyle sağlanır.

İşte map literal'leriyle oluşturulmuş birkaç basit Dart map'i:

```dart
var gifts = {
  // Anahtar: Değer
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings',
};

var nobleGases = {2: 'helium', 10: 'neon', 18: 'argon'};
```

> **Not:**
>
> Dart, `gifts`'in tipini `Map<String, String>`, `nobleGases`'in
> tipini ise `Map<int, String>` olarak çıkarır. İki map'ten birine yanlış tipte
> bir değer eklemeye çalışırsanız analizci ya da çalışma zamanı hata verir. Daha fazla bilgi için
> [tip çıkarımı](https://dart.dev/language/type-system#type-inference) konusunu okuyun.

Aynı nesneleri bir Map yapıcısıyla da oluşturabilirsiniz:

```dart
var gifts = Map<String, String>();
gifts['first'] = 'partridge';
gifts['second'] = 'turtledoves';
gifts['fifth'] = 'golden rings';

var nobleGases = Map<int, String>();
nobleGases[2] = 'helium';
nobleGases[10] = 'neon';
nobleGases[18] = 'argon';
```

> **Not:**
>
> C# ya da Java gibi bir dilden geliyorsanız sadece `Map()` yerine
> `new Map()` görmeyi bekleyebilirsiniz. Dart'ta `new` anahtar kelimesi isteğe bağlıdır.
> Ayrıntılar için [Using constructors](https://dart.dev/language/classes#using-constructors) sayfasına bakın.

Var olan bir map'e indis atama operatörüyle (`[]=`)
yeni bir anahtar-değer çifti ekleyin:

```dart
var gifts = {'first': 'partridge'};
gifts['fourth'] = 'calling birds'; // Bir anahtar-değer çifti ekle
```

Bir map'ten indis operatörüyle (`[]`) değer alın:

```dart
var gifts = {'first': 'partridge'};
assert(gifts['first'] == 'partridge');
```

Map'te olmayan bir anahtarı ararsanız karşılığında `null` alırsınız:

```dart
var gifts = {'first': 'partridge'};
assert(gifts['fifth'] == null);
```

Map'teki anahtar-değer çifti sayısını almak için `.length` kullanın:

```dart
var gifts = {'first': 'partridge'};
gifts['fourth'] = 'calling birds';
assert(gifts.length == 2);
```

Derleme zamanı sabiti olan bir map oluşturmak için
map literal'inin önüne `const` ekleyin:

```dart
final constantMap = const {2: 'helium', 10: 'neon', 18: 'argon'};

// constantMap[2] = 'Helium'; // Bu satır hataya yol açar.
```

Map'ler hakkında daha fazla bilgi için
[`dart:core` dokümantasyonunun](https://dart.dev/libraries/dart-core#maps) Maps bölümüne bakın.

### Koleksiyon elemanları

Bir koleksiyon literal'i bir dizi eleman içerir. Çalışma
zamanında her eleman değerlendirilir ve sıfır ya da daha fazla
değer üretir; bu değerler ortaya çıkan koleksiyona eklenir.
Bu elemanlar iki ana kategoriye ayrılır: yaprak (leaf) elemanlar
ve kontrol akışı elemanları.

- Yaprak eleman: Koleksiyon literal'ine tek bir
  öğe ekler.

  - İfade elemanı: Tek bir ifadeyi
    değerlendirir ve ortaya çıkan değeri
    koleksiyona ekler.
  - Map girdisi elemanı: Bir anahtar ve değer
    ifadesi çiftini değerlendirir ve ortaya çıkan girdiyi
    koleksiyona ekler.
- Kontrol akışı elemanı: Çevreleyen koleksiyona koşullu ya da yinelemeli olarak
  sıfır ya da daha fazla değer ekler.

  - Null-farkındalıklı (null-aware) eleman: Bir ifadeyi değerlendirir ve
    sonuç `null` değilse değeri
    çevreleyen koleksiyona ekler.
  - Spread elemanı: Verilen bir dizi
    (koleksiyon ifadesi) üzerinde dolaşır ve ortaya çıkan
    tüm değerleri çevreleyen koleksiyona ekler.
  - Null-farkındalıklı spread elemanı:
    Spread elemanına benzer, ancak koleksiyonun
    `null` olmasına izin verir ve null ise hiçbir şey eklemez.
  - If elemanı: Verilen bir koşul ifadesine göre
    içteki bir elemanı koşullu olarak değerlendirir;
    koşul false ise isteğe bağlı olarak başka bir `else` elemanını
    değerlendirir.
  - For elemanı: Verilen bir iç elemanı
    yineleyerek tekrar tekrar değerlendirir ve
    sıfır ya da daha fazla sonuç değeri ekler.

Koleksiyon elemanları hakkında daha fazla bilgi için aşağıdaki
bölümlere bakın.

#### İfade elemanları

Bir ifade elemanı tek bir ifadeyi değerlendirir
ve ortaya çıkan değeri koleksiyona ekler. Bu
ifade literal'ler, değişkenler, operatörler, fonksiyon çağrıları ve
yapıcı çağrıları gibi çeşitli yapıları
kapsayabilir.

Bir ifade elemanının koleksiyon içindeki sözdizimi şöyledir:

```dart
<expression>
```

#### Map girdisi elemanları

Bir map girdisi elemanı bir anahtar ve değer
ifadesi çiftini değerlendirir ve ortaya çıkan girdiyi
koleksiyona ekler. Bu çiftteki hem anahtar hem de değer
ifade olabilir.

Bir map girdisi elemanının koleksiyon içindeki sözdizimi şöyledir:

```dart
<key_expression>: <value_expression>
```

#### Null-farkındalıklı elemanlar

Null-farkındalıklı bir eleman bir ifadeyi değerlendirir ve
sonuç `null` değilse değeri çevreleyen
koleksiyona ekler.

> **Sürüm notu:**
>
> Null-farkındalıklı koleksiyon elemanları
> en az 3.8 [dil sürümü](https://dart.dev/language/versioning) gerektirir.

Null-farkındalıklı bir elemanın bir ifade elemanı içindeki
sözdizimi şöyledir:

```dart
?<expression>
```

Null-farkındalıklı bir elemanın bir map girdisi elemanı içindeki
sözdizimi şöyledir:

```dart
// anahtar null-farkındalıklı bir elemandır
?<key_expression>: <value_expression>
```

```dart
// değer null-farkındalıklı bir elemandır
<key_expression>: ?<value_expression>
```

```dart
// anahtar ve değer null-farkındalıklı elemanlardır
?<key_expression>: ?<value_expression>
```

Aşağıdaki örnekte `absentValue` `null` olduğu için
`?absentValue` null-farkındalıklı elemanının sonucu
`items` adlı listeye eklenmez:

```dart
int? absentValue = null;
int? presentValue = 3;
var items = [
  1,
  ?absentValue,
  ?presentValue,
  absentValue,
  5,
]; // [1, 3, null, 5]
```

Aşağıdaki örnek, map girdisi elemanları içinde
null-farkındalıklı elemanları kullanmanın
çeşitli yollarını gösterir:

```dart
String? presentKey = 'Apple';
String? absentKey = null;

int? presentValue = 3;
int? absentValue = null;

var itemsA = {presentKey: absentValue}; // {Apple: null}
var itemsB = {presentKey: ?absentValue}; // {}

var itemsC = {absentKey: presentValue}; // {null: 3}
var itemsD = {?absentKey: presentValue}; // {}

var itemsE = {absentKey: absentValue}; // {null: null}
var itemsF = {?absentKey: ?absentValue}; // {}
```

#### Spread elemanları

Spread elemanı verilen bir dizi üzerinde dolaşır ve
ortaya çıkan tüm değerleri çevreleyen
koleksiyona ekler.

Bir spread elemanının koleksiyon içindeki sözdizimi şöyledir.
Dizi ifadesi, `Iterable`'ı uygulayan (implement) bir nesne veren
herhangi bir ifade olabilir:

```dart
...<sequence_expression>
```

Aşağıdaki örnekte `a` adlı listedeki elemanlar
`items` adlı listeye eklenir.

```dart
var a = [1, 2, null, 4];
var items = [0, ...a, 5]; // [0, 1, 2, null, 4, 5]
```

`null` olabilecek bir ifadeyi yayıyorsanız (spread) ve `null`'ı
yok saymak (hiç eleman eklememek) istiyorsanız
[null-farkındalıklı spread elemanı](https://dart.dev/language/collections#null-spread-element) kullanın.

Spread operatörü hakkında daha fazla bilgi için
[Spread operator](https://dart.dev/language/operators/#spread-operators) sayfasına bakın.

#### Null-farkındalıklı spread elemanları

Null-farkındalıklı spread elemanı spread elemanına
benzer, ancak koleksiyonun `null` olmasına izin verir ve
null ise hiçbir şey eklemez.

Null-farkındalıklı bir spread elemanının koleksiyon içindeki
sözdizimi şöyledir:

```dart
...?<sequence_expression>
```

Aşağıdaki örnekte `a` adlı liste null olduğu için
yok sayılır, ancak `b` adlı listedeki elemanlar
`items` adlı listeye eklenir. Dikkat edin: Bir
koleksiyonun kendisi `null` değilse ama `null` olan elemanlar
içeriyorsa, bu `null` elemanlar yine de sonuca eklenir.

```dart
List<int>? a = null;
var b = [1, null, 3];
var items = [0, ...?a, ...?b, 4]; // [0, 1, null, 3, 4]
```

Null güvenliği (null safety) nedeniyle null olabilecek bir değer üzerinde
spread işlemi (`...`) yapamazsınız. Aşağıdaki örnek
derleme zamanı hatası verir, çünkü
`extraOptions` parametresi null olabilir ve
`extraOptions` üzerinde kullanılan spread operatörü null-farkındalıklı değildir.

*statik analiz: başarısız*

```dart
List<String> buildCommandLine(
  String executable,
  List<String> options, [
  List<String>? extraOptions,
]) {
  return [
    executable,
    ...options,
    ...extraOptions, // <-- Hata
  ];
}

// Kullanım:
//   buildCommandLine('dart', ['run', 'my_script.dart'], null);
// Sonuç:
//   Derleme zamanı hatası
```

Null olabilen bir koleksiyonu yaymak istiyorsanız
null-farkındalıklı spread elemanı kullanın. Aşağıdaki örnek geçerlidir,
çünkü `extraOptions` üzerinde null-farkındalıklı spread operatörü kullanılmıştır.

```dart
List<String> buildCommandLine(
  String executable,
  List<String> options, [
  List<String>? extraOptions,
]) {
  return [
    executable,
    ...options,
    ...?extraOptions, // <-- Artık sorun yok.
  ];
}

// Kullanım:
//   buildCommandLine('dart', ['run', 'my_script.dart'], null);
// Sonuç:
//   [dart, run, my_script.dart]
```

Null-farkındalıklı spread operatörü hakkında daha fazla bilgi için
[Spread operator](https://dart.dev/language/operators/#spread-operators) sayfasına bakın.

#### If elemanları

Bir `if` elemanı, verilen bir koşul ifadesine göre içteki bir elemanı
koşullu olarak değerlendirir; koşul false ise isteğe bağlı olarak
başka bir `else` elemanını değerlendirir.

`if` elemanının birkaç sözdizimi çeşidi vardır:

```dart
// bool ifade true ise sonucu ekle.
if (<bool_expression>) <result>
```

```dart
// İfade desenle eşleşirse sonucu ekle.
if (<expression> case <pattern>) <result>
```

```dart
// İşlem true sonuç verirse ilk sonucu,
// aksi halde ikinci sonucu ekle.
if (<bool_expression>) <result> else <result>
```

```dart
// İşlem true sonuç verirse ilk sonucu,
// aksi halde ikinci sonucu ekle.
if (<expression> case <pattern>) <result> else <result>
```

Aşağıdaki örnekler, bir koleksiyon içinde boolean bir ifadeyle
`if` elemanı kullanmanın
çeşitli yollarını gösterir:

```dart
var includeItem = true;
var items = [0, if (includeItem) 1, 2, 3]; // [0, 1, 2, 3]
```

```dart
var includeItem = true;
var items = [0, if (!includeItem) 1, 2, 3]; // [0, 2, 3]
```

```dart
var name = 'apple';
var items = [0, if (name == 'orange') 1 else 10, 2, 3]; // [0, 10, 2, 3]
```

```dart
var name = 'apple';
var items = [
  0,
  if (name == 'kiwi') 1 else if (name == 'pear') 10,
  2,
  3,
]; // [0, 2, 3]
```

Aşağıdaki örnekler, bir koleksiyon içinde `case` kısmı olan
bir `if` elemanı kullanmanın çeşitli yollarını
gösterir:

```dart
Object data = 123;
var typeInfo = [
  if (data case int i) 'Data is an integer: $i',
  if (data case String s) 'Data is a string: $s',
  if (data case bool b) 'Data is a boolean: $b',
  if (data case double d) 'Data is a double: $d',
]; // [Data is an integer: 123]
```

```dart
var word = 'hello';
var items = [
  1,
  if (word case String(length: var wordLength)) wordLength,
  3,
]; // [1, 5, 3]
```

```dart
var orderDetails = ['Apples', 12, ''];
var summary = [
  'Product: ${orderDetails[0]}',
  if (orderDetails case [_, int qty, _]) 'Quantity: $qty',
  if (orderDetails case [_, _, ''])
    'Delivery: Not Started'
  else
    'Delivery: In Progress',
]; // [Product: Apples, Quantity: 12, Delivery: Not Started]
```

Farklı `if` işlemlerini bir `else if`
kısmıyla karıştırabilirsiniz. Örneğin:

```dart
var a = 'apple';
var b = 'orange';
var c = 'mango';
var items = [
  0,
  if (a == 'apple') 1 else if (a case 'mango') 10,
  if (b case 'pear') 2 else if (b == 'mango') 20,
  if (c case 'apple') 3 else if (c case 'mango') 30,
  4,
]; // [0, 1, 30, 4]
```

`if` koşulu hakkında daha fazla bilgi için
[`if` deyimi](https://dart.dev/language/branches#if) bölümüne,
`if-case`
koşulu hakkında daha fazla bilgi için [`if-case` deyimi](https://dart.dev/language/branches#if-case) bölümüne bakın.

#### For elemanları

Bir `for` elemanı verilen bir iç elemanı yineleyerek
tekrar tekrar değerlendirir ve sıfır ya da daha fazla sonuç değeri ekler.

Bir `for` elemanının koleksiyon içindeki sözdizimi şöyledir:

```dart
for (<expression> in <collection>) <result>
```

```dart
for (<initialization_clause>; <condition_clause>; <increment_clause>) <result>
```

Aşağıdaki örnekler, bir koleksiyon içinde
`for` elemanı kullanmanın çeşitli yollarını gösterir:

```dart
var numbers = [2, 3, 4];
var items = [1, for (var n in numbers) n * n, 7]; // [1, 4, 9, 16, 7]
```

```dart
var items = [1, for (var x = 5; x > 2; x--) x, 7]; // [1, 5, 4, 3, 7]
```

```dart
var items = [1, for (var x = 2; x < 4; x++) x, 7]; // [1, 2, 3, 7]
```

`for` döngüsü hakkında daha fazla bilgi için
[`for` döngüleri](https://dart.dev/language/loops/#for-loops) bölümüne bakın.

#### Kontrol akışı elemanlarını iç içe kullanma

Kontrol akışı elemanlarını birbirinin içine yerleştirebilirsiniz. Bu,
diğer dillerdeki list comprehension'lara güçlü bir
alternatiftir.

Aşağıdaki örnekte `numbers` içindeki yalnızca çift sayılar
`items`'a dahil edilir.

```dart
var numbers = [1, 2, 3, 4, 5, 6, 7];
var items = [
  0,
  for (var n in numbers)
    if (n.isEven) n,
  8,
]; // [0, 2, 4, 6, 8]
```

Bir `if` ya da `for` elemanının hemen içinde bir koleksiyon
literal'i üzerinde spread kullanmak yaygın ve deyimsel (idiomatic) bir kullanımdır. Örneğin:

```dart
var items = [
  if (condition) oneThing(),
  if (condition) ...[multiple(), things()],
]; // [oneThing, [multiple_a, multiple_b], things]
```

Her tür elemanı istediğiniz derinlikte iç içe yerleştirebilirsiniz.
Aşağıdaki örnekte `if`, `for` ve spread elemanları
bir koleksiyon içinde birbirinin içine yerleştirilmiştir:

```dart
var nestItems = true;
var ys = [1, 2, 3, 4];
var items = [
  if (nestItems) ...[
    for (var x = 0; x < 3; x++)
      for (var y in ys)
        if (x < y) x + y * 10,
  ],
]; // [10, 20, 30, 40, 21, 31, 41, 32, 42]
```


## Generic'ler

*Dart'ta generic tipler hakkında bilgi edinin.* · Kaynak: <https://dart.dev/language/generics>

Temel dizi tipi olan [`List`](https://api.dart.dev/dart-core/List-class.html)'in
API dokümantasyonuna bakarsanız tipin aslında `List<E>` olduğunu görürsünüz.
<...> gösterimi List'i *generic* (ya da *parametreli*) bir tip olarak işaretler;
yani biçimsel tip parametreleri olan bir tip. [Geleneksel olarak](https://dart.dev/effective-dart/design#do-follow-existing-mnemonic-conventions-when-naming-type-parameters) çoğu tip değişkeninin
E, T, S, K ve V gibi tek harfli isimleri vardır.

### Neden generic kullanılır?

Generic'ler çoğu zaman tip güvenliği için gereklidir, ama faydaları
yalnızca kodunuzun çalışmasını sağlamakla sınırlı değildir:

- Generic tipleri doğru belirtmek daha iyi üretilmiş kodla sonuçlanır.
- Generic'leri kod tekrarını azaltmak için kullanabilirsiniz.

Bir listenin yalnızca string içermesini istiyorsanız onu
`List<String>` olarak tanımlayabilirsiniz ("string listesi" diye okunur). Böylece
siz, diğer programcılar ve araçlarınız, listeye string olmayan bir şey atamanın
muhtemelen bir hata olduğunu fark edebilir. İşte bir örnek:

*statik analiz: başarısız*

```dart
var names = <String>[];
names.addAll(['Seth', 'Kathy', 'Lars']);
names.add(42); // Hata
```

Generic kullanmanın bir başka nedeni kod tekrarını azaltmaktır.
Generic'ler, statik analizin avantajlarından yararlanmaya devam ederken
tek bir arayüzü ve uygulamayı birçok tip arasında paylaşmanızı sağlar.
Örneğin bir nesneyi önbelleğe almak (cache) için
bir arayüz oluşturduğunuzu düşünün:

```dart
abstract class ObjectCache {
  Object getByKey(String key);
  void setByKey(String key, Object value);
}
```

Bu arayüzün string'e özel bir sürümünü istediğinizi fark ediyor
ve başka bir arayüz oluşturuyorsunuz:

```dart
abstract class StringCache {
  String getByKey(String key);
  void setByKey(String key, String value);
}
```

Sonra bu arayüzün sayıya özel bir sürümünü istediğinize karar veriyorsunuz...
Gerisini tahmin edebilirsiniz.

Generic tipler sizi tüm bu arayüzleri oluşturma zahmetinden kurtarabilir.
Bunun yerine bir tip parametresi alan tek bir arayüz oluşturabilirsiniz:

```dart
abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}
```

Bu kodda T yer tutucu tiptir. Bunu, bir geliştiricinin ileride
tanımlayacağı bir tip olarak düşünebilirsiniz.

### Koleksiyon literal'lerini kullanma

List, set ve map literal'leri parametreli olabilir. Parametreli literal'ler,
daha önce gördüğünüz literal'lerin aynısıdır; tek fark açılış parantezinden önce
`<tip>` (list ve set için) ya da
`<anahtarTipi, değerTipi>` (map için)
eklemenizdir. Tipli literal kullanımına bir örnek:

```dart
var names = <String>['Seth', 'Kathy', 'Lars'];
var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
var pages = <String, String>{
  'index.html': 'Homepage',
  'robots.txt': 'Hints for web robots',
  'humans.txt': 'We are people, not machines',
};
```

### Parametreli tipleri yapıcılarla kullanma

Bir yapıcı kullanırken bir ya da daha fazla tip belirtmek için tipleri
sınıf adının hemen ardından açılı parantez (`<...>`) içine yazın. Örneğin:

```dart
var nameSet = Set<String>.of(names);
```

Aşağıdaki kod, anahtarları tam sayı ve değerleri `View` tipinde olan
bir `SplayTreeMap` oluşturur:

```dart
var views = SplayTreeMap<int, View>();
```

### Generic koleksiyonlar ve içerdikleri tipler

Dart'ta generic tipler *somutlaştırılmıştır (reified)*; yani tip bilgilerini
çalışma zamanında da taşırlar. Örneğin bir koleksiyonun tipini
test edebilirsiniz:

```dart
var names = <String>[];
names.addAll(['Seth', 'Kathy', 'Lars']);
print(names is List<String>); // true
```

> **Not:**
>
> Buna karşılık Java'daki generic'ler *silme (erasure)* kullanır; yani generic
> tip parametreleri çalışma zamanında kaldırılır. Java'da bir nesnenin List olup olmadığını
> test edebilirsiniz, ama `List<String>` olup olmadığını test edemezsiniz.

### Parametreli tipi kısıtlama

Generic bir tip uygularken
argüman olarak verilebilecek tipleri sınırlamak,
yani argümanın belirli bir tipin alt tipi olmasını zorunlu kılmak isteyebilirsiniz.
Bu kısıtlamaya sınır (bound) denir.
Bunu `extends` kullanarak yapabilirsiniz.

Yaygın bir kullanım, bir tipi (varsayılan [`Object?`](https://dart.dev/null-safety/understanding-null-safety#top-and-bottom) yerine)
`Object`'in alt tipi yaparak
null olamaz hale getirmektir.

```dart
class Foo<T extends Object> {
  // Foo'ya T için verilen her tip null olamaz (non-nullable) olmalıdır.
}
```

`extends`'i `Object` dışındaki tiplerle de kullanabilirsiniz.
İşte `SomeBaseClass`'ı genişleten bir örnek;
böylece `T` tipindeki nesneler üzerinde `SomeBaseClass`'ın üyeleri çağrılabilir:

```dart
class Foo<T extends SomeBaseClass> {
  // Uygulama buraya gelir...
  String toString() => "Instance of 'Foo<$T>'";
}

class Extender extends SomeBaseClass {
  ...
}
```

Generic argüman olarak `SomeBaseClass`'ı ya da onun herhangi bir alt tipini kullanmak sorun değildir:

```dart
var someBaseClassFoo = Foo<SomeBaseClass>();
var extenderFoo = Foo<Extender>();
```

Hiç generic argüman belirtmemek de sorun değildir:

```dart
var foo = Foo();
print(foo); // Instance of 'Foo<SomeBaseClass>'
```

`SomeBaseClass` olmayan herhangi bir tip belirtmek hataya yol açar:

*statik analiz: başarısız*

```dart
var foo = Foo<Object>();
```

#### Kendine başvuran tip parametresi kısıtlamaları (F-bound'lar)

Parametre tiplerini sınırlarla kısıtlarken sınırın
tip parametresinin kendisine başvurmasını sağlayabilirsiniz. Bu, kendine başvuran bir kısıtlama,
yani F-bound oluşturur. Örneğin:

```dart
abstract interface class Comparable<T> {
  int compareTo(T o);
}

int compareAndOffset<T extends Comparable<T>>(T t1, T t2) =>
    t1.compareTo(t2) + 1;

class A implements Comparable<A> {
  @override
  int compareTo(A other) => /*...uygulama...*/ 0;
}

int useIt = compareAndOffset(A(), A());
```

`T extends Comparable<T>` F-bound'u, `T`'nin kendisiyle karşılaştırılabilir olması gerektiği anlamına gelir.
Yani `A` yalnızca aynı tipteki diğer örneklerle karşılaştırılabilir.

### Generic metotları kullanma

Metotlar ve fonksiyonlar da tip argümanı alabilir:

```dart
T first<T>(List<T> ts) {
  // Biraz ön hazırlık ya da hata kontrolü yap, sonra...
  T tmp = ts[0];
  // Ek kontrol ya da işlem yap...
  return tmp;
}
```

Burada `first` üzerindeki generic tip parametresi (`<T>`),
`T` tip argümanını birkaç yerde kullanmanıza izin verir:

- Fonksiyonun dönüş tipinde (`T`).
- Bir argümanın tipinde (`List<T>`).
- Bir yerel değişkenin tipinde (`T tmp`).


## Typedef'ler

*Dart'ta tip takma adları (type alias) hakkında bilgi edinin.* · Kaynak: <https://dart.dev/language/typedefs>

Bir tip takma adı (type alias), `typedef` anahtar kelimesiyle
tanımlandığı için genellikle *typedef* olarak anılır ve
bir tipe kısa yoldan başvurmanın bir yoludur.
`IntList` adlı bir tip takma adını tanımlama ve kullanma örneği:

```dart
typedef IntList = List<int>;
IntList il = [1, 2, 3];
```

Bir tip takma adının tip parametreleri olabilir:

```dart
typedef ListMapper<X> = Map<X, List<X>>;
Map<String, List<String>> m1 = {}; // Uzun hali.
ListMapper<String> m2 = {}; // Aynı şey, ama daha kısa ve net.
```

> **Sürüm notu:**
>
> 2.13'ten önce typedef'ler fonksiyon tipleriyle sınırlıydı.
> Yeni typedef'leri kullanmak en az 2.13 [dil sürümü](https://dart.dev/language/versioning)
> gerektirir.

Fonksiyonlar için çoğu durumda typedef yerine
[satır içi (inline) fonksiyon tipleri](https://dart.dev/effective-dart/design#prefer-inline-function-types-over-typedefs)
kullanmanızı öneriyoruz.
Yine de fonksiyon typedef'leri işe yarayabilir:

```dart
typedef Compare<T> = int Function(T a, T b);

int sort(int a, int b) => a - b;

void main() {
  assert(sort is Compare<int>); // True!
}
```


## Dart tip sistemi

*Sağlam (sound) Dart kodu neden ve nasıl yazılır.* · Kaynak: <https://dart.dev/language/type-system>

Dart dili tip güvenlidir (type safe): Bir değişkenin değerinin her zaman değişkenin statik tipiyle
eşleşmesini sağlamak için statik tip kontrolü ile
[çalışma zamanı kontrollerinin](https://dart.dev/language/type-system#runtime-checks) bir birleşimini kullanır.
Buna bazen sağlam tipleme (sound typing) denir.
*Tipler* zorunlu olsa da [tip çıkarımı](https://dart.dev/language/type-system#type-inference) sayesinde
tip *belirtimleri* isteğe bağlıdır.

Statik tip kontrolünün bir faydası, Dart'ın [statik analizcisini](https://dart.dev/tools/analysis)
kullanarak hataları derleme zamanında bulabilmektir.

Statik analiz hatalarının çoğunu generic sınıflara tip belirtimi ekleyerek
düzeltebilirsiniz. En yaygın generic sınıflar
`List<T>` ve `Map<K,V>` koleksiyon tipleridir.

Örneğin aşağıdaki kodda `printInts()` fonksiyonu bir tam sayı listesini yazdırır,
`main()` ise bir liste oluşturup onu `printInts()`'e geçirir.

*statik analiz: başarısız*

```dart
void printInts(List<int> a) => print(a);

void main() {
  final list = [];
  list.add(1);
  list.add('2');
  printInts(list);
}
```

Yukarıdaki kod, `printInts(list)` çağrısında `list` üzerinde (yukarıda
vurgulanan) bir tip hatasına yol açar:

```text
error - The argument type 'List<dynamic>' can't be assigned to the parameter type 'List<int>'. - argument_type_not_assignable
```

Hata, `List<dynamic>`'ten `List<int>`'e sağlam olmayan örtük bir dönüşümü (implicit cast) işaret eder.
`list` değişkeninin statik tipi `List<dynamic>`'tir. Bunun nedeni,
`var list = []` başlatma tanımının analizciye `dynamic`'ten daha belirli
bir tip argümanı çıkarması için yeterli bilgi vermemesidir.
`printInts()` fonksiyonu `List<int>` tipinde bir parametre beklediği için
tipler uyuşmaz.

Liste oluşturulurken (aşağıda vurgulanan) bir tip belirtimi (`<int>`) eklendiğinde,
analizci bir string argümanının `int` parametresine atanamayacağından
şikâyet eder.
`list.add('2')` içindeki tırnakları kaldırmak, statik analizden geçen
ve hiçbir hata ya da uyarı vermeden çalışan bir kod ortaya çıkarır.

*statik analiz: başarılı*

```dart
void printInts(List<int> a) => print(a);

void main() {
  final list = <int>[];
  list.add(1);
  list.add(2);
  printInts(list);
}
```

[DartPad'de deneyin](https://dartpad.dev/?id=25074a51a00c71b4b000f33b688dedd0).

### Sağlamlık (soundness) nedir?

*Sağlamlık*, programınızın belirli geçersiz durumlara düşememesini
sağlamakla ilgilidir. Sağlam bir *tip sistemi*, bir ifadenin
statik tipiyle eşleşmeyen bir değer üretmesi durumuna asla düşemeyeceğiniz
anlamına gelir. Örneğin bir ifadenin statik tipi `String` ise,
çalışma zamanında onu değerlendirdiğinizde yalnızca bir string alacağınız garantidir.

Dart'ın tip sistemi, Java ve C#'taki tip sistemleri gibi sağlamdır.
Bu sağlamlığı statik kontrol (derleme zamanı hataları) ile
çalışma zamanı kontrollerinin birleşimiyle uygular. Örneğin bir `String`'i
`int`'e atamak derleme zamanı hatasıdır. Bir nesneyi
`as String` ile `String`'e dönüştürmek (cast),
nesne bir `String` değilse çalışma zamanı hatasıyla başarısız olur.

### Sağlamlığın faydaları

Sağlam bir tip sisteminin birçok faydası vardır:

- Tiple ilgili hataları derleme zamanında ortaya çıkarma.  
  Sağlam bir tip sistemi, kodu tipleri konusunda net olmaya zorlar;
  böylece çalışma zamanında bulunması zor olabilecek tiple ilgili hatalar
  derleme zamanında ortaya çıkar.
- Daha okunabilir kod.  
  Bir değerin gerçekten belirtilen tipte olduğuna güvenebildiğiniz için
  kod daha kolay okunur. Sağlam Dart'ta tipler yalan söyleyemez.
- Bakımı daha kolay kod.  
  Sağlam bir tip sistemiyle, bir kod parçasını değiştirdiğinizde
  tip sistemi sizi bu yüzden bozulan diğer kod parçaları
  hakkında uyarabilir.
- Daha iyi önceden derleme (AOT, ahead of time).  
  AOT derleme tipler olmadan da mümkündür, ancak üretilen
  kod çok daha az verimli olur.

### Statik analizden geçmek için ipuçları

Statik tiplerle ilgili kuralların çoğu kolay anlaşılır.
İşte daha az belirgin olan kurallardan bazıları:

- Metotları override ederken sağlam dönüş tipleri kullanın.
- Metotları override ederken sağlam parametre tipleri kullanın.
- Dinamik bir listeyi tipli bir liste olarak kullanmayın.

Bu kuralları aşağıdaki tip hiyerarşisini kullanan örneklerle
ayrıntılı olarak inceleyelim:

![Üst tipi Animal, alt tipleri Alligator, Cat ve HoneyBadger olan bir hayvan hiyerarşisi. Cat'in alt tipleri Lion ve MaineCoon.](https://dart.dev/assets/img/language/type-hierarchy.png)

#### Metotları override ederken sağlam dönüş tipleri kullanın

Bir alt sınıftaki metodun dönüş tipi, üst sınıftaki metodun dönüş tipiyle
aynı tip ya da onun bir alt tipi olmalıdır.
`Animal` sınıfındaki getter metodunu düşünün:

```dart
class Animal {
  void chase(Animal a) {
     ...
  }
  Animal get parent => ...
}
```

`parent` getter metodu bir `Animal` döndürür. `HoneyBadger`
alt sınıfında
getter'ın dönüş tipini `HoneyBadger` (ya da `Animal`'ın
herhangi bir başka alt tipi) ile değiştirebilirsiniz, ama ilgisiz bir tipe izin verilmez.

*statik analiz: başarılı*

```dart
class HoneyBadger extends Animal {
  @override
  void chase(Animal a) {
     ...
  }

  @override
  HoneyBadger get parent => ...
}
```

*statik analiz: başarısız*

```dart
class HoneyBadger extends Animal {
  @override
  void chase(Animal a) {
     ...
  }

  @override
  Root get parent => ...
}
```

#### Metotları override ederken sağlam parametre tipleri kullanın

Override edilen bir metodun parametresi, üst sınıftaki karşılık gelen parametreyle
aynı tipte ya da onun bir üst tipinde olmalıdır.
Tipi orijinal parametrenin bir alt tipiyle değiştirerek
parametre tipini "daraltmayın".

> **Not:**
>
> Alt tip kullanmak için geçerli bir nedeniniz varsa
> [`covariant` anahtar kelimesini](https://dart.dev/language/type-system#covariant-keyword) kullanabilirsiniz.

`Animal` sınıfının `chase(Animal)` metodunu düşünün:

```dart
class Animal {
  void chase(Animal a) {
     ...
  }
  Animal get parent => ...
}
```

`chase()` metodu bir `Animal` alır. Bir `HoneyBadger` her şeyi kovalar.
`chase()` metodunu her şeyi (`Object`) alacak şekilde override etmek sorun değildir.

*statik analiz: başarılı*

```dart
class HoneyBadger extends Animal {
  @override
  void chase(Object a) {
     ...
  }

  @override
  Animal get parent => ...
}
```

Aşağıdaki kod, `chase()` metodundaki parametreyi
`Animal`'dan `Animal`'ın bir alt sınıfı olan `Mouse`'a daraltır.

*statik analiz: başarısız*

```dart
class Mouse extends Animal {
   ...
}

class Cat extends Animal {
  @override
  void chase(Mouse a) {
     ...
  }
}
```

Bu kod tip güvenli değildir, çünkü o zaman bir kedi tanımlayıp
onu bir timsahın peşine göndermek mümkün olurdu:

```dart
Animal a = Cat();
a.chase(Alligator()); // Ne tip açısından ne de kedi açısından güvenli.
```

#### Dinamik bir listeyi tipli bir liste olarak kullanmayın

İçinde farklı türde şeyler bulunan bir liste istediğinizde
`dynamic` bir liste iyi bir seçimdir. Ancak
`dynamic` bir listeyi tipli bir liste olarak kullanamazsınız.

Bu kural generic tiplerin örnekleri için de geçerlidir.

Aşağıdaki kod `Dog`'lardan oluşan `dynamic` bir liste oluşturur ve onu
`Cat` tipinde bir listeye atar; bu da statik analiz sırasında hata üretir.

*statik analiz: başarısız*

```dart
void main() {
  List<Cat> foo = <dynamic>[Dog()]; // Hata
  List<dynamic> bar = <dynamic>[Dog(), Cat()]; // Sorun yok
}
```

### Çalışma zamanı kontrolleri

Çalışma zamanı kontrolleri, derleme zamanında tespit edilemeyen
tip güvenliği sorunlarıyla ilgilenir.

Örneğin aşağıdaki kod çalışma zamanında bir istisna fırlatır,
çünkü köpek listesini kedi listesine dönüştürmek bir hatadır:

*çalışma zamanı: başarısız*

```dart
void main() {
  List<Animal> animals = <Dog>[Dog()];
  List<Cat> cats = animals as List<Cat>;
}
```

#### `dynamic`'ten örtük aşağı dönüşümler (downcast)

Statik tipi `dynamic` olan ifadeler örtük olarak
daha belirli bir tipe dönüştürülebilir.
Gerçek tip eşleşmezse dönüşüm çalışma zamanında hata fırlatır.
Aşağıdaki `assumeString` metodunu düşünün:

*statik analiz: başarılı*

```dart
int assumeString(dynamic object) {
  String string = object; // `object`'in bir `String` olduğunu çalışma zamanında kontrol et.
  return string.length;
}
```

Bu örnekte `object` bir `String` ise dönüşüm başarılı olur.
`int` gibi `String`'in alt tipi olmayan bir şeyse
bir `TypeError` fırlatılır:

*çalışma zamanı: başarısız*

```dart
final length = assumeString(1);
```

> **İpucu:**
>
> `dynamic`'ten örtük aşağı dönüşümleri önlemek ve bu sorundan kaçınmak için
> analizcinin *strict casts* (katı dönüşümler) modunu açmayı düşünün.
>
> ```yaml
> analyzer:
>   language:
>     strict-casts: true
> ```
>
> Analizcinin davranışını özelleştirme hakkında daha fazla bilgi için
> [Customizing static analysis](https://dart.dev/tools/analysis) sayfasına göz atın.

### Tip çıkarımı

Analizci; alanların, metotların, yerel değişkenlerin
ve çoğu generic tip argümanının tiplerini çıkarabilir.
Analizcinin belirli bir tipi çıkarmak için yeterli bilgisi olmadığında
`dynamic` tipini kullanır.

Tip çıkarımının generic'lerle nasıl çalıştığına dair bir örnek:
Bu örnekte `arguments` adlı bir değişken, string anahtarları
çeşitli tipteki değerlerle eşleştiren bir map tutar.

Değişkenin tipini açıkça yazarsanız şöyle yazabilirsiniz:

```dart
Map<String, Object?> arguments = {'argA': 'hello', 'argB': 42};
```

Alternatif olarak `var` ya da `final` kullanıp tipi Dart'ın çıkarmasına izin verebilirsiniz:

```dart
var arguments = {'argA': 'hello', 'argB': 42}; // Map<String, Object>
```

Map literal'i tipini girdilerinden çıkarır,
değişken de tipini map literal'inin tipinden çıkarır.
Bu map'te anahtarların ikisi de string'dir, ama değerler farklı
tiptedir (üst sınırı `Object` olan `String` ve `int`).
Bu yüzden map literal'inin tipi `Map<String, Object>` olur,
`arguments` değişkeninin tipi de öyle.

#### Alan ve metot çıkarımı

Tipi belirtilmemiş ve üst sınıftan bir alanı ya da metodu
override eden bir alan ya da metot, üst sınıftaki metodun ya da alanın
tipini miras alır.

Tanımlanmış ya da miras alınmış bir tipi olmayan ama bir başlangıç değeriyle
tanımlanan bir alanın tipi, başlangıç değerine göre çıkarılır.

#### Statik alan çıkarımı

Statik alanların ve değişkenlerin tipleri başlatıcılarından (initializer)
çıkarılır. Çıkarımın bir döngüyle karşılaşırsa başarısız olduğunu unutmayın
(yani değişkenin tipini çıkarmak, o değişkenin tipini bilmeye
bağlıysa).

#### Yerel değişken çıkarımı

Yerel değişkenlerin tipleri, varsa başlatıcılarından çıkarılır.
Sonraki atamalar hesaba katılmaz.
Bu, gereğinden fazla kesin bir tipin çıkarılmasına yol açabilir.
Böyle bir durumda tip belirtimi ekleyebilirsiniz.

*statik analiz: başarısız*

```dart
var x = 3; // x'in tipi int olarak çıkarılır.
x = 4.0;
```

*statik analiz: başarılı*

```dart
num y = 3; // Bir num, double ya da int olabilir.
y = 4.0;
```

#### Tip argümanı çıkarımı

Yapıcı çağrılarına ve
[generic metot](https://dart.dev/language/generics#using-generic-methods) çağrılarına verilen tip argümanları,
kullanıldıkları bağlamdan gelen aşağı yönlü bilgi ile yapıcıya ya da
generic metoda verilen argümanlardan gelen yukarı yönlü bilginin birleşimine göre
çıkarılır. Çıkarım istediğiniz ya da beklediğiniz şeyi yapmıyorsa
tip argümanlarını her zaman açıkça belirtebilirsiniz.

*statik analiz: başarılı*

```dart
// <int>[] yazmışsınız gibi çıkarılır.
List<int> listOfInt = [];

// <double>[3.0] yazmışsınız gibi çıkarılır.
var listOfDouble = [3.0];

// Iterable<int> olarak çıkarılır.
var ints = listOfDouble.map((x) => x.toInt());
```

Son örnekte `x`'in tipi aşağı yönlü bilgi kullanılarak `double` olarak çıkarılır.
Closure'ın dönüş tipi ise yukarı yönlü bilgi kullanılarak `int` olarak çıkarılır.
Dart bu dönüş tipini `map()` metodunun tip argümanını (`<int>`)
çıkarırken yukarı yönlü bilgi olarak kullanır.

##### Sınırları kullanarak çıkarım

> **Sürüm notu:**
>
> Sınırları kullanarak çıkarım en az 3.7.0 [dil sürümü](https://dart.dev/language/versioning) gerektirir.

Sınırları kullanarak çıkarım özelliğiyle
Dart'ın tip çıkarım algoritması, yalnızca en iyi tahmine dayalı yaklaşımlarla değil,
mevcut kısıtlamaları tanımlanmış tip sınırlarıyla birleştirerek
kısıtlamalar üretir.

Bu özellikle [F-sınırlı](https://dart.dev/language/generics/#f-bounds) tipler için önemlidir;
sınırları kullanarak çıkarım, aşağıdaki örnekte
`X`'in `B`'ye bağlanabileceğini doğru şekilde çıkarır.
Bu özellik olmadan tip argümanı açıkça belirtilmelidir: `f<B>(C())`:

```dart
class A<X extends A<X>> {}

class B extends A<B> {}

class C extends B {}

void f<X extends A<X>>(X x) {}

void main() {
  f(B()); // Sorun yok.

  // Sorun yok. Sınırlar kullanılmadan, en iyi tahmine dayanan çıkarım
  // `C`'nin `A<C>`'nin alt tipi olmadığını gördükten sonra başarısız olurdu.
  f(C());

  f<B>(C()); // Sorun yok.
}
```

Dart'taki `int` ya da `num` gibi gündelik tiplerle daha gerçekçi bir örnek:

```dart
X max<X extends Comparable<X>>(X x1, X x2) => x1.compareTo(x2) > 0 ? x1 : x2;

void main() {
  // Bu özellikle `max<num>(3, 7)` olarak çıkarılır, özellik olmadan başarısız olur.
  max(3, 7);
}
```

Sınırları kullanarak çıkarımla Dart, tip argümanlarını *ayrıştırabilir*
ve generic bir tip parametresinin sınırından tip bilgisi çıkarabilir.
Bu, aşağıdaki örnekteki `f` gibi fonksiyonların hem
belirli iterable tipini (`List` ya da `Set`) *hem de* eleman tipini korumasını sağlar.
Sınırları kullanarak çıkarımdan önce bu,
tip güvenliğini ya da belirli tip bilgisini kaybetmeden mümkün değildi.

```dart
(X, Y) f<X extends Iterable<Y>, Y>(X x) => (x, x.first);

void main() {
  var (myList, myInt) = f([1]);
  myInt.whatever; // Derleme zamanı hatası, `myInt`'in tipi `int`.

  var (mySet, myString) = f({'Hello!'});
  mySet.union({}); // Çalışır, `mySet`'in tipi `Set<String>`.
}
```

Sınırları kullanarak çıkarım olmasaydı `myInt`'in tipi `dynamic` olurdu.
Önceki çıkarım algoritması hatalı `myInt.whatever` ifadesini
derleme zamanında yakalayamaz, bunun yerine çalışma zamanında hata fırlatırdı.
Tersine, sınırları kullanarak çıkarım olmadan `mySet.union({})`
derleme zamanı hatası olurdu, çünkü önceki algoritma
`mySet`'in bir `Set` olduğu bilgisini koruyamazdı.

Sınırları kullanarak çıkarım algoritması hakkında daha fazla bilgi için
[tasarım belgesini](https://github.com/dart-lang/language/blob/main/accepted/future-releases/3009-inference-using-bounds/design-document.md#motivating-example) okuyun.

### Tiplerin yerine koyulması

Bir metodu override ettiğinizde, bir tipteki bir şeyi (eski
metotta) yeni bir tipe sahip olabilecek bir şeyle (yeni metotta) değiştirirsiniz.
Benzer şekilde, bir fonksiyona argüman geçirdiğinizde,
bir tipe sahip bir şeyi (tanımlı tipi olan bir parametreyi)
başka bir tipe sahip bir şeyle (gerçek argümanla) değiştirirsiniz.
Bir tipe sahip bir şeyi ne zaman bir alt tipe ya da üst tipe
sahip bir şeyle değiştirebilirsiniz?

Tipleri yerine koyarken *tüketiciler (consumer)* ve
*üreticiler (producer)* açısından düşünmek işe yarar. Tüketici bir tipi alır, üretici bir tip üretir.

**Bir tüketicinin tipini bir üst tiple, bir üreticinin
tipini ise bir alt tiple değiştirebilirsiniz.**

Basit tip atamasına ve generic tiplerle atamaya ilişkin
örneklere bakalım.

#### Basit tip ataması

Nesneleri nesnelere atarken bir tipi ne zaman farklı bir tiple
değiştirebilirsiniz? Cevap, nesnenin bir tüketici mi yoksa bir
üretici mi olduğuna bağlıdır.

Aşağıdaki tip hiyerarşisini düşünün:

![Üst tipi Animal, alt tipleri Alligator, Cat ve HoneyBadger olan bir hayvan hiyerarşisi. Cat'in alt tipleri Lion ve MaineCoon.](https://dart.dev/assets/img/language/type-hierarchy.png)

`Cat c`'nin bir *tüketici*, `Cat()`'in ise bir *üretici*
olduğu şu basit atamayı düşünün:

```dart
Cat c = Cat();
```

Tüketen konumda, belirli bir tipi (`Cat`) tüketen bir şeyi
her şeyi (`Animal`) tüketen bir şeyle değiştirmek güvenlidir;
bu yüzden `Cat c`'yi `Animal c` ile değiştirmeye izin verilir, çünkü `Animal`,
`Cat`'in bir üst tipidir.

*statik analiz: başarılı*

```dart
Animal c = Cat();
```

Ancak `Cat c`'yi `MaineCoon c` ile değiştirmek tip güvenliğini bozar,
çünkü üst sınıf `Lion` gibi farklı davranışları olan
bir `Cat` tipi sağlayabilir:

*statik analiz: başarısız*

```dart
MaineCoon c = Cat();
```

Üreten konumda, bir tip (`Cat`) üreten bir şeyi daha belirli bir tiple
(`MaineCoon`) değiştirmek güvenlidir. Bu yüzden aşağıdakine
izin verilir:

*statik analiz: başarılı*

```dart
Cat c = MaineCoon();
```

#### Generic tip ataması

Generic tipler için kurallar aynı mı? Evet. Hayvan listelerinin
hiyerarşisini düşünün: `Cat`'lerden oluşan bir `List`,
`Animal`'lardan oluşan bir `List`'in alt tipi,
`MaineCoon`'lardan oluşan bir `List`'in ise üst tipidir:

![List<Animal> -> List<Cat> -> List<MaineCoon>](https://dart.dev/assets/img/language/type-hierarchy-generics.png)

Aşağıdaki örnekte
`myCats`'e bir `MaineCoon` listesi atayabilirsiniz,
çünkü `List<MaineCoon>`, `List<Cat>`'in bir alt tipidir:

*statik analiz: başarılı*

```dart
List<MaineCoon> myMaineCoons = ...
List<Cat> myCats = myMaineCoons;
```

Peki ters yönde ne olur?
Bir `Animal` listesini bir `List<Cat>`'e atayabilir misiniz?

*statik analiz: başarısız*

```dart
List<Animal> myAnimals = ...
List<Cat> myCats = myAnimals;
```

Bu atama statik analizden geçmez,
çünkü `Animal` gibi `dynamic` olmayan tiplerden
izin verilmeyen örtük bir aşağı dönüşüm oluşturur.

Bu tür bir kodun statik analizden geçmesi için
açık bir dönüşüm (explicit cast) kullanabilirsiniz.

```dart
List<Animal> myAnimals = ...
List<Cat> myCats = myAnimals as List<Cat>;
```

Yine de açık bir dönüşüm, dönüştürülen listenin (`myAnimals`) gerçek tipine
bağlı olarak çalışma zamanında başarısız olabilir.

#### Metotlar

Bir metodu override ederken üretici ve tüketici kuralları yine geçerlidir.
Örneğin:

![chase metodunu tüketici, parent getter'ını üretici olarak gösteren Animal sınıfı](https://dart.dev/assets/img/language/consumer-producer-methods.png)

Bir tüketici için (`chase(Animal)` metodu gibi) parametre tipini
bir üst tiple değiştirebilirsiniz. Bir üretici için (`parent`
getter metodu gibi) dönüş tipini bir alt tiple
değiştirebilirsiniz.

Daha fazla bilgi için
[Metotları override ederken sağlam dönüş tipleri kullanın](https://dart.dev/language/type-system#use-proper-return-types)
ve [Metotları override ederken sağlam parametre tipleri kullanın](https://dart.dev/language/type-system#use-proper-param-types) bölümlerine bakın.

##### Kovaryant parametreler

Bazı (nadiren kullanılan) kodlama kalıpları, bir parametrenin tipini
bir alt tiple override ederek tipi daraltmaya dayanır; bu geçersizdir.
Bu durumda analizciye bunu bilerek yaptığınızı söylemek için
`covariant` anahtar kelimesini kullanabilirsiniz.
Bu, statik hatayı kaldırır ve bunun yerine geçersiz
argüman tipini çalışma zamanında kontrol eder.

Aşağıda `covariant`'ı nasıl kullanabileceğiniz gösteriliyor:

*statik analiz: başarılı*

```dart
class Animal {
  void chase(Animal x) {
     ...
  }
}

class Mouse extends Animal {
   ...
}

class Cat extends Animal {
  @override
  void chase(covariant Mouse x) {
     ...
  }
}
```

Bu örnek `covariant`'ın alt tipte kullanımını gösterse de
`covariant` anahtar kelimesi üst sınıftaki ya da
alt sınıftaki metoda yerleştirilebilir.
Genellikle en iyi yer üst sınıftaki metottur.
`covariant` anahtar kelimesi tek bir parametreye uygulanır ve
setter'larda ve alanlarda da desteklenir.

### Diğer kaynaklar

Aşağıdaki kaynaklarda sağlam Dart hakkında daha fazla bilgi bulunur:

- [Fixing type promotion failures](https://dart.dev/tools/non-promotion-reasons) -
  Tip yükseltme (type promotion) hatalarını anlayın ve nasıl düzelteceğinizi öğrenin.
- [Sound null safety](https://dart.dev/null-safety) -
  Sağlam null güvenliğiyle kod yazmayı öğrenin.
- [Customizing static analysis](https://dart.dev/tools/analysis) -
  Bir analiz seçenekleri dosyası kullanarak analizciyi ve linter'ı
  kurma ve özelleştirme.


---

# Desenler (Patterns)

## Desenler

*Dart'taki desenlerin (pattern) özeti.* · Kaynak: <https://dart.dev/language/patterns>

> **Sürüm notu:**
>
> Desenler en az 3.0 [dil sürümü](https://dart.dev/language/versioning) gerektirir.

Desenler (pattern), deyimler (statement) ve ifadeler (expression) gibi
Dart dilinde bir sözdizimi kategorisidir.
Bir desen, gerçek değerlerle eşleştirilebilecek
bir değer kümesinin şeklini temsil eder.

Bu sayfada şunlar anlatılıyor:

- Desenlerin ne yaptığı.
- Dart kodunda desenlerin nerelerde kullanılabildiği.
- Desenlerin yaygın kullanım alanları.

Farklı desen türleri hakkında bilgi için
[desen tipleri](https://dart.dev/language/pattern-types) sayfasını ziyaret edin.

### Desenler ne yapar?

Genel olarak bir desen, bağlama ve desenin şekline göre bir değeri **eşleştirebilir**,
bir değeri **ayrıştırabilir** ya da her ikisini birden yapabilir.

Önce *desen eşleştirme*, verilen bir değerin şunları sağlayıp sağlamadığını kontrol etmenize olanak tanır:

- Belirli bir şekle sahip olma.
- Belirli bir sabit olma.
- Başka bir şeye eşit olma.
- Belirli bir tipte olma.

Ardından *desen ayrıştırma (destructuring)*, o değeri parçalarına ayırmak için
kullanışlı, bildirimsel (declarative) bir sözdizimi sunar. Aynı desen, bu süreçte
değişkenleri o parçaların bir kısmına ya da tamamına bağlamanıza da olanak tanıyabilir.

#### Eşleştirme

Bir desen, değerin beklediğiniz biçimde olup olmadığını belirlemek için her zaman bir değere karşı
test edilir. Başka bir deyişle, değerin desenle *eşleşip eşleşmediğini* kontrol edersiniz.

Neyin eşleşme sayılacağı [hangi tür deseni](https://dart.dev/language/pattern-types) kullandığınıza bağlıdır.
Örneğin bir sabit deseni, değer desenin sabitine eşitse
eşleşir:

```dart
switch (number) {
  // Sabit desen 1 == number ise eşleşir.
  case 1:
    print('one');
}
```

Birçok desen alt desenlerden yararlanır; bunlara bazen sırasıyla *dış* ve *iç*
desenler denir. Desenler alt desenleri üzerinde özyinelemeli (recursive) olarak eşleşir.
Örneğin herhangi bir [koleksiyon tipi](https://dart.dev/language/collections)
deseninin tek tek alanları
[değişken desenleri](https://dart.dev/language/pattern-types#variable) ya da [sabit desenleri](https://dart.dev/language/pattern-types#constant) olabilir:

```dart
const a = 'a';
const b = 'b';
switch (obj) {
  // [a, b] list deseni, obj iki alanlı bir liste ise önce obj ile eşleşir,
  // sonra alanları 'a' ve 'b' sabit alt desenleriyle eşleşirse.
  case [a, b]:
    print('$a, $b');
}
```

Eşleşen bir değerin bazı kısımlarını yok saymak için yer tutucu olarak
[joker (wildcard) desen](https://dart.dev/language/pattern-types#wildcard) kullanabilirsiniz. List desenlerinde ise [rest elemanı](https://dart.dev/language/pattern-types#rest-element) kullanabilirsiniz.

#### Ayrıştırma

Bir nesne ile desen eşleştiğinde desen nesnenin verilerine erişebilir
ve onları parçalar halinde çıkarabilir. Başka bir deyişle desen nesneyi *ayrıştırır*:

```dart
var numList = [1, 2, 3];
// [a, b, c] list deseni numList'teki üç elemanı ayrıştırır...
var [a, b, c] = numList;
// ...ve onları yeni değişkenlere atar.
print(a + b + c);
```

Bir ayrıştırma deseninin içine [her tür deseni](https://dart.dev/language/pattern-types) yerleştirebilirsiniz.
Örneğin bu case deseni, ilk elemanı `'a'` ya da `'b'` olan
iki elemanlı bir listeyi eşleştirir ve ayrıştırır:

```dart
switch (list) {
  case ['a' || 'b', var c]:
    print(c);
}
```

### Desenlerin kullanılabildiği yerler

Desenleri Dart dilinde birkaç yerde kullanabilirsiniz:

- Yerel değişken [tanımları](https://dart.dev/language/patterns#variable-declaration) ve [atamaları](https://dart.dev/language/patterns#variable-assignment)
- [for ve for-in döngüleri](https://dart.dev/language/loops#for-loops)
- [if-case](https://dart.dev/language/branches#if-case) ve [switch-case](https://dart.dev/language/branches#switch-statements)
- [Koleksiyon literal'lerinde](https://dart.dev/language/collections#control-flow-operators) kontrol akışı

Bu bölümde desenlerle eşleştirme ve ayrıştırmanın yaygın kullanım alanları anlatılıyor.

#### Değişken tanımı

Dart'ın yerel değişken tanımına izin verdiği her yerde
*desen değişken tanımı* kullanabilirsiniz.
Desen, tanımın sağındaki değerle eşleştirilir.
Eşleştikten sonra değeri ayrıştırır ve yeni yerel değişkenlere bağlar:

```dart
// Yeni a, b ve c değişkenlerini tanımlar.
var (a, [b, c]) = ('str', [1, 2]);
```

Bir desen değişken tanımı `var` ya da `final` ile başlamalı, ardından
bir desen gelmelidir.

#### Değişken ataması

Bir *değişken atama deseni* bir atamanın sol tarafında yer alır.
Önce eşleşen nesneyi ayrıştırır. Sonra değerleri yenilerini bağlamak yerine
*var olan* değişkenlere atar.

Üçüncü bir geçici değişken tanımlamadan iki değişkenin değerlerini
yer değiştirmek için bir değişken atama deseni kullanın:

```dart
var (a, b) = ('left', 'right');
(b, a) = (a, b); // Yer değiştir.
print('$a $b'); // "right left" yazdırır.
```

#### Switch deyimleri ve ifadeleri

Her case cümlesi bir desen içerir. Bu, [switch deyimleri](https://dart.dev/language/branches#switch-statements)
ve [ifadeleri](https://dart.dev/language/branches#switch-expressions) ile
[if-case deyimleri](https://dart.dev/language/branches#if-case) için geçerlidir.
Bir case içinde [her tür deseni](https://dart.dev/language/pattern-types) kullanabilirsiniz.

*Case desenleri* [çürütülebilirdir (refutable)](https://dart.dev/resources/glossary#refutable-pattern),
yani bir değere karşı test edilebilirler.
Kontrol akışının şunlardan birini yapmasına izin verirler:

- Üzerinde switch yapılan nesneyi eşleştirip ayrıştırmak.
- Nesne eşleşmezse çalışmaya devam etmek.

Bir desenin bir case içinde ayrıştırdığı değerler yerel değişken olur.
Kapsamları yalnızca o case'in gövdesidir.

```dart
switch (obj) {
  // 1 == obj ise eşleşir.
  case 1:
    print('one');

  // obj'nin değeri 'first' ve 'last' sabit
  // değerleri arasındaysa eşleşir.
  case >= first && <= last:
    print('in range');

  // obj iki alanlı bir record ise eşleşir,
  // sonra alanları 'a' ve 'b'ye atar.
  case (var a, var b):
    print('a = $a, b = $b');

  default:
}
```

[Mantıksal-veya desenleri](https://dart.dev/language/pattern-types#logical-or), switch ifadelerinde ya da deyimlerinde
birden fazla case'in aynı gövdeyi paylaşması için kullanışlıdır:

```dart
var isPrimary = switch (color) {
  Color.red || Color.yellow || Color.blue => true,
  _ => false,
};
```

Switch deyimlerinde birden fazla case,
[mantıksal-veya deseni kullanmadan](https://dart.dev/language/branches#switch-share) da aynı gövdeyi paylaşabilir; ancak bu desenler
birden fazla case'in aynı [koruma ifadesini (guard)](https://dart.dev/language/branches#guard-clause) paylaşmasını sağlamak için hâlâ benzersiz şekilde kullanışlıdır:

```dart
switch (shape) {
  case Square(size: var s) || Circle(size: var s) when s > 0:
    print('Non-empty symmetric shape');
}
```

[Koruma ifadeleri](https://dart.dev/language/branches#guard-clause), case'in bir parçası olarak keyfi bir koşulu değerlendirir;
koşul false olsa bile switch'ten çıkmaz
(case gövdesinde bir `if` deyimi kullanmak buna yol açardı).

```dart
switch (pair) {
  case (int a, int b):
    if (a > b) print('First element greater');
  // false ise hiçbir şey yazdırmaz ve switch'ten çıkar.
  case (int a, int b) when a > b:
    // false ise hiçbir şey yazdırmaz ama sonraki case'e geçer.
    print('First element greater');
  case (int a, int b):
    print('First element not greater');
}
```

#### For ve for-in döngüleri

Bir koleksiyondaki değerler üzerinde dolaşmak ve onları ayrıştırmak için
[for ve for-in döngülerinde](https://dart.dev/language/loops#for-loops) desen kullanabilirsiniz.

Bu örnek, bir `<Map>.entries` çağrısının döndürdüğü
[`MapEntry`](https://api.dart.dev/dart-core/MapEntry-class.html)
nesnelerini ayrıştırmak için bir for-in döngüsünde [nesne ayrıştırma](https://dart.dev/language/pattern-types#object) kullanır:

```dart
Map<String, int> hist = {'a': 23, 'b': 100};

for (var MapEntry(key: key, value: count) in hist.entries) {
  print('$key occurred $count times');
}
```

Nesne deseni, `hist.entries`'in `MapEntry` isimli tipinde olduğunu kontrol eder,
ardından `key` ve `value` isimli alan alt desenlerine iner.
Her yinelemede `MapEntry` üzerinde `key` getter'ını ve `value` getter'ını çağırır
ve sonuçları sırasıyla `key` ve `count` yerel değişkenlerine bağlar.

Bir getter çağrısının sonucunu aynı isimli bir değişkene bağlamak yaygın bir
kullanımdır; bu yüzden nesne desenleri getter adını
[değişken alt deseninden](https://dart.dev/language/pattern-types#variable) de çıkarabilir. Bu, değişken desenini
`key: key` gibi gereksiz tekrarlı bir halden yalnızca `:key` haline sadeleştirmenizi sağlar:

```dart
for (var MapEntry(:key, value: count) in hist.entries) {
  print('$key occurred $count times');
}
```

### Desenlerin kullanım alanları

[Önceki bölüm](https://dart.dev/language/patterns#places-patterns-can-appear),
desenlerin diğer Dart kod yapılarına *nasıl* uyduğunu anlatıyor.
Örnek olarak iki değişkenin değerlerini [yer değiştirmek](https://dart.dev/language/patterns#variable-assignment)
ya da bir map'teki
[anahtar-değer çiftlerini ayrıştırmak](https://dart.dev/language/patterns#for-and-for-in-loops)
gibi ilginç kullanımlar gördünüz. Bu bölüm daha da fazla kullanım alanını anlatarak şu sorulara cevap veriyor:

- Desenleri *ne zaman ve neden* kullanmak isteyebilirsiniz.
- Hangi tür sorunları çözerler.
- En çok hangi deyimsel kullanımlara uygundurlar.

#### Birden çok dönüş değerini ayrıştırma

Record'lar, tek bir fonksiyon çağrısından birden çok değeri toplayıp
[döndürmeyi](https://dart.dev/language/records#multiple-returns) sağlar.
Desenler ise bir record'un alanlarını, fonksiyon çağrısıyla aynı satırda
doğrudan yerel değişkenlere ayrıştırma yeteneği ekler.

Her record alanı için tek tek yeni yerel değişkenler tanımlamak yerine,
yani şöyle yazmak yerine:

```dart
var info = userInfo(json);
var name = info.$1;
var age = info.$2;
```

Bir fonksiyonun döndürdüğü record'un alanlarını, bir [değişken tanımı](https://dart.dev/language/patterns#variable-declaration) ya da
[atama deseni](https://dart.dev/language/patterns#variable-assignment) ile, alt desen olarak da bir [record deseni](https://dart.dev/language/pattern-types#record)
kullanarak yerel değişkenlere ayrıştırabilirsiniz:

```dart
var (name, age) = userInfo(json);
```

İsimli alanları olan bir record'u desenle ayrıştırmak için:

```dart
final (:name, :age) =
    getData(); // Örneğin, return (name: 'doug', age: 25);
```

#### Sınıf örneklerini ayrıştırma

[Nesne desenleri](https://dart.dev/language/pattern-types#object) isimli nesne tipleriyle eşleşir ve
nesnenin sınıfının zaten sunduğu getter'ları kullanarak verilerini ayrıştırmanızı sağlar.

Bir sınıfın örneğini ayrıştırmak için isimli tipi,
ardından ayrıştırılacak özellikleri
parantez içinde yazın:

```dart
final Foo myFoo = Foo(one: 'one', two: 2);
var Foo(:one, :two) = myFoo;
print('one $one, two $two');
```

#### Cebirsel veri tipleri

Nesne ayrıştırma ve switch case'leri,
[cebirsel veri tipi (algebraic data type)](https://en.wikipedia.org/wiki/Algebraic_data_type)
tarzında kod yazmaya elverişlidir.
Bu yöntemi şu durumlarda kullanın:

- Birbiriyle ilişkili tiplerden oluşan bir aileniz varsa.
- Her tip için özel davranış gerektiren bir işleminiz varsa.
- Bu davranışı tüm farklı tip tanımlarına dağıtmak yerine
  tek bir yerde toplamak istiyorsanız.

İşlemi her tip için bir örnek metodu olarak uygulamak yerine,
işlemin çeşitlerini alt tipler üzerinde switch yapan tek bir fonksiyonda tutun:

```dart
sealed class Shape {}

class Square implements Shape {
  final double length;
  Square(this.length);
}

class Circle implements Shape {
  final double radius;
  Circle(this.radius);
}

double calculateArea(Shape shape) => switch (shape) {
  Square(length: var l) => l * l,
  Circle(radius: var r) => math.pi * r * r,
};
```

#### Gelen JSON'u doğrulama

[Map](https://dart.dev/language/pattern-types#map) ve [list](https://dart.dev/language/pattern-types#list) desenleri, JSON'dan ayrıştırılmış veriler gibi
serileştirmesi çözülmüş (deserialized) verilerdeki anahtar-değer çiftlerini ayrıştırmak için çok uygundur:

```dart
var data = {
  'user': ['Lily', 13],
};
var {'user': [name, age]} = data;
```

JSON verisinin beklediğiniz yapıda olduğunu biliyorsanız
önceki örnek gerçekçidir.
Ancak veri genellikle ağ gibi harici bir kaynaktan gelir.
Yapısını doğrulamak için önce veriyi doğrulamanız gerekir.

Desenler olmadan doğrulama uzun ve zahmetlidir:

```dart
if (data is Map<String, Object?> && data.containsKey('user')) {
  var user = data['user'];
  if (user is List<Object?> &&
      user.length == 2 &&
      user[0] is String &&
      user[1] is int) {
    var name = user[0] as String;
    var age = user[1] as int;
    print('User $name is $age years old.');
  }
}
```

Tek bir [case deseni](https://dart.dev/language/patterns#switch-statements-and-expressions)
aynı doğrulamayı yapabilir.
Tek case'ler en iyi [if-case](https://dart.dev/language/branches#if-case) deyimleri olarak çalışır.
Desenler JSON'u doğrulamak için daha bildirimsel ve çok daha kısa
bir yöntem sunar:

```dart
if (data case {'user': [String name, int age]}) {
  print('User $name is $age years old.');
}
```

Bu case deseni aynı anda şunları doğrular:

- `data` bir map'tir, çünkü devam etmek için önce dıştaki
  [map deseniyle](https://dart.dev/language/pattern-types#map) eşleşmelidir.
  - Ve bir map olduğu için `data`'nın null olmadığını da doğrular.
- `data` bir `user` anahtarı içerir.
- `user` anahtarı iki değerli bir listeyle eşleşir.
- Listedeki değerlerin tipleri `String` ve `int`'tir.
- Değerleri tutacak yeni yerel değişkenler `name` ve `age`'dir.


## Desen tipleri

*Dart'taki desen tipleri için başvuru kaynağı.* · Kaynak: <https://dart.dev/language/pattern-types>

Bu sayfa farklı desen türleri için bir başvuru kaynağıdır.
Desenlerin nasıl çalıştığına, Dart'ta nerelerde kullanılabildiğine ve yaygın
kullanım alanlarına genel bir bakış için ana [Desenler](https://dart.dev/language/patterns) sayfasını ziyaret edin.

##### Desen önceliği

[Operatör önceliğine](https://dart.dev/language/operators#operator-precedence-example) benzer şekilde,
desenlerin değerlendirilmesi de öncelik kurallarına uyar.
Düşük öncelikli desenleri önce değerlendirmek için
[parantezli desenler](https://dart.dev/language/pattern-types#parenthesized) kullanabilirsiniz.

Bu belge desen tiplerini artan öncelik sırasına göre listeler:

- [Mantıksal-veya](https://dart.dev/language/pattern-types#logical-or) desenleri [mantıksal-ve](https://dart.dev/language/pattern-types#logical-and) desenlerinden daha düşük önceliklidir,
  mantıksal-ve desenleri [ilişkisel](https://dart.dev/language/pattern-types#relational)
  desenlerden daha düşük önceliklidir,
  ve bu böyle devam eder.
- Sonek (post-fix) tekli desenler ([cast](https://dart.dev/language/pattern-types#cast), [null-check](https://dart.dev/language/pattern-types#null-check)
  ve [null-assert](https://dart.dev/language/pattern-types#null-assert)) aynı öncelik düzeyini paylaşır.
- Geri kalan birincil desenler en yüksek önceliği paylaşır.
  Koleksiyon tipi ([record](https://dart.dev/language/pattern-types#record), [list](https://dart.dev/language/pattern-types#list) ve
  [map](https://dart.dev/language/pattern-types#map))
  ve [Object](https://dart.dev/language/pattern-types#object) desenleri başka verileri
  kapsadığı için dış desenler olarak önce değerlendirilir.

### Mantıksal-veya (logical-or)

`subpattern1 || subpattern2`

Bir mantıksal-veya deseni alt desenleri `||` ile ayırır ve dallardan herhangi biri
eşleşirse eşleşir. Dallar soldan sağa değerlendirilir. Bir dal eşleştiğinde
geri kalanlar değerlendirilmez.

```dart
var isPrimary = switch (color) {
  Color.red || Color.yellow || Color.blue => true,
  _ => false,
};
```

Bir mantıksal-veya desenindeki alt desenler değişken bağlayabilir, ancak dallar
aynı değişken kümesini tanımlamalıdır, çünkü desen eşleştiğinde yalnızca bir dal
değerlendirilecektir.

### Mantıksal-ve (logical-and)

`subpattern1 && subpattern2`

`&&` ile ayrılmış bir desen çifti yalnızca iki alt desen de eşleşirse eşleşir.
Sol dal eşleşmezse sağ dal değerlendirilmez.

Bir mantıksal-ve desenindeki alt desenler değişken bağlayabilir, ancak her alt
desendeki değişkenler çakışmamalıdır, çünkü desen eşleşirse
ikisi de bağlanacaktır:

```dart
switch ((1, 2)) {
  // Hata, iki alt desen de 'b'yi bağlamaya çalışıyor.
  case (var a, var b) && (var b, var c): // ...
}
```

### İlişkisel (relational)

`== expression`

`< expression`

İlişkisel desenler, eşleşen değeri verilen bir sabitle şu eşitlik ya da
ilişkisel operatörlerden herhangi birini kullanarak karşılaştırır: `==`, `!=`, `<`,
`>`, `<=` ve `>=`.

Eşleşen değer üzerinde ilgili operatörü sabiti argüman olarak vererek çağırmak
`true` döndürdüğünde desen eşleşir.

İlişkisel desenler, özellikle [mantıksal-ve deseniyle](https://dart.dev/language/pattern-types#logical-and)
birlikte kullanıldığında, sayısal aralıklarda eşleştirme yapmak için kullanışlıdır:

```dart
String asciiCharType(int char) {
  const space = 32;
  const zero = 48;
  const nine = 57;

  return switch (char) {
    < space => 'control',
    == space => 'space',
    > space && < zero => 'punctuation',
    >= zero && <= nine => 'digit',
    _ => '',
  };
}
```

### Cast (tip dönüşümü)

`foo as String`

Bir cast deseni, değeri başka bir alt desene geçirmeden önce,
ayrıştırmanın ortasına bir [tip dönüşümü](https://dart.dev/language/operators#type-test-operators) eklemenizi sağlar:

```dart
(num, Object) record = (1, 's');
var (i as int, s as String) = record;
```

Değer belirtilen tipte değilse cast desenleri istisna [fırlatır](https://dart.dev/language/error-handling#throw).
[null-assert deseni](https://dart.dev/language/pattern-types#null-assert) gibi bu da ayrıştırılmış bir değerin
beklenen tipini zorla doğrulamanızı sağlar.

### Null-check

`subpattern?`

Null-check desenleri önce değer null değilse eşleşir, ardından iç deseni
aynı değerle eşleştirir. Eşleştirilen null olabilir değerin null olamayan temel
tipinde bir değişken bağlamanızı sağlarlar.

`null` değerleri istisna fırlatmadan eşleşme başarısızlığı
olarak ele almak için null-check desenini kullanın.

```dart
String? maybeString = 'nullable with base type String';
switch (maybeString) {
  case var s?:
  // 's' burada null olamayan String tipindedir.
}
```

Değer null *olduğunda* eşleştirmek için `null` [sabit desenini](https://dart.dev/language/pattern-types#constant) kullanın.

### Null-assert

`subpattern!`

Null-assert desenleri önce nesne null değilse eşleşir, sonra değer üzerinde eşleşir.
Null olmayan değerlerin geçmesine izin verirler, ancak eşleşen değer
null ise istisna [fırlatırlar](https://dart.dev/language/error-handling#throw).

`null` değerlerin sessizce eşleşme başarısızlığı olarak ele alınmamasını sağlamak için
eşleştirme sırasında bir null-assert deseni kullanın:

```dart
List<String?> row = ['user', null];
switch (row) {
  case ['user', var name!]: // ...
  // 'name' burada null olamayan bir string'dir.
}
```

Değişken tanımı desenlerinden `null` değerleri elemek için
null-assert desenini kullanın:

```dart
(int?, int?) position = (2, 3);

var (x!, y!) = position;
```

Değer null *olduğunda* eşleştirmek için `null` [sabit desenini](https://dart.dev/language/pattern-types#constant) kullanın.

### Sabit (constant)

`123, null, 'string', math.pi, SomeClass.constant, const Thing(1, 2), const (1 + 2)`

Sabit desenleri, değer sabite eşit olduğunda eşleşir:

```dart
switch (number) {
  // 1 == number ise eşleşir.
  case 1: // ...
}
```

Basit literal'leri ve isimli sabitlere yapılan başvuruları doğrudan sabit deseni olarak kullanabilirsiniz:

- Sayı literal'leri (`123`, `45.56`)
- Boolean literal'leri (`true`)
- String literal'leri (`'string'`)
- İsimli sabitler (`someConstant`, `math.pi`, `double.infinity`)
- Sabit yapıcılar (`const Point(0, 0)`)
- Sabit koleksiyon literal'leri (`const []`, `const {1, 2}`)

Daha karmaşık sabit ifadeler paranteze alınmalı ve önüne
`const` eklenmelidir (`const (1 + 2)`):

```dart
// List ya da map deseni:
case [a, b]: // ...

// List ya da map literal'i:
case const [a, b]: // ...
```

### Değişken (variable)

`var bar, String str, final int _`

Değişken desenleri, eşleşmiş ya da ayrıştırılmış değerlere yeni değişkenler bağlar.
Genellikle ayrıştırılmış bir değeri yakalamak için bir
[ayrıştırma deseninin](https://dart.dev/language/patterns#destructuring)
parçası olarak bulunurlar.

Değişkenler, yalnızca desen eşleştiğinde ulaşılabilen kod bölgesinde
kapsam içindedir.

```dart
switch ((1, 2)) {
  // 'var a' ve 'var b', sırasıyla 1 ve 2'ye bağlanan değişken desenleridir.
  case (var a, var b): // ...
  // 'a' ve 'b', case gövdesinde kapsam içindedir.
}
```

*Tipli* bir değişken deseni yalnızca eşleşen değer tanımlanan tipteyse eşleşir,
aksi halde başarısız olur:

```dart
switch ((1, 2)) {
  // Eşleşmez.
  case (int a, String b): // ...
}
```

Bir [joker deseni](https://dart.dev/language/pattern-types#wildcard) değişken deseni olarak kullanabilirsiniz.

### Tanımlayıcı (identifier)

`foo, _`

Tanımlayıcı desenleri, bulundukları bağlama göre
bir [sabit deseni](https://dart.dev/language/pattern-types#constant) ya da bir [değişken deseni](https://dart.dev/language/pattern-types#variable)
gibi davranır:

- [Tanım](https://dart.dev/language/patterns#variable-declaration) bağlamı: Tanımlayıcı adıyla yeni bir değişken tanımlar:
  `var (a, b) = (1, 2);`
- [Atama](https://dart.dev/language/patterns#variable-assignment) bağlamı: Tanımlayıcı adıyla var olan değişkene atama yapar:
  `(a, b) = (3, 4);`
- [Eşleştirme](https://dart.dev/language/patterns#matching) bağlamı: İsimli bir sabit deseni olarak ele alınır (adı
  `_` değilse):

  ```dart
  const c = 1;
  switch (2) {
    case c:
      print('match $c');
    default:
      print('no match'); // "no match" yazdırır.
  }
  ```
- Herhangi bir bağlamda [joker](https://dart.dev/language/pattern-types#wildcard) tanımlayıcı: Her değerle eşleşir ve onu atar:
  `case [_, var y, _]: print('The middle element is $y');`

### Parantezli (parenthesized)

`(subpattern)`

Parantezli ifadelerde olduğu gibi, bir desendeki parantezler
[desen önceliğini](https://dart.dev/language/pattern-types#pattern-precedence) kontrol etmenizi ve daha yüksek öncelikli
bir desen beklenen yere daha düşük öncelikli bir desen yerleştirmenizi sağlar.

Örneğin `x`, `y` ve `z` boolean sabitlerinin
sırasıyla `true`, `true` ve `false` olduğunu düşünün.
Aşağıdaki örnek boolean ifade değerlendirmesine benzese de
aslında desen eşleştirmesi yapar.

```dart
// ...
x || y => 'matches true',
x || y && z => 'matches true',
x || (y && z) => 'matches true',
// `x || y && z`, `x || (y && z)` ile aynı şeydir.
(x || y) && z => 'matches nothing',
// ...
```

Dart deseni soldan sağa doğru eşleştirmeye başlar.

1. İlk desen `true` ile eşleşir, çünkü `x` `true` ile eşleşir.
2. İkinci desen `true` ile eşleşir, çünkü `x` `true` ile eşleşir.
3. Üçüncü desen `true` ile eşleşir, çünkü `x` `true` ile eşleşir.
4. Dördüncü desen `(x || y) && z` hiçbir şeyle eşleşmez.

   - `x` `true` ile eşleştiği için Dart `y`'yi eşleştirmeyi denemez.
   - `(x || y)` `true` ile eşleşse de `z` `true` ile eşleşmez.
   - Bu yüzden `(x || y) && z` deseni `true` ile eşleşmez.
   - `(x || y)` alt deseni `false` ile eşleşmez,
     bu yüzden Dart `z`'yi eşleştirmeyi denemez.
   - Bu yüzden `(x || y) && z` deseni `false` ile eşleşmez.
   - Sonuç olarak `(x || y) && z` hiçbir şeyle eşleşmez.

### List

`[subpattern1, subpattern2]`

Bir list deseni [`List`](https://dart.dev/language/collections#lists)'i uygulayan değerlerle eşleşir, ardından
alt desenlerini listenin elemanlarıyla özyinelemeli olarak eşleştirerek onları konumlarına göre ayrıştırır:

```dart
const a = 'a';
const b = 'b';
switch (obj) {
  // [a, b] list deseni, obj iki alanlı bir liste ise önce obj ile eşleşir,
  // sonra alanları 'a' ve 'b' sabit alt desenleriyle eşleşirse.
  case [a, b]:
    print('$a, $b');
}
```

List desenleri, desendeki eleman sayısının listenin tamamıyla eşleşmesini
gerektirir. Ancak listedeki herhangi sayıda elemanı karşılamak için yer tutucu olarak
bir [rest elemanı](https://dart.dev/language/pattern-types#rest-element) kullanabilirsiniz.

#### Rest elemanı

List desenleri, keyfi uzunluktaki listelerle eşleşmeye olanak tanıyan
*bir* rest elemanı (`...`) içerebilir.

```dart
var [a, b, ..., c, d] = [1, 2, 3, 4, 5, 6, 7];
// "1 2 6 7" yazdırır.
print('$a $b $c $d');
```

Bir rest elemanının, listedeki diğer alt desenlerle eşleşmeyen elemanları
yeni bir listede toplayan bir alt deseni de olabilir:

```dart
var [a, b, ...rest, c, d] = [1, 2, 3, 4, 5, 6, 7];
// "1 2 [3, 4, 5] 6 7" yazdırır.
print('$a $b $rest $c $d');
```

### Map

`{"key": subpattern1, someConst: subpattern2}`

Map desenleri [`Map`](https://dart.dev/language/collections#maps)'i uygulayan değerlerle eşleşir, ardından
alt desenlerini map'in anahtarlarıyla özyinelemeli olarak eşleştirerek onları ayrıştırır.

Map desenleri desenin map'in tamamıyla eşleşmesini gerektirmez. Bir map deseni,
map'in içerdiği ama desenle eşleşmeyen anahtarları yok sayar.
Map'te olmayan bir anahtarı eşleştirmeye çalışmak
bir [`StateError`](https://api.dart.dev/dart-core/StateError-class.html) fırlatır:

```dart
final {'foo': int? foo} = {};
```

### Record

`(subpattern1, subpattern2)`

`(x: subpattern1, y: subpattern2)`

Record desenleri bir [record](https://dart.dev/language/records) nesnesiyle eşleşir ve alanlarını ayrıştırır.
Değer, desenle aynı [şekle](https://dart.dev/language/records#record-types) sahip bir record değilse
eşleşme başarısız olur. Aksi halde alan alt desenleri record'daki
karşılık gelen alanlarla eşleştirilir.

Record desenleri, desenin record'un tamamıyla eşleşmesini gerektirir. *İsimli*
alanları olan bir record'u desenle ayrıştırmak için alan adlarını desene ekleyin:

```dart
var (myString: foo, myNumber: bar) = (myString: 'string', myNumber: 1);
```

Getter adı yazılmayabilir ve alan alt desenindeki [değişken deseninden](https://dart.dev/language/pattern-types#variable)
ya da [tanımlayıcı deseninden](https://dart.dev/language/pattern-types#identifier) çıkarılabilir. Aşağıdaki desen
çiftlerinin her biri birbirine denktir:

```dart
// Değişken alt desenli record deseni:
var (untyped: untyped, typed: int typed) = record;
var (:untyped, :int typed) = record;

switch (record) {
  case (untyped: var untyped, typed: int typed): // ...
  case (:var untyped, :int typed): // ...
}

// null-check ve null-assert alt desenli record deseni:
switch (record) {
  case (checked: var checked?, asserted: var asserted!): // ...
  case (:var checked?, :var asserted!): // ...
}

// cast alt desenli record deseni:
var (untyped: untyped as int, typed: typed as String) = record;
var (:untyped as int, :typed as String) = record;
```

### Object (nesne)

`SomeClass(x: subpattern1, y: subpattern2)`

Nesne desenleri, nesnenin özelliklerindeki getter'ları kullanarak veriyi ayrıştırmak için
eşleşen değeri verilen bir isimli tiple karşılaştırır. Değer aynı tipte değilse
[çürütülürler (refuted)](https://dart.dev/resources/glossary#refutable-pattern), yani eşleşmezler.

```dart
switch (shape) {
  // shape Rect tipindeyse eşleşir, sonra Rect'in özellikleriyle karşılaştırılır.
  case Rect(width: var w, height: var h): // ...
}
```

Getter adı yazılmayabilir ve alan alt desenindeki [değişken deseninden](https://dart.dev/language/pattern-types#variable)
ya da [tanımlayıcı deseninden](https://dart.dev/language/pattern-types#identifier) çıkarılabilir:

```dart
// Yeni x ve y değişkenlerini Point'in x ve y özelliklerinin değerlerine bağlar.
var Point(:x, :y) = Point(1, 2);
```

Nesne desenleri desenin nesnenin tamamıyla eşleşmesini gerektirmez.
Bir nesnenin desenin ayrıştırmadığı ek alanları olsa bile eşleşebilir.

### Joker (wildcard)

`_`

`_` adlı bir desen jokerdir; hiçbir değişkene bağlama ya da atama yapmayan
bir [değişken deseni](https://dart.dev/language/pattern-types#variable) ya da
[tanımlayıcı desenidir](https://dart.dev/language/pattern-types#identifier).

Sonraki konumsal değerleri ayrıştırabilmek için bir alt desene ihtiyaç duyduğunuz
yerlerde yer tutucu olarak kullanışlıdır:

```dart
var list = [1, 2, 3];
var [_, two, _] = list;
```

Tip belirtimli bir joker adı, bir değerin tipini test etmek ama değeri
bir isme bağlamamak istediğinizde kullanışlıdır:

```dart
switch (record) {
  case (int _, String _):
    print('First field is int and second is String.');
}
```


---

# Kontrol akışı (Control flow)

## Döngüler

*Dart kodunuzun akışını kontrol etmek için döngüleri nasıl kullanacağınızı öğrenin.* · Kaynak: <https://dart.dev/language/loops>

Bu sayfa, Dart kodunuzun akışını döngüler ve onları destekleyen deyimlerle
nasıl kontrol edebileceğinizi gösterir:

- `for` döngüleri
- `while` ve `do while` döngüleri
- `break` ve `continue`

Dart'ta kontrol akışını şunlarla da yönetebilirsiniz:

- `if` ve `switch` gibi [dallanmalar](https://dart.dev/language/branches)
- `try`, `catch` ve `throw` gibi [istisnalar](https://dart.dev/language/error-handling)

### For döngüleri

Standart `for` döngüsüyle yineleme yapabilirsiniz. Örneğin:

```dart
var message = StringBuffer('Dart is fun');
for (var i = 0; i < 5; i++) {
  message.write('!');
}
```

Dart'ın `for` döngüleri içindeki closure'lar indeksin *değerini* yakalar.
Bu, JavaScript'te sık karşılaşılan bir tuzaktan kaçınmayı sağlar. Örneğin şunu düşünün:

```dart
var callbacks = [];
for (var i = 0; i < 2; i++) {
  callbacks.add(() => print(i));
}

for (final c in callbacks) {
  c();
}
```

Çıktı beklendiği gibi önce `0`, sonra `1` olur. Buna karşılık aynı örnek
JavaScript'te önce `2`, sonra yine `2` yazdırırdı.

`List` ya da `Set` gibi bir [`Iterable`](https://api.dart.dev/dart-core/Iterable-class.html)
tip üzerinde dolaşırken bazen o anki yineleme sayacını
bilmeniz gerekmeyebilir.
Bu durumda daha temiz bir kod için `for-in` döngüsünü kullanın:

```dart
for (var candidate in candidates) {
  candidate.interview();
}
```

Önceki örnek döngüde `candidate`
döngü gövdesi içinde tanımlanır ve
her seferinde `candidates`'teki bir değere başvuracak şekilde ayarlanır.
`candidate` yerel bir [değişkendir](https://dart.dev/language/variables).
Döngü gövdesi içinde `candidate`'e yeniden değer atamak yalnızca
o yinelemedeki yerel değişkeni değiştirir,
orijinal `candidates` iterable'ını değiştirmez.

Iterable'dan elde edilen değerleri işlemek için
bir `for-in` döngüsünde [desen](https://dart.dev/language/patterns)
de kullanabilirsiniz:

```dart
for (final Candidate(:name, :yearsExperience) in candidates) {
  print('$name has $yearsExperience of experience.');
}
```

> **İpucu:**
>
> `for-in` kullanımını pratik etmek için
> [Iterable collections eğitimini](https://dart.dev/libraries/collections/iterables) takip edin.

Iterable sınıflarının başka bir seçenek olarak bir
[forEach()](https://api.dart.dev/dart-core/Iterable/forEach.html) metodu da vardır:

```dart
var collection = [1, 2, 3];
collection.forEach(print); // 1 2 3
```

### While ve do-while

Bir `while` döngüsü koşulu döngüden önce değerlendirir:

```dart
while (!isDone()) {
  doSomething();
}
```

Bir `do`-`while` döngüsü koşulu döngüden *sonra* değerlendirir:

```dart
do {
  printLine();
} while (!atEndOfPage());
```

### Break ve continue

Döngüyü durdurmak için `break` kullanın:

```dart
while (true) {
  if (shutDownRequested()) break;
  processIncomingRequests();
}
```

Bir sonraki yinelemeye geçmek için `continue` kullanın:

```dart
for (int i = 0; i < candidates.length; i++) {
  var candidate = candidates[i];
  if (candidate.yearsExperience < 5) {
    continue;
  }
  candidate.interview();
}
```

List ya da set gibi bir [`Iterable`](https://api.dart.dev/dart-core/Iterable-class.html)
kullanıyorsanız
önceki örneği farklı bir şekilde yazabilirsiniz:

```dart
candidates
    .where((c) => c.yearsExperience >= 5)
    .forEach((c) => c.interview());
```

### Etiketler (labels)

Etiket, bir deyimin önüne yerleştirerek *etiketli bir deyim* oluşturabileceğiniz,
ardından iki nokta gelen bir tanımlayıcıdır (`etiketAdi:`).
Döngüler ve switch case'leri sıklıkla etiketli deyim olarak kullanılır.
Etiketli bir deyime daha sonra bir `break` ya da `continue`
deyiminde şu şekilde başvurulabilir:

- `break labelName;`
  Etiketli deyimin çalışmasını sonlandırır.
  İç içe bir döngünün içindeyken belirli bir dış döngüden
  çıkmak için kullanışlıdır.
- `continue labelName;`
  Etiketli döngü deyiminin o anki yinelemesinin geri kalanını
  atlar ve bir sonraki yinelemeyle devam eder.

Etiketler kontrol akışını yönetmek için kullanılır. Çoğunlukla
döngüler ve switch case'leriyle birlikte kullanılırlar ve varsayılan olarak en içteki
döngüyü etkilemek yerine hangi deyimden çıkılacağını ya da hangisine devam edileceğini
belirtmenizi sağlarlar.

#### For döngüsünde `break` ile etiket kullanımı

Aşağıdaki kod, `outerLoop` adlı bir etiketin
bir `for` döngüsünde `break` deyimiyle kullanımını gösterir:

```dart
outerLoop:
for (var i = 1; i <= 3; i++) {
  for (var j = 1; j <= 3; j++) {
    print('i = $i, j = $j');
    if (i == 2 && j == 2) {
      break outerLoop;
    }
  }
}
print('outerLoop exited');
```

Önceki örnekte `i == 2` ve `j == 2` olduğunda `break outerLoop;`
deyimi hem iç hem de dış döngüyü durdurur. Sonuç olarak çıktı şöyledir:

```text
i = 1, j = 1
i = 1, j = 2
i = 1, j = 3
i = 2, j = 1
i = 2, j = 2
outerLoop exited
```

#### For döngüsünde `continue` ile etiket kullanımı

Aşağıdaki kod, `outerLoop` adlı bir etiketin
bir `for` döngüsünde `continue` deyimiyle kullanımını gösterir:

```dart
outerLoop:
for (var i = 1; i <= 3; i++) {
  for (var j = 1; j <= 3; j++) {
    if (i == 2 && j == 2) {
      continue outerLoop;
    }
    print('i = $i, j = $j');
  }
}
```

Önceki örnekte `i == 2` ve `j == 2` olduğunda `continue outerLoop;`
`i = 2` için kalan yinelemeleri atlar ve `i = 3`'e geçer. Sonuç olarak çıktı şöyledir:

```text
i = 1, j = 1
i = 1, j = 2
i = 1, j = 3
i = 2, j = 1
i = 3, j = 1
i = 3, j = 2
i = 3, j = 3
```

#### While döngüsünde `break` ile etiket kullanımı

Aşağıdaki kod, `outerLoop` adlı bir etiketin
bir `while` döngüsünde `break` deyimiyle kullanımını gösterir:

```dart
var i = 1;

outerLoop:
while (i <= 3) {
  var j = 1;
  while (j <= 3) {
    print('i = $i, j = $j');
    if (i == 2 && j == 2) {
      break outerLoop;
    }
    j++;
  }
  i++;
}
print('outerLoop exited');
```

Önceki örnekte program, `i == 2` ve `j == 2` olduğunda hem iç hem de dış
`while` döngüsünden çıkar. Sonuç olarak çıktı şöyledir:

```text
i = 1, j = 1
i = 1, j = 2
i = 1, j = 3
i = 2, j = 1
i = 2, j = 2
outerLoop exited
```

#### While döngüsünde `continue` ile etiket kullanımı

Aşağıdaki kod, `outerLoop` adlı bir etiketin
bir `while` döngüsünde `continue` deyimiyle kullanımını gösterir:

```dart
var i = 1;

outerLoop:
while (i <= 3) {
  var j = 1;
  while (j <= 3) {
    if (i == 2 && j == 2) {
      i++;
      continue outerLoop;
    }
    print('i = $i, j = $j');
    j++;
  }
  i++;
}
```

Önceki örnekte `i = 2` ve `j = 2` için yineleme atlanır ve döngü
doğrudan `i = 3`'e geçer. Sonuç olarak çıktı şöyledir:

```text
i = 1, j = 1
i = 1, j = 2
i = 1, j = 3
i = 2, j = 1
i = 3, j = 1
i = 3, j = 2
i = 3, j = 3
```

#### Do-while döngüsünde `break` ile etiket kullanımı

Aşağıdaki kod, `outerLoop` adlı bir etiketin
bir `do while` döngüsünde `break` deyimiyle kullanımını gösterir:

```dart
var i = 1;

outerLoop:
do {
  var j = 1;
  do {
    print('i = $i, j = $j');
    if (i == 2 && j == 2) {
      break outerLoop;
    }
    j++;
  } while (j <= 3);
  i++;
} while (i <= 3);

print('outerLoop exited');
```

Önceki örnekte program, `i == 2` ve `j == 2` olduğunda hem iç hem de dış
döngüden çıkar. Sonuç olarak çıktı şöyledir:

```text
i = 1, j = 1
i = 1, j = 2
i = 1, j = 3
i = 2, j = 1
i = 2, j = 2
outerLoop exited
```

#### Do-while döngüsünde `continue` ile etiket kullanımı

Aşağıdaki kod, `outerLoop` adlı bir etiketin
bir `do while` döngüsünde `continue` deyimiyle kullanımını gösterir:

```dart
var i = 1;

outerLoop:
do {
  var j = 1;
  do {
    if (i == 2 && j == 2) {
      i++;
      continue outerLoop;
    }
    print('i = $i, j = $j');
    j++;
  } while (j <= 3);
  i++;
} while (i <= 3);
```

Önceki örnekte döngü `i = 2` ve `j = 2`'yi atlar ve doğrudan
`i = 3`'e geçer.
Sonuç olarak çıktı şöyledir:

```text
i = 1, j = 1
i = 1, j = 2
i = 1, j = 3
i = 2, j = 1
i = 3, j = 1
i = 3, j = 2
i = 3, j = 3
```


## Dallanmalar

*Dart kodunuzun akışını kontrol etmek için dallanmaları nasıl kullanacağınızı öğrenin.* · Kaynak: <https://dart.dev/language/branches>

Bu sayfa, Dart kodunuzun akışını dallanmalarla nasıl kontrol edebileceğinizi gösterir:

- `if` deyimleri ve elemanları
- `if-case` deyimleri ve elemanları
- `switch` deyimleri ve ifadeleri

Dart'ta kontrol akışını şunlarla da yönetebilirsiniz:

- `for` ve `while` gibi [döngüler](https://dart.dev/language/loops)
- `try`, `catch` ve `throw` gibi [istisnalar](https://dart.dev/language/error-handling)

### If

Dart, isteğe bağlı `else` cümleleriyle `if` deyimlerini destekler.
`if`'ten sonra parantez içindeki koşul,
[boolean](https://dart.dev/language/built-in-types#booleans) sonuç veren bir ifade olmalıdır:

```dart
if (isRaining()) {
  you.bringRainCoat();
} else if (isSnowing()) {
  you.wearJacket();
} else {
  car.putTopDown();
}
```

`if`'i bir ifade bağlamında nasıl kullanacağınızı öğrenmek için
[Conditional expressions](https://dart.dev/language/operators#conditional-expressions) bölümüne göz atın.

#### If-case

Dart'taki `if` deyimleri, ardından bir [desen](https://dart.dev/language/patterns) gelen `case` cümlelerini destekler:

```dart
if (pair case [int x, int y]) return Point(x, y);
```

Desen değerle eşleşirse
dal, desenin tanımladığı değişkenler kapsam içindeyken çalışır.

Önceki örnekte
`[int x, int y]` list deseni `pair` değeriyle eşleşir,
bu yüzden `return Point(x, y)` dalı desenin tanımladığı
`x` ve `y` değişkenleriyle çalışır.

Aksi halde, varsa çalıştırılmak üzere kontrol akışı
`else` dalına geçer:

```dart
if (pair case [int x, int y]) {
  print('Was coordinate array $x,$y');
} else {
  throw FormatException('Invalid coordinates.');
}
```

If-case deyimi, *tek* bir desenle eşleştirme ve
[ayrıştırma](https://dart.dev/language/patterns#destructuring) yapmanın bir yoludur.
Bir değeri *birden çok* desenle test etmek için [switch](https://dart.dev/language/branches#switch) kullanın.

> **Sürüm notu:**
>
> if deyimlerindeki case cümleleri
> en az 3.0 [dil sürümü](https://dart.dev/language/versioning) gerektirir.

### Switch deyimleri

Bir `switch` deyimi, bir değer ifadesini bir dizi case'e karşı değerlendirir.
Her `case` cümlesi, değerin eşleştirileceği bir [desendir](https://dart.dev/language/patterns).
Bir case için [her tür deseni](https://dart.dev/language/pattern-types) kullanabilirsiniz.

Değer bir case'in deseniyle eşleştiğinde case gövdesi çalışır.
Boş olmayan `case` cümleleri tamamlandıktan sonra switch'in sonuna atlar.
`break` deyimi gerektirmezler.
Boş olmayan bir `case` cümlesini bitirmenin diğer geçerli yolları
[`continue`](https://dart.dev/language/loops#break-and-continue), [`throw`](https://dart.dev/language/error-handling#throw) ya da
[`return`](https://dart.dev/language/functions#return-values) deyimidir.

Hiçbir `case` cümlesi eşleşmediğinde kod çalıştırmak için
`default` ya da [joker `_`](https://dart.dev/language/pattern-types#wildcard) cümlesi kullanın:

```dart
var command = 'OPEN';
switch (command) {
  case 'CLOSED':
    executeClosed();
  case 'PENDING':
    executePending();
  case 'APPROVED':
    executeApproved();
  case 'DENIED':
    executeDenied();
  case 'OPEN':
    executeOpen();
  default:
    executeUnknown();
}
```

Boş case'ler bir sonraki case'e düşer (fall through); böylece case'ler aynı gövdeyi paylaşabilir.
Bir sonrakine düşmeyen boş bir case için
gövde olarak [`break`](https://dart.dev/language/loops#break-and-continue) kullanın.
Sıralı olmayan bir düşüş için
bir [`continue` deyimi](https://dart.dev/language/loops#break-and-continue)
ve bir etiket kullanabilirsiniz:

```dart
switch (command) {
  case 'OPEN':
    executeOpen();
    continue newCase; // newCase etiketinden çalışmaya devam eder.

  case 'DENIED': // Boş case bir sonrakine düşer (fall through).
  case 'CLOSED':
    executeClosed(); // Hem DENIED hem de CLOSED için çalışır,

  newCase:
  case 'PENDING':
    executeNowClosed(); // Hem OPEN hem de PENDING için çalışır.
}
```

Case'lerin aynı gövdeyi ya da koruma ifadesini paylaşmasını sağlamak için [mantıksal-veya desenlerini](https://dart.dev/language/patterns#or-pattern-switch) kullanabilirsiniz.
Desenler ve case cümleleri hakkında daha fazla bilgi için
desen dokümantasyonundaki [Switch deyimleri ve ifadeleri](https://dart.dev/language/patterns#switch-statements-and-expressions) bölümüne göz atın.

#### Switch ifadeleri

Bir `switch` *ifadesi*, hangi case eşleşirse onun ifade
gövdesine göre bir değer üretir.
Switch ifadesini Dart'ın ifadelere izin verdiği her yerde kullanabilirsiniz;
bir ifade deyiminin *başı hariç*. Örneğin:

```dart
var x = switch (y) { ... };

print(switch (x) { ... });

return switch (x) { ... };
```

Bir ifade deyiminin başında switch kullanmak istiyorsanız
bir [switch deyimi](https://dart.dev/language/branches#switch-statements) kullanın.

Switch ifadeleri, şuna benzer bir switch *deyimini*:

```dart
// Burada slash, star, comma, semicolon vb. sabit değişkenlerdir...
switch (charCode) {
  case slash || star || plus || minus: // Mantıksal-veya deseni
    token = operator(charCode);
  case comma || semicolon: // Mantıksal-veya deseni
    token = punctuation(charCode);
  case >= digit0 && <= digit9: // İlişkisel ve mantıksal-ve desenleri
    token = number();
  default:
    throw FormatException('Invalid');
}
```

Şuna benzer bir *ifadeye* dönüştürmenizi sağlar:

```dart
token = switch (charCode) {
  slash || star || plus || minus => operator(charCode),
  comma || semicolon => punctuation(charCode),
  >= digit0 && <= digit9 => number(),
  _ => throw FormatException('Invalid'),
};
```

Bir `switch` ifadesinin sözdizimi `switch` deyiminin sözdiziminden farklıdır:

- Case'ler `case` anahtar kelimesiyle *başlamaz*.
- Case gövdesi bir dizi deyim yerine tek bir ifadedir.
- Her case'in bir gövdesi olmalıdır; boş case'ler için örtük düşüş (fallthrough) yoktur.
- Case desenleri gövdelerinden `:` yerine `=>` ile ayrılır.
- Case'ler `,` ile ayrılır (sonda isteğe bağlı bir `,` kullanılabilir).
- Varsayılan case'ler hem `default` hem de `_` yerine
  *yalnızca* `_` kullanabilir.

> **Sürüm notu:**
>
> Switch ifadeleri en az 3.0 [dil sürümü](https://dart.dev/language/versioning) gerektirir.

#### Kapsayıcılık (exhaustiveness) kontrolü

Kapsayıcılık kontrolü, bir değerin switch'e girip hiçbir case ile
eşleşmemesi mümkünse derleme zamanı hatası
bildiren bir özelliktir.

```dart
// bool? üzerinde kapsayıcı olmayan switch, null olasılığını karşılayan case eksik:
switch (nullableBool) {
  case true:
    print('yes');
  case false:
    print('no');
}
```

Varsayılan bir case (`default` ya da `_`) switch'ten geçebilecek
tüm olası değerleri kapsar.
Bu, herhangi bir tip üzerindeki switch'i kapsayıcı hale getirir.

[Enum'lar](https://dart.dev/language/enums) ve [mühürlü (sealed) tipler](https://dart.dev/language/class-modifiers#sealed) switch'ler için
özellikle kullanışlıdır, çünkü varsayılan bir case olmasa bile
olası değerleri bilinir ve tamamen sayılabilir.
Bir sınıfın alt tipleri üzerinde switch yaparken
kapsayıcılık kontrolünü etkinleştirmek için
o sınıfta [`sealed` niteleyicisini](https://dart.dev/language/class-modifiers#sealed) kullanın:

```dart
sealed class Shape {}

class Square implements Shape {
  final double length;
  Square(this.length);
}

class Circle implements Shape {
  final double radius;
  Circle(this.radius);
}

double calculateArea(Shape shape) => switch (shape) {
  Square(length: var l) => l * l,
  Circle(radius: var r) => math.pi * r * r,
};
```

Biri `Shape`'in yeni bir alt sınıfını eklerse
bu `switch` ifadesi eksik kalır.
Kapsayıcılık kontrolü sizi eksik alt tip hakkında bilgilendirir.
Bu, Dart'ı bir ölçüde
[fonksiyonel cebirsel veri tipi tarzında](https://en.wikipedia.org/wiki/Algebraic_data_type) kullanmanızı sağlar.

### Koruma ifadesi (guard clause)

Bir `case` cümlesinden sonra isteğe bağlı bir koruma ifadesi koymak için `when` anahtar kelimesini kullanın.
Bir koruma ifadesi `if case`'in, ayrıca
hem `switch` deyimlerinin hem de ifadelerinin ardından gelebilir.

```dart
// Switch deyimi:
switch (something) {
  case somePattern when some || boolean || expression:
    //             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Koruma ifadesi (guard clause).
    body;
}

// Switch ifadesi:
var value = switch (something) {
  somePattern when some || boolean || expression => body,
  //               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Koruma ifadesi (guard clause).
}

// If-case deyimi:
if (something case somePattern when some || boolean || expression) {
  //                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Koruma ifadesi (guard clause).
  body;
}
```

Koruma ifadeleri, eşleştirmeden *sonra* keyfi bir boolean ifadeyi değerlendirir.
Bu, bir case gövdesinin çalışıp çalışmayacağına dair
ek kısıtlamalar eklemenizi sağlar.
Koruma ifadesi false sonuç verdiğinde
çalışma, tüm switch'ten çıkmak yerine
bir sonraki case'e geçer.


## Hata yönetimi

*Dart'ta hataları ve istisnaları ele almayı öğrenin.* · Kaynak: <https://dart.dev/language/error-handling>

### İstisnalar (exceptions)

Dart kodunuz istisna fırlatabilir ve yakalayabilir. İstisnalar, beklenmedik bir şey
olduğunu belirten hatalardır. İstisna yakalanmazsa
istisnayı fırlatan [isolate](https://dart.dev/language/concurrency#isolates) askıya alınır
ve genellikle isolate ile programı sonlandırılır.

Java'nın aksine Dart'taki tüm istisnalar denetlenmeyen (unchecked) istisnalardır.
Metotlar hangi istisnaları fırlatabileceklerini bildirmez ve sizin de
herhangi bir istisnayı yakalama zorunluluğunuz yoktur.

Dart, [`Exception`](https://api.dart.dev/dart-core/Exception-class.html)
ve [`Error`](https://api.dart.dev/dart-core/Error-class.html)
tiplerini ve önceden tanımlanmış çok sayıda alt tipini sunar. Elbette
kendi istisnalarınızı da tanımlayabilirsiniz. Bununla birlikte Dart programları
yalnızca Exception ve Error nesnelerini değil, null olmayan herhangi bir nesneyi istisna olarak fırlatabilir.

#### Throw

Bir istisna fırlatma, yani istisna *oluşturma* örneği:

```dart
throw FormatException('Expected at least 1 section');
```

Keyfi nesneler de fırlatabilirsiniz:

```dart
throw 'Out of llamas!';
```

> **Not:**
>
> Üretim kalitesindeki kod genellikle
> [`Error`](https://api.dart.dev/dart-core/Error-class.html)
> ya da [`Exception`](https://api.dart.dev/dart-core/Exception-class.html)'ı uygulayan tipler fırlatır.

İstisna fırlatmak bir ifade olduğu için istisnaları
=> deyimlerinde ve ifadelere izin verilen diğer her yerde fırlatabilirsiniz:

```dart
void distanceTo(Point other) => throw UnimplementedError();
```

#### Catch

Bir istisnayı yakalamak (catch), istisnanın yayılmasını durdurur
(istisnayı yeniden fırlatmadığınız sürece).
Bir istisnayı yakalamak size onu ele alma fırsatı verir:

```dart
try {
  breedMoreLlamas();
} on OutOfLlamasException {
  buyMoreLlamas();
}
```

Birden fazla türde istisna fırlatabilen kodu ele almak için
birden çok catch cümlesi belirtebilirsiniz. Fırlatılan nesnenin tipiyle eşleşen
ilk catch cümlesi istisnayı ele alır. catch cümlesi bir tip belirtmiyorsa
o cümle fırlatılan her tipteki nesneyi ele alabilir:

```dart
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
```

Yukarıdaki kodun gösterdiği gibi `on`, `catch` ya da ikisini birden kullanabilirsiniz.
İstisna tipini belirtmeniz gerektiğinde `on` kullanın. İstisna işleyicinizin
istisna nesnesine ihtiyacı olduğunda `catch` kullanın.

`catch()`'e bir ya da iki parametre verebilirsiniz.
Birincisi fırlatılan istisnadır,
ikincisi ise yığın izidir (bir [`StackTrace`](https://api.dart.dev/dart-core/StackTrace-class.html)
nesnesi).

```dart
try {
  // ···
} on Exception catch (e) {
  print('Exception details:\n $e');
} catch (e, s) {
  print('Exception details:\n $e');
  print('Stack trace:\n $s');
}
```

Bir istisnayı kısmen ele alıp
yayılmaya devam etmesine izin vermek için
`rethrow` anahtar kelimesini kullanın.

```dart
void misbehave() {
  try {
    dynamic foo = true;
    print(foo++); // Çalışma zamanı hatası
  } catch (e) {
    print('misbehave() partially handled ${e.runtimeType}.');
    rethrow; // Çağıranların istisnayı görmesine izin ver.
  }
}

void main() {
  try {
    misbehave();
  } catch (e) {
    print('main() finished handling ${e.runtimeType}.');
  }
}
```

#### Finally

İstisna fırlatılsa da fırlatılmasa da bir kodun çalışmasını sağlamak için
`finally` cümlesi kullanın. İstisnayla eşleşen bir `catch` cümlesi yoksa
istisna `finally` cümlesi çalıştıktan sonra yayılır:

```dart
try {
  breedMoreLlamas();
} finally {
  // İstisna fırlatılsa bile her zaman temizlik yap.
  cleanLlamaStalls();
}
```

`finally` cümlesi, eşleşen `catch` cümlelerinden sonra çalışır:

```dart
try {
  breedMoreLlamas();
} catch (e) {
  print('Error: $e'); // Önce istisnayı ele al.
} finally {
  cleanLlamaStalls(); // Sonra temizlik yap.
}
```

Daha fazla bilgi için
[çekirdek kütüphanenin istisna dokümantasyonuna](https://dart.dev/libraries/dart-core#exceptions) göz atın.

### Assert

Geliştirme sırasında, bir boolean koşul false ise normal çalışmayı
kesmek için `assert(<koşul>, <isteğeBağlıMesaj>);`
şeklindeki assert deyimini kullanın.

```dart
// Değişkenin null olmayan bir değeri olduğundan emin ol.
assert(text != null);

// Değerin 100'den küçük olduğundan emin ol.
assert(number < 100);

// Bunun bir https URL'si olduğundan emin ol.
assert(urlString.startsWith('https'));
```

Bir doğrulamaya (assertion) mesaj eklemek için
`assert`'e ikinci argüman olarak bir string verin
(isteğe bağlı olarak [sondaki virgülle](https://dart.dev/language/collections#trailing-comma)):

```dart
assert(
  urlString.startsWith('https'),
  'URL ($urlString) should start with "https".',
);
```

`assert`'in ilk argümanı, boolean bir değer veren
herhangi bir ifade olabilir. İfadenin değeri
true ise doğrulama başarılı olur ve çalışma
devam eder. false ise doğrulama başarısız olur ve bir istisna (bir
[`AssertionError`](https://api.dart.dev/dart-core/AssertionError-class.html)) fırlatılır.

Doğrulamalar tam olarak ne zaman çalışır?
Bu, kullandığınız araçlara ve framework'e bağlıdır:

- Flutter doğrulamaları [debug modunda](https://docs.flutter.dev/testing/debugging#debug-mode-assertions) etkinleştirir.
- [`webdev serve`](https://dart.dev/tools/webdev#serve) gibi yalnızca geliştirmeye yönelik araçlar
  genellikle doğrulamaları varsayılan olarak etkinleştirir.
- [`dart run`](https://dart.dev/tools/dart-run) ve [`dart compile js`](https://dart.dev/tools/dart-compile#js) gibi bazı araçlar
  doğrulamaları bir komut satırı bayrağıyla destekler: `--enable-asserts`.

Üretim kodunda doğrulamalar yok sayılır ve
`assert`'e verilen argümanlar değerlendirilmez.


---

# Fonksiyonlar (Functions)

## Fonksiyonlar

*Dart'taki fonksiyonlar hakkında her şey.* · Kaynak: <https://dart.dev/language/functions>

Dart gerçek bir nesne yönelimli dildir; bu yüzden fonksiyonlar bile nesnedir
ve bir tipleri vardır: [Function.](https://api.dart.dev/dart-core/Function-class.html)
Bu, fonksiyonların değişkenlere atanabileceği ya da diğer fonksiyonlara
argüman olarak geçirilebileceği anlamına gelir. Ayrıca bir Dart sınıfının örneğini
bir fonksiyonmuş gibi çağırabilirsiniz. Ayrıntılar için [Callable objects](https://dart.dev/language/callable-objects) sayfasına bakın.

Bir fonksiyonun uygulanmasına örnek:

```dart
bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}
```

Effective Dart
[public API'ler için tip belirtimi](https://dart.dev/effective-dart/design#do-type-annotate-fields-and-top-level-variables-if-the-type-isnt-obvious) önerse de
tipleri yazmasanız da fonksiyon çalışır:

```dart
isNoble(atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}
```

Yalnızca tek bir ifade içeren fonksiyonlar için kısaltılmış bir
sözdizimi kullanabilirsiniz:

```dart
bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;
```

`=> ifade` sözdizimi,
`{ return ifade; }` ifadesinin kısaltmasıdır. `=>` gösterimine
bazen *ok (arrow)* sözdizimi denir.

> **Not:**
>
> Ok (`=>`) ile noktalı virgül (`;`) arasında yalnızca *ifadeler* bulunabilir.
> İfadeler bir değer üretir.
> Bu, Dart'ın bir değer beklediği yere bir deyim yazamayacağınız anlamına gelir.
> Örneğin
> bir [koşullu ifade](https://dart.dev/language/operators#conditional-expressions) kullanabilirsiniz
> ama bir [if deyimi](https://dart.dev/language/branches#if) kullanamazsınız.
> Önceki örnekte
> `_nobleGases[atomicNumber] != null;` boolean bir değer döndürür.
> Fonksiyon da `atomicNumber`'ın soy gaz aralığına girip girmediğini
> belirten boolean bir değer döndürür.

### Parametreler

Bir fonksiyonun istediği sayıda *zorunlu konumsal* parametresi olabilir. Bunların
ardından ya *isimli* parametreler ya da *isteğe bağlı konumsal* parametreler gelebilir
(ikisi birden olamaz).

> **Not:**
>
> Bazı API'ler, özellikle [Flutter](https://flutter.dev) widget yapıcıları, zorunlu olan
> parametreler için bile yalnızca isimli parametreler kullanır. Ayrıntılar için
> sonraki bölüme bakın.

Bir fonksiyona argüman geçirirken ya da fonksiyon parametrelerini tanımlarken
[sondaki virgülleri](https://dart.dev/language/collections#lists) kullanabilirsiniz.

#### İsimli parametreler

İsimli parametreler, açıkça `required` olarak işaretlenmedikçe
isteğe bağlıdır.

Bir fonksiyon tanımlarken isimli parametreleri belirtmek için
`{param1, param2, …}`
kullanın.
Bir isimli parametreye varsayılan değer vermez
ya da onu `required` olarak işaretlemezseniz,
varsayılan değeri `null` olacağı için
tipi null olabilir (nullable) olmalıdır:

```dart
/// [bold] ve [hidden] bayraklarını ayarlar ...
void enableFlags({bool? bold, bool? hidden}) {
  ...
}
```

Bir fonksiyonu çağırırken
isimli argümanları
`paramAdi: deger` şeklinde belirtebilirsiniz.
Örneğin:

```dart
enableFlags(bold: true, hidden: false);
```

Bir isimli parametre için `null` dışında bir varsayılan değer tanımlamak için
`=` ile varsayılan değeri belirtin.
Belirtilen değer bir derleme zamanı sabiti olmalıdır.
Örneğin:

```dart
/// [bold] ve [hidden] bayraklarını ayarlar ...
void enableFlags({bool bold = false, bool hidden = false}) {
  ...
}

// bold true olur; hidden false olur.
enableFlags(bold: true);
```

Bunun yerine bir isimli parametrenin zorunlu olmasını,
yani çağıranların parametre için bir değer vermesini istiyorsanız
onu `required` ile işaretleyin:

```dart
const Scrollbar({super.key, required Widget child});
```

Biri `child` argümanını belirtmeden
bir `Scrollbar` oluşturmaya çalışırsa
analizci bir sorun bildirir.

> **Not:**
>
> `required` olarak işaretlenmiş bir parametre yine de null olabilir:
>
> ```dart
> const Scrollbar({super.key, required Widget? child});
> ```

Konumsal argümanları başa koymak isteyebilirsiniz,
ama Dart bunu zorunlu tutmaz.
Dart, API'nize uygun düştüğünde isimli argümanların
argüman listesinin herhangi bir yerine konmasına izin verir:

```dart
repeat(times: 2, () {
  ...
});
```

#### İsteğe bağlı konumsal parametreler

Bir grup fonksiyon parametresini `[]` içine almak
onları isteğe bağlı konumsal parametreler olarak işaretler.
Varsayılan değer vermezseniz
varsayılan değerleri `null` olacağı için
tipleri null olabilir olmalıdır:

```dart
String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}
```

Bu fonksiyonu isteğe bağlı parametre olmadan
çağırma örneği:

```dart
assert(say('Bob', 'Howdy') == 'Bob says Howdy');
```

Bu fonksiyonu üçüncü parametreyle çağırma örneği ise şöyle:

```dart
assert(
  say('Bob', 'Howdy', 'smoke signal') ==
      'Bob says Howdy with a smoke signal',
);
```

İsteğe bağlı bir konumsal parametre için `null` dışında bir varsayılan değer tanımlamak için
`=` ile varsayılan değeri belirtin.
Belirtilen değer bir derleme zamanı sabiti olmalıdır.
Örneğin:

```dart
String say(String from, String msg, [String device = 'carrier pigeon']) {
  var result = '$from says $msg with a $device';
  return result;
}

assert(say('Bob', 'Howdy') == 'Bob says Howdy with a carrier pigeon');
```

#### Parametre niteleyicileri

`final` ve `var` parametre niteleyicileri yalnızca
örnek alanları tanımlamak için [birincil yapıcılara (primary constructor)](https://dart.dev/language/primary-constructors) ayrılmıştır.
Bunları başka herhangi bir tanımdaki biçimsel parametrelerde kullanmak
derleme zamanı hatası (`extraneous_modifier`) üretir.
Kod örnekleri ve geçiş adımları için
[Parameter modifier restrictions](https://dart.dev/language/primary-constructors#parameter-modifier-restrictions) bölümüne bakın.

Bir stil tercihi olarak parametrelere yeniden değer atanamamasını zorunlu kılmak için
bunun yerine [`parameter_assignments`](https://dart.dev/tools/linter-rules/parameter_assignments)
lint kuralını kullanın.

### main() fonksiyonu

Her uygulamanın, uygulamanın giriş noktası işlevi gören üst düzey bir
`main()` fonksiyonu olmalıdır. `main()` fonksiyonu `void` döndürür
ve argümanlar için isteğe bağlı bir
`List<String>` parametresi vardır.

İşte basit bir `main()` fonksiyonu:

```dart
void main() {
  print('Hello, World!');
}
```

Argüman alan bir komut satırı uygulaması için
`main()` fonksiyonu örneği:

```dart
// Uygulamayı şöyle çalıştırın: dart run args.dart 1 test
void main(List<String> arguments) {
  print(arguments);

  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');
}
```

Komut satırı argümanlarını tanımlamak ve ayrıştırmak için
[args kütüphanesini](https://pub.dev/packages/args) kullanabilirsiniz.

### Birinci sınıf nesneler olarak fonksiyonlar

Bir fonksiyonu başka bir fonksiyona parametre olarak geçirebilirsiniz. Örneğin:

```dart
void printElement(int element) {
  print(element);
}

var list = [1, 2, 3];

// printElement'i parametre olarak geçir.
list.forEach(printElement);
```

Bir fonksiyonu bir değişkene de atayabilirsiniz, örneğin:

```dart
var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
assert(loudify('hello') == '!!! HELLO !!!');
```

Bu örnekte anonim bir fonksiyon kullanılıyor.
Bunlar hakkında daha fazlası sonraki bölümde.

### Fonksiyon tipleri

Bir fonksiyonun tipini belirtebilirsiniz; buna *fonksiyon tipi* denir.
Fonksiyon tipi, bir fonksiyon tanımının başlığında
fonksiyon adının yerine `Function` anahtar kelimesi konarak elde edilir.
Ayrıca konumsal parametrelerin adlarını yazmayabilirsiniz, ancak
isimli parametrelerin adları atlanamaz. Örneğin:

```dart
void greet(String name, {String greeting = 'Hello'}) =>
    print('$greeting $name!');

// `greet`'i bir değişkende sakla ve çağır.
void Function(String, {String greeting}) g = greet;
g('Dash', greeting: 'Howdy');
```

> **Not:**
>
> Dart'ta fonksiyonlar birinci sınıf nesnelerdir;
> yani değişkenlere atanabilir,
> argüman olarak geçirilebilir ve başka fonksiyonlardan döndürülebilirler.
>
> Fonksiyon tiplerine açıkça isim vermek için bir [`typedef`](https://dart.dev/language/typedefs) tanımı kullanabilirsiniz;
> bu, açıklık ve yeniden kullanılabilirlik açısından faydalı olabilir.

### Anonim fonksiyonlar

`main()` ya da `printElement()` gibi çoğu fonksiyona isim verseniz de
isimsiz fonksiyonlar da oluşturabilirsiniz.
Bu fonksiyonlara *anonim fonksiyon*, *lambda* ya da *closure* denir.

Anonim bir fonksiyon isimli bir fonksiyona benzer, çünkü şunlara sahiptir:

- Virgülle ayrılmış sıfır ya da daha fazla parametre
- Parantez içinde isteğe bağlı tip belirtimleri.

Aşağıdaki kod bloğu fonksiyonun gövdesini içerir:

```dart
([[Type] param1[, ...]]) {
  codeBlock;
}
```

Aşağıdaki örnek, tipi belirtilmemiş `item` parametresine sahip
anonim bir fonksiyonu
`map` fonksiyonuna geçirir.
Listedeki her eleman için çağrılan `map` fonksiyonu
her string'i büyük harfe çevirir.
Ardından bir `for-in` döngüsü dönüştürülen her string'i uzunluğuyla birlikte yazdırır.

```dart
const list = ['apples', 'bananas', 'oranges'];

var uppercaseList = list.map((item) {
  return item.toUpperCase();
}).toList();
// map işleminden sonra listeye çevir

for (var item in uppercaseList) {
  print('$item: ${item.length}');
}
```

Bu örneği [DartPad](https://dartpad.dev)'de çalıştırabilirsiniz.

Fonksiyon yalnızca tek bir ifade ya da return deyimi içeriyorsa
onu ok gösterimiyle kısaltabilirsiniz.
İşlevsel olarak aynı olduğunu doğrulamak için aşağıdaki satırı DartPad'e yapıştırıp **Run**'a
tıklayın.

```dart
var uppercaseList = list.map((item) => item.toUpperCase()).toList();
```

### Sözcüksel kapsam (lexical scope)

Dart değişkenlerin kapsamını kodun yerleşimine göre belirler.
Bu özelliğe sahip bir programlama diline sözcüksel kapsamlı dil denir.
Bir değişkenin kapsam içinde olup olmadığını görmek için "süslü parantezleri dışarı doğru takip edebilirsiniz".

**Örnek:** Her kapsam düzeyinde değişkenleri olan bir dizi iç içe fonksiyon:

```dart
bool topLevel = true;

void main() {
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }
}
```

`nestedFunction()` metodu, en üst düzeye kadar
her düzeydeki değişkenleri kullanabilir.

### Sözcüksel closure'lar

Kendi sözcüksel kapsamının dışında bulunduğunda bile o kapsamdaki değişkenlere
erişebilen fonksiyon nesnesine *closure* denir.

Fonksiyonlar, çevreleyen kapsamlarda tanımlanmış değişkenleri yakalayabilir (close over).
Aşağıdaki örnekte `makeAdder()`, `addBy` değişkenini yakalar. Döndürülen
fonksiyon nereye giderse gitsin `addBy`'ı hatırlar.

```dart
/// Fonksiyonun argümanına [addBy] ekleyen
/// bir fonksiyon döndürür.
Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}

void main() {
  // 2 ekleyen bir fonksiyon oluştur.
  var add2 = makeAdder(2);

  // 4 ekleyen bir fonksiyon oluştur.
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);
}
```

### Tear-off'lar

Bir fonksiyona, metoda ya da isimli yapıcıya parantezsiz başvurduğunuzda
Dart bir *tear-off* oluşturur. Bu, fonksiyonla aynı
parametreleri alan ve çağrıldığında asıl fonksiyonu çağıran bir closure'dır.
Kodunuz, closure'ın aldığı parametrelerle isimli bir fonksiyonu çağıran
bir closure'a ihtiyaç duyuyorsa çağrıyı bir lambda'ya sarmayın.
Bir tear-off kullanın.

```dart
var charCodes = [68, 97, 114, 116];
var buffer = StringBuffer();
```

*iyi*

```dart
// Fonksiyon tear-off'u
charCodes.forEach(print);

// Metot tear-off'u
charCodes.forEach(buffer.write);
```

*kötü*

```dart
// Fonksiyon lambdası
charCodes.forEach((code) {
  print(code);
});

// Metot lambdası
charCodes.forEach((code) {
  buffer.write(code);
});
```

### Fonksiyonların eşitliğini test etme

Üst düzey fonksiyonların, statik metotların ve
örnek metotlarının eşitliğini test etmeye bir örnek:

```dart
void foo() {} // Üst düzey bir fonksiyon

class A {
  static void bar() {} // Statik bir metot
  void baz() {} // Bir örnek (instance) metodu
}

void main() {
  Function x;

  // Üst düzey fonksiyonları karşılaştırma.
  x = foo;
  assert(foo == x);

  // Statik metotları karşılaştırma.
  x = A.bar;
  assert(A.bar == x);

  // Örnek metotlarını karşılaştırma.
  var v = A(); // A'nın 1. örneği
  var w = A(); // A'nın 2. örneği
  var y = w;
  x = w.baz;

  // Bu closure'lar aynı örneğe (#2) başvurur,
  // bu yüzden eşittirler.
  assert(y.baz == x);

  // Bu closure'lar farklı örneklere başvurur,
  // bu yüzden eşit değildirler.
  assert(v.baz != w.baz);
}
```

### Dönüş değerleri

Tüm fonksiyonlar bir değer döndürür. Dönüş değeri belirtilmemişse
fonksiyon gövdesinin sonuna örtük olarak `return null;` deyimi eklenir.

```dart
foo() {}

assert(foo() == null);
```

Bir fonksiyonda birden çok değer döndürmek için değerleri bir [record](https://dart.dev/language/records#multiple-returns) içinde toplayın.

```dart
(String, int) foo() {
  return ('something', 42);
}
```

### Getter'lar ve setter'lar

Her özellik erişimi (üst düzey, statik ya da örnek) bir getter'ın ya da
setter'ın çağrılmasıdır. Bir değişken örtük olarak bir getter,
değiştirilebilirse bir de setter oluşturur. Bu yüzden bir özelliğe eriştiğinizde
aslında arka planda küçük bir fonksiyon çağırırsınız. Bir özelliği okumak
bir getter fonksiyonunu, yazmak ise bir setter fonksiyonunu çağırır;
özellik bir değişken olarak tanımlanmış olsa bile.

Bununla birlikte getter ve setter'ları sırasıyla
`get` ve `set` anahtar kelimeleriyle açıkça da tanımlayabilirsiniz.
Bu, bir özelliğin değerinin okunurken ya da yazılırken hesaplanmasını sağlar.

Getter ve setter kullanmanın amacı, istemci (özelliği kullanan kod) ile
sağlayıcı (onu tanımlayan sınıf ya da kütüphane) arasında net bir ayrım
oluşturmaktır. İstemci, değerin basit bir değişkende mi saklandığını yoksa
o anda mı hesaplandığını bilmeye gerek kalmadan bir değeri ister ya da
ayarlar. Bu da sağlayıcıya özelliğin çalışma şeklini değiştirme
özgürlüğü verir.

Örneğin özelliğin değeri hiçbir yerde saklanmıyor olabileceği için
getter her çağrıldığında yeniden hesaplanabilir. Bir başka örnek de
değerin private bir değişkende saklandığı ve public erişime yalnızca
bir getter ya da setter çağrılarak izin verildiği durumdur.

Aşağıdaki örnek bunu gösteriyor:
`secret` getter'ı ve setter'ı, atanan ve okunan değerler üzerinde
kendi işlemlerini yaparak private `_secret` değişkenine
dolaylı erişim sağlar.

```dart
// Tanımlayıcısı alt çizgiyle (`_`) başladığı için kütüphaneye özel olan
// `_secret` adlı bir değişken tanımlar.
String _secret = 'Hello';

// [_secret]'a okuma erişimi sağlayan
// public, üst düzey bir getter.
String get secret {
  print('Getter was used!');
  return _secret.toUpperCase();
}

// [_secret]'a yazma erişimi sağlayan
// public, üst düzey bir setter.
set secret(String newMessage) {
  print('Setter was used!');
  if (newMessage.isNotEmpty) {
    _secret = newMessage;
    print('New secret: "$newMessage"');
  }
}

void main() {
  // Değeri okumak getter'ı çağırır.
  print('Current message: $secret');

  /*
  Çıktı:
  Getter was used!
  Current message: HELLO
  */

  // Değer atamak setter'ı çağırır.
  secret = 'Dart is fun';

  // Tekrar okumak, yeni hesaplanan değeri göstermek için getter'ı çağırır
  print('New message: $secret');

  /*
  Çıktı:
  Setter was used! New secret: "Dart is fun"
  Getter was used!
  New message: DART IS FUN
  */
}
```

### Üreteçler (generators)

Bir değer dizisini tembel (lazy) şekilde üretmeniz gerektiğinde
bir *üreteç fonksiyonu* kullanmayı düşünün.
Dart'ta iki tür üreteç fonksiyonu için yerleşik destek vardır:

- **Senkron** üreteç: Bir [`Iterable`](https://api.dart.dev/dart-core/Iterable-class.html)
  nesnesi döndürür.
- **Asenkron** üreteç: Bir [`Stream`](https://api.dart.dev/dart-async/Stream-class.html)
  nesnesi döndürür.

**Senkron** bir üreteç fonksiyonu yazmak için
fonksiyon gövdesini `sync*` olarak işaretleyin
ve değerleri vermek için `yield` deyimlerini kullanın:

```dart
Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}
```

**Asenkron** bir üreteç fonksiyonu yazmak için
fonksiyon gövdesini `async*` olarak işaretleyin
ve değerleri vermek için `yield` deyimlerini kullanın:

```dart
Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}
```

Üreteciniz özyinelemeliyse
`yield*` kullanarak performansını artırabilirsiniz:

```dart
Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}
```

### Harici (external) fonksiyonlar

Harici fonksiyon, gövdesi tanımından ayrı olarak uygulanan bir fonksiyondur.
Bir fonksiyon tanımının önüne şu şekilde `external` anahtar kelimesini ekleyin:

```dart
external void someFunc(int i);
```

Harici bir fonksiyonun uygulaması başka bir Dart kütüphanesinden
ya da daha yaygın olarak başka bir dilden gelebilir. Birlikte çalışma (interop) bağlamlarında `external`,
yabancı fonksiyonlar ya da değerler için tip bilgisi sunarak
onları Dart'ta kullanılabilir hale getirir. Uygulama ve kullanım
büyük ölçüde platforma özgüdür; daha fazla bilgi için örneğin
[C](https://dart.dev/interop/c-interop) ya da [JavaScript](https://dart.dev/interop/js-interop)
interop dokümantasyonuna göz atın.

Harici fonksiyonlar üst düzey fonksiyonlar, [örnek metotları](https://dart.dev/language/methods#instance-methods),
getter ya da setter'lar veya [yönlendirmeyen yapıcılar](https://dart.dev/language/constructors#redirecting-constructors) olabilir.
Bir [örnek değişkeni](https://dart.dev/language/classes#instance-variables) de `external`
olabilir;
bu, harici bir getter'a ve (değişken
`final` değilse) harici bir setter'a denktir.
