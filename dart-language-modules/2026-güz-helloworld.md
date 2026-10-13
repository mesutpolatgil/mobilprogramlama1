# Introduction to Dart ( Dart'a Giriş)

*Dart programlarına ve önemli kavramlara giriş.*

Bu sayfa, Dart dilinin temel özelliklerine ilişkin örnekler aracılığıyla kısa bir giriş sunmaktadır.

Dart dili hakkında daha fazla bilgi edinmek için sol taraftaki menüde Dil başlığı altında listelenen ayrıntılı, bireysel konu sayfalarını ziyaret edin.

Dart'ın temel kütüphaneleri hakkında bilgi edinmek için temel kütüphane belgelerine göz atın. Daha etkileşimli bir giriş için Dart file sayfasını da inceleyebilirsiniz.

## Hello World

Her uygulama, yürütmenin başladığı üst düzey `main()` fonksiyonunu gerektirir. Açıkça bir değer döndürmeyen fonksiyonlar `void` dönüş türüne sahiptir. Konsolda metin görüntülemek için üst düzey `print()` fonksiyonunu kullanabilirsiniz:

```dart
void main() {
  print ('Hello, World!');
}
```

Dart'taki `main()` fonksiyonu hakkında, komut satırı argümanları için isteğe bağlı parametreler de dahil olmak üzere daha fazla bilgi edinin.

## Variables ( Değişkenler )

type-safe Dart kodunda bile, çoğu değişken türünü açıkça belirtmeden `var`. kullanarak tanımlayabilirsiniz. Tür çıkarımı sayesinde, bu değişkenlerin türleri başlangıç değerlerine göre belirlenir:

```dart
var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg',
};
```

Dart'taki değişkenler hakkında, varsayılan değerler, `final` ve `const` anahtar kelimeleri ve static types dahil olmak üzere daha fazla bilgi edinin.

## Control flow statements (  Kontrol akış ifadeleri)

Dart, normal kontrol akış ifadelerini destekler:

```dart
if (year >= 2001) {
  print('21st century');
} else if (year >= 1901) {
  print('20th century');
}

for (final object in flybyObjects) {
  print(object);
}

for (int month = 1; month <= 12; month++) {
  print(month);
}

while (year < 2016) {
  year += 1;
}
```

Dart'taki `break` ve `continue`, `switch` ve `case` ile `assert` gibi kontrol akışı ifadeleri hakkında daha fazla bilgi edinin.

## Functions ( Fonksiyonlar )

Her fonksiyonun argümanlarının ve dönüş değerinin türlerini belirtmenizi öneririz:

```dart
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

var result = fibonacci(20);
```

Tek bir ifade içeren fonksiyonlar için kısa yol `=>` (ok) syntax kullanışlıdır.  Bu syntax, özellikle anonim fonksiyonları argüman olarak iletirken faydalıdır:

```dart
flybyObjects.where((name) => name.contains('turn')).forEach(print);
```

Bu kod, anonim bir fonksiyonu (`where()` fonksiyonunun argümanı) göstermenin yanı sıra, bir fonksiyonu argüman olarak kullanabileceğinizi de gösteriyor: en üst düzeydeki `print()` fonksiyonu, `forEach()` fonksiyonunun argümanıdır.

Dart'taki fonksiyonlar hakkında, isteğe bağlı parametreler, varsayılan parametre değerleri ve sözcüksel kapsam dahil olmak üzere daha fazla bilgi edinin.

## Comments ( Yorumlar)

Dart yorumları genellikle `//` ile başlar.

```dart
// This is a normal, one-line comment.

/// This is a documentation comment, used to document libraries,
/// classes, and their members. Tools like IDEs and dartdoc treat
/// doc comments specially.

/* Comments like these are also supported. */
```

Dart'taki yorumlar hakkında, dokümantasyon araçlarının nasıl çalıştığı da dahil olmak üzere daha fazla bilgi edinin.

## Imports (İmportlar )

Diğer kütüphanelerde tanımlanan API'lere erişmek için `import` komutunu kullanın.

```dart
// Importing core libraries
import 'dart:math';

// Importing libraries from external packages
import 'package:test/test.dart';

// Importing files
import 'path/to/my_other_file.dart';
```

Dart'ta kütüphaneler ve görünürlük hakkında daha fazla bilgi edinin; kütüphane önekleri, `show` ve `hide` komutları ile `deferred` anahtar sözcüğü aracılığıyla tembel yükleme dahil.

## Classes ( Sınıflar )

İşte üç özelliği, iki yapıcısı ve bir metodu olan bir sınıf örneği.  Özelliklerden biri doğrudan ayarlanamadığı için (değişken yerine) bir alıcı metodu kullanılarak tanımlanmıştır. Yöntem, değişkenlerin dize eşdeğerlerini dize sabitleri içinde yazdırmak için dize enterpolasyonunu kullanır.

```dart
class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // Method.
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}
```

Dize enterpolasyonu, sabit değerler, ifadeler ve `toString()` yöntemi dahil olmak üzere dizeler hakkında daha fazla bilgi edinin.

`Spacecraft` sınıfını şu şekilde kullanabilirsiniz:

```dart
var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
voyager.describe();

var voyager3 = Spacecraft.unlaunched('Voyager III');
voyager3.describe();
```

Dart'taki sınıflar hakkında, başlatıcı listeleri, isteğe bağlı `new` ve `const`, yönlendirici yapıcılar, fabrika yapıcıları, getter'lar, setter'lar ve çok daha fazlası dahil olmak üzere daha fazla bilgi edinin.

## Enums ( Enumular/Numaralandırmalar)

Enumlar, önceden tanımlanmış bir değerler kümesini veya örnekleri, o türden başka hiçbir örneğin olamayacağından emin olacak şekilde sıralamanın bir yoludur.

İşte, önceden tanımlanmış gezegen türlerinden oluşan basit bir listeyi tanımlayan basit bir `enum` örneği:

```dart
enum PlanetType { terrestrial, gas, ice }
```

İşte, gezegenleri tanımlayan bir sınıfın, tanımlanmış bir sabit örnekler kümesiyle (yani kendi güneş sistemimizdeki gezegenler) geliştirilmiş bir `enum` bildiriminin bir örneği.

