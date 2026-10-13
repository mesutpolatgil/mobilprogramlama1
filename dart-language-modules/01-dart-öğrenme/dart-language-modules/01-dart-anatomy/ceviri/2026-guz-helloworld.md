> **Uyarı:** Bu içerik, SCÜ Şarkışla UBYO Mobil Programlama I dersi kapsamında tamamen eğitim amaçlı çevrilmiş ve derlenmiştir. Orijinal dokümantasyon kaynakları (dart.dev, docs.flutter.dev) kendi orijinal lisanslarına (BSD-3-Clause, CC-BY 4.0) tabidir. Bu çalışmanın hiçbir ticari amacı yoktur.

# Dart Anatomisi ve Temel Sözdizimi (01-dart-anatomy)

Bu doküman, Dart programlama dilinin temel anatomisini, veri türlerini, sabit yapılarını ve karar mekanizmalarını resmi kaynaklardan (dart.dev) derleyerek Türkçe olarak sunar.

---

## 📑 İçindekiler

- [1. Dart Program Anatomisi ve main() Fonksiyonu](#1-dart-program-anatomisi-ve-main-fonksiyonu)
- [2. Temel Veri Tipleri: int ve double](#2-temel-veri-tipleri-int-ve-double)
  - [2.1 int Veri Türü](#21-int-veri-türü)
  - [2.2 double Veri Türü](#22-double-veri-türü)
  - [2.3 Sayısal Tip Dönüşümleri](#23-sayısal-tip-dönüşümleri)
- [3. Sabitler: const ve final Yapıları](#3-sabitler-const-ve-final-yapıları)
  - [3.1 final Anahtar Kelimesi](#31-final-anahtar-kelimesi)
  - [3.2 const Anahtar Kelimesi](#32-const-anahtar-kelimesi)
  - [3.3 final vs const Karşılaştırma Tablosu](#33-final-vs-const-karşılaştırma-tablosu)
- [4. Mantıksal Karar Yapıları: if, else if, else](#4-mantıksal-karar-yapıları-if-else-if-else)
  - [4.1 Temel if-else Blokları](#41-temel-if-else-blokları)
  - [4.2 Mantıksal Operatörler](#42-mantıksal-operatörler)
- [5. Uygulama Entegrasyonu: PPL Hacim Hesaplayıcı](#5-uygulama-entegrasyonu-ppl-hacim-hesaplayıcı)

---

## 1. Dart Program Anatomisi ve main() Fonksiyonu

Her Dart programının yürütülmeye başladığı giriş noktası üst düzey (top-level) `main()` fonksiyonudur:

```dart
void main() {
  print('Merhaba Mobil Programlama!');
}
```

Dart; nesne yönelimli (OOP), güçlü tipli (strongly typed) ve sesli null güvenliği (sound null safety) mekanizmasına sahip modern bir dildir.

---

## 2. Temel Veri Tipleri: int ve double

Dart'ta tüm sayılar `num` soyut sınıfından türer. Temel olarak iki alt türe ayrılır:

### 2.1 int Veri Türü
Tam sayı değerlerini temsil eder. 64-bit hassasiyettedir.
- **Kullanım Alanları:** Sayma işlemleri, döngü sayaçları, set/tekrar sayıları, süreler (saniye).

```dart
int setSayisi = 4;
int tekrarSayisi = 12;
int dinlenmeSuresi = 90; // saniye
```

### 2.2 double Veri Türü
64-bit IEEE 754 standardında ondalıklı sayıları temsil eder.
- **Kullanım Alanları:** Hassas ölçümler, ağırlık, tonaj hesabı, oranlar, koordinatlar.

```dart
double agirlik = 75.5; // kg
double hedefAgirlik = 80.0;
double hacim = setSayisi * tekrarSayisi * agirlik; // 3624.0 kg
```

### 2.3 Sayısal Tip Dönüşümleri

```dart
// String -> Sayı
int tamsayi = int.parse('10');
double ondalik = double.parse('82.5');

// Sayı -> String
String agirlikMetni = agirlik.toStringAsFixed(1); // "75.5"
```

---

## 3. Sabitler: const ve final Yapıları

Bir değişkenin değerinin sonradan değiştirilmesini engellemek için `final` veya `const` kullanılır.

### 3.1 final Anahtar Kelimesi
`final` ile tanımlanan değişken çalışma anında (runtime) yalnızca **bir kez** başlatılabilir ve sonrasında değeri değiştirilemez.

```dart
final DateTime anlikZaman = DateTime.now(); // Çalışma anında atanır
final double hesaplananHacim = setSayisi * tekrarSayisi * agirlik;
```

### 3.2 const Anahtar Kelimesi
`const` ile tanımlanan değişkenler **derleme anı (compile-time)** sabitleridir. Değerleri kod derlenirken kesin olarak bilinmelidir.

```dart
// Evrensel ve değiştirilemez antrenman standartları
const int standartDinlenmeSuresi = 90;
const double asiriYuklenmeAdimi = 2.5; // +2.5 kg artış önerisi
const String dersKodu = "MOB101";
```

### 3.3 final vs const Karşılaştırma Tablosu

| Özellik | `final` | `const` |
| :--- | :--- | :--- |
| **Atanma Zamanı** | Çalışma Zamanı (Runtime) | Derleme Zamanı (Compile-time) |
| **Kullanım Örneği** | API'den gelen veri, `DateTime.now()`, kullanıcı girdisi hesabı | Matematiksel sabitler (`pi`), önceden bilinen kural ve limitler |
| **Yeniden Atanabilirlik** | Değiştirilemez (Immutable) | Değiştirilemez (Immutable) |
| **Bellek Yönetimi** | Nesne oluşturulduğunda bellek ayrılır | Kanonikleştirilir (tek bellek adresi paylaşılır) |

---

## 4. Mantıksal Karar Yapıları: if, else if, else

Dart dilinde akış kontrolü koşullu ifadelerle sağlanır:

### 4.1 Temel if-else Blokları

```dart
bool tukeniseUlasildi = true;
int dinlenme = 90;

if (tukeniseUlasildi) {
  dinlenme += 30; // Tükeniş bonusu
  print('Tükeniş gerçekleşti. Dinlenme: $dinlenme sn');
} else {
  print('Rezervde tekrar bırakıldı. Standart dinlenme: $dinlenme sn');
}
```

### 4.2 Mantıksal Operatörler
- `&&` (VE - AND)
- `||` (VEYA - OR)
- `!` (DEĞİL - NOT)

```dart
if (yapilanTekrar >= hedefTekrar && kaldirilanAgirlik >= hedefAgirlik) {
  print('Hedef başarıyla tamamlandı! Ağırlığı artırabilirsiniz.');
} else if (yapilanTekrar >= hedefTekrar) {
  print('Tekrar tuttu, ağırlığı artırmayı deneyin.');
} else {
  print('Hedefe ulaşılamadı. Aynı ağırlıkta devam edin.');
}
```

---

## 5. Uygulama Entegrasyonu: PPL Hacim Hesaplayıcı

Bu konu modülü kapsamında `v1-2026-helloworld` klasöründe geliştirilen mobil uygulama; `int`, `double`, `const`, `final` ve `if/else` mimarilerini Push-Pull-Legs antrenman hacim hesaplama modelinde birebir çalıştırmaktadır.
