# Dart Çevirisi – Anlama Kontrol Soruları

Bu sorular, çeviriyi okuyan kişinin konuyu gerçekten anlayıp anlamadığını ölçmek için hazırlandı. İlk iki soru klasik (açık uçlu), son iki soru çoktan seçmeli testtir. Cevaplar en altta.

---

## Soru 1 (Klasik)

Aşağıdaki kodu inceleyin.

```dart
final name = 'Bob';
const bar = 1000000;
const double atm = 1.01325 * bar;
name = 'Alice';
```

a) `final` ile `const` arasındaki temel fark nedir? Kendi cümlelerinizle açıklayın.

b) Bu kodda hangi satır hata verir ve neden?

c) `const double atm = 1.01325 * bar;` satırı neden geçerlidir? Bu satırda `const` yerine `final` yazılsaydı ne değişirdi?

---

## Soru 2 (Klasik)

Aşağıdaki kodu inceleyin.

```dart
String? name;
var result = name ?? 'Misafir';
var length = name?.length;
name ??= 'Ayşe';

print(result);
print(length);
print(name);
```

a) Kod çalıştırıldığında üç `print` satırı sırasıyla ne yazdırır?

b) Kodda kullanılan `??`, `?.` ve `??=` operatörlerinin her birinin ne işe yaradığını açıklayın.

c) `String? name;` yerine `String name;` yazılsaydı, null güvenliği (null safety) açısından ne olurdu?

---

## Soru 3 (Test)

Aşağıdaki kodun çıktısı nedir?

```dart
int a = 5;
int b = a++;
int c = ++a;
print('$a $b $c');
```

A) `6 5 6`

B) `7 6 7`

C) `7 5 7`

D) `7 5 6`

---

## Soru 4 (Test)

`late` değişkenleriyle ilgili aşağıdakilerden hangisi doğrudur?

A) `late` ile işaretlenen bir değişken, null olabilen (`?`) bir değişkenle aynı anlama gelir.

B) Başlatılmadan önce okunmaya çalışılan bir `late` değişken, çalışma zamanında hata fırlatır.

C) `late final` olarak tanımlanan bir değişkene istenildiği kadar yeniden değer atanabilir.

D) `late` ile işaretlenen bir yerel değişkenin başlatıcısı, değişken bildirildiği anda hemen çalışır.

---
---

# Cevap Anahtarı

## Cevap 1

**a)** İkisi de değeri yalnızca bir kez atanabilen değişkenlerdir. Fark, değerin ne zaman bilindiğindedir. `final` değişkenin değeri çalışma zamanında belirlenebilir, ancak bir kez atandıktan sonra değiştirilemez. `const` değişken ise derleme zamanı sabitidir. Değeri program çalışmadan önce, derleme sırasında bilinmek zorundadır. Bu yüzden `const` her zaman `final` olarak da davranır, ama tersi doğru değildir.

**b)** `name = 'Alice';` satırı hata verir. `name`, `final` olarak tanımlandığı için bir kez `'Bob'` değeri atanmıştır ve tekrar değer atanamaz.

**c)** `bar` bir `const` olduğundan değeri derleme zamanında bilinir. `1.01325 * bar` ifadesi de yalnızca derleme zamanı sabitlerinden oluşur, bu yüzden derleme zamanında hesaplanabilir ve `const` olabilir. Bu satırda `final` yazılsaydı da kod geçerli olurdu, ancak değer derleme zamanı sabiti olmaz, çalışma zamanında hesaplanabilen bir `final` değişken olurdu.

*Değerlendirme notu:* (a) için derleme zamanı / çalışma zamanı ayrımı, (b) için `name` satırının ve nedeninin doğru bulunması, (c) için `const` ifadenin yalnızca sabitlerden oluşması gerektiği vurgusu aranmalıdır.

---

## Cevap 2

**a)** Çıktı sırasıyla şöyledir:

```
Misafir
null
Ayşe
```

`name` başta `null` olduğu için `result` değişkenine `'Misafir'` atanır. `name?.length` ifadesi `name` null olduğundan null döner. Son olarak `name ??= 'Ayşe'` satırı `name` null olduğu için ona `'Ayşe'` değerini atar. `result` ve `length` bu atamadan önce hesaplandığı için değişmez.

**b)**
- `??` (if-null): Sol taraf null değilse onu, null ise sağ taraftaki değeri döndürür.
- `?.` (koşullu üye erişimi): Soldaki ifade null değilse üyeye erişir, null ise hata vermek yerine null döndürür.
- `??=` (null ise ata): Değişken yalnızca null ise sağdaki değeri atar, değilse hiçbir şey yapmaz.

**c)** `String name;` ifadesi, `name`'in null olamayacağı anlamına gelir. Ancak değişkene bir değer verilmemiştir. Bu durumda Dart, değişkenin kullanılmadan önce başlatılmasını zorunlu kılar. Başlatılmazsa derleme hatası alınır. Ayrıca `name`'e null atanamaz ve `name ?? 'Misafir'` gibi ifadeler gereksiz (anlamsız) hale gelir.

*Değerlendirme notu:* (a) için üç doğru çıktının yanı sıra `result` ve `length`'in `??=` satırından önce hesaplandığının fark edilmesi, (b) için üç operatörün doğru ayrımı, (c) için null olamayan türün başlatma zorunluluğu aranmalıdır.

---

## Cevap 3

**Doğru cevap: C) `7 5 7`**

Adım adım:
1. `a = 5` olarak başlar.
2. `int b = a++;` önce `a`'nın mevcut değerini (5) `b`'ye atar, sonra `a`'yı 1 artırır. Böylece `b = 5` ve `a = 6` olur.
3. `int c = ++a;` önce `a`'yı 1 artırır (7), sonra bu yeni değeri `c`'ye atar. Böylece `a = 7` ve `c = 7` olur.
4. Sonuç: `a = 7`, `b = 5`, `c = 7`.

Diğer şıklar, `a++` (sonek) ile `++a` (önek) arasındaki farkın karıştırılmasından kaynaklanır. Sonek operatör eski değeri, önek operatör ise artırılmış yeni değeri döndürür.

---

## Cevap 4

**Doğru cevap: B)**

`late` değişkeni, bildirim sırasında değer verilmese de değişkenin kullanılmadan önce başlatılacağını Dart'a söyler. Başlatılmadan okunursa çalışma zamanında hata oluşur.

- A yanlış: `late` değişken null olabilen bir değişken değildir. Null olamayan bir türü sonradan başlatmak için kullanılır.
- C yanlış: `late final` değişkene yalnızca bir kez değer atanabilir.
- D yanlış: `late` ile işaretlenmiş ve başlatıcısı olan bir değişkenin başlatıcısı, bildirim anında değil, değişken ilk kez kullanıldığında çalışır (tembel başlatma).