```dart
/// Enum that enumerates the different planets in our solar system
/// and some of their properties.
enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  // ···
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  /// A constant generating constructor
  const Planet({
    required this.planetType,
    required this.moons,
    required this.hasRings,
  });

  /// All instance variables are final
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  /// Enhanced enums support getters and other methods
  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}
```

`Planet` `enum`'unu şu şekilde kullanabilirsiniz:

```dart
final yourPlanet = Planet.earth;

if (!yourPlanet.isGiant) {
  print('Your planet is not a "giant planet".');
}
```

Derleyici, bağlamdan `enum` türünü çıkarabildiğinde, `enum` değerlerine erişmek için daha kısa olan nokta kısaltma syntax kullanabilirsiniz. Tam `EnumName.value` yazmak yerine, sadece `.value` yazabilirsiniz. Bu, kodunuzu daha temiz ve okunması daha kolay hale getirebilir.

Örneğin, `Planet` türünü açıkça belirterek bir değişken tanımlarken, `Planet` türü zaten belirlenmiş olduğu için `enum` adını atlayabilirsiniz:

```dart
// Instead of the full, explicit syntax:
Planet myPlanet = Planet.venus;

// You can use a dot shorthand:
Planet myPlanet = .venus;
```

Nokta kısaltmaları sadece değişken bildirimleriyle sınırlı değildir. Bunlar, derleyiciye `enum` türünün açık olduğu durumlarda, örneğin işlev argümanları ve `switch` deyimlerinde de kullanılabilir.

Dart'taki `enum`'lar hakkında daha fazla bilgi edinin; bu bilgiler arasında geliştirilmiş `enum` gereksinimleri, otomatik olarak eklenen özellikler, sıralı değer adlarına erişim, `switch` deyimi desteği ve çok daha fazlası yer almaktadır. Nokta kısaltma syntax hakkında daha fazla bilgi edinin.

## Inheritance ( Miras/Kalıtım)

Dart'ta tek taraflı kalıtımı vardır.

```dart
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}
```

Sınıfların genişletilmesi, isteğe bağlı `@override` ek açıklaması ve daha fazlası hakkında daha fazla bilgi edinin.

## Mixins ( Karışımlar )

Mixin'ler, kodu birden fazla sınıf hiyerarşisinde yeniden kullanmanın bir yoludur. Aşağıda bir `mixin` bildirimi yer almaktadır:

```dart
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}
```

Bir sınıfa bir `mixin`’in özelliklerini eklemek için, sınıfı o `mixin` ile genişletmeniz yeterlidir.

```dart
class PilotedCraft extends Spacecraft with Piloted {
  // ···
}
```

`PilotedCraft` sınıfında artık `astronauts` alanı ve `describeCrew()` yöntemi de bulunmaktadır.

Mixin'ler hakkında daha fazla bilgi edinin.

## Interfaces and abstract classes ( Arayüzler ve soyut sınıflar )

Tüm sınıflar dolaylı olarak bir arayüz tanımlar. Bu nedenle, herhangi bir sınıfı uygulayabilirsiniz.

```dart
class MockSpaceship implements Spacecraft {
  // ···
}
```

Gizli arayüzler hakkında veya explicit `interface` anahtar sözcüğü hakkında daha fazla bilgi edinin.

Somut bir sınıf tarafından genişletilecek (veya uygulanacak) bir soyut sınıf oluşturabilirsiniz. Soyut sınıflar, soyut yöntemler (içeriği boş olan) içerebilir.

```dart
abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}
```

`Describable` sınıfını genişleten her sınıf, genişletici sınıfın `describe()` yönteminin uygulamasını çağıran `describeWithEmphasis()` yöntemine sahiptir.

Soyut sınıflar ve yöntemler hakkında daha fazla bilgi edinin.

Saf bir arayüz tanımlamak için, “`abstract`” ve “`interface`” belirteçlerini bir arada kullanın. Diğer soyut sınıflar gibi, soyut bir arayüz sınıfı da örneklenemez. Diğer kütüphaneler bu arayüzü uygulayabilir, ancak onu genişletemez.

Soyut arayüz sınıfları hakkında daha fazla bilgi edinin.

## Async (Asenkron )

Async ve `await` kullanarak callback sorunlarından kaçının ve kodunuzu çok daha okunabilir hale getirin.

```dart
const oneSecond = Duration(seconds: 1);
// ···
Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}
```

Yukarıdaki yöntem aşağıdakilere eşdeğerdir:

```dart
Future<void> printWithDelay(String message) {
  return Future.delayed(oneSecond).then((_) {
    print(message);
  });
}
```

Aşağıdaki örnekte görüldüğü gibi, `async` ve `await` asenkron kodun okunmasını kolaylaştırmaya yardımcı olur.

```dart
Future<void> createDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print(
          'File for $object already exists. It was modified on $modified.',
        );
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch (e) {
      print('Cannot create description for $object: $e');
    }
  }
}
```

Ayrıca, akışları oluşturmak için güzel ve okunaklı bir yol sunan `async*`'ı da kullanabilirsiniz.

```dart
Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  for (final object in objects) {
    await Future.delayed(oneSecond);
    yield '${craft.name} flies by $object';
  }
}
```

`async` fonksiyonlar, `Future`, `Stream` ve asenkron döngü (`await for`) dahil olmak üzere asenkron destek hakkında daha fazla bilgi edinin.

## Exceptions (İstisnalar )

Bir exceptions oluşturmak için `throw` kullanın:

```dart
if (astronauts == 0) {
  throw StateError('No astronauts.');
}
```

Bir exceptions yakalamak için `on` veya `catch` (veya her ikisini) içeren bir `try` ifadesi kullanın:

```dart
Future<void> describeFlybyObjects(List<String> flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
}
```

Yukarıdaki kodun asenkron olduğunu unutmayın; `try` ifadesi, asenkron bir fonksiyon içindeki hem senkron hem de asenkron kod için çalışır.

Yığın izleri, `rethrow` ve `Error` ile `Exception` arasındaki fark dahil olmak üzere exceptions hakkında daha fazla bilgi edinin.

## Important concepts( Önemli kavramlar)

Dart dilini öğrenmeye devam ederken şu gerçekleri ve kavramları aklınızda tutun:

