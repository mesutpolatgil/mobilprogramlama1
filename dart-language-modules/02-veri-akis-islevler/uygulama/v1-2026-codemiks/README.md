# Ders Not Sistemi (v1 · 2026 · codemiks)

**Mobil Programlama I · 2. Takım (codemiks)**
Konu: Dart dili, Veri, Akış ve İşlevler (Types, Patterns, Control flow, Functions)

Bu klasörde iki şey var:

1. **`main.dart`**: Konuların hepsini tek bir senaryoda kullanan bir konsol uygulaması. Uygulama öğrenci kayıtlarını ham veriden (JSON benzeri map'lerden) okur, doğrular, değerlendirir ve rapor üretir.
2. **`cods/`** ve **`dart-dil-rehberi.pdf`**: dart.dev'deki 246 kod örneğinin çalıştırılabilir halleri ve Türkçe rehber. PDF'teki her kod kutusuna tıklayınca ilgili dosya açılır. Bunun için PDF ile `cods/` klasörü yan yana durmalıdır.

## Çalıştırma

Dart SDK 3.8 ya da daha yenisi gerekir (null-aware koleksiyon elemanları için).

```bash
dart run --enable-asserts main.dart
```

Kod örneklerinden birini çalıştırmak için:

```bash
cd cods
dart pub get
dart run 1_types/1_built_in_types/05_number_conversion.dart
```

VS Code'da `cods` klasörünü açıp bir dosyadayken **Ctrl+Shift+B**'ye basarsanız o dosya doğrudan çalışır.

## Uygulamada hangi konu nerede?

| Bölüm | Ne yapıyor | Kullanılan konular |
|---|---|---|
| 1. Veriyi okuma | Ham map'leri `if-case` ile doğrular, hatalı notu özel istisnayla reddeder | Map/List, map ve list desenleri, `try/on/catch/finally`, özel `Exception`, `assert` |
| 2. Değerlendirme | Her öğrenciye Geçti/Kaldı/Devamsız sonucu verir | `typedef` ile record tipi, record ayrıştırma, `sealed class`, kapsayıcı `switch` ifadesi, `when` koruma ifadesi, ilişkisel desenler (`>= 90`) |
| 3. İstatistik | En yüksek, en düşük ve ortalama notu bulur | Birden çok değer döndüren record `(int, int, double)`, `for-in`, `continue`, ok (`=>`) fonksiyonları |
| 4. Koleksiyon elemanları | Rapor listesini kurar | Collection `if`/`else`, collection `for`, spread (`...`), null-aware eleman (`?onurOgrencisi`), `break` |
| 5. Fonksiyonlar | Not dönüştürme ve sayaç | Tear-off, closure, fonksiyon tipli `typedef`, isimli ve isteğe bağlı parametreler, `sync*` üreteç |
| 6. Getter / Setter | Ders katsayısını doğrulayarak değiştirir | `get`/`set`, `ArgumentError` |
| 7. Etiketli döngü | İç içe döngüden tek seferde çıkar | `break` ile etiket (`dis:`) |
| 8. Asenkron duyurular | Kayıtları sırayla duyurur | `async*` üreteç, `Stream`, `await for` |

Ayrıca `Depo<T>` sınıfı **generic** tip kullanımını gösteriyor.

## Beklenen çıktı (kısaltılmış)

```text
=== 1. Veriyi okuma  [Types · Collections · Patterns · Error handling] ===
Eklendi: Ayşe -> [85, 92, 78]
Eklendi: Mert -> [45, 52, 38]
Eklendi: Deniz -> []
Eklendi: Selin -> [99, 95]
Reddedildi: GecersizNotHatasi: 120, 0-100 aralığında değil
Atlandı (biçim uygun değil): bozuk kayıt
Toplam kayıt: 4

=== 2. Değerlendirme  [Records · Sealed class · Switch expression · Guard] ===
Ayşe  : Geçti (BA)
Mert  : Kaldı: Mert (102) ortalaması 45.0
Deniz : Devamsız
Selin : Geçti (AA)
...
```

## `cods/` klasör yapısı

```text
cods/
├── 1_types/          Yerleşik tipler, record'lar, koleksiyonlar, generic'ler, typedef'ler, tip sistemi
├── 2_patterns/       Desenler, desen tipleri
├── 3_control_flow/   Döngüler, dallanmalar, hata yönetimi
├── 4_functions/      Fonksiyonlar
└── _ortak/           Örneklerin ortak kullandığı yardımcı sınıflar (hayvan hiyerarşisi, Flutter taklitleri)
```

- Dosya adları dart.dev'deki örnek bölge adlarından gelir (örnek: `05_number_conversion.dart`).
- Başında `// Not: Bu örnek bilerek ... hata verir` yazan dosyalar, dokümandaki hatalı kullanım örnekleridir. Bunlar analizden hariç tutulmuştur.
- `_sozdizimi.dart` ile biten dosyalar çalıştırılabilir kod değil, sözdizimi şablonudur.

Kaynak: <https://dart.dev/language> (CC-BY 4.0, kod örnekleri BSD-3-Clause)
