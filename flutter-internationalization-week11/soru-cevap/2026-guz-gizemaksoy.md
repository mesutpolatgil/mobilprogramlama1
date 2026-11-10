# Flutter Internationalization (i18n) — Soru-Cevap

**Konu:** [Internationalizing Flutter apps](https://docs.flutter.dev/ui/internationalization)
**Hazırlayanlar:** Gizem Aksoy, Gaye Aksoy · 2026 Güz · Hafta 11

---

## Test Soruları

### Soru 1

Bir Flutter uygulamasına hiçbir yerelleştirme ayarı eklenmediğinde, Flutter varsayılan olarak hangi dilin yerelleştirmelerini sağlar?

- A) Cihazın sistem dili
- B) Yalnızca ABD İngilizcesi (US English)
- C) Material ve Cupertino'nun desteklediği tüm diller
- D) `supportedLocales` listesindeki ilk dil

**Cevap: B**

**Açıklama:** Flutter varsayılan olarak yalnızca ABD İngilizcesi yerelleştirmelerini sağlar. Başka diller için `flutter_localizations` paketi eklenmeli, `localizationsDelegates` ve `supportedLocales` özellikleri tanımlanmalıdır.

---

### Soru 2

`app_en.arb` dosyasında aşağıdaki mesaj tanımlanmıştır:

```json
"pronoun": "{gender, select, male{he} female{she} other{they}}"
```

`AppLocalizations.of(context)!.pronoun("Male")` çağrısı ne döndürür?

- A) `he`
- B) `she`
- C) `they`
- D) Hata verir (exception)

**Cevap: C**

**Açıklama:** `select` ifadelerinde parametre ile durum adları arasındaki karşılaştırma büyük/küçük harfe duyarlıdır. `"Male"`, `male` durumuyla eşleşmez. Bu yüzden varsayılan `other` durumuna düşer ve `they` döner.

---

## Klasik Sorular

### Soru 3

`gen-l10n` aracıyla bir uygulamaya kendi yerelleştirilmiş mesajlarınızı eklemek için yapılması gereken adımları sırasıyla açıklayınız.

**Cevap:**

1. `flutter pub add flutter_localizations:"{sdk: flutter}" intl:any` komutuyla `flutter_localizations` ve `intl` paketleri bağımlılık olarak eklenir.
2. `pubspec.yaml` dosyasının `flutter` bölümüne `generate: true` satırı eklenerek kod üretimi etkinleştirilir.
3. Proje kök dizinine bir `l10n.yaml` dosyası oluşturulur. Bu dosyada `.arb` dosyalarının dizini (`arb-dir: lib/l10n`), şablon dosya (`template-arb-file: app_en.arb`) ve üretilecek dosyanın adı (`output-localization-file: app_localizations.dart`) belirtilir.
4. `lib/l10n` dizinine şablon dosya `app_en.arb` eklenir ve mesajlar anahtar–değer çiftleri olarak yazılır.
5. Desteklenecek her dil için aynı anahtarlara sahip başka bir `.arb` dosyası eklenir (ör. `app_es.arb`).
6. `flutter pub get`, `flutter run` veya `flutter gen-l10n` komutu çalıştırılarak `AppLocalizations` sınıfı otomatik üretilir.
7. `app_localizations.dart` içe aktarılır ve `AppLocalizations.delegate`, `MaterialApp`'in `localizationsDelegates` listesine eklenir. `supportedLocales` için `AppLocalizations.supportedLocales` kullanılabilir.
8. Metinler widget'larda `AppLocalizations.of(context)!.helloWorld` şeklinde kullanılır. Bu çağrı yalnızca Material uygulaması başladıktan sonra çalışır, aksi hâlde null hatası oluşur.

---

### Soru 4

Kullanıcı cihazının dilini değiştirdiğinde Flutter, uygulamanın hangi yerel ayarı (locale) kullanacağına nasıl karar verir? `supportedLocales` ve `localeResolutionCallback`'in bu süreçteki rolünü açıklayınız.

**Cevap:**

`MaterialApp`'in `supportedLocales` parametresi, uygulamanın geçebileceği yerel ayarları sınırlar. Kullanıcı cihazın yerel ayarını değiştirdiğinde uygulamanın `Localizations` widget'ı bu değişikliğe yalnızca yeni yerel ayar bu listede varsa uyar. Flutter şu sırayla karar verir:

1. Cihazın yerel ayarıyla **tam olarak eşleşen** bir yerel ayar `supportedLocales` içinde varsa o kullanılır.
2. Tam eşleşme yoksa, **aynı dil koduna** (`languageCode`) sahip ilk desteklenen yerel ayar kullanılır.
3. Bu da yoksa `supportedLocales` listesinin **ilk elemanı** kullanılır.

Bu varsayılan davranış değiştirilmek istenirse `localeResolutionCallback` tanımlanır. Bu fonksiyon cihazın yerel ayarını ve desteklenen yerel ayarlar listesini alır ve kullanılacak yerel ayarı döndürür. Örneğin aşağıdaki kod, kullanıcının seçtiği yerel ayarı koşulsuz kabul eder:

```dart
MaterialApp(
  localeResolutionCallback: (locale, supportedLocales) {
    return locale;
  },
);
```

Uygulamanın o anki yerel ayarı ise `Localizations.localeOf(context)` ile öğrenilebilir.