- Bir değişkene atayabileceğiniz her şey bir nesnedir ve her nesne bir sınıfın örneğidir. Sayılar, fonksiyonlar ve `null` bile nesnedir. Null hariç (sound `null` safety etkinleştirirseniz), tüm nesneler `Object` sınıfından miras(inheritance)alır.

  > **Sürüm notu**  
  > Null güvenliği (`null` safety), Dart 2.12 ile kullanıma sunulmuştur. Null güvenliğini kullanmak için en az 2.12 dil sürümü gereklidir.

- Dart güçlü tipli bir dil olmasına rağmen, tip açıklamaları isteğe bağlıdır çünkü Dart tipleri çıkarabilir.  `var number = 101` ifadesinde, number'ın `int` tipinde olduğu çıkarılır.
- Değişkenler, siz izin vermediğiniz sürece `null` değeri içeremez.  Bir değişkeni, türünün sonuna soru işareti (`?`) koyarak `null` değerine izin verilebilir hale getirebilirsiniz.  Örneğin, `int`? türündeki bir değişken bir tamsayı olabileceği gibi `null` değeri de olabilir. Bir ifadenin hiçbir zaman `null` olarak değerlendirilmediğini ancak Dart'ın aynı fikirde olmadığını biliyorsanız, `null` olmadığını iddia etmek (ve `null` ise bir istisna atmak) için `!` ekleyebilirsiniz. Bir örnek: `int x = nullableButNotNullİnt!`
- Herhangi bir türe izin verildiğini açıkça söylemek istediğinizde, type Nesnesini kullanın? (boş güvenliği etkinleştirdiyseniz), `Object` veya - tür denetimini çalışma zamanına kadar ertelemeniz gerekiyorsa - special type `dynamic` kullanın.
- Dart, `List<int>` (tamsayılar listesi) veya `List<Object>` (herhangi bir türdeki nesnelerin listesi) gibi genel türleri destekler.
- Dart, üst düzey fonksiyonları (`main()` gibi) ve bir sınıfa veya nesneye bağlı fonksiyonları (sırasıyla statik ve örnek yöntemleri) destekler. Fonksiyonlar içinde fonksiyonlar oluşturabilirsiniz (iç içe geçmiş veya yerel fonksiyonlar).
- Benzer şekilde, Dart üst düzey değişkenlerin yanı sıra bir sınıfa veya nesneye bağlı değişkenleri de destekler (statik ve örnek değişkenler). Örnek değişkenler bazen alanlar veya özellikler olarak bilinir.
- Java'nın aksine, Dart'ta public, protected ve private anahtar kelimeleri yoktur. Bir tanımlayıcı alt çizgi (`_`) ile başlıyorsa, yalnızca kendi kütüphanesi içinde özeldir. Ayrıntılar için Kütüphaneler ve içe aktarmalar bölümüne bakın.
- Tanımlayıcılar bir harf veya alt çizgi (`_`) ile başlayabilir, ardından bu karakterlerin herhangi bir kombinasyonu ve rakamlar gelebilir.
- Dart hem ifadelere (çalışma zamanı değerlerine sahip) hem de ifadelere (sahip olmayan) sahiptir. Örneğin, `conditional expression? expr1: expr2`, `expr1` veya `expr2` değerine sahiptir. Bunu, hiçbir değeri olmayan `if-else` ifadesiyle karşılaştırın.  Bir ifade genellikle bir veya daha fazla ifade içerir, ancak bir ifade doğrudan bir ifade içeremez.
- Dart araçları iki tür sorun bildirebilir: uyarılar ve hatalar. Uyarılar, kodunuzun çalışmayabileceğine dair göstergelerdir ancak programınızın çalışmasını engellemezler. Hatalar derleme zamanı veya çalışma zamanı hataları olabilir. Derleme zamanı hatası, kodun hiç çalışmasını engeller; çalışma zamanı hatası ise kod çalışırken bir istisna(exception)oluşmasına neden olur.

## Additional resources(Ek kaynaklar)

Temel kütüphane belgelerinde ve Dart API referansında daha fazla belge ve kod örneği bulabilirsiniz. Bu sitedeki kod, Dart stil kılavuzundaki kurallara uygundur.

---

# Variables ( Değişkenler)

*Dart'taki değişkenler hakkında bilgi edinin.*

İşte bir değişken oluşturup onu başlatmanın bir örneği:

```dart
var name = 'Bob';
```

Değişkenler referansları saklar. `name` adlı değişken, değeri “Bob” olan bir `String` nesnesine bir referans içerir.

“`name`” değişkeninin türü `String` olarak belirlenir, ancak bu türü belirtmek suretiyle değiştirebilirsiniz. Bir nesne tek bir türle sınırlı değilse, `Object` türünü (veya gerekirse `dynamic` türünü) belirtin.

```dart
Object name = 'Bob';
```

Başka bir seçenek de, çıkarım yoluyla belirlenecek türü açıkça belirtmektir:

```dart
String name = 'Bob';
```

> **NOT**  
> Bu sayfa, yerel değişkenler için tip açıklamaları yerine `var` kullanılması yönündeki stil kılavuzu tavsiyesine uymaktadır.

## Null safety( Null güvenliği)

Dart dili, sound `null` safety sağlar.

Null güvenliği, `null` olarak ayarlanmış değişkenlere istemeden erişilmesinden kaynaklanan hataları önler. Bu hataya “`null` dereferans hatası” denir. Bir ifade `null` olarak değerlendirildiğinde, bu ifadenin bir özelliğine erişildiğinde veya bir yöntemi çağrıldığında `null` dereferans hatası oluşur. Bu kuralın istisnası, `toString()` veya `hashCode` gibi `null` değerinin söz konusu özelliği veya yöntemi desteklediği durumlardır. Null güvenliği sayesinde, Dart derleyicisi bu potansiyel hataları derleme sırasında tespit eder.

Örneğin, bir `int` türü i değişkeninin mutlak değerini bulmak istediğinizi varsayalım. Eğer i `null` ise, `i.abs()` çağrısı bir `null` dereferans hatasına neden olur. Diğer dillerde bunu denemek, çalışma zamanı hatasına yol açabilir. Dart derleyicisi, bu tür işlemleri yasaklayarak bu hatayı önler.

