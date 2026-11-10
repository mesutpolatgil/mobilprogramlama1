> **Uyarı:** Bu içerik, SCÜ Şarkışla UBYO Mobil Programlama I dersi kapsamında tamamen eğitim amaçlı çevrilmiş ve derlenmiştir. Orijinal dokümantasyon kaynakları (dart.dev, docs.flutter.dev) kendi orijinal lisanslarına (BSD-3-Clause, CC-BY 4.0) tabidir. Bu çalışmanın hiçbir ticari amacı yoktur.

# Flutter Uygulamalarını Uluslararasılaştırma (i18n)

## İçindekiler

- [Flutter'da yerelleştirmeye giriş](#giris)
  - [`flutter_localizations` ile uluslararasılaştırılmış bir uygulama kurmak](#kurulum)
  - [Yerel ayarı geçersiz kılmak (override)](#override)
  - [Kendi yerelleştirilmiş mesajlarınızı eklemek](#mesaj-ekleme)
  - [Yer tutucular, çoğullar ve seçimler](#yer-tutucular)
  - [Kaçış (escaping) sözdizimi](#kacis)
  - [Sayı ve para birimi içeren mesajlar](#sayilar)
  - [Tarih içeren mesajlar](#tarihler)
  - [iOS için yerelleştirme: iOS uygulama paketini güncellemek](#ios)
- [İleri düzey özelleştirme konuları](#ileri)
  - [Gelişmiş yerel ayar tanımı](#gelismis-locale)
  - [Yerel ayarı takip etmek: `Locale` sınıfı ve `Localizations` widget'ı](#locale-takip)
  - [Uygulamanın `supportedLocales` parametresini belirlemek](#supported-locales)
  - [`l10n.yaml` dosyasını yapılandırmak](#l10n-yaml)
- [Flutter'da uluslararasılaştırma nasıl çalışır?](#nasil-calisir)
  - [Yerelleştirilmiş değerleri yüklemek ve almak](#yukleme)
  - [Uygulamanın yerelleştirilmiş kaynakları için bir sınıf tanımlamak](#sinif-tanimlama)
  - [Yeni bir dil için destek eklemek](#yeni-dil)
- [Alternatif uluslararasılaştırma iş akışları](#alternatif)
  - [Yerelleştirilmiş kaynaklar için alternatif bir sınıf](#alternatif-sinif)
  - [Dart `intl` araçlarını kullanmak](#dart-araclari)
- [Daha fazla bilgi](#daha-fazla)

---

> **Neler öğreneceksiniz**
>
> - Cihazın yerel ayarını (kullanıcının tercih ettiği dili) nasıl takip edeceğinizi.
> - Yerel ayara özgü Material veya Cupertino widget'larını nasıl etkinleştireceğinizi.
> - Yerel ayara özgü uygulama değerlerini nasıl yöneteceğinizi.
> - Bir uygulamanın desteklediği yerel ayarları nasıl tanımlayacağınızı.

Uygulamanız başka bir dil konuşan kullanıcılara dağıtılabilecekse, onu uluslararasılaştırmanız gerekir. Bu, uygulamayı; metin ve yerleşim (layout) gibi değerleri, desteklediği her dil veya yerel ayar için yerelleştirmeyi mümkün kılacak şekilde yazmanız gerektiği anlamına gelir. Flutter, uluslararasılaştırmaya yardımcı olan widget'lar ve sınıflar sunar; Flutter kütüphanelerinin kendileri de uluslararasılaştırılmıştır.

Bu sayfa, bir Flutter uygulamasını `MaterialApp` ve `CupertinoApp` sınıflarını kullanarak yerelleştirmek için gereken kavramları ve iş akışlarını ele alır; çünkü uygulamaların çoğu bu şekilde yazılır. Bununla birlikte, daha alt seviyedeki `WidgetsApp` sınıfıyla yazılmış uygulamalar da aynı sınıflar ve mantık kullanılarak uluslararasılaştırılabilir.

<a id="giris"></a>
## Flutter'da yerelleştirmeye giriş

Bu bölüm, yeni bir Flutter uygulamasının nasıl oluşturulacağını ve uluslararasılaştırılacağını, ayrıca hedef platformun gerektirebileceği ek kurulumları anlatan bir eğitim sunar.

Bu örneğin kaynak kodunu [`gen_l10n_example`](https://github.com/flutter/website/tree/main/examples/internationalization/gen_l10n_example) içinde bulabilirsiniz.

<a id="kurulum"></a>
### `flutter_localizations` ile uluslararasılaştırılmış bir uygulama kurmak

Flutter varsayılan olarak yalnızca ABD İngilizcesi (US English) yerelleştirmelerini sağlar. Başka diller için destek eklemek isteyen bir uygulama, ek `MaterialApp` (veya `CupertinoApp`) özelliklerini belirtmeli ve `flutter_localizations` adlı paketi projeye dahil etmelidir.

Başlamak için, seçtiğiniz bir dizinde `flutter create` komutuyla yeni bir Flutter uygulaması oluşturun.

```console
$ flutter create <name_of_flutter_app>
```

Flutter projelerinin yakında `material_ui` ve `cupertino_ui` paketlerini kullanması teşvik edilecektir; ancak `flutter create` komutu henüz bunu varsayılan olarak yapacak şekilde güncellenmemiştir. Şimdiden geçiş yapmak isterseniz şu komutu çalıştırabilirsiniz:

```console
$ dart fix --apply --code=migrate_design_widgets
```

`flutter_localizations` paketini kullanmak için, onu ve `intl` paketini bağımlılık olarak ekleyin:

```console
$ flutter pub add flutter_localizations:"{sdk: flutter}" intl:any
```

Bu komut `pubspec.yaml` dosyanızı aşağıdaki girdilerle günceller:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  intl: any
```

Paketi `flutter_localizations` ön ekiyle (prefix) içe aktarın:

```dart
import 'package:flutter_localizations/flutter_localizations.dart'
    as flutter_localizations;
```

Ardından `MaterialApp`, `CupertinoApp` veya `WidgetsApp` için `localizationsDelegates` ve `supportedLocales` değerlerini belirtin:

```dart
return const MaterialApp(
  title: 'Localizations Sample App',
  localizationsDelegates: GlobalMaterialLocalizations.delegates,
  supportedLocales: [
    Locale('en'), // English
    Locale('es'), // Spanish
  ],
  home: MyHomePage(),
);
```

> **Not:** Uygulamanız `MaterialApp` yerine `CupertinoApp` tabanlıysa `GlobalCupertinoLocalizations.delegates` kullanın.
>
> Uygulamanız `MaterialApp` yerine `WidgetsApp` tabanlıysa `flutter_localizations.GlobalWidgetsLocalizations.delegate` kullanın.

`flutter_localizations` bağımlılığını ekleyip yukarıdaki kodu yazdıktan sonra Flutter, Material ve Cupertino kütüphanelerini seçilen desteklenen yerel ayara göre yerelleştirir. Widget'lar yerelleştirilmiş mesajlara uyum sağlamalı ve uygun soldan sağa (LTR) veya sağdan sola (RTL) yerleşimi kullanmalıdır.

Hedef platformun yerel ayarını İspanyolca (`es`) olarak değiştirmeyi deneyin; mesajların yerelleştirildiğini görmelisiniz.

[`scriptCode`](https://api.flutter.dev/flutter/package-intl_locale/Locale/scriptCode.html) desteği sunduğu için tam `Locale.fromSubtags` yapıcısı (constructor) tercih edilir; yine de `Locale` varsayılan yapıcısı tamamen geçerlidir.

`localizationsDelegates` listesinin elemanları, yerelleştirilmiş değer koleksiyonları üreten fabrikalardır (factory). `GlobalMaterialLocalizations.delegate`, Material Components kütüphanesi için yerelleştirilmiş metinleri ve diğer değerleri sağlar. `flutter_localizations.GlobalWidgetsLocalizations.delegate` ise `widgets.dart` kütüphanesi için varsayılan metin yönünü (soldan sağa ya da sağdan sola) tanımlar.

Bu uygulama özellikleri, bağlı oldukları türler ve uluslararasılaştırılmış Flutter uygulamalarının genellikle nasıl yapılandırıldığı hakkında daha fazla bilgi bu sayfanın devamında yer almaktadır.

<a id="override"></a>
### Yerel ayarı geçersiz kılmak (override)

`Localizations.override`, `Localizations` widget'ı için bir fabrika yapıcısıdır (factory constructor). Uygulamanızın bir bölümünün, cihazınız için yapılandırılmış yerel ayardan farklı bir yerel ayarla yerelleştirilmesi gereken (genellikle nadir görülen) durumlara olanak tanır.

Bu davranışı gözlemlemek için `Localizations.override` çağrısı ve basit bir `CalendarDatePicker` ekleyin:

```dart
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text(widget.title)),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Add the following code
          Localizations.override(
            context: context,
            locale: const Locale('es'),
            // Using a Builder to get the correct BuildContext.
            // Alternatively, you can create a new widget and Localizations.override
            // will pass the updated BuildContext to the new widget.
            child: Builder(
              builder: (context) {
                // A toy example for an internationalized Material widget.
                return CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                  onDateChanged: (value) {},
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
```

Uygulamayı hot reload yapın; `CalendarDatePicker` widget'ı İspanyolca olarak yeniden çizilmelidir.

<a id="mesaj-ekleme"></a>
### Kendi yerelleştirilmiş mesajlarınızı eklemek

Uygulamanıza yerelleştirilmiş metin eklemek için aşağıdaki adımları tamamlayın:

**1.** `flutter_localizations` ve `intl` paketlerini bağımlılık olarak ekleyin:

```console
$ flutter pub add flutter_localizations:"{sdk: flutter}" intl:any
```

Bu, `pubspec.yaml` dosyasına aşağıdaki girdileri ekler:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  intl: any
```

**2.** `pubspec.yaml` dosyasını açın ve `generate` bayrağını (flag) etkinleştirin. Bu bayrak pubspec dosyasındaki `flutter` bölümünde bulunur.

```yaml
# The following section is specific to Flutter.
flutter:
  generate: true # Add this line
```

**3.** Flutter projesinin kök dizinine yeni bir YAML dosyası ekleyin. Bu dosyayı `l10n.yaml` olarak adlandırın ve şu içeriği ekleyin:

```yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

Bu dosya yerelleştirme aracını yapılandırır. Bu örnekte şunları yaptınız:

- [App Resource Bundle](https://github.com/google/app-resource-bundle) (`.arb`) girdi dosyalarını `${FLUTTER_PROJECT}/lib/l10n` dizinine koydunuz. `.arb` dosyaları uygulamanız için yerelleştirme kaynaklarını sağlar.
- İngilizce şablonu `app_en.arb` olarak belirlediniz.
- Flutter'a yerelleştirmeleri `app_localizations.dart` dosyasında üretmesini söylediniz.

**4.** `${FLUTTER_PROJECT}/lib/l10n` dizinine `app_en.arb` şablon dosyasını ekleyin. Örneğin:

```json
{
  "helloWorld": "Hello World!",
  "@helloWorld": {
    "description": "The conventional newborn programmer greeting"
  }
}
```

**5.** Aynı dizine `app_es.arb` adında başka bir paket dosyası ekleyin. Bu dosyaya aynı mesajın İspanyolca çevirisini yazın.

```json
{
    "helloWorld": "¡Hola Mundo!"
}
```

**6.** Şimdi `flutter pub get` veya `flutter run` komutunu çalıştırın; kod üretimi otomatik olarak gerçekleşir. Üretilen dosyaları `arb-dir` veya `output-dir` seçenekleriyle belirttiğiniz yoldaki dizinde bulmalısınız. Alternatif olarak, uygulamayı çalıştırmadan aynı dosyaları üretmek için `flutter gen-l10n` komutunu da çalıştırabilirsiniz.

**7.** `app_localizations.dart` dosyasını içe aktarın, ardından `MaterialApp` yapıcısındaki `localizationsDelegates` listesine `AppLocalizations.delegate` ekleyin:

```dart
import 'l10n/app_localizations.dart';
```

```dart
return const MaterialApp(
  title: 'Localizations Sample App',
  localizationsDelegates: [
    AppLocalizations.delegate, // Add this line
    ...GlobalMaterialLocalizations.delegates,
  ],
  supportedLocales: [
    Locale('en'), // English
    Locale('es'), // Spanish
  ],
  home: MyHomePage(),
);
```

`AppLocalizations` sınıfı ayrıca otomatik üretilmiş bir `supportedLocales` listesi de sağlar. Yerel ayarları elle yazmak yerine bunu kullanabilirsiniz.

```dart
const MaterialApp(
  title: 'Localizations Sample App',
  localizationsDelegates: [
    AppLocalizations.delegate,
    ...GlobalMaterialLocalizations.delegates,
  ],
  supportedLocales: AppLocalizations.supportedLocales,
);
```

**8.** Material uygulaması başladıktan sonra `AppLocalizations` sınıfını uygulamanızın herhangi bir yerinde kullanabilirsiniz:

```dart
appBar: AppBar(
  // The [AppBar] title text should update its message
  // according to the system locale of the target platform.
  // Switching between English and Spanish locales should
  // cause this text to update.
  title: Text(AppLocalizations.of(context)!.helloWorld),
),
```

> **Not:** `AppLocalizations` sınıfının başlatılabilmesi için Material uygulamasının gerçekten başlamış olması gerekir. Uygulama henüz başlamadıysa `AppLocalizations.of(context)!.helloWorld` bir null hatasına (null exception) neden olur.

Bu kod, hedef cihazın yerel ayarı İngilizce olduğunda "Hello World!", İspanyolca olduğunda ise "¡Hola Mundo!" gösteren bir `Text` widget'ı üretir. `arb` dosyalarında her girdinin anahtarı (key) getter metodunun adı olarak kullanılır; girdinin değeri ise yerelleştirilmiş mesajı içerir.

[`gen_l10n_example`](https://github.com/flutter/website/tree/main/examples/internationalization/gen_l10n_example) bu aracı kullanır.

Cihazdaki uygulama açıklamanızı yerelleştirmek için yerelleştirilmiş metni [`MaterialApp.onGenerateTitle`](https://pub.dev/documentation/material_ui/latest/material_ui/MaterialApp/onGenerateTitle.html) özelliğine verin:

```dart
return MaterialApp(
  onGenerateTitle: (context) => DemoLocalizations.of(context).title,
```

<a id="yer-tutucular"></a>
### Yer tutucular, çoğullar ve seçimler

> **İpucu:** VS Code kullanıyorsanız [arb-editor eklentisini](https://marketplace.visualstudio.com/items?itemName=Google.arb-editor) ekleyin. Bu eklenti, `.arb` şablon dosyalarını düzenlemeye yardımcı olmak için sözdizimi vurgulama, kod parçacıkları (snippet), hata tanılama ve hızlı düzeltmeler ekler.

Bir mesajın içine uygulama değerlerini de dahil edebilirsiniz. Bunun için getter yerine bir metot üreten, _yer tutucu_ (placeholder) kullanan özel bir sözdizimi vardır. Geçerli bir Dart tanımlayıcı (identifier) adı olması gereken yer tutucu, `AppLocalizations` kodunda üretilen metodun konumsal (positional) parametresi hâline gelir. Bir yer tutucu adını süslü parantez içine alarak tanımlayın:

```json
"{placeholderName}"
```

Her yer tutucuyu uygulamanın `.arb` dosyasındaki `placeholders` nesnesi içinde tanımlayın. Örneğin `userName` parametresi alan bir selamlama mesajı tanımlamak için `lib/l10n/app_en.arb` dosyasına şunu ekleyin:

```json
"hello": "Hello {userName}",
"@hello": {
  "description": "A message with a single parameter",
  "placeholders": {
    "userName": {
      "type": "String",
      "example": "Bob"
    }
  }
}
```

Bu kod parçası `AppLocalizations.of(context)` nesnesine bir `hello` metodu ekler. Metot `String` türünde bir parametre alır ve bir metin döndürür. `AppLocalizations` dosyasını yeniden üretin.

`Builder`'a verilen kodu şununla değiştirin:

```dart
// Examples of internationalized strings.
return Column(
  children: <Widget>[
    // Returns 'Hello John'
    Text(AppLocalizations.of(context)!.hello('John')),
  ],
);
```

Birden çok değeri belirtmek için sayısal yer tutucular da kullanabilirsiniz. Farklı dillerde kelimelerin çoğul hâli farklı şekillerde yapılır. Bu sözdizimi bir kelimenin _nasıl_ çoğul yapılacağını belirtmeyi de destekler. _Çoğullaştırılmış_ bir mesaj, kelimenin farklı durumlarda nasıl çoğul yapılacağını gösteren bir `num` parametresi içermelidir. Örneğin İngilizce "person" kelimesini "people" olarak çoğul yapar, ancak bu yeterli değildir. `message0` çoğulu "no people" veya "zero people" olabilir. `messageFew` çoğulu "several people", "some people" veya "a few people" olabilir. `messageMany` çoğulu ise "most people", "many people" ya da "a crowd" olabilir. Yalnızca daha genel olan `messageOther` alanı zorunludur. Aşağıdaki örnek hangi seçeneklerin kullanılabildiğini gösterir:

```json
"{countPlaceholder, plural, =0{message0} =1{message1} =2{message2} few{messageFew} many{messageMany} other{messageOther}}"
```

Yukarıdaki ifade, `countPlaceholder` değerine karşılık gelen mesaj varyasyonuyla (`message0`, `message1`, ...) değiştirilir. Yalnızca `messageOther` alanı zorunludur.

Aşağıdaki örnek, "wombat" kelimesini çoğullaştıran bir mesaj tanımlar:

```json
"nWombats": "{count, plural, =0{no wombats} =1{1 wombat} other{{count} wombats}}",
"@nWombats": {
  "description": "A plural message",
  "placeholders": {
    "count": {
      "type": "num",
      "format": "compact"
    }
  }
}
```

Çoğul metodunu `count` parametresini vererek kullanın:

```dart
// Examples of internationalized strings.
return Column(
  children: <Widget>[
    ...
    // Returns 'no wombats'
    Text(AppLocalizations.of(context)!.nWombats(0)),
    // Returns '1 wombat'
    Text(AppLocalizations.of(context)!.nWombats(1)),
    // Returns '5 wombats'
    Text(AppLocalizations.of(context)!.nWombats(5)),
  ],
);
```

Çoğullara benzer şekilde, bir `String` yer tutucusuna göre de değer seçebilirsiniz. Bu çoğunlukla dilbilgisel cinsiyeti olan dilleri desteklemek için kullanılır. Sözdizimi şöyledir:

```json
"{selectPlaceholder, select, case{message} ... other{messageOther}}"
```

Sonraki örnek, cinsiyete göre bir zamir seçen bir mesaj tanımlar:

```json
"pronoun": "{gender, select, male{he} female{she} other{they}}",
"@pronoun": {
  "description": "A gendered message",
  "placeholders": {
    "gender": {
      "type": "String"
    }
  }
}
```

Bu özelliği cinsiyet metnini parametre olarak vererek kullanın:

```dart
// Examples of internationalized strings.
return Column(
  children: <Widget>[
    ...
    // Returns 'he'
    Text(AppLocalizations.of(context)!.pronoun('male')),
    // Returns 'she'
    Text(AppLocalizations.of(context)!.pronoun('female')),
    // Returns 'they'
    Text(AppLocalizations.of(context)!.pronoun('other')),
  ],
);
```

`select` ifadelerini kullanırken parametre ile gerçek değer arasındaki karşılaştırmanın büyük/küçük harfe duyarlı olduğunu unutmayın. Yani `AppLocalizations.of(context)!.pronoun("Male")` varsayılan olarak "other" durumuna düşer ve "they" döndürür.

<a id="kacis"></a>
### Kaçış (escaping) sözdizimi

Bazen `{` ve `}` gibi belirteçleri (token) normal karakter olarak kullanmanız gerekir. Bu belirteçlerin ayrıştırılmasını (parse) engellemek için `l10n.yaml` dosyasına aşağıdakini ekleyerek `use-escaping` bayrağını etkinleştirin:

```yaml
use-escaping: true
```

Ayrıştırıcı (parser), bir çift tek tırnak arasına alınmış her karakter dizisini yok sayar. Normal bir tek tırnak karakteri kullanmak için art arda iki tek tırnak kullanın. Örneğin aşağıdaki metin bir Dart `String` değerine dönüştürülür:

```json
{
  "helloWorld": "Hello! '{Isn''t}' this a wonderful day?"
}
```

Ortaya çıkan metin şöyledir:

```dart
"Hello! {Isn't} this a wonderful day?"
```

<a id="sayilar"></a>
### Sayı ve para birimi içeren mesajlar

Para birimi değerlerini temsil edenler de dahil olmak üzere sayılar, farklı yerel ayarlarda çok farklı şekillerde gösterilir. `flutter_localizations` içindeki yerelleştirme üretme aracı, sayıları yerel ayara ve istenen biçime göre biçimlendirmek için `intl` paketindeki [`NumberFormat`](https://api.flutter.dev/flutter/package-intl_intl/NumberFormat-class.html) sınıfını kullanır.

`int`, `double` ve `num` türleri aşağıdaki `NumberFormat` yapıcılarından herhangi birini kullanabilir:

| Mesajdaki "format" değeri | 1200000 için çıktı |
|---|---|
| `compact` | "1.2M" |
| `compactCurrency`* | "$1.2M" |
| `compactSimpleCurrency`* | "$1.2M" |
| `compactLong` | "1.2 million" |
| `currency`* | "USD1,200,000.00" |
| `decimalPattern` | "1,200,000" |
| `decimalPatternDigits`* | "1,200,000" |
| `decimalPercentPattern`* | "120,000,000%" |
| `percentPattern` | "120,000,000%" |
| `scientificPattern` | "1E6" |
| `simpleCurrency`* | "$1,200,000" |

Tabloda yıldızla (*) işaretlenmiş `NumberFormat` yapıcıları isteğe bağlı, isimlendirilmiş (named) parametreler sunar. Bu parametreler, yer tutucunun `optionalParameters` nesnesinin değeri olarak belirtilebilir. Örneğin `compactCurrency` için isteğe bağlı `decimalDigits` parametresini belirtmek üzere `lib/l10n/app_en.arb` dosyasında şu değişiklikleri yapın:

```json
"numberOfDataPoints": "Number of data points: {value}",
"@numberOfDataPoints": {
  "description": "A message with a formatted int parameter",
  "placeholders": {
    "value": {
      "type": "int",
      "format": "compactCurrency",
      "optionalParameters": {
        "decimalDigits": 2
      }
    }
  }
}
```

<a id="tarihler"></a>
### Tarih içeren mesajlar

Tarih metinleri hem yerel ayara hem de uygulamanın ihtiyaçlarına bağlı olarak birçok farklı şekilde biçimlendirilir.

`DateTime` türündeki yer tutucu değerleri, `intl` paketindeki [`DateFormat`](https://api.flutter.dev/flutter/package-intl_intl/DateFormat-class.html) ile biçimlendirilir.

`DateFormat` fabrika yapıcılarının adlarıyla tanımlanan 41 biçim varyasyonu vardır. Aşağıdaki örnekte `helloWorldOn` mesajında yer alan `DateTime` değeri `DateFormat.yMd` ile biçimlendirilir:

```json
"helloWorldOn": "Hello World on {date}",
"@helloWorldOn": {
  "description": "A message with a date parameter",
  "placeholders": {
    "date": {
      "type": "DateTime",
      "format": "yMd"
    }
  }
}
```

Yerel ayarı ABD İngilizcesi olan bir uygulamada aşağıdaki ifade "7/9/1959" sonucunu üretir. Rusça bir yerel ayarda ise "9.07.1959" sonucunu üretir.

```dart
AppLocalizations.of(context).helloWorldOn(DateTime.utc(1959, 7, 9))
```

<a id="ios"></a>
### iOS için yerelleştirme: iOS uygulama paketini güncellemek

Yerelleştirmeler Flutter tarafından yönetilse de desteklenen dilleri Xcode projesine eklemeniz gerekir. Bu, App Store'daki uygulama kaydınızın desteklenen dilleri doğru göstermesini sağlar.

Uygulamanızın desteklediği yerel ayarları yapılandırmak için şu adımları izleyin:

1. Projenizin `ios/Runner.xcodeproj` Xcode dosyasını açın.
2. **Project Navigator** içinde, **Projects** altındaki `Runner` proje dosyasını seçin.
3. Proje düzenleyicisinde `Info` sekmesini seçin.
4. **Localizations** bölümünde, desteklenen dilleri ve bölgeleri projenize eklemek için `Add` (`+`) butonuna tıklayın. Dosyaları ve referans dili seçmeniz istendiğinde yalnızca `Finish` seçin.
5. Xcode otomatik olarak boş `.strings` dosyaları oluşturur ve `ios/Runner.xcodeproj/project.pbxproj` dosyasını günceller. Bu dosyalar App Store tarafından uygulamanızın hangi dilleri ve bölgeleri desteklediğini belirlemek için kullanılır.

---

<a id="ileri"></a>
## İleri düzey özelleştirme konuları

Bu bölüm, yerelleştirilmiş bir Flutter uygulamasını özelleştirmenin ek yollarını ele alır.

<a id="gelismis-locale"></a>
### Gelişmiş yerel ayar tanımı

Birden çok varyantı olan bazı diller, doğru şekilde ayırt edilebilmek için yalnızca bir dil kodundan fazlasına ihtiyaç duyar.

Örneğin Çincenin tüm varyantlarını tam olarak ayırt etmek için dil kodu, yazı sistemi (script) kodu ve ülke kodu belirtilmelidir. Bunun nedeni basitleştirilmiş ve geleneksel yazı sistemlerinin varlığı ile aynı yazı sistemi içinde karakterlerin yazılışında bölgesel farklılıkların bulunmasıdır.

`CN`, `TW` ve `HK` ülke kodları için Çincenin her varyantını tam olarak ifade etmek amacıyla desteklenen yerel ayarlar listesi şunları içermelidir:

```dart
supportedLocales: [
  Locale.fromSubtags(languageCode: 'zh'), // generic Chinese 'zh'
  Locale.fromSubtags(
    languageCode: 'zh',
    scriptCode: 'Hans',
  ), // generic simplified Chinese 'zh_Hans'
  Locale.fromSubtags(
    languageCode: 'zh',
    scriptCode: 'Hant',
  ), // generic traditional Chinese 'zh_Hant'
  Locale.fromSubtags(
    languageCode: 'zh',
    scriptCode: 'Hans',
    countryCode: 'CN',
  ), // 'zh_Hans_CN'
  Locale.fromSubtags(
    languageCode: 'zh',
    scriptCode: 'Hant',
    countryCode: 'TW',
  ), // 'zh_Hant_TW'
  Locale.fromSubtags(
    languageCode: 'zh',
    scriptCode: 'Hant',
    countryCode: 'HK',
  ), // 'zh_Hant_HK'
],
```

Bu açık ve tam tanım, uygulamanızın bu ülke kodlarının tüm kombinasyonlarını birbirinden ayırt edebilmesini ve her birine tüm incelikleriyle yerelleştirilmiş içerik sunabilmesini sağlar. Kullanıcının tercih ettiği yerel ayar belirtilmemişse Flutter en yakın eşleşmeyi seçer; bu eşleşme büyük olasılıkla kullanıcının beklediğinden farklılıklar içerir. Flutter yalnızca `supportedLocales` içinde tanımlanmış yerel ayarlara çözümleme yapar ve yaygın kullanılan diller için `scriptCode` ile ayrıştırılmış yerelleştirilmiş içerik sağlar. Desteklenen yerel ayarların ve tercih edilen yerel ayarların nasıl çözümlendiği hakkında bilgi için [`Localizations`](https://api.flutter.dev/flutter/widgets/WidgetsApp/supportedLocales.html) sayfasına bakın.

Çince başlıca örnek olsa da Fransızca (`fr_FR`, `fr_CA`) gibi diğer diller de daha incelikli bir yerelleştirme için tam olarak ayırt edilmelidir.

<a id="locale-takip"></a>
### Yerel ayarı takip etmek: `Locale` sınıfı ve `Localizations` widget'ı

[`Locale`](https://api.flutter.dev/flutter/dart-ui/Locale-class.html) sınıfı kullanıcının dilini tanımlar. Mobil cihazlar, genellikle bir sistem ayarları menüsü aracılığıyla tüm uygulamalar için yerel ayar belirlemeyi destekler. Uluslararasılaştırılmış uygulamalar buna yerel ayara özgü değerler göstererek yanıt verir. Örneğin kullanıcı cihazın yerel ayarını İngilizceden Fransızcaya değiştirirse, başlangıçta "Hello World" gösteren bir `Text` widget'ı "Bonjour le monde" ile yeniden oluşturulur.

[`Localizations`](https://api.flutter.dev/flutter/flutter_localizations/GlobalWidgetsLocalizations-class.html) widget'ı, alt öğesi (child) için yerel ayarı ve alt öğenin bağlı olduğu yerelleştirilmiş kaynakları tanımlar. [`WidgetsApp`](https://api.flutter.dev/flutter/widgets/WidgetsApp-class.html) widget'ı bir `Localizations` widget'ı oluşturur ve sistemin yerel ayarı değişirse onu yeniden oluşturur.

Bir uygulamanın mevcut yerel ayarını her zaman `Localizations.localeOf()` ile öğrenebilirsiniz:

```dart
Locale myLocale = Localizations.localeOf(context);
```

<a id="supported-locales"></a>
### Uygulamanın `supportedLocales` parametresini belirlemek

`flutter_localizations` kütüphanesi birçok dili ve dil varyantını desteklese de varsayılan olarak yalnızca İngilizce çeviriler mevcuttur. Hangi dillerin tam olarak destekleneceğine karar vermek geliştiriciye kalmıştır.

`MaterialApp`'in [`supportedLocales`](https://pub.dev/documentation/material_ui/latest/material_ui/MaterialApp/supportedLocales.html) parametresi yerel ayar değişikliklerini sınırlar. Kullanıcı cihazındaki yerel ayarı değiştirdiğinde, uygulamanın `Localizations` widget'ı yalnızca yeni yerel ayar bu listenin bir üyesiyse değişikliğe uyar. Cihazın yerel ayarı için tam bir eşleşme bulunamazsa, eşleşen [`languageCode`](https://api.flutter.dev/flutter/dart-ui/Locale/languageCode.html) değerine sahip ilk desteklenen yerel ayar kullanılır. Bu da başarısız olursa `supportedLocales` listesinin ilk elemanı kullanılır.

Farklı bir "yerel ayar çözümleme" (locale resolution) yöntemi kullanmak isteyen bir uygulama bir [`localeResolutionCallback`](https://api.flutter.dev/flutter/widgets/LocaleResolutionCallback.html) sağlayabilir. Örneğin uygulamanızın, kullanıcının seçtiği yerel ayar ne olursa olsun koşulsuz kabul etmesi için:

```dart
MaterialApp(
  localeResolutionCallback: (locale, supportedLocales) {
    return locale;
  },
);
```

<a id="l10n-yaml"></a>
### `l10n.yaml` dosyasını yapılandırmak

`l10n.yaml` dosyası, `gen-l10n` aracını yapılandırarak şunları belirtmenize olanak tanır:

- tüm girdi dosyalarının nerede bulunduğu
- tüm çıktı dosyalarının nerede oluşturulacağı
- yerelleştirme delegate'inize hangi Dart sınıf adının verileceği

Seçeneklerin tam listesi için komut satırında `flutter gen-l10n --help` komutunu çalıştırın ya da aşağıdaki tabloya bakın:

| Seçenek | Açıklama |
|---|---|
| `arb-dir` | Şablon ve çevrilmiş arb dosyalarının bulunduğu dizin. Varsayılan değer `lib/l10n`'dir. |
| `output-dir` | Üretilen yerelleştirme sınıflarının yazıldığı dizin. Bu seçenek yalnızca yerelleştirme kodunu Flutter projesinde başka bir yerde üretmek istiyorsanız önemlidir. Ayrıca `synthetic-package` bayrağını false yapmanız gerekir.<br><br>Uygulama, `output-localization-file` seçeneğinde belirtilen dosyayı bu dizinden içe aktarmalıdır. Belirtilmezse varsayılan olarak `arb-dir` ile belirtilen girdi diziniyle aynı dizin kullanılır. |
| `template-arb-file` | Dart yerelleştirme ve mesaj dosyalarının üretilmesinde temel alınan şablon arb dosyası. Varsayılan değer `app_en.arb`'dir. |
| `output-localization-file` | Çıktı yerelleştirme ve yerelleştirme delegate sınıfları için dosya adı. Varsayılan değer `app_localizations.dart`'tır. |
| `untranslated-messages-file` | Henüz çevrilmemiş yerelleştirme mesajlarını açıklayan bir dosyanın konumu. Bu seçeneği kullanmak, hedef konumda şu biçimde bir JSON dosyası oluşturur:<br><br>`"locale": ["message_1", "message_2" ... "message_n"]`<br><br>Bu seçenek belirtilmezse çevrilmemiş mesajların bir özeti komut satırına yazdırılır. |
| `output-class` | Çıktı yerelleştirme ve yerelleştirme delegate sınıfları için kullanılacak Dart sınıf adı. Varsayılan değer `AppLocalizations`'dır. |
| `preferred-supported-locales` | Uygulama için tercih edilen desteklenen yerel ayarlar listesi. Araç, varsayılan olarak desteklenen yerel ayarlar listesini alfabetik sırayla üretir. Farklı bir yerel ayarı varsayılan yapmak için bu bayrağı kullanın.<br><br>Örneğin cihaz destekliyorsa varsayılan olarak Amerikan İngilizcesi kullanılması için `[ en_US ]` değerini verin. |
| `header` | Üretilen Dart yerelleştirme dosyalarının başına eklenecek başlık. Bu seçenek bir metin (string) alır.<br><br>Örneğin üretilen Dart dosyasının başına bu metni eklemek için `"/// All localized files."` değerini verin.<br><br>Alternatif olarak, daha uzun başlıklar için bir metin dosyası vermek üzere `header-file` seçeneğine göz atın. |
| `header-file` | Üretilen Dart yerelleştirme dosyalarının başına eklenecek başlık. Bu seçeneğin değeri, üretilen her Dart dosyasının en üstüne eklenen başlık metnini içeren dosyanın adıdır.<br><br>Alternatif olarak, daha basit bir başlık için metin vermek üzere `header` seçeneğine göz atın.<br><br>Bu dosya `arb-dir` ile belirtilen dizine konmalıdır. |
| `[no-]use-deferred-loading` | Dart yerelleştirme dosyasının, yerel ayarlar ertelenmiş (deferred) olarak içe aktarılacak şekilde üretilip üretilmeyeceğini belirtir; bu, Flutter web'de her yerel ayarın tembel yüklenmesine (lazy loading) olanak tanır.<br><br>Bu, JavaScript paketinin boyutunu azaltarak bir web uygulamasının ilk açılış süresini kısaltabilir. Bu bayrak true olduğunda, belirli bir yerel ayarın mesajları Flutter uygulaması tarafından yalnızca ihtiyaç duyulduğunda indirilir ve yüklenir. Çok sayıda farklı yerel ayarı ve çok sayıda yerelleştirme metni olan projelerde yüklemeyi ertelemek performansı artırabilir. Az sayıda yerel ayarı olan projelerde fark önemsizdir ve yerelleştirmeleri uygulamanın geri kalanıyla birlikte paketlemeye kıyasla açılışı yavaşlatabilir.<br><br>Bu bayrağın mobil veya masaüstü gibi diğer platformları etkilemediğini unutmayın. |
| `gen-inputs-and-outputs-list` | Belirtildiğinde araç, `gen_l10n_inputs_and_outputs.json` adında, aracın girdi ve çıktılarını içeren bir JSON dosyası üretir.<br><br>Bu, en son yerelleştirme setinin üretilmesinde Flutter projesinin hangi dosyalarının kullanıldığını takip etmek için faydalı olabilir. Örneğin Flutter aracının derleme sistemi, hot reload sırasında gen_l10n'in ne zaman çağrılacağını takip etmek için bu dosyayı kullanır.<br><br>Bu seçeneğin değeri JSON dosyasının üretildiği dizindir. Null olduğunda JSON dosyası üretilmez. |
| `synthetic-package` | Üretilen çıktı dosyalarının sentetik bir paket olarak mı yoksa Flutter projesinde belirtilen bir dizine mi üretileceğini belirler. Bu bayrak varsayılan olarak `true`'dur. `synthetic-package` false yapıldığında yerelleştirme dosyaları varsayılan olarak `arb-dir` ile belirtilen dizinde üretilir. `output-dir` belirtilmişse dosyalar orada üretilir. |
| `project-dir` | Belirtildiğinde araç, bu seçeneğe verilen yolu kök Flutter projesinin dizini olarak kullanır.<br><br>Null olduğunda mevcut çalışma dizinine göreli yol kullanılır. |
| `[no-]required-resource-attributes` | Tüm kaynak kimliklerinin (resource id) karşılık gelen bir kaynak özniteliği (resource attribute) içermesini zorunlu kılar.<br><br>Varsayılan olarak basit mesajlar meta veri gerektirmez; ancak okuyuculara mesajın anlamı hakkında bağlam sağladığı için şiddetle önerilir.<br><br>Çoğul mesajlar için kaynak öznitelikleri yine de zorunludur. |
| `[no-]nullable-getter` | Yerelleştirme sınıfı getter'ının nullable olup olmadığını belirtir.<br><br>Geriye dönük uyumluluk için bu değer varsayılan olarak true'dur; böylece `Localizations.of(context)` nullable bir değer döndürür. Bu değer false ise `Localizations.of(context)` çağrısının döndürdüğü değer üzerinde null kontrolü yapılır ve kullanıcı kodunda null kontrolüne gerek kalmaz. |
| `[no-]format` | Belirtildiğinde, yerelleştirme dosyaları üretildikten sonra `dart format` komutu çalıştırılır. |
| `use-escaping` | Tek tırnakların kaçış sözdizimi olarak kullanımının etkinleştirilip etkinleştirilmeyeceğini belirtir. |
| `[no-]suppress-warnings` | Belirtildiğinde tüm uyarılar bastırılır. |
| `[no-]relax-syntax` | Belirtildiğinde sözdizimi gevşetilir: özel karakter "{" ardından geçerli bir yer tutucu gelmiyorsa metin olarak, "}" ise özel karakter olarak işlenen önceki bir "{" karakterini kapatmıyorsa metin olarak değerlendirilir. |
| `[no-]use-named-parameters` | Üretilen yerelleştirme metotları için isimlendirilmiş (named) parametrelerin kullanılıp kullanılmayacağı. |

---

<a id="nasil-calisir"></a>
## Flutter'da uluslararasılaştırma nasıl çalışır?

Bu bölüm, Flutter'da yerelleştirmenin nasıl çalıştığına dair teknik ayrıntıları ele alır. Kendi yerelleştirilmiş mesaj setinizi desteklemeyi planlıyorsanız aşağıdaki içerik faydalı olacaktır. Aksi hâlde bu bölümü atlayabilirsiniz.

<a id="yukleme"></a>
### Yerelleştirilmiş değerleri yüklemek ve almak

`Localizations` widget'ı, yerelleştirilmiş değer koleksiyonları içeren nesneleri yüklemek ve aramak için kullanılır. Uygulamalar bu nesnelere [`Localizations.of(context,type)`](https://api.flutter.dev/flutter/widgets/Localizations/of.html) ile başvurur. Cihazın yerel ayarı değişirse `Localizations` widget'ı yeni yerel ayarın değerlerini otomatik olarak yükler ve ardından onu kullanan widget'ları yeniden oluşturur. Bunun nedeni `Localizations`'ın bir [`InheritedWidget`](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html) gibi çalışmasıdır. Bir build fonksiyonu kalıtsal bir widget'a (inherited widget) başvurduğunda, o kalıtsal widget'a örtük bir bağımlılık oluşur. Kalıtsal widget değiştiğinde (`Localizations` widget'ının yerel ayarı değiştiğinde), ona bağlı bağlamlar (context) yeniden oluşturulur.

Yerelleştirilmiş değerler, `Localizations` widget'ının [`LocalizationsDelegate`](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate-class.html) listesi tarafından yüklenir. Her delegate, yerelleştirilmiş değerlerden oluşan bir koleksiyonu kapsülleyen bir nesne üreten asenkron bir [`load()`](https://api.flutter.dev/flutter/widgets/LocalizationsDelegate/load.html) metodu tanımlamalıdır. Bu nesneler genellikle her yerelleştirilmiş değer için bir metot tanımlar.

Büyük bir uygulamada farklı modüller veya paketler kendi yerelleştirmeleriyle birlikte gelebilir. Bu yüzden `Localizations` widget'ı, her `LocalizationsDelegate` için bir tane olmak üzere bir nesne tablosu yönetir. `LocalizationsDelegate`'lerin `load` metotlarından biri tarafından üretilen nesneyi almak için bir `BuildContext` ve nesnenin türünü belirtin.

Örneğin Material Components widget'larının yerelleştirilmiş metinleri [`MaterialLocalizations`](https://pub.dev/documentation/material_ui/latest/material_ui/MaterialLocalizations-class.html) sınıfı tarafından tanımlanır. Bu sınıfın örnekleri (instance), [`MaterialApp`](https://pub.dev/documentation/material_ui/latest/material_ui/MaterialApp-class.html) sınıfının sağladığı bir `LocalizationDelegate` tarafından oluşturulur. Bunlar `Localizations.of()` ile alınabilir:

```dart
Localizations.of<MaterialLocalizations>(context, MaterialLocalizations);
```

Bu `Localizations.of()` ifadesi sık kullanıldığı için `MaterialLocalizations` sınıfı kullanışlı bir kısayol sunar:

```dart
static MaterialLocalizations of(BuildContext context) {
  return Localizations.of<MaterialLocalizations>(context, MaterialLocalizations);
}

/// References to the localized values defined by MaterialLocalizations
/// are typically written like this:

tooltip: MaterialLocalizations.of(context).backButtonTooltip,
```

<a id="sinif-tanimlama"></a>
### Uygulamanın yerelleştirilmiş kaynakları için bir sınıf tanımlamak

Uluslararasılaştırılmış bir Flutter uygulaması oluşturmak genellikle uygulamanın yerelleştirilmiş değerlerini kapsülleyen sınıfla başlar. Aşağıdaki örnek bu tür sınıfların tipik bir örneğidir.

Bu uygulamanın tam kaynak kodu: [`intl_example`](https://github.com/flutter/website/tree/main/examples/internationalization/intl_example).

Bu örnek, [`intl`](https://pub.dev/packages/intl) paketinin sağladığı API'lere ve araçlara dayanır. [Yerelleştirilmiş kaynaklar için alternatif bir sınıf](#alternatif-sinif) bölümü, `intl` paketine bağlı olmayan [bir örneği](https://github.com/flutter/website/tree/main/examples/internationalization/minimal) anlatır.

`DemoLocalizations` sınıfı (aşağıdaki kod parçasında tanımlanmıştır), uygulamanın desteklediği yerel ayarlara çevrilmiş metinlerini (bu örnekte yalnızca bir tane) içerir. Bunları aramak için Dart'ın [`intl`](https://pub.dev/packages/intl) paketi tarafından üretilen `initializeMessages()` fonksiyonunu ve [`Intl.message()`](https://pub.dev/documentation/intl/latest/intl/Intl/message.html) metodunu kullanır.

```dart
class DemoLocalizations {
  DemoLocalizations(this.localeName);

  static Future<DemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null || locale.countryCode!.isEmpty
        ? locale.languageCode
        : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      return DemoLocalizations(localeName);
    });
  }

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations)!;
  }

  final String localeName;

  String get title {
    return Intl.message(
      'Hello World',
      name: 'title',
      desc: 'Title for the Demo application',
      locale: localeName,
    );
  }
}
```

`intl` paketine dayanan bir sınıf, `initializeMessages()` fonksiyonunu ve `Intl.message()` için yerel ayar başına arka depoyu (backing store) sağlayan, üretilmiş bir mesaj kataloğunu içe aktarır. Mesaj kataloğu, `Intl.message()` çağrıları içeren sınıflar için kaynak kodu analiz eden bir [`intl` aracı](#dart-araclari) tarafından üretilir. Bu örnekte bu yalnızca `DemoLocalizations` sınıfıdır.

<a id="yeni-dil"></a>
### Yeni bir dil için destek eklemek

[`GlobalMaterialLocalizations`](https://api.flutter.dev/flutter/flutter_localizations/GlobalMaterialLocalizations-class.html) içinde yer almayan bir dili desteklemesi gereken bir uygulamanın ek iş yapması gerekir: kelime veya ifadeler için yaklaşık 70 çeviri ("yerelleştirme") ve yerel ayarın tarih kalıpları ile sembollerini sağlamalıdır.

Norveççe Nynorsk dili için desteğin nasıl ekleneceğine dair bir örnek için aşağıya bakın.

Yeni bir `GlobalMaterialLocalizations` alt sınıfı, Material kütüphanesinin bağlı olduğu yerelleştirmeleri tanımlar. Ayrıca `GlobalMaterialLocalizations` alt sınıfı için fabrika görevi gören yeni bir `LocalizationsDelegate` alt sınıfı da tanımlanmalıdır.

Asıl Nynorsk çevirileri hariç, tam [`add_language`](https://github.com/flutter/website/tree/main/examples/internationalization/add_language/lib/main.dart) örneğinin kaynak kodu aşağıdadır.

Yerel ayara özgü `GlobalMaterialLocalizations` alt sınıfının adı `NnMaterialLocalizations`, `LocalizationsDelegate` alt sınıfının adı ise `_NnMaterialLocalizationsDelegate`'tir. `NnMaterialLocalizations.delegate` değeri delegate'in bir örneğidir ve bu yerelleştirmeleri kullanan bir uygulamanın ihtiyaç duyduğu tek şey budur.

Delegate sınıfı temel tarih ve sayı biçimi yerelleştirmelerini içerir. Diğer tüm yerelleştirmeler, `NnMaterialLocalizations` içindeki `String` değerli özellik getter'ları ile şu şekilde tanımlanır:

```dart
@override
String get moreButtonTooltip => r'More';

@override
String get aboutListTileTitleRaw => r'About $applicationName';

@override
String get alertDialogLabel => r'Alert';
```

Bunlar elbette İngilizce çevirilerdir. İşi tamamlamak için her getter'ın dönüş değerini uygun bir Nynorsk metniyle değiştirmeniz gerekir.

Getter'lar, `r'About $applicationName'` gibi `r` ön ekine sahip "ham" (raw) Dart metinleri döndürür; çünkü bazen metinler `$` ön ekli değişkenler içerir. Bu değişkenler parametreli yerelleştirme metotları tarafından genişletilir:

```dart
@override
String get pageRowsInfoTitleRaw => r'$firstRow–$lastRow of $rowCount';

@override
String get pageRowsInfoTitleApproximateRaw =>
    r'$firstRow–$lastRow of about $rowCount';
```

Yerel ayarın tarih kalıpları ve sembollerinin de belirtilmesi gerekir. Bunlar kaynak kodda şöyle tanımlanır:

```dart
const nnLocaleDatePatterns = {
  'd': 'd.',
  'E': 'ccc',
  'EEEE': 'cccc',
  'LLL': 'LLL',
  // ...
}
```

```dart
const Map<String, Object?> nnDateSymbols = {
  'NAME': 'nn',
  'ERAS': <dynamic>['f.Kr.', 'e.Kr.'],
```

Yerel ayarın doğru tarih biçimlendirmesini kullanması için bu değerlerin değiştirilmesi gerekir. Ne yazık ki `intl` kütüphanesi sayı biçimlendirme konusunda aynı esnekliği sunmadığı için `_NnMaterialLocalizationsDelegate` içinde yerine mevcut bir yerel ayarın biçimlendirmesi kullanılmalıdır:

```dart
class _NnMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const _NnMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'nn';

  @override
  Future<MaterialLocalizations> load(Locale locale) {
    final String localeName = intl.Intl.canonicalizedLocale(locale.toString());

    // The locale (in this case `nn`) needs to be initialized into the custom
    // date symbols and patterns setup that Flutter uses.
    date_symbol_data_custom.initializeDateFormattingCustom(
      locale: localeName,
      patterns: nnLocaleDatePatterns,
      symbols: intl.DateSymbols.deserializeFromMap(nnDateSymbols),
    );

    return SynchronousFuture<MaterialLocalizations>(
      NnMaterialLocalizations(
        localeName: localeName,
        // The `intl` library's NumberFormat class is generated from CLDR data
        // (see https://github.com/dart-lang/i18n/blob/main/pkgs/intl/lib/number_symbols_data.dart).
        // Unfortunately, there is no way to use a locale that isn't defined in
        // this map and the only way to work around this is to use a listed
        // locale's NumberFormat symbols. So, here we use the number formats
        // for 'en_US' instead.
        decimalFormat: intl.NumberFormat('#,##0.###', 'en_US'),
        twoDigitZeroPaddedFormat: intl.NumberFormat('00', 'en_US'),
        // DateFormat here will use the symbols and patterns provided in the
        // `date_symbol_data_custom.initializeDateFormattingCustom` call above.
        // However, an alternative is to simply use a supported locale's
        // DateFormat symbols, similar to NumberFormat above.
        fullYearFormat: intl.DateFormat('y', localeName),
        compactDateFormat: intl.DateFormat('yMd', localeName),
        shortDateFormat: intl.DateFormat('yMMMd', localeName),
        mediumDateFormat: intl.DateFormat('EEE, MMM d', localeName),
        longDateFormat: intl.DateFormat('EEEE, MMMM d, y', localeName),
        yearMonthFormat: intl.DateFormat('MMMM y', localeName),
        shortMonthDayFormat: intl.DateFormat('MMM d'),
      ),
    );
  }

  @override
  bool shouldReload(_NnMaterialLocalizationsDelegate old) => false;
}
```

Yerelleştirme metinleri hakkında daha fazla bilgi için [flutter_localizations README](https://github.com/flutter/flutter/blob/main/packages/flutter_localizations/lib/src/l10n/README.md) dosyasına göz atın.

`GlobalMaterialLocalizations` ve `LocalizationsDelegate` sınıflarının dile özgü alt sınıflarını uyguladıktan sonra dili ve bir delegate örneğini uygulamanıza eklemeniz gerekir. Aşağıdaki kod uygulamanın dilini Nynorsk olarak ayarlar ve `NnMaterialLocalizations` delegate örneğini uygulamanın `localizationsDelegates` listesine ekler:

```dart
const MaterialApp(
  localizationsDelegates: [
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    NnMaterialLocalizations.delegate, // Add the newly created delegate
  ],
  supportedLocales: [Locale('en', 'US'), Locale('nn')],
  home: Home(),
),
```

---

<a id="alternatif"></a>
## Alternatif uluslararasılaştırma iş akışları

Bu bölüm, Flutter uygulamanızı uluslararasılaştırmak için farklı yaklaşımları anlatır.

<a id="alternatif-sinif"></a>
### Yerelleştirilmiş kaynaklar için alternatif bir sınıf

Önceki örnek Dart `intl` paketi temel alınarak tanımlanmıştı. Sadelik için ya da belki farklı bir i18n çerçevesiyle (framework) entegrasyon için yerelleştirilmiş değerleri yönetmede kendi yaklaşımınızı seçebilirsiniz.

[`minimal`](https://github.com/flutter/website/tree/main/examples/internationalization/minimal) uygulamasının tam kaynak kodu.

Aşağıdaki örnekte `DemoLocalizations` sınıfı tüm çevirilerini doğrudan dil başına Map'ler içinde barındırır:

```dart
class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations)!;
  }

  static const _localizedValues = <String, Map<String, String>>{
    'en': {'title': 'Hello World'},
    'es': {'title': 'Hola Mundo'},
  };

  static List<String> languages() => _localizedValues.keys.toList();

  String get title {
    return _localizedValues[locale.languageCode]!['title']!;
  }
}
```

Minimal uygulamada `DemoLocalizationsDelegate` biraz farklıdır. `load` metodu bir [`SynchronousFuture`](https://api.flutter.dev/flutter/foundation/SynchronousFuture-class.html) döndürür; çünkü herhangi bir asenkron yükleme yapılması gerekmez.

```dart
class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      DemoLocalizations.languages().contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<DemoLocalizations>(DemoLocalizations(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
```

<a id="dart-araclari"></a>
### Dart `intl` araçlarını kullanmak

Dart [`intl`](https://pub.dev/packages/intl) paketini kullanarak bir API oluşturmadan önce `intl` paketinin dokümantasyonunu inceleyin. Aşağıdaki liste, `intl` paketine bağlı bir uygulamayı yerelleştirme sürecini özetler:

Demo uygulaması, uygulamanın kullandığı tüm yerelleştirilebilir metinleri tanımlayan `l10n/messages_all.dart` adlı üretilmiş bir kaynak dosyaya bağlıdır.

`l10n/messages_all.dart` dosyasını yeniden oluşturmak iki adım gerektirir.

**1.** Uygulamanın kök dizini mevcut dizinken `lib/main.dart` dosyasından `l10n/intl_messages.arb` dosyasını üretin:

```console
$ dart run intl_translation:extract_to_arb --output-dir=lib/l10n lib/main.dart
```

`intl_messages.arb` dosyası, `main.dart` içinde tanımlanan her `Intl.message()` fonksiyonu için bir girdi bulunan JSON biçiminde bir eşlemedir (map). Bu dosya, İngilizce ve İspanyolca çeviriler olan `intl_en.arb` ve `intl_es.arb` için şablon görevi görür. Bu çevirileri siz, yani geliştirici oluşturursunuz.

**2.** Uygulamanın kök dizini mevcut dizinken her `intl_<locale>.arb` dosyası için `intl_messages_<locale>.dart` dosyasını ve tüm mesaj dosyalarını içe aktaran `intl_messages_all.dart` dosyasını üretin:

```console
$ dart run intl_translation:generate_from_arb \
    --output-dir=lib/l10n --no-use-deferred-loading \
    lib/main.dart lib/l10n/intl_*.arb
```

***Windows dosya adlarında joker karakter (wildcard) kullanımını desteklemez.*** Bunun yerine `intl_translation:extract_to_arb` komutuyla üretilen .arb dosyalarını tek tek listeleyin.

```console
$ dart run intl_translation:generate_from_arb \
    --output-dir=lib/l10n --no-use-deferred-loading \
    lib/main.dart \
    lib/l10n/intl_en.arb lib/l10n/intl_fr.arb lib/l10n/intl_messages.arb
```

`DemoLocalizations` sınıfı, yerelleştirilmiş mesajları yüklemek için üretilmiş `initializeMessages()` fonksiyonunu (`intl_messages_all.dart` içinde tanımlıdır), bunları aramak için ise `Intl.message()` metodunu kullanır.

---

<a id="daha-fazla"></a>
## Daha fazla bilgi

En iyi kod okuyarak öğreniyorsanız aşağıdaki örneklere göz atın.

- [`minimal`](https://github.com/flutter/website/tree/main/examples/internationalization/minimal)
  `minimal` örneği olabildiğince basit olacak şekilde tasarlanmıştır.
- [`intl_example`](https://github.com/flutter/website/tree/main/examples/internationalization/intl_example)
  [`intl`](https://pub.dev/packages/intl) paketinin sağladığı API'leri ve araçları kullanır.

Dart'ın `intl` paketi sizin için yeniyse [Dart `intl` araçlarını kullanmak](#dart-araclari) bölümüne göz atın.