Null güvenliği üç önemli değişiklik getiriyor:

1.Bir değişken, parametre veya başka bir ilgili bileşen için bir tür belirlediğinizde, bu türün `null` değerine izin verip vermeyeceğini kontrol edebilirsiniz. Null değerine izin vermek için, tür bildiriminin sonuna bir ? eklemeniz yeterlidir.

  ```dart
  String? name  // Nullable type. Can be `null` or string.

  String name   // Non-nullable type. Cannot be `null` but can be string.
  ```

2.Değişkenleri kullanmadan önce başlatmanız gerekir. Nullable değişkenlerin varsayılan değeri `null` olduğundan, bunlar varsayılan olarak başlatılır. Dart, nullable olmayan türlere başlangıç değeri atamaz. Bu türler için başlangıç değerini sizin belirlemenizi zorunlu kılar. Dart, başlatılmamış bir değişkene erişmenize izin vermez. Bu, alıcının türünün `null` olabileceği ancak `null`’un kullanılan yöntemi veya özelliğini desteklemediği durumlarda, özelliklere erişmenizi veya yöntemleri çağırmanızı engeller.

3. Null değer alabilen bir türdeki bir ifadede özelliklere erişemez veya yöntemleri çağıramazsınız. Bu kural, `hashCode` veya `toString()` gibi `null` değerini destekleyen özellikler veya yöntemler için de geçerlidir.

Sound `null` safety, olası çalışma zamanı hatalarını düzenleme zamanı analiz hatalarına dönüştürür. Null güvenliği, `null` olmayan bir değişkeni aşağıdaki durumlarda işaretler:

- Null olmayan bir değerle başlatılmadı.
- Null bir değer atandı.

Bu kontrol, uygulamanızı yayına almadan önce bu hataları düzeltmenize olanak tanır.

## Default value (Varsayılan değer)

Null kabul edilebilir bir türe sahip, başlatılmamış değişkenlerin başlangıç değeri `null`’dur. Sayısal türdeki değişkenler bile başlangıçta `null`’dur; çünkü sayılar — Dart’taki her şey gibi — nesnelerdir.

```dart
int? lineCount;
assert(lineCount == null);
```

> **Not**  
> Üretim kodunda `assert()` çağrısı göz ardı edilir. Öte yandan, geliştirme aşamasında, condition değeri `false` ise `assert(condition)` bir istisna oluşturur. Ayrıntılar için Assert bölümüne bakınız.

Null güvenliği sayesinde, `null` olamayacak değişkenlerin değerlerini kullanmadan önce başlatmanız gerekir:

```dart
int lineCount = 0;
```

Yerel bir değişkeni, bildirildiği yerde başlatmanız gerekmez; ancak kullanılmadan önce ona bir değer atamanız gerekir. Örneğin, aşağıdaki kod geçerlidir çünkü Dart, `lineCount` değişkeninin `print()` işlevine aktarıldığı anda `null` olmadığını tespit edebilir:

```dart
int lineCount;

if (weLikeToCount) {
  lineCount = countLines();
} else {
  lineCount = 0;
}

print(lineCount);
```

Üst düzey ve sınıf değişkenleri gecikmeli olarak başlatılır; başlatma kodu, değişken ilk kez kullanıldığında çalıştırılır.

## Late variables (Geç değişkenler)

“`late`” niteleyicisinin iki kullanım durumu vardır:

- Bildiriminden sonra başlatılan, `null` olamayacak bir değişken tanımlama.
- Bir değişkeni gecikmeli olarak başlatma.

Çoğu zaman Dart’ın kontrol akışı analizi, `null` olamayacak bir değişkenin kullanılmadan önce `null` olmayan bir değere atandığını tespit edebilir; ancak bazen bu analiz başarısız olur. En sık karşılaşılan iki durum, üst düzey değişkenler ve örnek değişkenlerdir: Dart genellikle bunların atanıp atanmadığını belirleyemediği için bunu denemez.

Bir değişkenin kullanılmadan önce tanımlandığından eminseniz, ancak Dart bunun aksini düşünüyorsa, değişkeni `late` olarak işaretleyerek hatayı düzeltebilirsiniz:

```dart
late String description;

void main() {
  description = 'Feijoada!';
  print(description);
}
```

> **Duyuru**  
> Geç tanımlanan bir değişkeni başlatmazsanız, değişken kullanıldığında bir çalışma zamanı hatası oluşur.

Bir değişkeni “`late`” olarak işaretleyip de onu tanımlandığı yerde başlatırsanız, değişken ilk kez kullanıldığında başlatıcı çalıştırılır. Bu “tembel başlatma” yöntemi bazı durumlarda kullanışlıdır:

- Bu değişkene gerek olmayabilir ve onu başlatmak kaynak tüketecektir.
- Bir örnek değişkeni başlatıyorsunuz ve bu değişkenin başlatıcısının `this`'e erişmesi gerekiyor.

Aşağıdaki örnekte, `temperature` değişkeni hiç kullanılmazsa, kaynak tüketen `readThermometer()` işlevi hiçbir zaman çağrılmaz:

```dart
// This is the program's only call to readThermometer().
late String temperature = readThermometer(); // Lazily initialized.
```

## Final and const (Final ve sabit )

Bir değişkeni asla değiştirmek niyetinde değilseniz, `var` yerine ya da bir türün yanı sıra `final` veya `const` kullanın. Bir `final` değişkeni yalnızca bir kez ayarlanabilir; bir `const` değişkeni ise derleme zamanı sabitidir. (Const değişkenleri örtük olarak `final`’dir.)

> **Not**  
> Örnek değişkenleri `final` olabilir, ancak `const` olamaz.

İşte bir `final` değişkeni oluşturup ayarlamaya dair bir örnek:

```dart
final name = 'Bob'; // Without a type annotation
final String nickname = 'Bobby';
```

Final olarak tanımlanmış bir değişkenin değerini değiştiremezsiniz:

```dart
name = 'Alice'; // Error: a final variable can only be set once.
```

Derleme zamanı sabitleri olmasını istediğiniz değişkenler için `const` kullanın. Eğer `const` değişkeni sınıf düzeyindeyse, onu `static const` olarak işaretleyin. Değişkeni bildirdiğiniz yerde, değeri bir sayı veya dize sabiti, bir `const` değişkeni ya da sabit sayılar üzerinde yapılan aritmetik işlemin sonucu gibi bir derleme zamanı sabitine ayarlayın:

```dart
const bar = 1000000; // Unit of pressure (dynes/cm2)
const double atm = 1.01325 * bar; // Standard atmosphere
```

“`const`” anahtar sözcüğü sadece sabit değişkenleri tanımlamak için kullanılmaz. Bu anahtar sözcüğü, sabit değerler oluşturmak ve sabit değerler üreten yapıcıları tanımlamak için de kullanabilirsiniz. Herhangi bir değişken sabit bir değere sahip olabilir.

```dart
var foo = const [];
final bar = const [];
const baz = []; // Equivalent to `const []`
```

Yukarıdaki baz örneğinde olduğu gibi, bir `const` bildiriminin başlatma ifadesinden `const` kelimesini atlayabilirsiniz. Ayrıntılar için bkz. `const`’u gereksiz yere KULLANMAYIN.

Final ve `const` olmayan bir değişkenin referansını, daha önce `const` bir değere sahip olsa bile değiştirebilirsiniz:

```dart
foo = [1, 2, 3]; // Was const []
```

Bir `const` değişkenin değerini değiştiremezsiniz:

```dart
baz = [42]; // Error: Constant variables can't be assigned a value.
```

Tür denetimleri ve tür dönüştürme (`is` ve `as`), koleksiyon `if` ifadesi ve yayma operatörleri (`...` ve `...?`) kullanan sabitler tanımlayabilirsiniz:

```dart
const Object i = 3; // Where i is a const Object with an int value...
const list = [i as int]; // Use a typecast.
const map = {if (i is int) i: 'int'}; // Use is and collection if.
const set = {if (list is List<int>) ...list}; // ...and a spread.
```

> **Not**  
> Nihai bir nesne değiştirilemese de, alanları değiştirilebilir. Buna karşılık, `const` nesne ve alanları değiştirilemez: bunlar değişmez niteliktedir.

“`const`” kullanarak sabit değerler oluşturma hakkında daha fazla bilgi için bkz. Lists, Maps ve Classes.

## Wildcard variables(Joker değişkenler)

> **Sürüm Notu**  
> Joker değişkenler için en az 3.7 sürümünde bir dil sürümü gereklidir.

`_` adındaki bir joker değişken, bağlayıcı olmayan bir yerel değişken veya parametre bildirir; esasen bir yer tutucudur. Varsa, başlatıcı yine de yürütülür, ancak değere erişilemez. Aynı ad alanında, çakışma hatası oluşmadan `_` adında birden fazla bildirim bulunabilir.

Kütüphane gizliliğini etkileyebilecek düzeyde yapılan bildirimler veya üyeler, joker değişkenler için geçerli kullanımlar değildir. Aşağıdaki örnekler gibi bir blok kapsamına yerel olan bildirimlerde joker değişken tanımlanabilir:

- Yerel değişken bildirimi.

  ```dart
  main() {
    var _ = 1;
    int _ = 2;
  }
  ```

- For döngüsü değişkeni bildirimi.

  ```dart
  for (var _ in list) {}
  ```

- Catch cümlesinin parametreleri.

  ```dart
  try {
    throw '!';
  } catch (_) {
    print('oops');
  }
  ```

- Genel tip ve işlev tipi parametreleri.

  ```dart
  class T<_> {}
  void genericFunction<_>() {}

  takeGenericCallback(<_>() => true);
  ```

- Fonksiyon parametreleri.

  ```dart
  Foo(_, this._, super._, void _()) {}

  list.where((_) => true);

  void f(void g(int _, bool _)) {}

  typedef T = void Function(String _, String _);
  ```

> **İpucu**  
> “unnecessary_underscores” lint kuralını etkinleştirerek, isim çakışmalarını önlemek için daha önce kullanılan çoklu bağlayıcı alt çizgi (`__`, `___` vb.) kuralının yerine, tek bir bağlayıcı olmayan joker değişken olan `_`'nin hangi durumlarda kullanılabileceğini belirleyin.

---

# Operators ( Operatörler )

*Dart'ın desteklediği operatörler hakkında bilgi edinin.*

Dart, aşağıdaki tabloda gösterilen operatörleri destekler. Tablo, Dart'ın operatör ilişkilerini yaklaşık olarak gösteren, en yüksekten en düşüğe doğru operatör ilişkilendirme ve öncelik sırasını göstermektedir. Bu operatörlerin çoğunu sınıf üyerleri olarak uygulayabilirsiniz.

| Tanım | Operator | İlişkisellik |
|---|---|---|
| unary postfix | `expr ++    expr --`<br>`()    []    ?[]`<br>`.    ?.    !` | Hiçbiri |
| unary prefix | `- expr    ! expr    ~ expr`<br>`++ expr    -- expr`<br>`await expr` | Hiçbiri |
| multiplicative | `*    /    %    ~/` | Sol |
| additive | `+    -` | Sol |
| shift | `<<    >>    >>>` | Sol |
| bitwise AND | `&` | Sol |
| bitwise XOR | `^` | Sol |
| bitwise OR | `\|` | Sol |
| relational<br>test | `>=    >    <=`<br>`<    as    is    is!` | Hiçbiri |
| equality | `==    !=` | Hiçbiri |
| logical AND | `&&` | Sol |
| logical OR | `\|\|` | Sol |
| if-null | `??` | Sol |
| conditional | `expr1    ?`<br>`expr2    :    expr3` | Sağ |
| cascade | `..    ?..` | Sol |
| assignment | `=    *=    /=    +=`<br>`-=    &=    ^=    etc.` | Sağ |
| spread (See note) | `...    ...?` | Hiçbiri |

> **Uyarı**  
> Önceki tablo yalnızca yardımcı bir kılavuz olarak kullanılmalıdır. Operatör önceliği ve ilişkiselliği kavramı, dil gramerinde bulunan gerçeğin bir yaklaşımıdır. Dart'ın operatör ilişkilerinin kesin davranışını, Dart dil spesifikasyonunda tanımlanan gramerde bulabilirsiniz.

Operatörleri kullandığınızda ifadeler oluşturursunuz. İşte operatör ifadelerine bazı örnekler:

```dart
a++
a + b
a = b
a == b
c ? a : b
a is T
```

## Operator precedence example (Operatör önceliği örneği)

Operatör tablosunda, her operatör, onu izleyen satırlardaki operatörlerden daha yüksek önceliğe sahiptir. Örneğin, çarpımsal operatör %, mantıksal AND operatörden daha yüksek önceliğe sahip olan eşitlik operatöründen `==` daha yüksek önceliğe sahiptir (ve bu nedenle daha önce yürütür) &&. Bu öncelik, aşağıdaki iki kod satırının aynı şekilde yürütüleceği anlamına gelir:

```dart
// Parentheses improve readability.
if ((n % i == 0) && (d % i == 0)) {
  // ...
}

// Harder to read, but equivalent.
if (n % i == 0 && d % i == 0) {
  // ...
}
```

> **Uyarı**  
> İki işlenen alan operatörleri için en soldaki işlenen hangi yöntemin kullanılacağını belirler. Örneğin, bir Vector nesneniz ve bir Point nesneniz varsa, `aVector + aPoint` Vector addition (+) kullanır.

## Arithmetic operators(Aritmetik operatörler)

Dart, aşağıdaki tabloda gösterildiği gibi olağan aritmetik operatörleri destekler.

| Operator | Anlamı |
|---|---|
| `+` | Eklemek |
| `-` | Çıkarma İşlemi |
| `-expr` | Tekli eksi,diğer adıyla olumsuzlama (ifadenin işaretini tersine çevirme) |
| `*` | Çarpmak |
| `/` | Bölmek |
| `~/` | Bölme işlemi, tam sayı sonuç döndürür |
| `%` | Bir tam sayı bölmesinin kalanını(modül) bulun. |

Örnek:

```dart
assert(2 + 3 == 5);
assert(2 - 3 == -1);
assert(2 * 3 == 6);
assert(5 / 2 == 2.5); // Result is a double
assert(5 ~/ 2 == 2); // Result is an int
assert(5 % 2 == 1); // Remainder

assert('5/2 = ${5 ~/ 2} r ${5 % 2}' == '5/2 = 2 r 1');
```

Dart ayrıca hem prefix(önek) hem de postfix(sonek)artırma ve azaltma operatörlerini destekler.

| Operator | Anlamı |
|---|---|
| `++var` | var = var + 1 (ifade değeri şudur: var + 1 ) |
| `var++` | var = var + 1 (ifade değeri şudur : var ) |
| `--var` | var = var - 1 (ifade değeri şudur: var - 1 ) |
| `var--` | var = var - 1 (ifade değeri şudur : var ) |

Örnek:

```dart
int a;
int b;

a = 0;
b = ++a; // Increment a before b gets its value.
assert(a == b); // 1 == 1

a = 0;
b = a++; // Increment a after b gets its value.
assert(a != b); // 1 != 0

a = 0;
b = --a; // Decrement a before b gets its value.
assert(a == b); // -1 == -1

a = 0;
b = a--; // Decrement a after b gets its value.
assert(a != b); // -1 != 0
```

## Equality and relational operators(Eşitlik ve ilişkisel operatörler)

Aşağıdaki tabloda eşitlik ve ilişkisel operatörlerin anlamları listelenmiştir.

| Operator | Anlamı |
|---|---|
| `==` | Eşitlik ; aşağıdaki tartışmaya bakın |
| `!=` | Eşit değil |
| `>` | Daha büyük |
| `<` | Daha küçük |
| `>=` | Büyük veya eşit |
| `<=` | Küçük veya eşit |

İki nesne x ve y'nin aynı şeyi temsil edip etmediğini test etmek için `==` operatörünü kullanın. (İki nesnenin tam olarak aynı nesne olup olmadığını bilmeniz gereken nadir durumlarda, bunun yerine `identical()` fonksiyonunu kullanın.) `==` operatörü şu şekilde çalışır:

Eğer x veya y `null` ise, her ikisi de `null` ise `true`, yalnızca biri `null` ise `false` döndürür.

2. x üzerinde y argümanıyla `==` yönteminin çağrılmasının sonucunu döndürür. (Doğru, `==` gibi operatörler ilk işlenen üzerinde çağrılan yöntemlerdir.  Ayrıntılar için Operatörler bölümüne bakın.)

İşte eşitlik ve ilişki operatörlerinin her birinin kullanımına dair bir örnek:

```dart
assert(2 == 2);
assert(2 != 3);
assert(3 > 2);
assert(2 < 3);
assert(3 >= 3);
assert(2 <= 3);
```

## Type test operators(Test tipi operatörler)

`as`, `is` ve `is!` operatörleri çalışma zamanında türleri kontrol etmek için kullanışlıdır.

| Operator | Anlamı |
|---|---|
| `as` | Tür dönüştürme (ayrıca kütüphane öneklerini belirtmek için de kullanılır ) |
| `is` | Nesnenin belirtilen türe sahip olup olmadığını kontrol edin, doğruysa değeri döndürülür. |
| `is!` | Nesnenin belirtilen türe sahip olmaması durumunda doğru değeri döndürür. |

`obj is T` ifadesi, obj'nin T tarafından belirtilen arayüzü uyguladığı durumda doğrudur. Örneğin, `obj is Object?` ifadesi her zaman doğrudur.

Bir nesneyi belirli bir türe dönüştürmek için `as` operatörünü kullanın; ancak ve ancak nesnenin o türde olduğundan eminseniz. Örnek:

```dart
(employee as Person).firstName = 'Bob';
```

Nesnenin T türünde olduğundan emin değilseniz, nesneyi kullanmadan önce türünü kontrol etmek için `is T` ifadesini kullanın.

```dart
if (employee is Person) {
  // Type check
  employee.firstName = 'Bob';
}
```

> **Not**  
> Kodlar eşdeğer değildir.  Eğer employee `null` ise veya bir Person nesnesi değilse, ilk örnek bir istisna atar; ikinci örnek ise hiçbir şey yapmaz.

## Assignment operators(Atama operatörleri)

Daha önce gördüğünüz gibi, = operatörünü kullanarak değer atayabilirsiniz.  Atanan değişken `null` ise atama yapmak için `??=` operatörünü kullanın.

```dart
// Assign value to a
a = value;
// Assign value to b if b is null; otherwise, b stays the same
b ??= value;
```

+= gibi bileşik atama operatörleri, bir işlemi bir atama işlemiyle birleştirir.

|   |   |   |   |   |
|---|---|---|---|---|
| `=` | `*=` | `%=` | `>>>=` | `^=` |
| `+=` | `/=` | `<<=` | `&=` | `\|=` |
| `-=` | `~/=` | `>>=` |   |   |

Bileşik atama operatörleri şu şekilde çalışır:

|   |   |   |
|---|---|---|
| For an operator op: | `a op= b` | `a = a op b` |
| Example: | `a += b` | `a = a + b` |

Aşağıdaki örnekte atama ve bileşik atama operatörleri kullanılmıştır:

```dart
var a = 2; // Assign using =
a *= 3; // Assign and multiply: a = a * 3
assert(a == 6);
```

## Logical operators(Mantıksal operatörler)

Mantıksal operatörleri kullanarak mantıksal ifadeleri ters çevirebilir veya birleştirebilirsiniz.

| Operator | Anlamı |
|---|---|
| `!expr` | Aşağıdaki ifadeyi tersine çevirir(yanlışı doğruya,doğruyu yanlışa çevirir). |
| `\|\|` | Mantıksal OR |
| `&&` | Mantıksal AND |

İşte mantıksal operatörlerin kullanımına dair bir örnek:

```dart
if (!done && (col == 0 || col == 3)) {
  // ...Do something...
}
```

## Bitwise and shift operators(Bit düzeyinde ve kaydırma operatörleri)

Dart'taki sayıların tek tek bitlerini değiştirebilirsiniz. Genellikle, bu bitwise ve shift operatörlerini tamsayılarla kullanırsınız.

| Operator | Anlamı |
|---|---|
| `&` | AND |
| `\|` | OR |
| `^` | XOR |
| `~expr` | Unary bitwise complement (0'lar 1'e; 1'ler 0'a dönüşür) |
| `<<` | Sola kaydır |
| `>>` | Sağa kaydır |
| `>>>` | İmzasız sağa kaydırma |

> **Not**  
> Büyük veya negatif operatörlerle yapılan bitwise işlemlerin davranışı platformlar arasında farklılık gösterebilir. Daha fazla bilgi edinmek için Bitwise operations platform differences bölümünü inceleyin.

İşte bitwise ve shift operatörlerinin kullanımına dair bir örnek:

```dart
final value = 0x22;
final bitmask = 0x0f;

assert((value & bitmask) == 0x02); // AND
assert((value & ~bitmask) == 0x20); // AND NOT
assert((value | bitmask) == 0x2f); // OR
assert((value ^ bitmask) == 0x2d); // XOR

assert((value << 4) == 0x220); // Shift left
assert((value >> 4) == 0x02); // Shift right

// Shift right example that results in different behavior on web
// because the operand value changes when masked to 32 bits:
assert((-value >> 4) == -0x03);

assert((value >>> 4) == 0x02); // Unsigned shift right
assert((-value >>> 4) > 0); // Unsigned shift right
```

> **Sürüm notu**  
> >>> operatörü (üçlü kaydırma veya işaretsiz kaydırma olarak bilinir) en az 2.14 sürümündeki bir dil gerektirir.

## Conditional expressions(Koşullu ifadeler)

Dart'ta, normalde `if-else` ifadeleri gerektirebilecek ifadeleri kısa ve öz bir şekilde değerlendirmenizi sağlayan iki operatör bulunur:

```dart
condition ? expr1 : expr2
```

Koşul doğruysa, `expr1` ifadesini değerlendirir (ve değerini döndürür); aksi takdirde, `expr2` ifadesini değerlendirir ve değerini döndürür.

```dart
expr1 ?? expr2
```

Eğer `expr1` boş değilse, değerini döndürür; aksi takdirde `expr2`'nin değerini değerlendirir ve döndürür.

Boolean ifadesine göre bir değer atamanız gerektiğinde, ? and : koşul operatörlerini kullanmayı düşünün.

```dart
var visibility = isPublic ? 'public' : 'private';
```

Boolean ifadesi `null` değerini kontrol ediyorsa, `if-null` operatörü `??`'yi (`null` birleştirme operatörü olarak da bilinir) kullanmayı düşünün.

```dart
String playerName(String? name) => name ?? 'Guest';
```

Önceki örnek en az iki farklı şekilde daha yazılabilirdi, ancak bu kadar öz ve net olmazdı:

```dart
// Slightly longer version uses ?: operator.
String playerName(String? name) => name != null ? name : 'Guest';

// Very long version uses if-else statement.
String playerName(String? name) {
  if (name != null) {
    return name;
  } else {
    return 'Guest';
  }
}
```

## Cascade notation(Basamaklı gösterim)

Cascades (`..`, `?..`) aynı nesne üzerinde bir dizi işlem yapmanıza olanak tanır. Örnek üyelerine erişmenin yanı sıra, aynı nesne üzerindeki örnek yöntemlerini de çağırabilirsiniz. Bu, genellikle geçici bir değişken oluşturma adımını ortadan kaldırır ve daha akıcı bir kod yazmanıza olanak tanır.

Aşağıdaki kodu göz önünde bulundurun:

```dart
var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0;
```

`Paint()` yapıcısı bir `Paint` nesnesi döndürür. Basamaklı gösterimden sonra gelen kod, bu nesne üzerinde işlem yapar ve döndürülebilecek değerleri yok sayar.

Önceki örnek şu koda eşdeğerdir:

```dart
var paint = Paint();
paint.color = Colors.black;
paint.strokeCap = StrokeCap.round;
paint.strokeWidth = 5.0;
```

Eğer cascade işlem yaptığı nesne `null` olabilirse, ilk işlem için `null`-shorting cascade(`?..`) kullanın.  `?..` ile başlamak, cascade işlemlerinin hiçbirinin bu `null` nesne üzerinde denenmemesini garanti eder.

```dart
document.querySelector('#confirm') // Get an object.
  ?..textContent =
      'Confirm' // Use its members.
  ..classList.add('important')
  ..onClick.listen((e) => window.alert('Confirmed!'))
  ..scrollIntoView();
```

Önceki kod aşağıdakine eşdeğerdir:

```dart
final button = document.querySelector('#confirm');
button?.textContent = 'Confirm';
button?.classList.add('important');
button?.onClick.listen((e) => window.alert('Confirmed!'));
button?.scrollIntoView();
```

Ayrıca cascades iç içe yerleştirebilirsiniz. Örneğin:

```dart
final addressBook =
    (AddressBookBuilder()
          ..name = 'jenny'
          ..email = 'jenny@example.com'
          ..phone =
              (PhoneNumberBuilder()
                    ..number = '415-555-0100'
                    ..label = 'home')
                  .build())
        .build();
```

cascadenizi gerçek bir nesne döndüren bir fonksiyon üzerine kurarken dikkatli olun. Örneğin, aşağıdaki kod çalışmaz:

```dart
var sb = StringBuffer();
sb.write('foo')
  ..write('bar'); // Error: method 'write' isn't defined for 'void'.
```

`SB.write()` çağrısı `void` döndürür ve `void` üzerinde bir basamak oluşturamazsınız.

> **Not**  
> Kesin konuşmak gerekirse, basamaklı işlemler için kullanılan "çift nokta" gösterimi bir operatör değildir.  Bu, Dart syntaxın bir parçasıdır.

## Spread operators(Yayılma operatörleri)

Yayma operatörleri, bir koleksiyon üreten bir ifadeyi değerlendirir, elde edilen değerleri açar ve bunları başka bir koleksiyona ekler.

Yayılma operatörü aslında bir operatör ifadesi değildir.  `...`/`...?` syntax, koleksiyon değişmez değerinin bir parçasıdır.  Dolayısıyla, yayılma operatörleri hakkında daha fazla bilgiyi Collections sayfasında bulabilirsiniz.

Bir operatör olmadığı için, syntax da herhangi bir "operatör önceliği" yoktur.  Etkili bir şekilde, en düşük "önceliğe" sahiptir — yayılma hedefi olarak her türlü ifade geçerlidir, örneğin:

```dart
[...a + b]
```

## Other operators (Diğer operatörler)

Kalan operatörlerin çoğunu diğer örneklerde gördünüz:

| Operator | İsim | Anlam |
|---|---|---|
| `()` | Fonksiyon uygulması | Bir fonksiyon çağrısını temsil eder. |
| `[]` | Abonelik erişimi | Geçersiz kılınabilir operatöre yapılan bir çağrıyı temsil eder. |
| `?[]` | Koşullu alt simge erişimi | Benzer şekilde [],ancak en soldaki işlenen null olabilir. |
| `.` | Üye erişimi | Bir ifadenin bir özelliğine atıfta bulunur. |
| `?.` | Şartlı üye erişimi | Benzer şekilde . , ancak en soldaki işlenen null olabilir. |
| `!` | Boş olmayan doğrulama operatörü | Bir ifadeyi,temelindeki boş değer alamayan türe dönüştürür; dönüştürme başarısız olursa çalışma zamanı hatası fırlatır. |

., `?.`, ve `..` operatörleri hakkında daha fazla bilgi için Classes bölümüne bakın.

---

# Comments(Yorumlar)

*Dart'taki farklı yorum türleri.*

Dart tek satırlık yorumları, çok satırlık yorumları ve dokümantasyon yorumlarını destekler.

## Single-line comments(Tek satırlı yorumlar)

Tek satırlık bir yorum `//` ile başlar. `//` ile satır sonu arasındaki her şey Dart derleyicisi tarafından göz ardı edilir.

```dart
void main() {
  // TODO: refactor into an AbstractLlamaGreetingFactory?
  print('Welcome to my Llama farm!');
}
```

## Multi-line comments(Çok satırlı yorumlar)

Çok satırlı bir yorum `/*` ile başlar ve `*/` ile biter. `/*` ile `*/` arasındaki her şey Dart derleyicisi tarafından yok sayılır (yorum bir dokümantasyon yorumu olmadığı sürece; bir sonraki bölüme bakın). Çok satırlı yorumlar iç içe geçebilir.

```dart
void main() {
  /*
   * This is a lot of work. Consider raising chickens.

  Llama larry = Llama();
  larry.feed();
  larry.exercise();
  larry.clean();
   */
}
```

## Documentation comments(Dokümantasyon yorumları)

Dokümantasyon yorumları, `///` veya `/**.` ile başlayan çok satırlı veya tek satırlı yorumlardır. Ardışık satırlarda `///` kullanmak, çok satırlı dokümantasyon yorumu ile aynı etkiyi yaratır.

Bir dokümantasyon yorumunun içinde, analizör parantez içine alınmamış tüm metni yok sayar.  Parantez kullanarak sınıflara, yöntemlere, alanlara, üst düzey değişkenlere, fonksiyonlara ve parametrelere referans verebilirsiniz.  Parantez içindeki adlar, belgelenen program öğesinin sözdizimsel kapsamında çözümlenir.

İşte diğer sınıflara ve argümanlara referanslar içeren dokümantasyon yorumlarına bir örnek:

```dart
/// A domesticated South American camelid (Lama glama).
///
/// Andean cultures have used llamas as meat and pack
/// animals since pre-Hispanic times.
///
/// Just like any other animal, llamas need to eat,
/// so don't forget to [feed] them some [Food].
class Llama {
  String? name;

  /// Feeds your llama [food].
  ///
  /// The typical llama eats one bale of hay per week.
  void feed(Food food) {
    // ...
  }

  /// Exercises your llama with an [activity] for
  /// [timeLimit] minutes.
  void exercise(Activity activity, int timeLimit) {
    // ...
  }
}
```

Sınıfın oluşturulan dokümanlarında, [feed] ifadesi feed yönteminin dokümanlarına bir bağlantı haline gelir ve [`Food`] ifadesi ise `Food` sınıfının dokümanlarına bir bağlantı haline gelir.

Dart kodunu ayrıştırmak ve HTML dokümantasyonu oluşturmak için Dart'ın dokümantasyon oluşturma aracı olan dart.doc kullanabilirsiniz. Oluşturulan dokümantasyon örneği için Dart API documentation bakın. Yorumlarınızı nasıl yapılandıracağınıza dair tavsiyeler için Effective Dart:Documentation bölümüne bakın.
