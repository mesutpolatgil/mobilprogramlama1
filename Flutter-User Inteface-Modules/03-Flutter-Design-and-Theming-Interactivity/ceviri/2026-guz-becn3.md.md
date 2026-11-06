Uyarı: Bu içerik, SCÜ Şarkışla UBYO Mobil Programlama I dersi kapsamında tamamen eğitim amaçlı çevrilmiş ve derlenmiştir. Orijinal dokümantasyon kaynakları (dart.dev, docs.flutter.dev) kendi orijinal lisanslarına (BSD-3-Clause, CC-BY 4.0) tabidir. Bu çalışmanın hiçbir ticari amacı yoktur.

# Flutter Dokümantasyonu Kapsamlı Rehberi (Türkçe Çeviri Külliyatı)
> **22 Bölüm Tam Külliyat:** Tasarım Sistemleri, Temalar, Tipografi, Shader'lar, Etkileşim, Jestler, Sürükleme, Formlar, Actions & Shortcuts ve Klavye Odak Sistemi  
> **Kaynak:** [docs.flutter.dev](https://docs.flutter.dev) | **Lisans:** Creative Commons Attribution 4.0 International & 3-Clause BSD License  
> **Standart:** Flutter Resmi Dokümantasyon Çevirisi — Teknik Terim Bütünlüğü ve Eksiksiz Kod Blokları Korunmuştur.
---
## 📑 Kapsamlı İçindekiler Fihristi (22 Bölüm — 5 Kısım)
### KISIM I: TASARIM SİSTEMLERİ VE TEMALAR
> *Flutter'ın tema mimarisi, ThemeData yapılandırması, Material 3 tasarım prensipleri ve Apple Cupertino arayüz kütüphanesi.*

- [**Bölüm 1: Renkleri ve Font Stillerini Paylaşmak İçin Tema Kullanma** *(Share Styles with Themes)*](#bolum-1)  
  Tema mimarisi, ThemeData yapılandırması, renk/stil paylaşımı ve tema miras alma.
- [**Bölüm 2: Flutter için Material Design** *(Material Design for Flutter)*](#bolum-2)  
  Material 3 tasarım dili, bileşen kütüphanesi ve stil prensipleri.
- [**Bölüm 3: Flutter için Cupertino Tasarımı** *(Cupertino Design for Flutter)*](#bolum-3)  
  iOS tasarım dili ve Cupertino widget ekosistemi.

### KISIM II: TİPOGRAFİ, FONTLAR VE GRAFİK EFEKTLERİ
> *Google Fonts entegrasyonu, TextTheme ölçekleri, özel font importu, paket içi font paylaşımı ve GPU tabanlı GLSL fragment shader'ları.*

- [**Bölüm 4: Flutter'ın Fontları ve Tipografi** *(Flutter's Fonts and Typography)*](#bolum-4)  
  TextTheme ölçekleri, statik/değişken fontlar ve font varyasyonları.
- [**Bölüm 5: Özel Bir Font Kullanma** *(Use a Custom Font)*](#bolum-5)  
  Projeye özel font aktarma (.ttf/.otf), pubspec.yaml ve TextStyle kullanımı.
- [**Bölüm 6: Bir Paketten Fontları Dışa Aktarma** *(Export Fonts from a Package)*](#bolum-6)  
  Fontları paket olarak dışa aktarma, lib/ mimarisi ve packages/ kullanımı.
- [**Bölüm 7: Parça Gölgelendiricileri Yazma ve Kullanma** *(Writing and Using Fragment Shaders)*](#bolum-7)  
  GPU tabanlı GLSL (.frag) gölgelendiricileri, FragmentProgram API'si ve Canvas entegrasyonu.

### KISIM III: ETKİLEŞİM, DURUM YÖNETİMİ, JESTLER VE SÜRÜKLEME
> *Stateful ve Stateless widget mimarisi, setState() yaşam döngüsü, işaretçi olayları, GestureDetector, super_drag_and_drop ve Dismissible listeler.*

- [**Bölüm 8: Flutter Uygulamanıza Etkileşim Ekleme** *(Add Interactivity to Your Flutter App)*](#bolum-8)  
  Stateful/Stateless widget mimarisi, setState() ve durum yönetimi stratejileri.
- [**Bölüm 9: Dokunmalar, Sürüklemeler ve Diğer Hareketler** *(Taps, Drags, and Other Gestures)*](#bolum-9)  
  İşaretçi olayları, isabet testi ve hareket arenası (gesture arena) kuralları.
- [**Bölüm 10: Dokunmaları İşleme** *(Handle Taps)*](#bolum-10)  
  GestureDetector kullanımı, dokunma algılama ve SnackBar bildirimleri.
- [**Bölüm 11: Uygulama Dışına Sürükleme** *(Drag Outside an App)*](#bolum-11)  
  Uygulama içi ve uygulamalar arası sürükle-bırak (super_drag_and_drop paketi).
- [**Bölüm 12: Bir Arayüz Öğesini Sürükleme** *(Drag a UI Element)*](#bolum-12)  
  LongPressDraggable ve DragTarget ile sürüklenebilir arayüz öğeleri ve sepet etkileşimi.
- [**Bölüm 13: Material Dokunma Dalgalanması Ekleme** *(Add Material Touch Ripples)*](#bolum-13)  
  InkWell widget'ı ile dokunma dalgalanması (ripple) animasyonları.
- [**Bölüm 14: Kaydırarak Kapatma / Silme Uygulama** *(Implement Swipe to Dismiss)*](#bolum-14)  
  Dismissible widget'ı ile kaydırarak listeden silme ve arka plan görsel göstergeleri.

### KISIM IV: FORMLAR VE METİN GİRİŞİ (FORMS & TEXT INPUT)
> *TextField ve TextFormField stillendirme, InputDecoration, TextEditingController ile değer okuma/dinleme, FocusNode yönetimi ve GlobalKey<FormState> doğrulamaları.*

- [**Bölüm 15: Metin Alanı Oluşturma ve Stillendirme** *(Create and Style a Text Field)*](#bolum-15)  
  TextField ve TextFormField widget'ları, InputDecoration kenarlıkları, ipucu ve etiketler.
- [**Bölüm 16: Metin Alanının Değerini Alma** *(Retrieve the Value of a Text Field)*](#bolum-16)  
  TextEditingController oluşturma, TextField'a bağlama, dispose() kaynak temizliği ve controller.text okuma.
- [**Bölüm 17: Metin Alanındaki Değişiklikleri İşleme** *(Handle Changes to a Text Field)*](#bolum-17)  
  onChanged() geri çağırması ve addListener() ile anlık metin değişikliklerini dinleme, characters desteği.
- [**Bölüm 18: Odak ve Metin Alanları** *(Focus and Text Fields)*](#bolum-18)  
  autofocus özelliği, FocusNode yaşam döngüsü, odak ağacı ve requestFocus() ile programatik odak.
- [**Bölüm 19: Doğrulamalı Bir Form Oluşturma** *(Build a Form with Validation)*](#bolum-19)  
  GlobalKey<FormState>() mimarisi, TextFormField validator fonksiyonu, AutovalidateMode ve form doğrulama.

### KISIM V: BİLDİRİMLER, EYLEMLER, KISAYOLLAR VE ODAK SİSTEMİ
> *ScaffoldMessenger ve SnackBar bildirimleri, Actions & Shortcuts mimarisi, niyetler (Intents), klavye olay yayılımı ve FocusScope sekme gezintisi.*

- [**Bölüm 20: Bir SnackBar Görüntüleme** *(Display a SnackBar)*](#bolum-20)  
  Scaffold oluşturma, ScaffoldMessenger ile SnackBar tetikleme ve SnackBarAction ile geri alma (undo) eylemleri.
- [**Bölüm 21: Eylemleri ve Kısayolları Kullanma** *(Using Actions and Shortcuts)*](#bolum-21)  
  Fiziksel klavye olaylarını bağlama, Shortcuts ve Actions widget'ları, Intent mimarisi ve ShortcutManager.
- [**Bölüm 22: Flutter'ın Klavye Odak Sistemini Anlama** *(Understanding Flutter's Keyboard Focus System)*](#bolum-22)  
  FocusNode, FocusScopeNode, odak ağacı ve zinciri, sekme gezintisi (tab traversal) ve FocusTraversalPolicy.

---
**FLUTTER TEKNİK DOKÜMANTASYON ÇEVİRİSİ  •  GENEL MASTER KÜLLİYAT**
Tasarım & Temalar  •  Tipografi & Shader'lar  •  Jestler & Sürükleme  •  Formlar  •  Actions, Shortcuts & Odak

**Kaynak Dokümantasyon:** docs.flutter.dev  |  Flutter Resmi Kılavuzu (22 Modül Tam Külliyat)
**Çeviri ve Formatlama:** Teknik Çeviri Standartları & Birebir Görsel Düzen (Mizanpaj) Korunarak Hazırlanmıştır
> *Bu sayfada  ›  Renkleri ve font stillerini paylaşmak için tema kullanma*



---

## KISIM I: TASARIM SİSTEMLERİ VE TEMALAR
> *Flutter'ın tema mimarisi, ThemeData yapılandırması, Material 3 tasarım prensipleri ve Apple Cupertino arayüz kütüphanesi.*

---

<a id="bolum-1"></a>

# Bölüm 1: Renkleri ve Font Stillerini Paylaşmak İçin Tema Kullanma (Share Styles with Themes)

Tema kullanarak bir uygulama genelinde renklerin ve font stillerinin nasıl paylaşılacağı.


> **ℹ️  Not:** Bu tarif, Flutter'ın Material 3 desteğini ve google_fonts paketini kullanır.

Bir uygulama genelinde renkleri ve font stillerini paylaşmak için temaları (*theme*) kullanın.

Uygulama genelinde geçerli temalar tanımlayabilirsiniz. Tek bir bileşenin tema stilini değiştirmek için bir temayı genişletebilirsiniz (extend). Her tema; ilgili `Material` bileşeni türü için geçerli olan renkleri, yazı stilini ve diğer parametreleri tanımlar.

Flutter, stillendirmeyi aşağıdaki sırayla uygular:

1. Belirli bir `Widget`'a uygulanan stiller.
2. Doğrudan üst temayı (*parent theme*) geçersiz kılan (*override*) temalar.
3. Tüm uygulama için ana tema.
Bir tema tanımladıktan sonra, bunu kendi `Widget`'larınız içinde kullanın. Flutter'ın `Material` widget'ları; app bar'lar, butonlar, onay kutuları (*checkbox*) ve daha fazlası için arka plan renklerini ve font stillerini ayarlamak üzere sizin temanızı kullanır.


## Bir Uygulama Teması Oluşturma

Tüm uygulamanız genelinde bir tema paylaşmak için `MaterialApp` constructor'ına `theme` özelliğini (property) tanımlayın. Bu özellik bir `ThemeData` instance'ı alır.

Constructor içinde bir tema belirtmezseniz, Flutter sizin için varsayılan bir tema oluşturur.


```dart
MaterialApp(
  title: appName,
  theme: ThemeData(
    // Define the default brightness and colors.
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      // ···
      brightness: Brightness.dark,
    ),

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
      ),
      // ···
      titleLarge: GoogleFonts.oswald(
        fontSize: 30,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: GoogleFonts.merriweather(),
      displaySmall: GoogleFonts.pacifico(),
    ),
  ),
  home: const MyHomePage(title: appName),
);
```

Çoğu `ThemeData` instance'ı aşağıdaki iki özellik için değer belirler. Bu özellikler tüm uygulamayı etkiler.

1. `colorScheme` renkleri tanımlar.
2. `textTheme` metin stillendirmesini tanımlar.
Hangi renkleri, font'ları ve diğer özellikleri tanımlayabileceğinizi öğrenmek için [ThemeData dokümantasyonuna](https://api.flutter.dev/flutter/material/ThemeData-class.html) göz atın.


## Bir temayı uygulama (Apply a theme)

Yeni temanızı uygulamak için, bir Widget'ın stillendirme özelliklerini belirtirken `Theme.of(context)` metodunu kullanın. Bunlar `style` ve `color` özelliklerini içerebilir, ancak bunlarla sınırlı değildir.

`Theme.of(context)` metodu Widget ağacında (*widget tree*) yukarı doğru arama yapar ve ağaçtaki en yakın `Theme` widget'ını getirir. Bağımsız (*standalone*) bir temanız varsa o uygulanır. Yoksa Flutter uygulamanın genel temasını uygular.

Aşağıdaki örnekte `Container` constructor'ı kendi `color` değerini ayarlamak için bu tekniği kullanır.


```dart
Container(
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  color: Theme.of(context).colorScheme.primary,
  child: Text(
    'Text with a background color',
    // ···
    style: Theme.of(context).textTheme.bodyMedium!
        .copyWith(color: Theme.of(context).colorScheme.onPrimary),
  ),
),
```


## Bir temayı geçersiz kılma (Override a theme)

Uygulamanın bir bölümündeki genel temayı geçersiz kılmak için, uygulamanın o bölümünü bir `Theme` widget'ı ile sarmalayın (*wrap* edin).

Bir temayı iki şekilde geçersiz kılabilirsiniz:

1. Benzersiz bir `ThemeData` instance'ı oluşturun.
2. Üst (*parent*) temayı genişletin.

### Benzersiz bir ThemeData örneği ayarlama

Uygulamanızın bir bileşeninin genel temayı yoksaymasını istiyorsanız, bir `ThemeData` örneği oluşturun. Bu örneği `Theme` widget'ına iletin.


```dart
Theme(
  // Create a unique theme with `ThemeData`.
  data: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
  ),
  child: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
);
```


### Üst temayı genişletme (Extend the parent theme)

Her şeyi sıfırdan geçersiz kılmak yerine, üst temayı genişletmeyi değerlendirin. Bir temayı genişletmek için `copyWith()` metodunu kullanın.


```dart
Theme(
  // Find and extend the parent theme using `copyWith`.
  // To learn more, check out the section on `Theme.of`.
  data: Theme.of(context)
      .copyWith(colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink)),
  child: const FloatingActionButton(
    onPressed: null,
    child: Icon(Icons.add),
  ),
);
```


## Theme widget'ı hakkında bir video izleyin

Daha fazla bilgi edinmek için `Theme` widget'ı hakkındaki bu kısa Widget of the Week videosunu izleyin:


![Widget of the Week — Theme](extracted_media/rId14_image1.jpeg)
*Widget of the Week — Theme*


## Etkileşimli bir örneği deneyin

Flutter tasarım sisteminde tema yapılandırmalarını ve renk şeması güncellemelerini test etmek için [Flutter resmi Cookbook sayfası](https://docs.flutter.dev/cookbook/design/themes) üzerindeki interaktif ortamı doğrudan deneyebilirsiniz.

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/cookbook/design/themes](https://docs.flutter.dev/cookbook/design/themes)

> *Bu sayfada  ›  Flutter için Material Design*

<a id="bolum-2"></a>

# Bölüm 2: Flutter için Material Design (Material Design for Flutter)

Flutter için Material Design hakkında bilgi edinin.

`Material Design`; Google tasarımcıları ve geliştiricileri tarafından oluşturulan ve desteklenen açık kaynaklı bir tasarım sistemidir.


## Daha fazla bilgi

`Material Design` ve Flutter hakkında daha fazla bilgi edinmek için şunlara göz atın:

- [Material.io geliştirici dokümantasyonu](https://m3.material.io)
Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/ui/design/material](https://docs.flutter.dev/ui/design/material)

> *Bu sayfada  ›  Flutter için Cupertino Tasarımı*

<a id="bolum-3"></a>

# Bölüm 3: Flutter için Cupertino Tasarımı (Cupertino Design for Flutter)

Flutter için Cupertino tasarımı hakkında bilgi edinin.

Flutter `Cupertino` paketi, Flutter uygulamaları için Apple'ın iOS tasarım dilini uygulayan bir `Widget` koleksiyonudur. Widget'lar; yuvarlatılmış köşeler, gradyanlar ve minimalist tasarım da dahil olmak üzere iOS ile benzer bir görünüme ve hisse sahiptir. Ayrıca iOS etkileşimlerini ve animasyonlarını da içerirler.

Önceden `Cupertino`, çekirdek Flutter SDK'sının bir parçasıydı; ancak framework'ten ayrıştırılmıştır. `Cupertino`'ya pub.dev üzerindeki [cupertino_ui](https://pub.dev/packages/cupertino_ui) paketinden erişebilirsiniz.

Aşağıdaki 15 dakikalık video, `Cupertino` paketine üst düzey bir genel bakış sunmaktadır:


![Flutter in Focus Series 1 — Cupertino Paketi](extracted_media/rId18_image2.jpeg)
*Flutter in Focus Series 1 — Cupertino Paketi*

Bazı `Cupertino` widget'larını çalışırken görmek için, *Widget of the Week* serisinden aşağıdaki videolar bunlardan birkaçını ele almaktadır:


| Öğe 1 | Öğe 2 |
| :---: | :---: |
| ![CupertinoRadio](extracted_media/rId19_image3.jpeg)<br>**CupertinoRadio** | ![CupertinoSheetRoute](extracted_media/rId20_image4.jpeg)<br>**CupertinoSheetRoute** |
| ![CupertinoSegmentedControl](extracted_media/rId21_image5.jpeg)<br>**CupertinoSegmentedControl** | ![CupertinoCheckbox](extracted_media/rId22_image6.jpeg)<br>**CupertinoCheckbox** |
| ![CupertinoSwitch](extracted_media/rId23_image7.jpeg)<br>**CupertinoSwitch** | - |


## Daha fazla bilgi

`Cupertino` paketini Flutter ile kullanma hakkında daha fazla bilgi edinmek için aşağıdaki kaynaklara göz atın:

- (Büyük ölçüde görsel olan) [Cupertino widget kataloğu](https://docs.flutter.dev/ui/widgets/cupertino)
- [pub.dev üzerindeki Cupertino kütüphane sayfası](https://pub.dev/packages/cupertino_ui)
- [flutter/flutter reposundaki Cupertino API örnekleri](https://github.com/flutter/flutter/tree/master/examples/api/lib/cupertino). ([Yönergeler](https://github.com/flutter/flutter/blob/master/examples/api/README.md)) Örneğin, `CupertinoSwitch` çalıştırmak için:

```bash
cd path/to/flutter
cd examples/api
flutter run lib/cupertino/switch/cupertino_switch.0.dart
```

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/ui/design/cupertino](https://docs.flutter.dev/ui/design/cupertino)

> *Bu sayfada  ›  Flutter'ın fontları ve tipografi*



---

## KISIM II: TİPOGRAFİ, FONTLAR VE GRAFİK EFEKTLERİ
> *Google Fonts entegrasyonu, TextTheme ölçekleri, özel font importu, paket içi font paylaşımı ve GPU tabanlı GLSL fragment shader'ları.*

---

<a id="bolum-4"></a>

# Bölüm 4: Flutter'ın Fontları ve Tipografi (Flutter's Fonts and Typography)

Flutter'ın tipografi desteği hakkında bilgi edinin.

[Tipografi](https://api.flutter.dev/flutter/material/Typography-class.html) (Typography), yazıların veya fontların stilini ve görünümünü kapsar: fontun ne kadar kalın olduğunu (*weight*), fontun eğikliğini (*slant*), harfler arasındaki boşluğu ve metnin diğer görsel yönlerini belirler.

*Tüm fontlar aynı şekilde oluşturulmaz.*
Bir font stili en azından şunlarla tanımlanır: **Roboto** veya** Noto** gibi aynı yazı tipi ailesindeki fontları açıklayan ortak karakter kuralları kümesini temsil eden bir yazı tipi ailesi (*typeface*), bir font ağırlığı / kalınlığı (örneğin Regular, Bold veya sayısal bir değer) ve bir stil (Regular, Italic vb.). Tüm bunlar ve ek önceden belirlenmiş nitelikler bir araya gelerek **statik font** (*static font*) olarak adlandırdığımız yapıyı oluşturur.

**Değişken fontlar** (*variable fonts*), bu niteliklerin bazılarının çalışma zamanında (*runtime*) değiştirilmesine olanak tanır ve normalde birden fazla statik font dosyası olacak özellikleri tek bir dosya içinde depolar.

## Tipografik Ölçek (Typographic Scale)

Tipografik ölçek, uygulamalarınızda denge, görsel uyum/bütünlük ve çeşitlilik sağlamaya yönelik birbiriyle ilişkili metin stilleri kümesidir.

Flutter'da `TextTheme` tarafından sağlanan yaygın tipografi ölçeği, metnin işlevini belirten beş kategori içerir:

- **Display** (Ekran / Manşet Stili)
- **Headline** (Ana Başlık)
- **Title** (Alt Başlık / Başlık)
- **Label** (Etiket Stili)
- **Body** (Gövde Metni)
Bunların her biri için ayrıca üç boyut varyasyonu bulunur:

- **Small** (Küçük)
- **Medium** (Orta)
- **Large** (Büyük)
Bir kategori ve metin boyutundan oluşan bu on beş kombinasyonun her biri tek bir `TextStyle` nesnesi ile temsil edilir.


![Flutter Material 3 Tipografik Ölçeği (Display Large'dan Body Small'a 15 Stil Seviyesi)](extracted_media/rId29_image8.png)
*Flutter Material 3 Tipografik Ölçeği (Display Large'dan Body Small'a 15 Stil Seviyesi)*

Flutter'ın sunduğu platforma özgü tüm tipografik ölçekler `Typography` sınıfı içinde yer alır. Genellikle `TextTheme` hedef platformunuza göre yerelleştirileceğinden bu sınıfa doğrudan referans vermeniz gerekmez.


## Değişken fontlar (Variable fonts)

[Değişken fontlar](https://fonts.google.com/variablefonts), metin stilinin önceden tanımlanmış yönlerini kontrol etmenizi sağlar. Değişken fontlar genişlik (*width*), kalınlık/ağırlık (*weight*), eğiklik (*slant*) gibi belirli eksenleri destekler (birkaçını saymak gerekirse). Kullanıcı, yazı tipini belirlerken bu sürekli eksen boyunca herhangi bir değeri seçebilir.


### Google Fonts yazı tipi test aracını (Type Tester) kullanma

Google Fonts üzerinde giderek artan sayıda font, değişken font özellikleri sunmaktadır. Seçeneklerin kapsamını görmek ve tek bir fontu nasıl çeşitlendirebileceğinizi keşfetmek için Type Tester (Yazı Tipi Test Aracı) özelliğini kullanabilirsiniz.


![Google Fonts Type Tester Arayüzü — Eksen Değerlerini ve Değişken Font Parametrelerini Ayarlama](extracted_media/rId31_image9.png)
*Google Fonts Type Tester Arayüzü — Eksen Değerlerini ve Değişken Font Parametrelerini Ayarlama*

Eksenlerden herhangi birindeki kaydırıcıyı (*slider*) hareket ettirerek font üzerindeki etkisini gerçek zamanlı olarak görebilirsiniz. Bir değişken fontu programlarken, fontun tasarım eksenlerini değiştirmek için `FontVariation` sınıfını kullanın. `FontVariation` sınıfı [OpenType font variables şartnamesine](https://learn.microsoft.com/typography/opentype/spec/dvaroverview) uygundur.


## Statik fontlar (Static fonts)

Google Fonts ayrıca statik fontları da içerir. Değişken fontlarda olduğu gibi, hangi seçeneklerin kullanımınıza sunulduğunu bilmek için fontun nasıl tasarlandığını bilmeniz gerekir. Burada da Google Fonts web sitesi size yardımcı olabilir.


## google_fonts paketini kullanma

Fontları siteden indirip uygulamalarınıza manuel olarak yükleyebileceğiniz gibi, pub.dev üzerindeki [google_fonts](https://pub.dev/packages/google_fonts) paketini doğrudan temanızda veya widget'larınızda kullanmayı da seçebilirsiniz.

Yalnızca font adını referans göstererek doğrudan olduğu gibi kullanılabilirler:


```dart
Text(
  'This is Google Fonts',
  style: GoogleFonts.lato(),
),
```

veya dönen `TextStyle` üzerinde özellikler ayarlanarak özelleştirilebilir:


```dart
Text(
  'This is Google Fonts',
  style: GoogleFonts.lato(
    textStyle: Theme.of(context).textTheme.displayLarge,
    fontSize: 48,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  ),
),
```


## Fontları değiştirme (Modifying fonts)

Statik bir fontu programatik olarak değiştirmek için aşağıdaki API'yi kullanın (ancak bunun yalnızca fontun bu özelliği destekleyecek şekilde tasarlanmış olması durumunda çalışacağını unutmayın):

- [FontFeature](https://api.flutter.dev/flutter/dart-ui/FontFeature-class.html) : Glifleri (*glyphs*) seçmek için
- [FontWeight](https://api.flutter.dev/flutter/dart-ui/FontWeight-class.html) : Font ağırlığını/kalınlığını değiştirmek için
- [FontStyle](https://api.flutter.dev/flutter/dart-ui/FontStyle.html) : İtalik (eğik) yapmak için
- [FontVariation](https://api.flutter.dev/flutter/dart-ui/FontVariation-class.html) : Belirli bir özellik için bir değer aralığı belirtmek üzere
Bir `FontFeature`, bir [OpenType özellik etiketine](https://learn.microsoft.com/typography/opentype/spec/featuretags) (*feature tag*) karşılık gelir ve belirli bir fontun bir özelliğini etkinleştirmek veya devre dışı bırakmak için bir boolean (doğru/yanlış) bayrak olarak düşünülebilir.


## Diğer kaynaklar (Other resources)

Aşağıdaki video, Flutter'ın tipografi yeteneklerinden bazılarını göstermekte ve bunu (uygulamanın çalıştığı platforma bağlı olarak) Material ve Cupertino görünümü ve hissi, animasyonlar ve özel parça gölgelendiricileri (*custom fragment shaders*) ile birleştirmektedir:


![Flutter Forward — Prototyping Beautiful Designs (Harika Tasarımlar Protipleme)](extracted_media/rId38_image10.jpeg)
*Flutter Forward — Prototyping Beautiful Designs (Harika Tasarımlar Protipleme)*

Bir mühendisin değişken fontları özelleştirme ve biçim değiştirirken (*morph*) onları canlandırma deneyimini okumak için (ki bu yukarıdaki videonun temelini oluşturmuştur), Flutter blogundaki [Playful typography with Flutter](https://medium.com/flutter/playful-typography-with-flutter-2cb79ca5fa3a) başlıklı yazıya göz atın. İlgili örnek ayrıca özel bir gölgelendirici (`shader`) kullanmaktadır.

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/ui/design/text/typography](https://docs.flutter.dev/ui/design/text/typography)

> *Bu sayfada  ›  Özel bir font kullanma*

<a id="bolum-5"></a>

# Bölüm 5: Özel Bir Font Kullanma (Use a Custom Font)

Özel fontların nasıl kullanılacağı.


> **ℹ️  Neler Öğreneceksiniz:** • Bir font nasıl seçilir.
• Font dosyaları projeye nasıl aktarılır.
• Bir font varsayılan tema fontu olarak nasıl ayarlanır.
• Belirli bir widget'ta bir font nasıl kullanılır.

Android ve iOS yüksek kaliteli sistem fontları sunsa da, tasarımcılar sıklıkla özel font desteği isterler. Bir tasarımcı tarafından özel hazırlanmış bir fontunuz olabilir ya da [Google Fonts](https://fonts.google.com) üzerinden bir font indirmiş olabilirsiniz.

Bir **yazı tipi ailesi** (*typeface*), belirli bir harf stilini oluşturan gliflerin (karakter simgelerinin) veya şekillerin koleksiyonudur. Bir **font** (*font*) ise bu yazı tipi ailesinin belirli bir kalınlık veya varyasyondaki temsilidir. Örneğin **Roboto** bir yazı tipi ailesidir;** Roboto Bold** ise bir fonttur.

Flutter, özel bir fontu tüm uygulama genelinde veya bağımsız widget'lara uygulamanıza olanak tanır. Bu tarif (*recipe*), aşağıdaki adımlarla özel fontlar kullanan bir uygulama oluşturur:

1. Fontlarınızı seçin (*Choose your fonts*).
2. Font dosyalarını projeye aktarın (*Import the font files*).
3. Fontu `pubspec.yaml` dosyasında bildirin (*Declare the font in the pubspec*).
4. Bir fontu varsayılan olarak ayarlayın (*Set a font as the default*).
5. Fontu belirli bir widget'ta kullanın (*Use a font in a specific widget*).
İlerlerken her adımı tek tek takip etmek zorunda değilsiniz. Kılavuzun sonunda eksiksiz ve tamamlanmış örnek dosyalar yer almaktadır.


> **ℹ️  Not:** Bu kılavuz aşağıdaki varsayımları yapmaktadır:
1. Flutter ortamınızı kurdunuz.
2. custom_fonts adında yeni bir Flutter uygulaması oluşturdunuz. Bu adımları henüz tamamlamadıysanız, bu kılavuza devam etmeden önce tamamlayın.
3. Verilen komutları bir macOS veya Linux terminalinde çalıştırıyor ve vi kullanıyorsunuz. vi yerine herhangi bir metin düzenleyiciyi kullanabilirsiniz. Windows kullanıcıları adımları uygularken uygun komutları ve dosya yollarını kullanmalıdır.
4. Flutter uygulamanıza Raleway ve RobotoMono fontlarını ekliyorsunuz.


## 1. Bir font seçin (Choose a font)

Font seçiminiz bir tercihten daha fazlası olmalıdır. Hangi dosya formatlarının Flutter ile uyumlu çalıştığını ve fontun tasarım seçenekleri ile uygulama performansını nasıl etkileyebileceğini göz önünde bulundurun.


### Desteklenen bir font formatı seçin (Pick a supported font format)

Flutter aşağıdaki font formatlarını destekler:

- OpenType font koleksiyonları: `.ttc`
- TrueType fontları: `.ttf`
- OpenType fontları: `.otf`
Flutter, masaüstü platformlarda Web Açık Font Formatındaki (`.woff` ve `.woff2`) fontları desteklemez.


### Belirli avantajları için fontları seçin (Choose fonts for their specific benefits)

Hangi font dosya türünün daha az yer kapladığı veya daha verimli olduğu konusunda kaynaklar nadiren tam olarak uzlaşır. Font dosya türleri arasındaki temel fark, formatın dosyadaki glifleri nasıl kodladığıyla ilgilidir. Zaman içinde formatlar ve fontlar geliştikçe birbirinden özellikler ödünç aldıkları için çoğu TrueType ve OpenType font dosyası benzer yeteneklere sahiptir.

Hangi fontu kullanmanız gerektiği aşağıdaki hususlara bağlıdır:

- Uygulamanızda fontlar için ne kadar varyasyona ihtiyacınız var?
- Uygulamanızda fontların ne kadar dosya boyutu kaplamasını kabul edebilirsiniz?
- Uygulamanızda kaç dili desteklemeniz gerekiyor?
Belirli bir fontun sunduğu seçenekleri araştırın: font dosyası başına birden fazla ağırlık veya stil, [değişken font yeteneği](https://fonts.google.com/variablefonts), birden fazla font ağırlığı için çoklu font dosyalarının bulunabilirliği veya font başına birden fazla genişlik seçeneği gibi.

Uygulamanızın tasarım gereksinimlerini karşılayan yazı tipi ailesini (*typeface* / font ailesi) seçin.

1.000'den fazla açık kaynaklı font ailesine doğrudan erişmeyi öğrenmek için [google_fonts](https://pub.dev/packages/google_fonts) paketine göz atın:

![Package of the Week — google_fonts (1.000'den Fazla Açık Kaynaklı Font Ailesi)](extracted_media/rId44_image11.jpeg)
*Package of the Week — google_fonts (1.000'den Fazla Açık Kaynaklı Font Ailesi)*

Birden çok projede tek bir fontu yeniden kullanmanıza olanak tanıyan bir diğer yaklaşımı öğrenmek için [Paketten fontları dışa aktarma](https://docs.flutter.dev/cookbook/design/package-fonts) (*Export fonts from a package*) konusuna bakın.


## 2. Font dosyalarını projeye aktarın (Import the font files)

Bir fontla çalışmak için, font dosyalarını Flutter projenize aktarın.

Font dosyalarını içe aktarmak için aşağıdaki adımları uygulayın:

1. Gerekirse, bu kılavuzdaki sonraki adımlarla eşleşmesi için Flutter uygulamanızın adını `custom_fonts` olarak değiştirin.

```bash
$ mv /path/to/my_app /path/to/custom_fonts
```

2. Flutter projenizin kök dizinine gidin.

```bash
$ cd /path/to/custom_fonts
```

3. Flutter projenizin kök dizininde bir `fonts` klasörü oluşturun.

```bash
$ mkdir fonts
```

4. Font dosyalarını Flutter projenizin kökündeki bir `fonts` veya `assets` klasörüne taşıyın ya da kopyalayın.

```bash
$ cp ~/Downloads/*.ttf ./fonts
```

Ortaya çıkan klasör yapısı aşağıdaki gibi görünmelidir:


```bash
custom_fonts/
  |- fonts/
    |- Raleway-Regular.ttf
    |- Raleway-Italic.ttf
    |- RobotoMono-Regular.ttf
    |- RobotoMono-Bold.ttf
```


## 3. Fontu pubspec.yaml dosyasında bildirin (Declare the font in the pubspec.yaml file)

Bir fontu indirdikten sonra, `pubspec.yaml` dosyasına bir font tanımı ekleyin. Bu font tanımı ayrıca uygulamanızda belirli bir ağırlığı veya stili işlemek (*render etmek*) için hangi font dosyasının kullanılması gerektiğini de belirtir.


### Fontları pubspec.yaml dosyasında tanımlama

Font dosyalarını Flutter uygulamanıza eklemek için aşağıdaki adımları tamamlayın:

1. Flutter projenizin kökündeki `pubspec.yaml` dosyasını açın.

```bash
$ vi pubspec.yaml
```

2. Aşağıdaki YAML bloğunu `flutter` bildiriminin hemen altına yapıştırın.

```yaml
flutter:
  fonts:
    - family: Raleway
      fonts:
        - asset: fonts/Raleway-Regular.ttf
        - asset: fonts/Raleway-Italic.ttf
          style: italic
    - family: RobotoMono
      fonts:
        - asset: fonts/RobotoMono-Regular.ttf
        - asset: fonts/RobotoMono-Bold.ttf
          weight: 700
```

Bu `pubspec.yaml` dosyası, `Raleway` font ailesi için italik stili `Raleway-Italic.ttf` font dosyası olarak tanımlar. `style: TextStyle(fontStyle: FontStyle.italic)` olarak ayarladığınızda, Flutter ekranda render ederken `Raleway-Regular` yerine `Raleway-Italic` dosyasını kullanır.

`family` değeri, yazı tipi ailesinin (*typeface*) adını belirler. Bu adı bir `TextStyle` nesnesinin `fontFamily` özelliğinde kullanırsınız.

`asset` değeri, `pubspec.yaml` dosyasından font dosyasına giden göreli bir yoldur (*relative path*). Bu dosyalar fonttaki gliflerin dış çizgilerini (*outlines*) içerir. Uygulama derlenirken Flutter bu dosyaları uygulamanın asset paketine (*asset bundle*) dahil eder.


### Her font için font dosyalarını dahil etme (Include font files for each font)

Farklı yazı tipleri, font dosyalarını farklı şekillerde uygular. Çeşitli font kalınlıklarına ve stillerine sahip bir yazı tipine ihtiyacınız varsa, bu çeşitliliği temsil eden font dosyalarını seçip içe aktarın.

İçinde birden fazla font barındırmayan veya değişken font özelliklerine sahip olmayan bir font dosyasını içe aktardığınızda, görüntülenme şeklini ayarlamak için `style` veya `weight` özelliğini kullanmayın. Normal bir font dosyasında bu özellikleri kullanırsanız Flutter görünümü simüle etmeye (yapay olarak taklit etmeye) çalışır. Görsel sonuç, doğru font dosyasını kullanmaktan oldukça farklı ve kalitesiz görünecektir.


### Stilleri ve ağırlıkları bildirme (Declare styles and weights)

Flutter, bir fontun ağırlığını veya stilini dosya adından çıkaramaz. Belirli bir ağırlığı veya stili kullanmak için `pubspec.yaml` dosyanızda o font dosyası için `weight` veya `style` özelliğini açıkça belirtmelisiniz.


### Font ağırlığını/kalınlığını ayarlama (Set font weight)

`weight` özelliği, dosyadaki glif dış çizgilerinin ağırlığını 100 ile 900 arasında, 100'ün bir tamsayı katı olarak belirtir. Bu değerler [FontWeight](https://api.flutter.dev/flutter/dart-ui/FontWeight-class.html) sınıfına karşılık gelir ve bir `TextStyle` nesnesinin `fontWeight` özelliğinde kullanılabilir.

Bu kılavuzda gösterilen `pubspec.yaml` dosyasında, `RobotoMono-Bold` fontunu ailenin `700` ağırlığı olarak tanımladınız. Uygulamanıza eklediğiniz `RobotoMono-Bold` fontunu kullanmak için `TextStyle` widget'ınızda `fontWeight` değerini `FontWeight.w700` olarak ayarlayın.

Uygulamanıza `RobotoMono-Bold` fontunu eklememiş ve ağırlığını bildirmemiş olsaydınız, Flutter normal fontu kalın göstermeye çalışırdı. Bu durumda metin yalnızca biraz daha koyu görünebilirdi.

Fontun kendi ağırlığını geçersiz kılmak için `weight` özelliğini kullanamazsınız. `RobotoMono-Bold` için `700` dışında başka bir ağırlık ayarlayamazsınız. `TextStyle(fontFamily: 'RobotoMono', fontWeight: FontWeight.w900)` şeklinde ayarlasanız bile, görüntülenen font `RobotoMono-Bold` ne kadar kalınsa yine o kalınlıkta render edilecektir.


### Font stilini ayarlama (Set font style)

`style` özelliği, font dosyasındaki gliflerin `italic` veya `normal` olarak görüntülenip görüntülenmeyeceğini belirtir. Bu değerler [FontStyle](https://api.flutter.dev/flutter/dart-ui/FontStyle.html) sınıfına karşılık gelir. Bu stilleri bir `TextStyle` nesnesinin `fontStyle` özelliğinde kullanabilirsiniz.

Bu kılavuzdaki `pubspec.yaml` dosyasında, `Raleway-Italic` fontunu italik stilde olarak tanımladınız. Uygulamanıza eklediğiniz `Raleway-Italic` fontunu kullanmak için `style: TextStyle(fontStyle: FontStyle.italic)` olarak ayarlayın. Flutter render ederken `Raleway-Regular` yerine `Raleway-Italic` fontunu kullanır.

Eğer `Raleway-Italic` fontunu uygulamanıza eklememiş ve stilini bildirmemiş olsaydınız, Flutter normal fontu italik göstermeye çalışırdı. Metin bu durumda sağa doğru yapay biçimde eğik görünebilirdi.

Bir fontun gliflerini geçersiz kılmak için `style` özelliğini kullanamazsınız. `TextStyle(fontFamily: 'Raleway', fontStyle: FontStyle.normal)` olarak ayarlasanız bile, görüntülenen font yine italik olarak render edilir. İtalik bir fontun normal stili de doğası gereği italiktir.


## 4. Bir fontu varsayılan olarak ayarlayın (Set a font as the default)

Metne bir font uygulamak için, fontu uygulamanın `theme`'inde varsayılan font olarak ayarlayabilirsiniz.

Varsayılan bir font ayarlamak için, uygulamanın `theme`'inde `fontFamily` özelliğini belirleyin. `fontFamily` değerini `pubspec.yaml` dosyasında bildirilen aile (*family*) adıyla eşleştirin.

Sonuç aşağıdaki koda benzeyecektir:


```dart
return MaterialApp(
  title: 'Custom Fonts',
  // Set Raleway as the default app font.
  theme: ThemeData(fontFamily: 'Raleway'),
  home: const MyHomePage(),
);
```

Temalar hakkında daha fazla bilgi edinmek için [Renkleri ve font stillerini paylaşmak için Temaları Kullanma](https://docs.flutter.dev/cookbook/design/themes) (*Using Themes to share colors and font styles*) tarifine göz atın.


## 5. Fontu belirli bir widget'ta ayarlayın (Set the font in a specific widget)

Fontu `Text` widget'ı gibi belirli bir widget'a uygulamak için ilgili widget'a bir `TextStyle` verin.

Bu kılavuz için, tek bir `Text` widget'ına `RobotoMono` fontunu uygulamayı deneyin. `fontFamily` değerini `pubspec.yaml` dosyasında bildirilen aile adıyla eşleştirin.

Sonuç aşağıdaki koda benzeyecektir:


```dart
child: Text(
  'Roboto Mono sample',
  style: TextStyle(fontFamily: 'RobotoMono'),
),
```


> **⚠️  Önemli:** Bir TextStyle nesnesi, karşılık gelen bir font dosyası olmadan bir ağırlık veya stil belirtirse, motor (engine) font için genel bir dosya kullanır ve istenen ağırlık ile stil için dış çizgileri tahmin edip türetmeye (extrapolate) çalışır.

Bu kabiliyete güvenmekten kaçının. Bunun yerine her zaman projeye uygun ve eksiksiz font dosyasını dahil edin.


## Tam örneği deneyin (Try the complete example)


### Fontları indirin (Download fonts)

[Google Fonts](https://fonts.google.com) üzerinden **Raleway** ve** RobotoMono** font dosyalarını indirin.


### pubspec.yaml dosyasını güncelleyin

1. Flutter projenizin kökündeki `pubspec.yaml` dosyasını açın.

```bash
$ vi pubspec.yaml
```

2. Dosya içeriğini aşağıdaki YAML yapılandırması ile değiştirin:

```yaml
name: custom_fonts
description: An example of how to use custom fonts with Flutter

dependencies:
  flutter:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter

flutter:
  fonts:
    - family: Raleway
      fonts:
        - asset: fonts/Raleway-Regular.ttf
        - asset: fonts/Raleway-Italic.ttf
          style: italic
    - family: RobotoMono
      fonts:
        - asset: fonts/RobotoMono-Regular.ttf
        - asset: fonts/RobotoMono-Bold.ttf
          weight: 700
  uses-material-design: true
```


### Bu main.dart dosyasını kullanın (Use this main.dart file)

1. Flutter projenizin `lib/` dizinindeki `main.dart` dosyasını açın.

```bash
$ vi lib/main.dart
```

2. Dosya içeriğini aşağıdaki Dart kodu ile değiştirin:

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Fonts',
      // Raleway'i varsayılan uygulama fontu olarak ayarla.
      theme: ThemeData(fontFamily: 'Raleway'),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar varsayılan Raleway fontunu kullanır.
      appBar: AppBar(title: const Text('Custom Fonts')),
      body: const Center(
        // Bu Text widget'ı RobotoMono fontunu kullanır.
        child: Text(
          'Roboto Mono sample',
          style: TextStyle(fontFamily: 'RobotoMono'),
        ),
      ),
    );
  }
}
```

Ortaya çıkan Flutter uygulaması aşağıdaki ekranı göstermelidir:


![Flutter Özel Fontlar Uygulama Ekranı — AppBar'da Raleway, Gövdede RobotoMono Fontu](extracted_media/rId46_image12.png)
*Flutter Özel Fontlar Uygulama Ekranı — AppBar'da Raleway, Gövdede RobotoMono Fontu*

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/cookbook/design/fonts](https://docs.flutter.dev/cookbook/design/fonts)

> *Bu sayfada  ›  Bir paketten fontları dışa aktarma (Export fonts from a package)*

<a id="bolum-6"></a>

# Bölüm 6: Bir Paketten Fontları Dışa Aktarma (Export Fonts from a Package)

Bir paketten fontların nasıl dışa aktarılacağı ve projelere nasıl dahil edileceği.

Bir fontu doğrudan bir uygulamanın parçası olarak tanımlamak yerine, ayrı bir paketin parçası olarak tanımlayabilirsiniz. Bu, aynı fontu birkaç farklı proje arasında paylaşmanın veya paketlerini [pub.dev](https://pub.dev) üzerinde yayımlayan geliştiriciler için oldukça kullanışlı ve pratik bir yöntemdir. Bu tarif aşağıdaki adımları kullanır:

1. Pakete bir font ekleme (Add a font to a package).
2. Paketi ve fontu uygulamaya ekleme (Add the package and font to the app).
3. Fontu kullanma (Use the font).

> **ℹ️  Not:** Neredeyse 1000 adet açık kaynaklı font ailesine doğrudan erişim sağlamak için google_fonts paketine göz atın.


## 1. Pakete bir font ekleme (Add a font to a package)

Bir paketten font dışa aktarmak (export etmek) için, font dosyalarını paket projesinin `lib` klasörüne aktarmanız gerekir. Font dosyalarını doğrudan `lib` klasörüne veya `lib/fonts` gibi bir alt dizine yerleştirebilirsiniz.

Bu örnekte, fontları bir `lib/fonts` klasöründe bulunan `awesome_package` adında bir Flutter kitaplığına (kütüphanesine) sahip olduğunuzu varsayalım:


```dart
plaintext
awesome_package/
  lib/
    awesome_package.dart
    fonts/
      Raleway-Regular.ttf
      Raleway-Italic.ttf
```


## 2. Paketi ve fontları uygulamaya ekleme (Add the package and fonts to the app)

Artık uygulamanın kök dizinindeki `pubspec.yaml` dosyasını güncelleyerek paketteki fontları kullanabilirsiniz.


### Paketi uygulamaya ekleme (Add the package to the app)

`awesome_package` paketini bir bağımlılık olarak eklemek için `flutter pub add` komutunu çalıştırın:


```dart
console
$ flutter pub add awesome_package
```


### Font varlıklarını bildirme (Declare the font assets)

Artık paketi içe aktardığınıza göre, Flutter'a `awesome_package` içerisindeki fontları nerede bulacağını bildirin.

Paket fontlarını tanımlamak (deklare etmek) için font yolunun başına `packages/awesome_package` ön ekini ekleyin. Bu yapılandırma Flutter'a font için paketin `lib` klasörüne bakmasını bildirir:


```yaml
flutter:
  fonts:
    - family: Raleway
      fonts:
        - asset: packages/awesome_package/fonts/Raleway-Regular.ttf
        - asset: packages/awesome_package/fonts/Raleway-Italic.ttf
          style: italic
```


## 3. Fontu kullanma (Use the font)

Metnin görünümünü değiştirmek için bir [TextStyle](https://api.flutter.dev/flutter/painting/TextStyle-class.html) kullanın. Paket fontlarını kullanmak için hangi fontu kullanmak istediğinizi ve fontun hangi pakete ait olduğunu belirtin:


```dart
child: Text(
  'Using the Raleway font from the awesome_package',
  style: TextStyle(fontFamily: 'Raleway'),
),
```


## Eksiksiz Örnek (Complete example)


### Fontlar (Fonts)

Raleway ve RobotoMono fontları [Google Fonts](https://fonts.google.com) üzerinden indirilmiştir.


### pubspec.yaml


```yaml
name: package_fonts
description: An example of how to use package fonts with Flutter

dependencies:
  awesome_package:
  flutter:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter

flutter:
  fonts:
    - family: Raleway
      fonts:
        - asset: packages/awesome_package/fonts/Raleway-Regular.ttf
        - asset: packages/awesome_package/fonts/Raleway-Italic.ttf
          style: italic
  uses-material-design: true
```


### main.dart


```dart
import 'package:material_ui/material_ui.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Package Fonts', home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The AppBar uses the app-default font.
      appBar: AppBar(title: const Text('Package Fonts')),
      body: const Center(
        // This Text widget uses the Raleway font.
        child: Text(
          'Using the Raleway font from the awesome_package',
          style: TextStyle(fontFamily: 'Raleway'),
        ),
      ),
    );
  }
}
```


![Paket Fontları Uygulama Ekranı — AppBar'da varsayılan font, gövdede awesome_package'dan alınan Raleway fontu](extracted_media/rId50_image13.png)
*Paket Fontları Uygulama Ekranı — AppBar'da varsayılan font, gövdede awesome_package'dan alınan Raleway fontu*

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/cookbook/design/package-fonts](https://docs.flutter.dev/cookbook/design/package-fonts)

> *Bu sayfada  ›  Parça gölgelendiricileri yazma ve kullanma (Writing and using fragment shaders)*

<a id="bolum-7"></a>

# Bölüm 7: Parça Gölgelendiricileri Yazma ve Kullanma (Writing and Using Fragment Shaders)

Flutter uygulamanızda özel görsel efektler oluşturmak için kırpma gölgelendiricileri (fragment shader) hazırlama ve kullanma rehberi.


> **ℹ️  Not:** Hem Skia hem de Impeller arka uçları (backend), özel gölgelendirici (custom shader) yazmayı destekler. Aksi belirtilmedikçe, aynı yönergeler her ikisi için de geçerlidir.

Özel gölgelendiriciler, Flutter SDK'sının sunduğu standart imkanların ötesinde zengin grafiksel efektler sağlamak için kullanılabilir. Bir gölgelendirici (shader), **GLSL** olarak bilinen, Dart benzeri küçük bir dilde yazılan ve doğrudan kullanıcının** GPU**'sunda (grafik işlem biriminde) çalıştırılan bir programdır.

Özel gölgelendiriciler bir Flutter projesine `pubspec.yaml` dosyasında listelenerek eklenir ve [FragmentProgram](https://api.flutter.dev/flutter/dart-ui/FragmentProgram-class.html) API'si kullanılarak elde edilir.


## Bir uygulamaya gölgelendirici ekleme (Adding shaders to an application)

`.frag` uzantılı GLSL dosyaları biçimindeki gölgelendiriciler, projenizin `pubspec.yaml` dosyasındaki `shaders` bölümünde bildirilmelidir. Flutter komut satırı aracı, gölgelendiriciyi uygun arka uç biçimine derler ve gerekli çalışma zamanı (runtime) meta verilerini oluşturur. Derlenen gölgelendirici daha sonra tıpkı bir varlık (*asset*) gibi uygulamaya dahil edilir.


```yaml
flutter:
  shaders:
    - shaders/myshader.frag
```

Hata ayıklama (*debug*) modunda çalışırken, bir gölgelendirici programında yapılan değişiklikler yeniden derlemeyi tetikler ve hot reload veya hot restart sırasında gölgelendiriciyi anında günceller.

Paketlerden gelen gölgelendiriciler projeye, gölgelendirici program adının başına `packages/$pkgname` ön eki getirilerek eklenir (burada `$pkgname` ilgili paketin adıdır).


### Gölgelendiricileri çalışma zamanında yükleme (Loading shaders at runtime)

Bir gölgelendiriciyi çalışma zamanında bir `FragmentProgram` nesnesine yüklemek için [FragmentProgram.fromAsset](https://api.flutter.dev/flutter/dart-ui/FragmentProgram/fromAsset.html) kurucusunu kullanın. Varlığın adı, `pubspec.yaml` dosyasında verilen gölgelendirici yolu ile aynıdır:


```dart
void loadMyShader() async {
  var program = await FragmentProgram.fromAsset('shaders/myshader.frag');
}
```

`FragmentProgram` nesnesi, bir veya daha fazla [FragmentShader](https://api.flutter.dev/flutter/dart-ui/FragmentShader-class.html) örneği oluşturmak için kullanılabilir. Bir `FragmentShader` nesnesi, belirli bir dizi *uniform* (yapılandırma parametresi) ile birlikte bir kırpma programını temsil eder. Kullanılabilir uniform'lar, gölgelendiricinin nasıl tanımlandığına bağlıdır.


```dart
void updateShader(Canvas canvas, Rect rect, FragmentProgram program) {
  var shader = program.fragmentShader();
  shader.setFloat(0, 42.0);
  canvas.drawRect(rect, Paint()..shader = shader);
}
```


### Canvas API

Parça gölgelendiricileri, [Paint.shader](https://api.flutter.dev/flutter/dart-ui/Paint/shader.html) özelliği ayarlanarak çoğu Canvas API'si ile kullanılabilir. Örneğin, [Canvas.drawRect](https://api.flutter.dev/flutter/dart-ui/Canvas/drawRect.html) kullanılırken gölgelendirici, dikdörtgen içindeki tüm pikseller/parçalar (fragments) için değerlendirilir. Çizgili bir yola (*stroked path*) sahip [Canvas.drawPath](https://api.flutter.dev/flutter/dart-ui/Canvas/drawPath.html) gibi bir API için gölgelendirici, çizgi içindeki tüm parçalar için değerlendirilir. [Canvas.drawImage](https://api.flutter.dev/flutter/dart-ui/Canvas/drawImage.html) gibi bazı API'ler ise gölgelendiricinin değerini yok sayar.


```dart
void paint(Canvas canvas, Size size, FragmentShader shader) {
  // Draws a rectangle with the shader used as a color source.
  canvas.drawRect(
    Rect.fromLTWH(0, 0, size.width, size.height),
    Paint()..shader = shader,
  );

  // Draws a stroked rectangle with the shader only applied to the fragments
  // that lie within the stroke.
  canvas.drawRect(
    Rect.fromLTWH(0, 0, size.width, size.height),
    Paint()
      ..style = PaintingStyle.stroke
      ..shader = shader,
  );
}
```


### ImageFilter API

Parça gölgelendiricileri [ImageFilter](https://api.flutter.dev/flutter/dart-ui/ImageFilter-class.html) API'si ile de kullanılabilir. Bu, önceden oluşturulmuş/çizilmiş içeriğe gölgelendirici uygulamak amacıyla [ImageFiltered](https://api.flutter.dev/flutter/widgets/ImageFiltered-class.html) sınıfı veya [BackdropFilter](https://api.flutter.dev/flutter/widgets/BackdropFilter-class.html) sınıfı ile özel kırpma gölgelendiricilerinin kullanılmasına olanak tanır. `ImageFilter`, özel bir kırpma gölgelendiricisi ile bir filtre oluşturmak için [ImageFilter.shader](https://api.flutter.dev/flutter/dart-ui/ImageFilter/ImageFilter.shader.html) kurucusunu sağlar.


> **⚠️  Uyarı:** Özel gölgelendiriciler için ImageFilter API'si yalnızca Impeller arka ucu tarafından desteklenir. Başka arka uçlarda (örneğin Skia) kullanılması bir hata fırlatılmasına yol açacaktır.


```dart
Widget build(BuildContext context, FragmentShader shader) {
  return ClipRect(
    child: SizedBox(
      width: 300,
      height: 300,
      child: BackdropFilter(
        filter: ImageFilter.shader(shader),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    ),
  );
}
```

`BackdropFilter` ile birlikte `ImageFilter` kullanılırken, [ClipRect](https://api.flutter.dev/flutter/widgets/ClipRect-class.html) bileşeni filtreden etkilenen alanı sınırlandırmak için kullanılabilir. Bir `ClipRect` olmadan, `BackdropFilter` tüm ekrana uygulanacaktır.

`ImageFilter` kırpma gölgelendiricileri, bazı uniform değerlerini motordan (Flutter engine) otomatik olarak alır. 0 dizinindeki `sampler2D` değeri filtre girdi görüntüsüne, 0 ve 1 dizinlerindeki `float` değerleri ise görüntünün genişlik ve yüksekliğine ayarlanır. Gölgelendiriciniz bu değerleri kabul edecek şekilde bu kurucuyu belirtmelidir (örneğin bir `sampler2D` ve bir `vec2`), ancak bunları Dart kodunuzdan atamamalısınız.

OpenGLES hedeflenirken dokunun y koordinatları ters çevrilmiş olacaktır; bu nedenle kırpma gölgelendiricisi, motor tarafından sağlanan dokulardan örnekleme yaparken UV koordinatlarını ters çevirerek düzeltmelidir (un-flip):


```glsl
#version 460 core
#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

// These uniforms are automatically set by the engine.
uniform vec2 u_size;
uniform sampler2D u_texture;

void main() {
  vec2 uv = FlutterFragCoord().xy / u_size;
#ifdef IMPELLER_TARGET_OPENGLES
  // When sampling from u_texture on OpenGLES the y-coordinates will be flipped.
  uv.y = 1.0 - uv.y;
#endif
  vec4 color = texture(u_texture, uv);
  float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
  fragColor = vec4(vec3(gray), color.a);
}
```


## Gölgelendirici yazma ve oluşturma (Authoring shaders)

Parça gölgelendiricileri GLSL kaynak dosyaları olarak yazılır. Genel teamül gereği bu dosyalar `.frag` uzantısına sahiptir. (Flutter, `.vert` uzantısına sahip olacak tepe noktası / vertex gölgelendiricilerini desteklemez.)

Kullanılabilir bazı özellikler kısıtlanmış olsa da, 460'tan 100'e kadar olan herhangi bir GLSL sürümü desteklenir. Bu belgedeki örneklerin geri kalanında `460 core` sürümü kullanılmaktadır.

Gölgelendiriciler, Flutter ile birlikte kullanıldıklarında aşağıdaki kısıtlamalara tabidir:

- UBO'lar ve SSBO'lar desteklenmez (UBOs and SSBOs aren't supported).
- `sampler2D` desteklenen tek örnekleyici türüdür.
- `texture` fonksiyonunun yalnızca iki bağımsız değişkenli sürümü (örnekleyici ve uv) desteklenir.
- Ek değişen (`varying`) girdiler bildirilemez.
- Skia hedeflenirken tüm duyarlık (*precision*) ipuçları yok sayılır.
- İşaretsiz tam sayılar (*unsigned integers*) ve mantıksal değerler (*booleans*) desteklenmez.

### Uniform Değerleri (Uniforms)

Bir kırpma programı, GLSL gölgelendirici kaynağında `uniform` değerleri tanımlanarak ve ardından her bir kırpma gölgelendiricisi örneği için Dart içinde bu değerler ayarlanarak yapılandırılabilir.

`float`, `vec2`, `vec3` ve `vec4` GLSL türlerindeki kayan noktalı uniform'lar [FragmentShader.setFloat](https://api.flutter.dev/flutter/dart-ui/FragmentShader/setFloat.html) veya [FragmentShader.getUniformFloat](https://api.flutter.dev/flutter/dart-ui/FragmentShader/getUniformFloat.html) metodu kullanılarak ayarlanır. `sampler2D` türünü kullanan GLSL örnekleyici değerleri ise [FragmentShader.setImageSampler](https://api.flutter.dev/flutter/dart-ui/FragmentShader/setImageSampler.html) veya [FragmentShader.getImageSampler](https://api.flutter.dev/flutter/dart-ui/FragmentShader/getImageSampler.html) metodu kullanılarak ayarlanır.

Her bir `uniform` değeri için doğru dizin (index), uniform değerlerinin kırpma programında tanımlandığı sıraya göre belirlenir. Birden fazla kayan noktadan oluşan veri türleri için (örneğin bir `vec4`), her bir değer için `FragmentShader.setFloat` veya [UniformFloatSlot.set](https://api.flutter.dev/flutter/dart-ui/UniformFloatSlot/set.html) metodunu bir kez çağırmanız gerekir.

Örneğin, bir GLSL kırpma programında aşağıdaki uniform bildirimleri verildiğinde:


```glsl
uniform float uScale;
uniform sampler2D uTexture;
uniform vec2 uMagnitude;
uniform vec4 uColor;
```

Bu `uniform` değerlerini başlatmak (ilklendirmek) için karşılık gelen Dart kodu şu şekildedir:


```dart
class Foobar {
  late final UniformFloatSlot _scale;
  late final List<UniformFloatSlot> _magnitude;
  late final List<UniformFloatSlot> _color;
  late final ImageSamplerSlot _texture;

  void setUp(FragmentShader shader) {
    _scale = shader.getUniformFloat('uScale');
    _magnitude = List<UniformFloatSlot>.generate(2, (int index) {
      return shader.getUniformFloat('uMagnitude', index);
    });    
    _color = List<UniformFloatSlot>.generate(4, (int index) {
      return shader.getUniformFloat('uColor', index);
    });
    _texture = shader.getImageSampler('uTexture');
  }

  void update(Color color, Image image) {
    _scale.set(23);
    _magnitude[0].set(114);
    _magnitude[1].set(83);
    _color[0].set(color.r * color.a);
    _color[1].set(color.g * color.a);
    _color[2].set(color.b * color.a);
    _color[3].set(color.a);
    _texture.set(image);
  }
}
```

`FragmentShader.setFloat` kullanılırken, dizinlerin `sampler2D` uniform'unu saymadığına dikkat edin. Bu uniform `FragmentShader.setImageSampler` ile ayrı olarak ayarlanır ve dizin numarası sıfırdan (0) başlar.

Başlatılmadan bırakılan herhangi bir kayan noktalı uniform varsayılan olarak `0.0` değerini alır.

Flutter'ın gölgelendirici derleyicisi tarafından üretilen yansıma (reflection) verileri, uniform ofsetleri gibi ayrıntıları görmek için aşağıdaki komutlarla denetlenebilir:


```bash
cd $FLUTTER
# Generate the .sl file.
`find bin/ -name impellerc` \
  --runtime-stage-metal \
  --iplr \
  --input=path/to/myshader.frag \
  --sl=foo.sl \
  --spirv=foo.spirv \
  --include=engine/src/flutter/impeller/compiler/shader_lib/ \
  --input-type=frag
# Convert the .sl file to .json
flatc \
  --json \
  ./engine/src/flutter/impeller/runtime_stage/runtime_stage.fbs \
  -- ./foo.sl
# View results
cat foo.json
```

**Mevcut konum (Current position)**
Gölgelendirici, değerlendirilmekte olan belirli parçanın yerel koordinatlarını içeren değişen (`varying`) bir değere erişebilir. `flutter/runtime_effect.glsl` kitaplığını içe aktararak ve `FlutterFragCoord` işlevini çağırarak erişilebilen mevcut konuma bağlı efektleri hesaplamak için bu özellikten yararlanın. Örneğin:


```glsl
#include <flutter/runtime_effect.glsl>

void main() {
  vec2 currentPos = FlutterFragCoord().xy;
}
```

`FlutterFragCoord` tarafından döndürülen değer, `gl_FragCoord` değerinden farklıdır. `gl_FragCoord` ekran alanı koordinatlarını sağlar ve gölgelendiricilerin farklı arka uçlar arasında tutarlı olmasını sağlamak için genellikle bundan kaçınılmalıdır. Skia arka ucu hedeflendiğinde, `gl_FragCoord` çağrıları yerel koordinatlara erişmek üzere yeniden yazılır, ancak bu yeniden yazma işlemi Impeller ile mümkün değildir.

**Renkler (Colors)**
Renkler için yerleşik bir veri türü bulunmamaktadır. Bunun yerine genellikle her bir bileşeni **RGBA** renk kanallarından birine karşılık gelen bir `vec4` ile temsil edilirler.

Tekil çıktı olan `fragColor`, renk değerinin `0.0` ile `1.0` aralığında normalleştirilmiş olmasını ve önceden çarpılmış alfa (*premultiplied alpha*) değerine sahip olmasını bekler. Bu durum, `0-255` aralığında değer kodlaması kullanan ve önceden çarpılmamış alfa değerine sahip tipik Flutter renklerinden farklıdır.

**Örnekleyiciler (Samplers)**
Bir örnekleyici (sampler), bir `dart:ui` `Image` nesnesine erişim sağlar. Bu görüntü, ya kodu çözülmüş bir görüntüden ya da [Scene.toImageSync](https://api.flutter.dev/flutter/dart-ui/Scene/toImageSync.html) veya [Picture.toImageSync](https://api.flutter.dev/flutter/dart-ui/Picture/toImageSync.html) kullanılarak uygulamanın bir bölümünden elde edilebilir.

**GLSL'de örnekleyici kullanımı örneği (Sampler usage in GLSL example)**

```glsl
#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform sampler2D uTexture;

out vec4 fragColor;

void main() {
  vec2 uv = FlutterFragCoord().xy / uSize;
  fragColor = texture(uTexture, uv);
}
```

Varsayılan olarak görüntü, `[0, 1]` aralığının dışındaki değerlerin nasıl davranacağını belirlemek için [TileMode.clamp](https://api.flutter.dev/flutter/dart-ui/TileMode.html) kullanır. Döşeme modunun özelleştirilmesi desteklenmez ve gerekirse gölgelendirici içinde emüle edilmesi gerekir.

**toImageSync örneği (toImageSync example)**

```dart
class SDFPainter {
  SDFPainter(this.sdfShader, this.renderShader);

  FragmentShader sdfShader;
  FragmentShader renderShader;
  Image? _sdf;
  bool isDirty = false;
  double radius = 0.5;

  void paint(Canvas canvas, Size size) {
    if (_sdf == null || isDirty) {
      final recorder = PictureRecorder();
      final subCanvas = Canvas(recorder);
      final paint = Paint()..shader = sdfShader;
      sdfShader.setFloat(0, size.width);
      sdfShader.setFloat(1, size.height);
      sdfShader.setFloat(2, radius);
      subCanvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
      final picture = recorder.endRecording();
      _sdf = picture.toImageSync(size.width.toInt(), size.height.toInt());
      isDirty = false;
    }

    renderShader.setFloat(0, size.width);
    renderShader.setFloat(1, size.height);
    renderShader.setImageSampler(0, _sdf!);

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = renderShader,
    );
  }
}
```


## Performans Konuları (Performance considerations)

Skia arka ucu hedeflenirken, gölgelendiricinin çalışma zamanında platforma özgü uygun gölgelendiriciye derlenmesi gerektiğinden gölgelendiricinin yüklenmesi maliyetli (expensive) olabilir. Bir animasyon sırasında bir veya daha fazla gölgelendirici kullanmayı düşünüyorsanız, animasyonu başlatmadan önce kırpma programı nesnelerini önbelleğe almayı (*precaching*) değerlendirin.

Bir `FragmentShader` nesnesini kareler (*frames*) arasında yeniden kullanabilirsiniz; bu, her kare için yeni bir `FragmentShader` oluşturmaktan çok daha verimlidir.

Performanslı gölgelendiriciler yazmaya ilişkin daha ayrıntılı bir kılavuz için GitHub üzerindeki [Writing efficient shaders](https://github.com/flutter/flutter/blob/main/docs/engine/impeller/docs/shader_optimization.md) (Verimli gölgelendiriciler yazma) belgesine göz atın.


## Diğer Kaynaklar (Other resources)

Daha fazla bilgi için aşağıdaki kaynaklardan yararlanabilirsiniz:

- [The Book of Shaders](https://thebookofshaders.com/) — Patricio Gonzalez Vivo ve Jen Lowe tarafından hazırlanan gölgelendirici rehberi
- [Shader toy](https://www.shadertoy.com/) — İş birlikçi ve etkileşimli bir gölgelendirici oyun alanı
- [simple_shader](https://github.com/flutter/samples/tree/main/simple_shader) — Basit bir Flutter kırpma gölgelendiricileri örnek projesi
- [flutter_shaders](https://pub.dev/packages/flutter_shaders) — Flutter'da kırpma gölgelendiricilerinin kullanımını basitleştiren bir paket
Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/ui/design/graphics/fragment-shaders](https://docs.flutter.dev/ui/design/graphics/fragment-shaders)

> *Bu sayfada  ›  Flutter uygulamanıza etkileşim ekleme (Add interactivity to your Flutter app)*



---

## KISIM III: ETKİLEŞİM, DURUM YÖNETİMİ, JESTLER VE SÜRÜKLEME
> *Stateful ve Stateless widget mimarisi, setState() yaşam döngüsü, işaretçi olayları, GestureDetector, super_drag_and_drop ve Dismissible listeler.*

---

<a id="bolum-8"></a>

# Bölüm 8: Flutter Uygulamanıza Etkileşim Ekleme (Add Interactivity to Your Flutter App)

Dokunmalara ve tıklamalara yanıt veren durum bilgisi olan (stateful) bir widget'ın nasıl uygulanacağı.


> **🎯  Öğrenecekleriniz:** (What you'll learn) : • Dokunma ve tıklamalara nasıl yanıt verileceği (How to respond to taps). • Özel bir widget'ın nasıl oluşturulacağı (How to create a custom widget). • Durumsuz (stateless) ve durum bilgisi olan (stateful) widget'lar arasındaki farklar.

Uygulamanızı kullanıcı girdilerine tepki verecek şekilde nasıl değiştirirsiniz? Bu öğreticide, yalnızca etkileşimsiz widget'lar içeren bir uygulamaya etkileşim kazandıracaksınız. Özellikle, iki durumsuz widget'ı yöneten özel bir durum bilgisi olan (*stateful*) widget oluşturarak bir simgeyi tıklanabilir hale getireceksiniz.

[Düzen oluşturma öğreticisi](https://docs.flutter.dev/ui/layout/tutorial) (building layouts tutorial), aşağıdaki ekran görüntüsünün düzenini nasıl oluşturacağınızı göstermişti:


![Düzen Eğitimi Uygulama Ekranı (The layout tutorial app) — Oeschinen Gölü Kamp Alanı](extracted_media/rId79_image14.jpeg)
*Düzen Eğitimi Uygulama Ekranı (The layout tutorial app) — Oeschinen Gölü Kamp Alanı*

Uygulama ilk başlatıldığında yıldız simgesi koyu kırmızı renktedir; bu durum, bu gölün daha önce favorilere eklendiğini gösterir. Yıldızın yanındaki sayı, 41 kişinin bu gölü favorilerine eklediğini belirtir. Bu öğreticiyi tamamladıktan sonra, yıldıza dokunulduğunda favori durumu kaldırılacak, dolu yıldız yerini içi boş bir yıldıza bırakacak ve sayaç sayısı azalacaktır. Tekrar dokunulduğunda ise göl yeniden favorilere eklenecek, dolu bir yıldız çizilecek ve sayı artacaktır.


![Oluşturulacak Özel Widget: Favorilere Eklenmiş (41) ve Eklenmemiş (40) Durum Görünümü](extracted_media/rId80_image15.png)
*Oluşturulacak Özel Widget: Favorilere Eklenmiş (41) ve Eklenmemiş (40) Durum Görünümü*

Bunu başarmak için, kendileri de birer widget olan hem yıldızı hem de sayacı içeren tek bir özel widget oluşturacaksınız. Yıldıza dokunmak her iki widget için de durumu değiştirdiğinden, aynı widget her ikisini birden yönetmelidir.

Doğrudan kod yazmaya başlamak için **2. Adım: StatefulWidget'tan Türetme** bölümüne geçebilirsiniz. Durumu yönetmenin farklı yollarını denemek isterseniz** Durum Yönetimi (Managing state)** bölümüne atlayabilirsiniz.


## Durum Bilgisi Olan ve Durumsuz Widget'lar (Stateful and stateless widgets)

Bir widget ya durum bilgisi olan (**stateful**) ya da durumsuz (**stateless**) bir yapıdadır. Bir widget değişebiliyorsa — örneğin bir kullanıcı onunla etkileşime girdiğinde — durum bilgisi olan (*stateful*) bir widget'tır.

*Durumsuz* (stateless) bir widget asla değişmez. [Icon](https://api.flutter.dev/flutter/widgets/Icon-class.html), [IconButton](https://pub.dev/documentation/material_ui/latest/material_ui/IconButton-class.html) ve [Text](https://api.flutter.dev/flutter/widgets/Text-class.html) durumsuz widget örnekleridir. Durumsuz widget'lar [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html) sınıfından türetilir.
*Durum bilgisi olan* (stateful) bir widget dinamiktir: örneğin, kullanıcı etkileşimleriyle tetiklenen olaylara yanıt olarak veya veri aldığında görünümünü değiştirebilir. [Checkbox](https://pub.dev/documentation/material_ui/latest/material_ui/Checkbox-class.html), [Radio](https://pub.dev/documentation/material_ui/latest/material_ui/Radio-class.html)[Slider](https://pub.dev/documentation/material_ui/latest/material_ui/Slider-class.html), [InkWell](https://pub.dev/documentation/material_ui/latest/material_ui/InkWell-class.html), [Form](https://api.flutter.dev/flutter/widgets/Form-class.html) ve [TextField](https://pub.dev/documentation/material_ui/latest/material_ui/TextField-class.html) durum bilgisi olan widget örnekleridir. Durum bilgili widget'lar [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html) sınıfından türetilir.
Bir widget'ın durumu, widget'ın durumunu görünümünden ayıran bir [State](https://api.flutter.dev/flutter/widgets/State-class.html) nesnesinde saklanır. Durum; bir kaydırıcının mevcut değeri veya bir onay kutusunun işaretli olup olmadığı gibi değişebilen değerlerden oluşur. Widget'ın durumu değiştiğinde, state nesnesi `setState()` metodunu çağırarak framework'e widget'ı yeniden çizmesini söyler.


## Durum Bilgisi Olan Bir Widget Oluşturma (Creating a stateful widget)


> **🎯  İşin Özü Nedir:** (What's the point?) : • Durum bilgisi olan (stateful) bir widget iki sınıf tarafından uygulanır: StatefulWidget'ın bir alt sınıfı ve State'in bir alt sınıfı. • State sınıfı, widget'ın değiştirilebilir (mutable) durumunu ve widget'ın build() metodunu içerir. • Widget'ın durumu değiştiğinde, state nesnesi setState() çağrısı yaparak framework'e widget'ı yeniden çizmesini bildirir.

Bu bölümde özel bir stateful widget oluşturacaksınız. İki durumsuz widget'ı — dolu kırmızı yıldızı ve yanındaki sayısal sayacı — iki alt widget içeren bir satırı yöneten tek bir özel stateful widget ile değiştireceksiniz: bir `IconButton` ve `Text`.

Özel bir stateful widget uygulamak iki sınıfın oluşturulmasını gerektirir:

- Widget'ı tanımlayan bir `StatefulWidget` alt sınıfı.
- Bu widget için durumu içeren ve widget'ın `build()` metodunu tanımlayan bir `State` alt sınıfı.
Bu bölüm, göller uygulaması için `FavoriteWidget` adı verilen stateful bir widget'ın nasıl oluşturulacağını gösterir. Kurulumu yaptıktan sonra ilk adımınız, `FavoriteWidget` için durumun nasıl yönetileceğini seçmektir.


### 0. Adım: Hazırlık (Step 0: Get ready)

Uygulamayı daha önce düzen öğreticisinde ([building layouts tutorial](https://docs.flutter.dev/ui/layout/tutorial)) oluşturduysanız bir sonraki bölüme geçebilirsiniz.

1. Geliştirme ortamınızı [kurduğunuzdan](https://docs.flutter.dev/install) emin olun.
2. [Yeni bir Flutter uygulaması oluşturun](https://docs.flutter.dev/reference/create-new-app).
3. `lib/main.dart` dosyasını öğreticideki [main.dart](https://github.com/flutter/website/blob/main/examples/layout/lakes/step6/lib/main.dart) ile değiştirin.
4. `pubspec.yaml` dosyasını öğreticideki [pubspec.yaml](https://github.com/flutter/website/blob/main/examples/layout/lakes/step6/pubspec.yaml) ile değiştirin.
5. Projenizde bir `images` dizini oluşturun ve [lake.jpg](https://github.com/flutter/website/blob/main/examples/layout/lakes/step6/images/lake.jpg) görselini ekleyin.
Bağlı ve etkinleştirilmiş bir fiziksel cihazınız olduğunda veya [iOS simülatörünü](https://docs.flutter.dev/platform-integration/ios/setup#set-up-devices) ya da [Android emülatörünü](https://docs.flutter.dev/platform-integration/android/setup#set-up-devices) başlattığınızda hazırsınız demektir!


### 1. Adım: Hangi nesnenin widget durumunu yöneteceğine karar verin (Step 1)

Bir widget'ın durumu çeşitli yollarla yönetilebilir, ancak bizim örneğimizde widget'ın kendisi olan `FavoriteWidget` kendi durumunu yönetecektir. Bu örnekte yıldıza dokunmak, üst widget'ı veya arayüzün geri kalanını etkilemeyen yalıtılmış bir eylemdir; bu nedenle widget durumunu kendi içinde dahili olarak işleyebilir.

Widget ile durumun ayrılması ve durumun nasıl yönetilebileceği hakkında daha fazla bilgi edinmek için **Durum Yönetimi (Managing state)** bölümüne bakın.


### 2. Adım: StatefulWidget'tan türetme (Step 2: Subclass StatefulWidget)

`FavoriteWidget` sınıfı kendi durumunu yönetir, bu nedenle bir `State` nesnesi oluşturmak için `createState()` metodunu geçersiz kılar (override eder). Framework, widget'ı derlemek/inşa etmek istediğinde `createState()` çağrısını yürütür. Bu örnekte `createState()`, bir sonraki adımda uygulayacağınız `_FavoriteWidgetState` örneğini döndürür:


```dart
class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}
```


> **ℹ️  Not:** Alt çizgi (_) ile başlayan üyeler veya sınıflar gizlidir (private). Daha fazla bilgi için Dart dili dokümantasyonundaki Kitaplıklar ve içe aktarmalar bölümüne bakın.


### 3. Adım: State'ten türetme (Step 3: Subclass State)

`_FavoriteWidgetState` sınıfı, widget'ın ömrü boyunca değişebilen verileri (*mutable data*) saklar. Uygulama ilk açıldığında arayüz, gölün favori durumunda olduğunu gösteren 41 beğeni sayısı ile birlikte koyu kırmızı bir yıldız görüntüler. Bu değerler `_isFavorited` ve `_favoriteCount` alanlarında tutulur:


```dart
class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
```

Bu sınıf ayrıca kırmızı bir `IconButton` ve `Text` içeren bir satır oluşturan bir `build()` metodu tanımlar. `Icon` yerine [IconButton](https://pub.dev/documentation/material_ui/latest/material_ui/IconButton-class.html) kullanırsınız çünkü dokunmayı işlemek için bir geri çağırma fonksiyonunu (`_toggleFavorite`) tanımlayan bir `onPressed` özelliğine sahiptir. Geri çağırma fonksiyonunu hemen ardından tanımlayacaksınız:


```dart
class _FavoriteWidgetState extends State<FavoriteWidget> {
  // ···
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(width: 18, child: SizedBox(child: Text('$_favoriteCount'))),
      ],
    );
  }

  // ···
}
```


> **💡  İpucu:** Metni bir SizedBox içine yerleştirmek ve genişliğini sabitlemek, metin 40 ve 41 değerleri arasında değiştiğinde fark edilebilir bir "sıçramayı / titremeyi" önler; aksi takdirde bu değerler farklı karakter genişliklerine sahip olduğundan satırda kayma meydana gelirdi.

`IconButton`'a basıldığında çağrılan `_toggleFavorite()` metodu, `setState()` metodunu çalıştırır. `setState()` çağrısı kritiktir; çünkü bu çağrı framework'e widget durumunun değiştiğini ve arayüzün yeniden çizilmesi gerektiğini bildirir. `setState()` içindeki mantık, arayüzü şu iki durum arasında değiştirir:

- Bir `star` simgesi ve 41 sayısı.
- Bir `star_border` simgesi ve 40 sayısı.

```dart
void _toggleFavorite() {
  setState(() {
    if (_isFavorited) {
      _favoriteCount -= 1;
      _isFavorited = false;
    } else {
      _favoriteCount += 1;
      _isFavorited = true;
    }
  });
}
```


### 4. Adım: Stateful widget'ı widget ağacına bağlama (Step 4)

Özel durum bilgili widget'ınızı uygulamanın `build()` metodundaki widget ağacına ekleyin. İlk olarak `Icon` ve `Text` oluşturan kodu bulun ve silin. Aynı konuma stateful widget'ınızı ekleyin:


```dart
dart diff
child: Row(
    children: [
      // ...
-     Icon(
-       Icons.star,
-       color: Colors.red[500],
-     ),
-     const Text('41'),
+     const FavoriteWidget(),
    ],
  ),
```

İşte bu kadar! Uygulamaya **hot reload** uyguladığınızda, yıldız simgesi artık dokunmalara anında yanıt verecektir.


### Sorun mu yaşıyorsunuz? (Problems?)

Kodunuzu çalıştıramıyorsanız, olası hatalar için geliştirme ortamınıza (IDE) bakın. [Flutter uygulamalarında hata ayıklama](https://docs.flutter.dev/testing/debugging) kılavuzu yardımcı olabilir. Sorunu hala çözemediyseniz, kodunuzu GitHub'daki etkileşimli lakes örneğiyle karşılaştırın:

- [lib/main.dart](https://github.com/flutter/website/tree/main/examples/layout/lakes/interactive/lib/main.dart)
- [pubspec.yaml](https://github.com/flutter/website/tree/main/examples/layout/lakes/interactive/pubspec.yaml)
- [lakes.jpg](https://github.com/flutter/website/tree/main/examples/layout/lakes/interactive/images/lake.jpg)
Hala sorularınız varsa, [geliştirici topluluğu](https://flutter.dev/community) kanallarından herhangi birine başvurabilirsiniz.

*Bu sayfanın geri kalanı, bir widget'ın durumunun yönetilebileceği çeşitli yolları kapsar ve kullanıma hazır diğer etkileşimli widget'ları listeler.*

## Durum Yönetimi (Managing state)


> **🎯  İşin Özü Nedir:** (What's the point?) : • Durumu yönetmek için farklı mimari yaklaşımlar mevcuttur. • Widget tasarımcısı olarak hangi yaklaşımı seçeceğinize siz karar verirsiniz. • Kararsız kaldığınız durumlarda, durumu üst (parent) widget'ta yöneterek başlayın.

Stateful bir widget'ın durumunu kim yönetir? Widget'ın kendisi mi? Üst (parent) widget mı? Her ikisi birden mi? Yoksa başka bir nesne mi? Cevap şudur: *Duruma göre değişir.* Widget'ınızı etkileşimli hale getirmenin geçerli birçok yolu vardır. Widget tasarımcısı olarak, widget'ınızın nasıl kullanılmasını beklediğinize göre kararı siz verirsiniz. İşte durumu yönetmenin en yaygın yolları:

- **Widget kendi durumunu yönetir** (The widget manages its own state)
- **Üst widget, widget'ın durumunu yönetir** (The parent manages the widget's state)
- **Karma yaklaşım** (A mix-and-match approach)
Hangi yaklaşımı kullanacağınıza nasıl karar verirsiniz? Aşağıdaki temel ilkeler karar vermenize rehberlik edecektir:

- Söz konusu durum bir **kullanıcı verisi** ise (örneğin bir onay kutusunun işaretli/işaretsiz modu veya bir kaydırıcının konumu), bu durum en iyi şekilde** üst (parent) widget** tarafından yönetilir.
- Söz konusu durum **estetik / görsel** bir özellik ise (örneğin bir animasyon veya görsel efekt), bu durum en iyi şekilde** widget'ın kendisi** tarafından yönetilir.
*Tereddütte kaldığınızda, durumu üst (parent) widget'ta yöneterek işe başlayın.*
Durumu yönetmenin farklı yollarını üç basit örnek oluşturarak göstereceğiz: **TapboxA**,** TapboxB** ve** TapboxC**. Örneklerin tamamı benzer şekilde çalışır — her biri dokunulduğunda yeşil veya gri bir kutu arasında geçiş yapan bir kapsayıcı (`Container`) oluşturur. `_active` boolean değeri rengi belirler: aktif için yeşil veya pasif için gri.


| Öğe 1 | Öğe 2 |
| :---: | :---: |
| ![Aktif Durum (Active State)](extracted_media/rId108_image16.png)<br>**Aktif Durum (Active State)** | ![Pasif Durum (Inactive State)](extracted_media/rId109_image17.png)<br>**Pasif Durum (Inactive State)** |

Bu örnekler, `Container` üzerindeki dokunma etkinliklerini yakalamak için [GestureDetector](https://api.flutter.dev/flutter/widgets/GestureDetector-class.html) kullanır.


### 1. Yaklaşım: Widget kendi durumunu yönetir (The widget manages its own state)

Bazen bir widget'ın kendi durumunu dahili olarak yönetmesi en mantıklı seçenektir. Örneğin, [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html), içeriği ekrandaki oluşturma kutusunu aştığında otomatik olarak kaydırır. `ListView` kullanan çoğu geliştirici kaydırma davranışını kendisi yönetmek istemez; bu yüzden `ListView` kendi kaydırma ofsetini kendisi yönetir.

`_TapboxAState` sınıfı:

- `TapboxA` için durumu yönetir.
- Kutunun geçerli rengini belirleyen `_active` boolean değişkenini tanımlar.
- Kutuya dokunulduğunda `_active` değerini güncelleyen ve arayüzü güncellemek için `setState()` fonksiyonunu çağıran `_handleTap()` fonksiyonunu tanımlar.
- Widget için tüm etkileşimli davranışları uygular.

```dart
import 'package:material_ui/material_ui.dart';

// TapboxA kendi durumunu yönetir (self-managed).

//------------------------- TapboxA ----------------------------------

class TapboxA extends StatefulWidget {
  const TapboxA({super.key});

  @override
  State<TapboxA> createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

//------------------------- MyApp ----------------------------------

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Demo')),
        body: const Center(child: TapboxA()),
      ),
    );
  }
}
```


### 2. Yaklaşım: Üst widget durumu yönetir (The parent widget manages the widget's state)

Çoğu zaman üst widget'ın durumu yönetmesi ve alt widget'a ne zaman güncelleneceğini bildirmesi en doğrusudur. Örneğin, [IconButton](https://pub.dev/documentation/material_ui/latest/material_ui/IconButton-class.html), bir simgeyi tıklanabilir bir buton olarak ele almanızı sağlar. `IconButton` durumsuz (stateless) bir widget'tır; çünkü üst widget'ın butona ne zaman tıklandığını bilmesi ve buna göre uygun eylemi gerçekleştirmesi gerektiğine karar verilmiştir.

Aşağıdaki örnekte `TapboxB`, durumunu bir geri çağırma (*callback*) aracılığıyla üst widget'ına aktarır. `TapboxB` herhangi bir durumu kendi içinde yönetmediğinden, `StatelessWidget` sınıfından türetilmiştir.

`ParentWidgetState` sınıfı:

- `TapboxB` için `_active` durumunu yönetir.
- Kutuya dokunulduğunda çağrılan `_handleTapboxChanged()` metodunu uygular.
- Durum değiştiğinde arayüzü güncellemek için `setState()` çağrısı yapar.
`TapboxB` sınıfı:

- Tüm durum üst bileşeni tarafından yönetildiği için `StatelessWidget` sınıfını genişletir.
- Bir dokunma algılandığında üst widget'ı bilgilendirir.

```dart
import 'package:material_ui/material_ui.dart';

// ParentWidget, TapboxB için durumu yönetir.

//------------------------ ParentWidget --------------------------------

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TapboxB(active: _active, onChanged: _handleTapboxChanged),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  const TapboxB({super.key, this.active = false, required this.onChanged});

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
```


### 3. Yaklaşım: Karma yaklaşım (A mix-and-match approach)

Bazı widget'lar için karma bir yaklaşım en mantıklısıdır. Bu senaryoda durum bilgisi olan (stateful) widget durumun bir kısmını kendisi yönetirken, üst widget durumun diğer yönlerini yönetir.

`TapboxC` örneğinde, dokunulduğunda (*tap down*) kutunun etrafında koyu yeşil bir kenarlık belirir. Dokunma bırakıldığında (*tap up*) kenarlık kaybolur ve kutunun rengi değişir. `TapboxC`, `_active` durumunu üst widget'ına aktarır ancak `_highlight` durumunu kendi içinde yönetir. Bu örnekte iki adet `State` nesnesi bulunur: `_ParentWidgetState` ve `_TapboxCState`.

`_ParentWidgetState` nesnesi:

- `_active` durumunu yönetir.
- Kutuya dokunulduğunda çağrılan `_handleTapboxChanged()` metodunu uygular.
- Bir dokunma gerçekleştiğinde ve `_active` durumu değiştiğinde arayüzü güncellemek için `setState()` çağırır.
`_TapboxCState` nesnesi:

- `_highlight` (vurgulama) durumunu yönetir.
- `GestureDetector` tüm dokunma olaylarını dinler. Kullanıcı parmağını basılı tuttuğunda vurguyu ekler (koyu yeşil kenarlık olarak). Kullanıcı parmağını çektiğinde vurguyu kaldırır.
- Dokunma basıldığında (tap down), bırakıldığında (tap up) veya iptal edildiğinde (tap cancel) `_highlight` durumunu değiştirerek arayüzü güncellemek için `setState()` çağırır.
- Bir dokunma olayında, [widget](https://api.flutter.dev/flutter/widgets/State/widget.html) özelliğini kullanarak üst widget'ın uygun eylemi gerçekleştirmesi için bu durum değişikliğini üst öğeye iletir.

```dart
import 'package:material_ui/material_ui.dart';

//---------------------------- ParentWidget ----------------------------

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TapboxC(active: _active, onChanged: _handleTapboxChanged),
    );
  }
}

//----------------------------- TapboxC ------------------------------

class TapboxC extends StatefulWidget {
  const TapboxC({super.key, this.active = false, required this.onChanged});

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<TapboxC> createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // Bu örnek, basıldığında yeşil bir kenarlık ekler.
    // Bırakıldığında kare karşıt duruma geçer.
    return GestureDetector(
      onTapDown: _handleTapDown, // Dokunma olaylarını oluştukları sırayla ele alır:
      onTapUp: _handleTapUp,     // down, up, tap, cancel
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? Border.all(color: Colors.teal[700]!, width: 10)
              : null,
        ),
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
```

Alternatif bir uygulama, aktiflik durumunu dahili tutup vurgulama durumunu üst öğeye aktarmış olabilirdi; ancak bir geliştiriciden bu dokunma kutusunu kullanmasını isteseydiniz, muhtemelen bunun pek mantıklı olmadığından şikayet ederdi. Geliştirici kutunun aktif olup olmadığını önemser; vurgulamanın arka planda nasıl yönetildiğini umursamaz ve dokunma kutusunun bu detayları kendi içinde halletmesini tercih eder.


## Diğer Etkileşimli Widget'lar (Other interactive widgets)

Flutter çok çeşitli butonlar ve benzeri etkileşimli widget'lar sunar. Bu widget'ların çoğu, standart ve tutarlı bir kullanıcı arayüzü tanımlayan [Material Design yönergelerini](https://m3.material.io/styles) uygular.

Tercih ederseniz, herhangi bir özel widget'a etkileşim kazandırmak için [GestureDetector](https://api.flutter.dev/flutter/widgets/GestureDetector-class.html) kullanabilirsiniz. `GestureDetector` örneklerini yukarıdaki Durum Yönetimi bölümünde bulabilirsiniz. `GestureDetector` hakkında daha fazla bilgi edinmek için Flutter kılavuzundaki [Dokunmaları işleme (Handle taps)](https://docs.flutter.dev/cookbook/gestures/handling-taps) tarifine göz atın.


> **💡  İpucu:** Flutter ayrıca Cupertino adı verilen iOS tarzı hazır bir widget seti de sağlar.

Etkileşime ihtiyaç duyduğunuzda, önceden hazırlanmış (prefabricated) hazır widget'lardan birini kullanmak en kolay ve pratik yoldur. İşte kısmi bir liste:


### Standart Widget'lar (Standard widgets)

- [Form](https://api.flutter.dev/flutter/widgets/Form-class.html)
- [FormField](https://api.flutter.dev/flutter/widgets/FormField-class.html)

### Material Bileşenleri (Material Components)

- [Checkbox](https://pub.dev/documentation/material_ui/latest/material_ui/Checkbox-class.html) (Onay Kutusu)
- [DropdownButton](https://pub.dev/documentation/material_ui/latest/material_ui/DropdownButton-class.html) (Açılır Menü Butonu)
- [TextButton](https://pub.dev/documentation/material_ui/latest/material_ui/TextButton-class.html) (Metin Butonu)
- [FloatingActionButton](https://pub.dev/documentation/material_ui/latest/material_ui/FloatingActionButton-class.html) (Kayan Eylem Butonu - FAB)
- [IconButton](https://pub.dev/documentation/material_ui/latest/material_ui/IconButton-class.html) (Simge Butonu)
- [Radio](https://pub.dev/documentation/material_ui/latest/material_ui/Radio-class.html) (Radyo Butonu)
- [ElevatedButton](https://pub.dev/documentation/material_ui/latest/material_ui/ElevatedButton-class.html) (Yükseltilmiş Buton)
- [Slider](https://pub.dev/documentation/material_ui/latest/material_ui/Slider-class.html) (Kaydırıcı)
- [Switch](https://pub.dev/documentation/material_ui/latest/material_ui/Switch-class.html) (Açma/Kapama Anahtarı)
- [TextField](https://pub.dev/documentation/material_ui/latest/material_ui/TextField-class.html) (Metin Giriş Alanı)

## Kaynaklar (Resources)

Uygulamanıza etkileşim kazandırırken aşağıdaki resmi kaynaklar size rehberlik edebilir:

- [Gestures (Hareketler)](https://docs.flutter.dev/cookbook/gestures) — Flutter tarif kitabındaki dokunma ve jestler bölümü.
- [Handling gestures (Hareketleri işleme)](https://docs.flutter.dev/ui#handling-gestures) — Bir buton oluşturma ve kullanıcı girdilerine yanıt vermesini sağlama.
- [Gestures in Flutter (Flutter'da Hareketler)](https://docs.flutter.dev/ui/interactivity/gestures) — Flutter'ın dokunma ve jest mekanizmasının ayrıntılı açıklaması.
- [Flutter API documentation](https://api.flutter.dev) — Tüm Flutter kitaplıkları için kapsamlı referans dokümantasyonu.
- **Wonderous Uygulaması:** [Çalışan Web Uygulaması](https://wonderous.app//web)  •  [GitHub Deposu](https://github.com/gskinnerTeam/flutter-wonderous-app) — Özel tasarıma ve etkileyici kullanıcı etkileşimlerine sahip Flutter vitrin uygulaması.
- [Flutter's Layered Design (Flutter'ın Katmanlı Tasarımı)](https://www.youtube.com/watch?v=dkyY9WCGMi0) (Video) — Durumlu ve durumsuz widget'lar hakkında değerli bilgiler içeren teknik video sunumu (Google mühendisi Ian Hickson tarafından sunulmuştur).
Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/ui/interactivity](https://docs.flutter.dev/ui/interactivity)

> *Bu sayfada  ›  Dokunmalar, sürüklemeler ve diğer hareketler (Taps, drags, and other gestures)*

<a id="bolum-9"></a>

# Bölüm 9: Dokunmalar, Sürüklemeler ve Diğer Hareketler (Taps, Drags, and Other Gestures)

Flutter'da dokunma ve sürükleme gibi hareketlerin (gestures) nasıl çalıştığı.

Bu belge, Flutter'da hareketlerin (*gestures*) nasıl dinleneceğini ve bunlara nasıl yanıt verileceğini açıklar. Hareket örnekleri arasında dokunmalar (*taps*), sürüklemeler (*drags*) ve ölçeklendirmeler (*scaling*) yer alır.

Flutter'daki hareket sistemi iki ayrı katmana sahiptir. İlk katman, ekran üzerindeki işaretçilerin (örneğin dokunmalar, fareler ve ekran kalemleri) konumunu ve hareketini tanımlayan ham işaretçi olaylarına (*raw pointer events*) sahiptir. İkinci katman ise bir veya daha fazla işaretçi hareketinden oluşan anlamsal eylemleri tanımlayan hareketlere (*gestures*) sahiptir.


## İşaretçiler (Pointers)

İşaretçiler, kullanıcının cihaz ekranıyla etkileşimi hakkındaki ham verileri temsil eder. Dört tür işaretçi olayı bulunur:

- [PointerDownEvent](https://api.flutter.dev/flutter/gestures/PointerDownEvent-class.html): İşaretçi ekrana belirli bir konumda temas etti.
- [PointerMoveEvent](https://api.flutter.dev/flutter/gestures/PointerMoveEvent-class.html): İşaretçi ekranda bir konumdan diğerine hareket etti.
- [PointerUpEvent](https://api.flutter.dev/flutter/gestures/PointerUpEvent-class.html): İşaretçi ekrana temas etmeyi bıraktı (parmak/fare kaldırıldı).
- [PointerCancelEvent](https://api.flutter.dev/flutter/gestures/PointerCancelEvent-class.html): Bu işaretçiden gelen girdi artık bu uygulamaya yönlendirilmiyor (eylem iptal edildi).
İşaretçi basıldığında (`pointer down`), framework işaretçinin ekrana temas ettiği konumda hangi widget'ın var olduğunu belirlemek için uygulamanızda bir isabet testi (*hit test*) gerçekleştirir. İşaretçi basma olayı (ve bu işaretçi için sonraki olaylar) daha sonra isabet testiyle bulunan en içteki widget'a (*innermost widget*) gönderilir. Buradan olaylar widget ağacı boyunca yukarı doğru kabarcıklanır (*bubble up*) ve en içteki widget'tan ağacın köküne giden yoldaki tüm widget'lara iletilir. İşaretçi olaylarının daha fazla gönderilmesini iptal etmek veya durdurmak için herhangi bir mekanizma yoktur.

İşaretçi olaylarını doğrudan widget katmanından dinlemek için bir [Listener](https://api.flutter.dev/flutter/widgets/Listener-class.html) widget'ı kullanabilirsiniz. Ancak genel olarak bunun yerine hareketleri (aşağıda tartışıldığı gibi) kullanmayı düşünün.


## Hareketler (Gestures)

Hareketler, birden fazla bağımsız işaretçi olayından — hatta potansiyel olarak birden fazla bağımsız işaretçiden — tanınan anlamsal eylemleri (örneğin dokunma, sürükleme ve ölçekleme) temsil eder. Hareketler, hareketin yaşam döngüsüne karşılık gelen birden çok olayı dağıtabilir (örneğin sürükleme başlangıcı, sürükleme güncellemesi ve sürükleme bitişi):


### Dokunma (Tap)

- `onTapDown`: Dokunmaya neden olabilecek bir işaretçi ekrana belirli bir konumda temas etti.
- `onTapUp`: Dokunmayı tetikleyen işaretçi, ekrana belirli bir konumda temas etmeyi bıraktı.
- `onTap`: Daha önce onTapDown'ı tetikleyen işaretçi onTapUp'ı da tetikledi ve bu durum tam bir dokunmaya neden oldu.
- `onTapCancel`: Daha önce onTapDown'ı tetikleyen işaretçi bir dokunmaya neden olmayacak (eylem tamamlanmadan iptal edildi).

### Çift Dokunma (Double tap)

- `onDoubleTap`: Kullanıcı hızlı bir şekilde art arda ekranda aynı konuma iki kez dokundu.

### Uzun Basma (Long press)

- `onLongPress`: Bir işaretçi uzun bir süre boyunca ekranda aynı konumda temas halinde kaldı.

### Dikey Sürükleme (Vertical drag)

- `onVerticalDragStart`: Bir işaretçi ekrana temas etti ve dikey olarak hareket etmeye başlayabilir.
- `onVerticalDragUpdate`: Ekrana temas eden ve dikey olarak hareket eden bir işaretçi dikey yönde hareket etti.
- `onVerticalDragEnd`: Daha önce temas eden işaretçi teması kesti ve temas bittiğinde belirli bir hızda hareket ediyordu.

### Yatay Sürükleme (Horizontal drag)

- `onHorizontalDragStart`: Bir işaretçi ekrana temas etti ve yatay olarak hareket etmeye başlayabilir.
- `onHorizontalDragUpdate`: Ekrana temas eden işaretçi yatay doğrultuda hareket etti.
- `onHorizontalDragEnd`: Yatayda hareket eden işaretçi teması kestiğinde belirli bir hızla hareket ediyordu.

### Serbest Kaydırma ve Taşıma (Pan)

- `onPanStart`: Bir işaretçi ekrana temas etti ve yatay veya dikey olarak hareket etmeye başlayabilir. onHorizontalDragStart veya onVerticalDragStart ayarlanmışsa bu geri çağırma çöker (hata verir).
- `onPanUpdate`: Ekrana temas eden ve dikey ya da yatay yönde hareket eden işaretçi. onHorizontalDragUpdate veya onVerticalDragUpdate ayarlanmışsa bu geri çağırma çöker.
- `onPanEnd`: Ekrana temas eden işaretçi teması kestiğinde belirli bir hızla hareket ediyordu. onHorizontalDragEnd veya onVerticalDragEnd ayarlanmışsa bu geri çağırma çöker.

### Widget'lara hareket algılama ekleme (Adding gesture detection to widgets)

Widget katmanından hareketleri dinlemek için bir [GestureDetector](https://api.flutter.dev/flutter/widgets/GestureDetector-class.html) widget'ı kullanın.


![Flutter Widget of the Week — GestureDetector Video Kılavuzu](extracted_media/rId135_image18.jpeg)
*Flutter Widget of the Week — GestureDetector Video Kılavuzu*


> **ℹ️  Not:** Daha fazla bilgi edinmek için GestureDetector - Flutter Widget of the Week kısa videosunu izleyin.

Material bileşenleri kullanıyorsanız, bu widget'ların çoğu zaten dokunmalara veya hareketlere doğal olarak yanıt verir. Örneğin, [IconButton](https://pub.dev/documentation/material_ui/latest/material_ui/IconButton-class.html) ve [TextButton](https://pub.dev/documentation/material_ui/latest/material_ui/TextButton-class.html) basmalara (dokunmalara) yanıt verirken, [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html) kaydırmayı tetiklemek için süpürme (swipe) hareketlerine yanıt verir. Bu hazır widget'ları kullanmıyorsanız ancak dokunmada "mürekkep sıçraması / dalgalanması" (*ink splash*) efekti elde etmek istiyorsanız [InkWell](https://pub.dev/documentation/material_ui/latest/material_ui/InkWell-class.html) kullanabilirsiniz.


### Hareket Belirsizliğini Çözme (Gesture disambiguation)

Ekrandaki belirli bir konumda birden fazla hareket algılayıcı yer alabilir. Örneğin:

- Bir `ListTile`, tüm ListTile'a yanıt veren bir dokunma algılayıcısına ve sondaki bir simge butonunu çevreleyen iç içe geçmiş bir algılayıcıya sahiptir. Simge butonunun ekran alanı, bir dokunma gerçekleştiğinde hareketi kimin yöneteceğini müzakere etmesi gereken iki hareket tanıyıcısı tarafından kaplanmıştır.
- Tek bir `GestureDetector`, uzun basma ve kısa dokunma gibi birden çok hareketi işleyecek şekilde yapılandırılmış bir ekran alanını kaplar. Kullanıcı ekranın o bölümüne dokunduğunda dokunma tanıyıcısı ile uzun basma tanıyıcısı müzakere etmelidir. Bu işaretçiyle daha sonra ne olduğuna bağlı olarak iki tanıyıcıdan biri hareketi alır ya da kullanıcı ne dokunma ne de uzun basma olan farklı bir hareket yaparsa hiçbiri almaz.
Tüm bu hareket algılayıcıları, yanlarından geçerken işaretçi olayları akışını dinler ve belirli hareketleri tanımaya çalışır. `GestureDetector` widget'ı, geri çağırmalarından hangilerinin boş olmadığına (`non-null`) bakarak hangi hareketleri tanımaya çalışacağına karar verir.

Ekranda belirli bir işaretçi için birden fazla hareket tanıyıcı olduğunda framework, her tanıyıcının **hareket arenasına** (*gesture arena*) katılmasını sağlayarak kullanıcının hangi hareketi amaçladığını netleştirir. Hareket arenası, aşağıdaki kurallara göre hangi hareketin kazanacağını belirler:

1. Herhangi bir zamanda bir tanıyıcı kendini eleyebilir ve arenadan ayrılabilir. Arenada yalnızca bir tanıyıcı kalırsa, o tanıyıcı kazanır.
2. Herhangi bir zamanda bir tanıyıcı kendisini kazanan ilan edebilir; bu durum kalan tüm tanıyıcıların elenmesine neden olur.
Örneğin, yatay ve dikey sürüklemeyi ayırt ederken her iki tanıyıcı da işaretçi basma olayını (`pointer down`) aldıklarında arenaya girer. Tanıyıcılar işaretçi hareket olaylarını izler. Kullanıcı işaretçiyi yatay olarak belirli bir mantıksal piksel eşiğinden fazla hareket ettirirse, yatay tanıyıcı galibiyetini ilan eder ve hareket yatay bir sürükleme olarak yorumlanır. Benzer şekilde, kullanıcı dikeyde belirli bir pikselden fazla hareket ederse dikey tanıyıcı kendisini kazanan ilan eder.

Hareket arenası, ekranda yalnızca bir yatay (veya yalnızca dikey) sürükleme tanıyıcı olduğunda son derece verimlidir. Bu senaryoda arenada tek bir tanıyıcı bulunur ve yatay sürükleme anında tanınır; bu da yatay hareketin ilk pikselinin dahi doğrudan bir sürükleme olarak işlenebilmesini sağlar ve kullanıcının belirsizlik çözümünü beklemesine gerek kalmaz.

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/ui/interactivity/gestures](https://docs.flutter.dev/ui/interactivity/gestures)

> *Bu sayfada  ›  Dokunmaları işleme (Handle taps)*

<a id="bolum-10"></a>

# Bölüm 10: Dokunmaları İşleme (Handle Taps)

Flutter'da dokunma ve tıklama eylemlerinin nasıl ele alınacağı.

Kullanıcılara yalnızca bilgi sunmakla kalmayıp uygulamanızla doğrudan etkileşime girmelerini de istersiniz. Dokunma ve sürükleme gibi temel kullanıcı hareketlerine yanıt vermek için [GestureDetector](https://api.flutter.dev/flutter/widgets/GestureDetector-class.html) widget'ını kullanın.


> **ℹ️  Not:** Daha fazla bilgi edinmek için GestureDetector - Flutter Widget of the Week kısa videosuna göz atabilirsiniz.

Bu tarif, dokunulduğunda ekranda bir bildirim çubuğu (`SnackBar`) gösteren özel bir butonun aşağıdaki adımlarla nasıl oluşturulacağını gösterir:

1. Butonu oluşturma (Create the button).
2. Butonu bir `GestureDetector` ile sarmalama ve bir `onTap()` geri çağırması tanımlama.

```dart
// GestureDetector butonu sarmalar.
GestureDetector(
  // Alt öğeye (child) dokunulduğunda snackbar göster.
  onTap: () {
    const snackBar = SnackBar(content: Text('Tap'));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  },
  // Özel buton
  child: Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.lightBlue,
      borderRadius: BorderRadius.circular(8),
    ),
    child: const Text('My Button'),
  ),
)
```


## Notlar (Notes)

1. Butonunuza Material dalgalanma efekti (ripple effect) ekleme hakkında bilgi için [Add Material touch ripples](https://docs.flutter.dev/cookbook/gestures/ripples) tarifine bakın.
2. Bu örnek özel bir buton oluştursa da, Flutter [ElevatedButton](https://pub.dev/documentation/material_ui/latest/material_ui/ElevatedButton-class.html), [TextButton](https://pub.dev/documentation/material_ui/latest/material_ui/TextButton-class.html) ve [CupertinoButton](https://pub.dev/documentation/cupertino_ui/latest/cupertino_ui/CupertinoButton-class.html) gibi zengin hazır buton uygulamaları içerir.

## Eksiksiz Örnek Uygulama (Interactive example)


```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Gesture Demo';

    return const MaterialApp(
      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: MyButton()),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    // GestureDetector butonu sarmalar.
    return GestureDetector(
      // Alt öğeye dokunulduğunda bir bildirim çubuğu göster.
      onTap: () {
        const snackBar = SnackBar(content: Text('Tap'));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      // Özel buton kapsayıcısı
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text('My Button'),
      ),
    );
  }
}
```

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/cookbook/gestures/handling-taps](https://docs.flutter.dev/cookbook/gestures/handling-taps)

> *Bu sayfada  ›  Uygulama dışına sürükleme (Drag outside an app)*

<a id="bolum-11"></a>

# Bölüm 11: Uygulama Dışına Sürükleme (Drag Outside an App)

Bir uygulamadan başka bir uygulamaya veya işletim sistemine nasıl sürükleme yapılacağı.

Uygulamanızın herhangi bir yerinde sürükle ve bırak (*drag and drop*) özelliğini hayata geçirmek isteyebilirsiniz.

Benimseyebileceğiniz iki potansiyel yaklaşım mevcuttur. Biri doğrudan Flutter'ın yerel widget'larını kullanır, diğeri ise [pub.dev](https://pub.dev) üzerinde bulunan [super_drag_and_drop](https://pub.dev/packages/super_drag_and_drop) paketinden yararlanır.


## Uygulamanız içinde sürüklenebilir widget'lar oluşturma

Uygulamanız içinde sürükle ve bırak özelliğini uygulamak istiyorsanız yerleşik [Draggable](https://api.flutter.dev/flutter/widgets/Draggable-class.html) widget'ını kullanabilirsiniz. Bu yaklaşıma dair kapsamlı kılavuz için [Drag a UI element within an app](https://docs.flutter.dev/cookbook/effects/drag-a-widget) tarifine bakın.

`Draggable` ve [DragTarget](https://api.flutter.dev/flutter/widgets/DragTarget-class.html) kullanmanın en büyük avantajı, bir bırakmayı (drop) kabul edip etmemeye karar vermek için esnek Dart kodu sağlayabilmenizdir.


> **ℹ️  Bilgi:** Daha fazla bilgi için Draggable - Widget of the Week videosunu inceleyebilirsiniz.


## Uygulamalar arasında sürükle ve bırak uygulama

Uygulamanız içinde ve *aynı zamanda* uygulamanız ile başka bir uygulama (Flutter olmayan harici bir uygulama ya da doğrudan işletim sistemi) arasında sürükle ve bırak yapmak istiyorsanız [super_drag_and_drop](https://pub.dev/packages/super_drag_and_drop) paketini değerlendirin.

Biri uygulama dışına sürüklemeler, diğeri uygulama içine sürüklemeler için olmak üzere iki farklı sürükle-bırak stili uygulamaktan kaçınmak amacıyla, pakete [yerel veri (local data)](https://pub.dev/documentation/super_drag_and_drop/latest/super_drag_and_drop/DragItem/localData.html) sağlayarak uygulamanız içindeki sürüklemeleri de bu paket üzerinden gerçekleştirebilirsiniz.

Bu yaklaşım ile doğrudan `Draggable` kullanmak arasındaki diğer bir fark; platform işletim sistemi API'lerinin eşzamanlı (*synchronous*) bir yanıta ihtiyaç duyması ve framework'ten eşzamansız bir yanıta izin vermemesi nedeniyle, uygulamanızın hangi verileri kabul ettiğini pakete en baştan açıkça bildirmeniz gerekmesidir.

Bu yaklaşımın öne çıkan avantajı, masaüstü (desktop), mobil ve web platformlarının tamamında son derece tutarlı biçimde çalışmasıdır.

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/ui/interactivity/gestures/drag-outside](https://docs.flutter.dev/ui/interactivity/gestures/drag-outside)

> *Bu sayfada  ›  Bir arayüz öğesini sürükleme (Drag a UI element)*

<a id="bolum-12"></a>

# Bölüm 12: Bir Arayüz Öğesini Sürükleme (Drag a UI Element)

Flutter'da sürüklenebilir bir kullanıcı arayüzü öğesinin adım adım nasıl uygulanacağı.

Sürükle ve bırak (*drag and drop*), mobil uygulamalarda sıkça karşılaşılan bir kullanıcı etkileşimidir. Kullanıcı bir widget'a uzun bastığında (bazen *dokun ve basılı tut* olarak adlandırılır), kullanıcının parmağının altında başka bir widget belirir ve kullanıcı bu widget'ı hedef konuma sürükleyip serbest bırakır. Bu tarifte, kullanıcının menüdeki bir yiyeceğe uzun bastığı ve ardından bu yemeği hesabını ödeyecek olan müşterinin fotoğrafına sürüklediği eğlenceli bir sürükle-bırak mekanizması inşa edeceksiniz.


![Yemek Siparişi ve Müşteri Sepetleri Sürükle-Bırak Etkileşimi](extracted_media/rId146_image19.png)
*Yemek Siparişi ve Müşteri Sepetleri Sürükle-Bırak Etkileşimi*

Bu tarif, önceden hazırlanmış bir menü öğeleri listesi ve bir müşteri satırıyla başlar. İlk adım, uzun basmayı tanımak ve bir menü öğesinin sürüklenebilir bir fotoğrafını ekranda göstermektir.


## Basma ve Sürükleme (Press and drag)

Flutter, sürükle-bırak etkileşimini başlatmak için tam olarak aradığınız davranışı sağlayan [LongPressDraggable](https://api.flutter.dev/flutter/widgets/LongPressDraggable-class.html) adında özel bir widget sunar. `LongPressDraggable` widget'ı, uzun basmanın ne zaman gerçekleştiğini algılar ve ardından kullanıcının parmağının yanında yeni bir widget görüntüler. Kullanıcı sürükledikçe widget parmağı takip eder. `LongPressDraggable`, kullanıcının sürüklediği görsel üzerinde size tam denetim sunar.

Her menü listesi öğesi özel bir `MenuListItem` widget'ı ile temsil edilir:


```dart
MenuListItem(
  name: item.name,
  price: item.formattedTotalItemPrice,
  photoProvider: item.imageProvider,
)
```

`MenuListItem` widget'ını bir `LongPressDraggable` widget'ı ile sarmalayın:


```dart
LongPressDraggable<Item>(
  data: item,
  dragAnchorStrategy: pointerDragAnchorStrategy,
  feedback: DraggingListItem(
    dragKey: _draggableKey,
    photoProvider: item.imageProvider,
  ),
  child: MenuListItem(
    name: item.name,
    price: item.formattedTotalItemPrice,
    photoProvider: item.imageProvider,
  ),
);
```

Bu yapıda, kullanıcı `MenuListItem` widget'ına uzun bastığında `LongPressDraggable` widget'ı bir `DraggingListItem` görüntüler. Bu geri bildirim widget'ı, seçilen yiyeceğin kullanıcının parmağının tam altında ortalanmış bir fotoğrafını gösterir.

`dragAnchorStrategy` özelliği [pointerDragAnchorStrategy](https://api.flutter.dev/flutter/widgets/pointerDragAnchorStrategy.html) olarak ayarlanmıştır. Bu özellik değeri `LongPressDraggable`'a, sürüklenen öğenin konumunu kullanıcının parmağına dayandırmasını bildirir. Kullanıcı parmağını oynattıkça görsel de parmakla birlikte hareket eder.

Öğe hedef noktaya bırakıldığında hiçbir veri aktarılmazsa sürükleyip bırakmanın pratik bir değeri kalmaz. Bu nedenle `LongPressDraggable` bir `data` parametresi alır. Bizim senaryomuzda `data` türü, kullanıcının bastığı menü öğesi hakkındaki tüm bilgileri taşıyan `Item` nesnesidir.

`LongPressDraggable` ile ilişkili bu veriler, kullanıcının sürükleme hareketini tamamlayıp bıraktığı [DragTarget](https://api.flutter.dev/flutter/widgets/DragTarget-class.html) adlı özel bir hedef widget'a iletilir. Bırakma davranışını bir sonraki adımda uygulayacaksınız.


## Sürüklenebilir Öğeyi Bırakma (Drop the draggable)

Kullanıcı bir `LongPressDraggable`'ı ekranda istediği yere bırakabilir; ancak bir `DragTarget` üzerine bırakılmadığı sürece bu bırakma hiçbir etki yaratmaz. Kullanıcı öğeyi bir `DragTarget` widget'ının üzerine bıraktığında, hedef widget taşınan veriyi kabul edebilir veya reddedebilir.

Bu örnekte kullanıcı, menü öğesini kullanıcının sepetine eklemek için bir `CustomerCart` widget'ı üzerine bırakmalıdır:


```dart
CustomerCart(
  hasItems: customer.items.isNotEmpty,
  highlighted: candidateItems.isNotEmpty,
  customer: customer,
);
```

`CustomerCart` widget'ını bir `DragTarget` widget'ı ile sarmalayın:


```dart
DragTarget<Item>(
  builder: (context, candidateItems, rejectedItems) {
    return CustomerCart(
      hasItems: customer.items.isNotEmpty,
      highlighted: candidateItems.isNotEmpty,
      customer: customer,
    );
  },
  onAcceptWithDetails: (details) {
    _itemDroppedOnCustomerCart(item: details.data, customer: customer);
  },
)
```

`DragTarget` mevcut widget'ınızı ekranda görüntüler ve kullanıcının ne zaman bir öğeyi hedef üzerine getirdiğini tanımak için `LongPressDraggable` ile senkronize çalışır. `DragTarget` ayrıca kullanıcının öğeyi ne zaman bıraktığını da algılar.

Kullanıcı öğeyi hedef alan üzerinde gezdirdiğinde `candidateItems`, sürüklenen verileri barındırır. Bu liste, kullanıcı üzerine geldiğinde sepetinizin görsel görünümünü değiştirmenize imkan tanır. Bizim örneğimizde `CustomerCart` widget'ı, üzerine bir yemek getirildiğinde kırmızı renge bürünür. Bu kırmızı görünüm, widget içerisindeki `highlighted` özelliği ile yönetilir.

Kullanıcı öğeyi bıraktığında `onAcceptWithDetails` geri çağırması tetiklenir. Bu adımda bırakılan veriyi kabul edip işlemeye karar verirsiniz. Örneğimizde bırakılan ürün her zaman kabul edilir ve sepete eklenir.


> **⚠️  Önemli:** Tür Kuralı: DragTarget üzerine bırakılan öğenin veri türünün, LongPressDraggable'dan taşınan veri türüyle (örneğin <Item>) tam olarak eşleşmesi şarttır. Türler uyumsuz olursa onAcceptWithDetails metodu tetiklenmez.


## Sepete Menü Öğesi Ekleme (Add a menu item to a cart)

Her müşteri, sepetteki ürünlerin listesini ve toplam fiyatı saklayan bir `Customer` nesnesi ile modellenir:


```dart
class Customer {
  Customer({required this.name, required this.imageProvider, List<Item>? items})
    : items = items ?? [];

  final String name;
  final ImageProvider imageProvider;
  final List<Item> items;

  String get formattedTotalItemPrice {
    final totalPriceCents = items.fold<int>(
      0,
      (prev, item) => prev + item.totalPriceCents,
    );
    return '\$${(totalPriceCents / 100.0).toStringAsFixed(2)}';
  }
}
```

`CustomerCart` widget'ı bir `Customer` örneğine dayanarak müşterinin fotoğrafını, ismini, toplam tutarını ve ürün adedini gösterir.

Bir menü öğesi sepete bırakıldığında müşterinin sepetini güncellemek için bırakılan öğeyi ilgili `Customer` nesnesine ekleyin:


```dart
void _itemDroppedOnCustomerCart({
  required Item item,
  required Customer customer,
}) {
  setState(() {
    customer.items.add(item);
  });
}
```

`_itemDroppedOnCustomerCart` metodu, `onAcceptWithDetails()` tetiklendiğinde çalıştırılır. Bırakılan öğeyi `customer` nesnesine ekleyip ardından `setState()` çağrısı yaparak arayüz yeni toplam tutar ve adet bilgileriyle anında güncellenir.


## Uygulama Testi ve Etkileşim Adımları

- Menüdeki yiyecek öğeleri arasında kaydırma yapın.
- Parmağınızla veya fareyle bir yemeğe basılı tutun.
- Basılı tutarken yiyeceğin fotoğrafı listenin üzerinde havada belirecektir.
- Fotoğrafı sürükleyip ekranın altındaki müşterilerden birinin sepetine bırakın. Resmin altındaki hesap tutarı güncellenecektir.
Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/cookbook/effects/drag-a-widget](https://docs.flutter.dev/cookbook/effects/drag-a-widget)

> *Bu sayfada  ›  Material dokunma dalgalanması ekleme (Add Material touch ripples)*

<a id="bolum-13"></a>

# Bölüm 13: Material Dokunma Dalgalanması Ekleme (Add Material Touch Ripples)

Flutter'da dokunulduğunda dalgalanma (ripple) animasyonlarının nasıl uygulanacağı.

Material Design tasarım yönergelerini izleyen widget'lar, kullanıcı üzerlerine dokunduğunda zarif bir dalgalanma (*ripple*) animasyonu görüntüler.

Flutter, bu efekti gerçekleştirmek için [InkWell](https://pub.dev/documentation/material_ui/latest/material_ui/InkWell-class.html) widget'ını sağlar. Dalgalanma efektini aşağıdaki iki kolay adımla oluşturabilirsiniz:

1. Dokunmayı destekleyen bir widget oluşturun (Create a widget that supports tap).
2. Dokunma geri çağırmalarını ve dalgalanma animasyonlarını yönetmek için bunu bir `InkWell` widget'ı ile sarmalayın.

```dart
// InkWell özel düz buton widget'ını sarmalar.
InkWell(
  // Kullanıcı butona dokunduğunda snackbar göster.
  onTap: () {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Tap')));
  },
  child: const Padding(
    padding: EdgeInsets.all(12),
    child: Text('Flat Button'),
  ),
)
```


## Eksiksiz Örnek Uygulama (Interactive example)


```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'InkWell Demo';

    return const MaterialApp(
      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: MyButton()),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    // InkWell özel düz buton widget'ını sarmalar.
    return InkWell(
      // Kullanıcı butona dokunduğunda bir bildirim çubuğu göster.
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Tap')));
      },
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: Text('Flat Button'),
      ),
    );
  }
}
```

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/cookbook/gestures/ripples](https://docs.flutter.dev/cookbook/gestures/ripples)

> *Bu sayfada  ›  Kaydırarak kapatma / silme uygulama (Implement swipe to dismiss)*

<a id="bolum-14"></a>

# Bölüm 14: Kaydırarak Kapatma / Silme Uygulama (Implement Swipe to Dismiss)

Öğeleri listeden çıkarmak veya silmek için kaydırma hareketinin (swipe to dismiss) nasıl uygulanacağı.

"Kaydırarak kapatma / silme" (*swipe to dismiss*) deseni birçok mobil uygulamada son derece yaygındır. Örneğin, bir e-posta uygulaması geliştirirken kullanıcının e-posta mesajlarını listeden silmek için parmağıyla kaydırarak çıkarmasına izin vermek isteyebilirsiniz.

Flutter, [Dismissible](https://api.flutter.dev/flutter/widgets/Dismissible-class.html) widget'ını sağlayarak bu görevi oldukça kolaylaştırır. Aşağıdaki adımları takip ederek kaydırarak kapatma özelliğinin nasıl uygulanacağını öğrenin:

1. Bir öğe listesi oluşturma (Create a list of items).
2. Her bir öğeyi bir `Dismissible` widget'ı ile sarmalama.
3. "Arka planda bırakılan" (*leave behind*) göstergeleri sağlama.

## 1. Bir öğe listesi oluşturma (Create a list of items)

İlk olarak bir öğe listesi oluşturun. Liste oluşturmaya ilişkin ayrıntılı yönergeler için [Working with long lists (Uzun listelerle çalışma)](https://docs.flutter.dev/cookbook/lists/long-lists) tarifine göz atabilirsiniz.


### Veri kaynağı oluşturma (Create a data source)

Bu örnekte üzerinde çalışmak üzere 20 adet örnek öğe istiyorsunuz. Basit ve anlaşılır tutmak için metinlerden (`String`) oluşan bir liste üretin:


```dart
final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
```


### Veri kaynağını bir listeye dönüştürme (Convert the data source into a list)

Listedeki her bir öğeyi ekranda görüntüleyin. Kullanıcılar henüz bu aşamada öğeleri kaydırarak silemeyecektir:


```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(title: Text(items[index]));
  },
)
```


## 2. Her bir öğeyi bir Dismissible widget'ı ile sarmalama

Bu adımda, [Dismissible](https://api.flutter.dev/flutter/widgets/Dismissible-class.html) widget'ını kullanarak kullanıcılara listedeki bir öğeyi kaydırarak listeden çıkarma yeteneği kazandırın.

Kullanıcı öğeyi kaydırıp çıkardıktan sonra, öğeyi veri listesinden silin ve ekranda bir bildirim çubuğu (`SnackBar`) gösterin. Gerçek bir uygulamada, öğeyi bir web servisinden, REST API'den veya veritabanından silmek gibi daha kapsamlı bir mantık yürütmeniz gerekebilir.

`itemBuilder()` fonksiyonunu bir `Dismissible` widget'ı döndürecek şekilde güncelleyin:


```dart
itemBuilder: (context, index) {
  final item = items[index];
  return Dismissible(
    // Her Dismissible mutlaka benzersiz bir Key içermelidir.
    // Anahtarlar (Keys), Flutter'ın widget'ları benzersiz şekilde tanımasını sağlar.
    key: Key(item),
    // Bir öğe kaydırılarak kapatıldıktan sonra uygulamanın ne yapacağını
    // bildiren bir fonksiyon sağlayın.
    onDismissed: (direction) {
      // Öğeyi veri kaynağından kaldırın.
      setState(() {
        items.removeAt(index);
      });

      // Ardından bir snackbar gösterin.
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('$item dismissed')));
    },
    child: ListTile(title: Text(item)),
  );
},
```


## 3. "Arka planda bırakılan" göstergeleri sağlama (Provide leave behind indicators)

Mevcut durumda uygulama, kullanıcıların öğeleri kaydırarak listeden atmasına izin verir; ancak bunu yaptıklarında arka planda ne olduğuna dair görsel bir ipucu sunmaz. Öğelerin kaldırılmakta olduğuna dair net bir görsel gösterge sağlamak için, öğe ekrandan kaydırılırken arkasında kalan bir gösterge (*"leave behind" indicator*) görüntüleyin. Bu örnekte gösterge kırmızı bir arka plandır.

Bu göstergeyi eklemek için `Dismissible` widget'ına bir `background` parametresi tanımlayın:


```dart
dart diff
ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('$item dismissed')));
  },
+ // Öğe kaydırılarak kapatılırken kırmızı bir arka plan göster.
+ background: Container(color: Colors.red),
  child: ListTile(
    title: Text(item),
  ),
```


## Eksiksiz Örnek Uygulama (Interactive example)


```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// MyApp bir StatefulWidget'tır. Bu, bir öğe kaldırıldığında widget durumunun
// anında güncellenmesine olanak tanır.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    const title = 'Dismissing Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(title)),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              // Her Dismissible mutlaka bir Key içermelidir.
              key: Key(item),
              // Bir öğe kaydırıldığında çalışacak mantık:
              onDismissed: (direction) {
                // Öğeyi veri kaynağından kaldır.
                setState(() {
                  items.removeAt(index);
                });

                // Ardından kullanıcıya bildirimi göster.
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('$item dismissed')));
              },
              // Öğe kaydırılırken arkada beliren kırmızı arka plan:
              background: Container(color: Colors.red),
              child: ListTile(title: Text(item)),
            );
          },
        ),
      ),
    );
  }
}
```

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/cookbook/gestures/dismissible](https://docs.flutter.dev/cookbook/gestures/dismissible)

> *Bu sayfada  ›  Metin alanı oluşturma ve stillendirme (Create and style a text field)*



---

## KISIM IV: FORMLAR VE METİN GİRİŞİ (FORMS & TEXT INPUT)
> *TextField ve TextFormField stillendirme, InputDecoration, TextEditingController ile değer okuma/dinleme, FocusNode yönetimi ve GlobalKey<FormState> doğrulamaları.*

---

<a id="bolum-15"></a>

# Bölüm 15: Metin Alanı Oluşturma ve Stillendirme (Create and Style a Text Field)

Flutter'da bir metin alanının (text field) nasıl uygulanacağı ve görsel olarak biçimlendirileceği.

Metin alanları, kullanıcıların bir uygulamaya metin girmesine olanak tanır. Formlar oluşturmak, mesaj göndermek, arama deneyimleri tasarlamak ve çok daha fazlası için kullanılırlar. Bu tarifte, metin alanlarının nasıl oluşturulacağını ve stillendirileceğini keşfedeceksiniz.

Flutter, iki farklı Material Design metin alanı widget'ı sağlar: [TextField](https://pub.dev/documentation/material_ui/latest/material_ui/TextField-class.html) ve [TextFormField](https://pub.dev/documentation/material_ui/latest/material_ui/TextFormField-class.html).


## TextField

`TextField`, Flutter'da en sık kullanılan temel metin girişi widget'ıdır.

Varsayılan olarak bir `TextField`, alt çizgi (underline) ile dekore edilmiştir. `TextField`'ın [decoration](https://pub.dev/documentation/material_ui/latest/material_ui/TextField/decoration.html) özelliğine bir [InputDecoration](https://pub.dev/documentation/material_ui/latest/material_ui/InputDecoration-class.html) sağlayarak etiket (label), simge (icon), satır içi ipucu metni (hint text) ve hata metni ekleyebilirsiniz. Dekorasyonu tamamen kaldırmak için (alt çizgi ve etiket için ayrılan boşluk dahil) `decoration` özelliğini `null` olarak ayarlayın.


```dart
TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    hintText: 'Enter a search term',
  ),
),
```

Metin değiştiğinde girilen değeri almak için [Handle changes to a text field (Metin alanındaki değişiklikleri işleme)](https://docs.flutter.dev/cookbook/forms/text-field-changes) tarifine başvurun.


## TextFormField

[TextFormField](https://pub.dev/documentation/material_ui/latest/material_ui/TextFormField-class.html), bir `TextField`'ı sarmalar ve onu çevreleyen bir [Form](https://api.flutter.dev/flutter/widgets/Form-class.html) ile entegre eder. Bu yapı doğrulama (validation) ve diğer [FormField](https://api.flutter.dev/flutter/widgets/FormField-class.html) widget'ları ile entegrasyon gibi ek işlevler sağlar.


```dart
TextFormField(
  decoration: const InputDecoration(
    border: UnderlineInputBorder(),
    labelText: 'Enter your username',
  ),
),
```


## Eksiksiz Örnek Uygulama (Interactive example)


```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Styling Demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your username',
            ),
          ),
        ),
      ],
    );
  }
}
```

Girdi doğrulama (validation) hakkında daha fazla bilgi edinmek için [Build a form with validation (Doğrulamalı form oluşturma)](https://docs.flutter.dev/cookbook/forms/validation) tarifine göz atabilirsiniz.

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/cookbook/forms/text-input](https://docs.flutter.dev/cookbook/forms/text-input)

> *Bu sayfada  ›  Metin alanının değerini alma (Retrieve the value of a text field)*

<a id="bolum-16"></a>

# Bölüm 16: Metin Alanının Değerini Alma (Retrieve the Value of a Text Field)

Bir kullanıcının metin alanına girdiği verilerin nasıl okunacağı ve alınacağı.

Bu tarifte, bir kullanıcının metin alanına girdiği metni aşağıdaki adımları izleyerek nasıl alacağınızı öğreneceksiniz:

1. Bir `TextEditingController` oluşturma.
2. `TextEditingController`'ı bir `TextField`'a bağlama.
3. Metin alanının geçerli değerini ekranda görüntüleme.

## 1. Bir TextEditingController oluşturma

Bir kullanıcının bir metin alanına girdiği metni almak için bir [TextEditingController](https://pub.dev/documentation/material_ui/latest/material_ui/TextEditingController-class.html) oluşturun ve bunu bir `TextField` veya `TextFormField`'a atayın.


> **⚠️  Önemli:** Kullanımı tamamlandığında TextEditingController üzerinde mutlaka dispose() metodunu çağırın. Bu, nesne tarafından kullanılan sistem kaynaklarının serbest bırakılmasını (bellek sızıntılarının önlenmesini) sağlar.


```dart
// Özel bir Form widget'ı tanımlayın.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

// Karşılık gelen State sınıfını tanımlayın.
// Bu sınıf Form ile ilgili verileri barındırır.
class _MyCustomFormState extends State<MyCustomForm> {
  // Bir metin denetleyicisi oluşturun ve bunu TextField'ın
  // mevcut değerini almak için kullanın.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Widget ağaçtan kaldırıldığında denetleyiciyi temizleyin.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Bu kısmı bir sonraki adımda dolduracağız.
  }
}
```


## 2. TextEditingController'ı TextField'a bağlama

Artık bir `TextEditingController`'ınız olduğuna göre, `controller` özelliğini kullanarak onu metin alanına bağlayın:


```dart
return TextField(controller: myController);
```


## 3. Metin alanının geçerli değerini görüntüleme

`TextEditingController`'ı metin alanına sağladıktan sonra değerleri okumaya başlayabilirsiniz. Kullanıcının metin alanına girdiği metni (`String`) almak için `TextEditingController` tarafından sunulan [text](https://pub.dev/documentation/material_ui/latest/material_ui/TextEditingController/text.html) özelliğini kullanın.

Aşağıdaki kod, kullanıcı bir kayan eylem butonuna (`FloatingActionButton`) dokunduğunda metin alanının geçerli değerini içeren bir uyarı iletişim kutusu (`AlertDialog`) görüntüler:


```dart
FloatingActionButton(
  // Kullanıcı butona bastığında, metin alanına girilen metni
  // içeren bir uyarı iletişim kutusu (AlertDialog) göster.
  onPressed: () {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          // TextEditingController kullanarak kullanıcının girdiği metni alın.
          content: Text(myController.text),
        );
      },
    );
  },
  tooltip: 'Show me the value!',
  child: const Icon(Icons.text_fields),
),
```


## Eksiksiz Örnek Uygulama (Interactive example)


```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

// Özel bir Form widget'ı tanımlayın.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Retrieve Text Input')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(controller: myController),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
```

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/cookbook/forms/retrieve-input](https://docs.flutter.dev/cookbook/forms/retrieve-input)

> *Bu sayfada  ›  Metin alanındaki değişiklikleri işleme (Handle changes to a text field)*

<a id="bolum-17"></a>

# Bölüm 17: Metin Alanındaki Değişiklikleri İşleme (Handle Changes to a Text Field)

Bir metin alanındaki anlık değişikliklerin nasıl algılanacağı ve işleneceği.

Bazı durumlarda, bir metin alanındaki metin her değiştiğinde bir geri çağırma (*callback*) fonksiyonu çalıştırmak son derece yararlıdır. Örneğin, kullanıcı yazdıkça sonuçları anında güncellemek istediğiniz otomatik tamamlama özellikli bir arama ekranı oluşturmak isteyebilirsiniz.

Metin her değiştiğinde bir geri çağırma fonksiyonunu nasıl çalıştırırsınız? Flutter ile iki seçeneğiniz vardır:

1. Bir `TextField` veya `TextFormField`'a `onChanged()` geri çağırması sağlamak.
2. Bir `TextEditingController` kullanmak.

## 1. onChanged() geri çağırması sağlamak

En basit yaklaşım, [TextField](https://pub.dev/documentation/material_ui/latest/material_ui/TextField-class.html) veya [TextFormField](https://pub.dev/documentation/material_ui/latest/material_ui/TextFormField-class.html) bileşenine bir [onChanged()](https://pub.dev/documentation/material_ui/latest/material_ui/TextField/onChanged.html) geri çağırması sağlamaktır. Metin her değiştiğinde bu geri çağırma yürütülür.

Bu örnekte, metin her değiştiğinde metin alanının geçerli değerini ve uzunluğunu konsola yazdırın.

Kullanıcı girdisiyle çalışırken [characters](https://api.flutter.dev/flutter/characters/Characters-class.html) kullanmak önemlidir; çünkü metin karmaşık unicode karakterler (emojiler, özel aksanlar vb.) içerebilir. Bu, kullanıcıya göründüğü gibi her karakterin doğru şekilde sayılmasını güvenceye alır.


```dart
TextField(
  onChanged: (text) {
    print('First text field: $text (${text.characters.length})');
  },
),
```


## 2. TextEditingController kullanmak

Daha güçlü ancak daha ayrıntılı bir yaklaşım, `TextField` veya `TextFormField`'ın [controller](https://pub.dev/documentation/material_ui/latest/material_ui/TextField/controller.html) özelliği olarak bir [TextEditingController](https://pub.dev/documentation/material_ui/latest/material_ui/TextEditingController-class.html) sağlamaktır.

Metin değiştiğinde bildirim almak için [addListener()](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html) metodunu kullanarak denetleyiciyi aşağıdaki adımlarla dinleyin:

1. Bir `TextEditingController` oluşturma.
2. `TextEditingController`'ı metin alanına bağlama.
3. En son değeri yazdıran bir fonksiyon oluşturma.
4. Değişiklikler için denetleyiciyi dinleme.

### TextEditingController oluşturma


```dart
// Özel bir Form widget'ı tanımlayın.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Widget ağaçtan kaldırıldığında denetleyiciyi temizleyin.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Bu kısmı bir sonraki adımda dolduracağız.
  }
}
```


> **ℹ️  Not:** Artık ihtiyaç duyulmadığında TextEditingController üzerinde dispose() çağırmayı unutmayın. Bu, nesne tarafından kullanılan tüm kaynakların güvenle serbest bırakılmasını sağlar.


### TextEditingController'ı metin alanına bağlama

`TextEditingController`'ı `TextField`'a bağlayın:


```dart
TextField(controller: myController),
```


### En son değeri yazdıran bir fonksiyon oluşturma


```dart
void _printLatestValue() {
  final text = myController.text;
  print('Second text field: $text (${text.characters.length})');
}
```


### Değişiklikler için denetleyiciyi dinleme

`_MyCustomFormState` sınıfı başlatıldığında (`initState`) dinlemeye başlayın ve sınıf elden çıkarıldığında (`dispose`) dinlemeyi durdurun:


```dart
@override
void initState() {
  super.initState();
  // Değişiklikleri dinlemeye başlayın.
  myController.addListener(_printLatestValue);
}

@override
void dispose() {
  // Widget kaldırıldığında denetleyiciyi temizleyin.
  // Bu aynı zamanda _printLatestValue dinleyicisini de kaldırır.
  myController.dispose();
  super.dispose();
}
```

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/cookbook/forms/text-field-changes](https://docs.flutter.dev/cookbook/forms/text-field-changes)

> *Bu sayfada  ›  Odak ve metin alanları (Focus and text fields)*

<a id="bolum-18"></a>

# Bölüm 18: Odak ve Metin Alanları (Focus and Text Fields)

Flutter'da metin alanlarında odaklanmanın (focus) nasıl çalıştığı ve programatik olarak nasıl yönetileceği.

Bir metin alanı seçildiğinde ve girdi kabul edebilir durumda olduğunda, "odağa" (*focus*) sahip olduğu söylenir. Genellikle kullanıcılar bir metin alanına dokunarak odağı taşırlar; geliştiriciler ise bu tarifte açıklanan araçları kullanarak odağı programatik olarak kaydırabilirler.

Odağı yönetmek, sezgisel akışa sahip profesyonel formlar oluşturmak için temel bir araçtır. Örneğin bir arama ekranınız olduğunu varsayalım. Kullanıcı arama ekranına geçtiğinde, odağı arama terimi metin alanına yönlendirebilirsiniz. Bu, kullanıcının metin alanına elle dokunmasına gerek kalmadan ekran açılır açılmaz yazmaya başlamasını sağlar.


## Metin alanı görünür olur olmaz odaklama (autofocus)

Bir metin alanına görünür olur olmaz anında odak vermek için `autofocus` özelliğini `true` olarak ayarlayın:


```dart
TextField(
  autofocus: true,
);
```


## Bir butona basıldığında metin alanına odaklanma

Odağı hemen taşımak yerine, daha sonraki bir anda bir metin alanına odak vermek isteyebilirsiniz. Gerçek dünyada bir API çağrısına veya bir doğrulama hatasına yanıt olarak belirli bir metin alanına odak vermeniz gerekebilir. Bu örnekte, kullanıcı bir butona bastıktan sonra aşağıdaki adımlarla bir metin alanına odak verin:

1. Bir `FocusNode` oluşturma.
2. `FocusNode`'u bir `TextField`'a aktarma.
3. Butona dokunulduğunda `TextField`'a odak kazandırma.

### 1. FocusNode oluşturma

İlk olarak bir [FocusNode](https://api.flutter.dev/flutter/widgets/FocusNode-class.html) oluşturun. `FocusNode`, Flutter'ın "odak ağacı" (*focus tree*) içindeki belirli bir `TextField`'ı benzersiz şekilde tanımlamanızı sağlar.

Odak düğümleri uzun ömürlü nesneler olduğundan, yaşam döngülerini bir `State` nesnesi kullanarak yönetin. `FocusNode` örneğini bir `State` sınıfının `initState()` metodu içinde oluşturun ve `dispose()` metodunda temizleyin:


```dart
class _MyCustomFormState extends State<MyCustomForm> {
  late final FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Form kapatıldığında odak düğümünü mutlaka temizleyin.
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ...
  }
}
```


### 2. FocusNode'u TextField'a aktarma


```dart
@override
Widget build(BuildContext context) {
  return TextField(focusNode: myFocusNode);
}
```


### 3. Butona dokunulduğunda metin alanına odaklanma

Kullanıcı kayan eylem butonuna bastığında odağı aktarmak için [requestFocus()](https://api.flutter.dev/flutter/widgets/FocusNode/requestFocus.html) metodunu çalıştırın:


```dart
FloatingActionButton(
  // Butona basıldığında myFocusNode kullanarak metin alanına odak verin.
  onPressed: () => myFocusNode.requestFocus(),
  tooltip: 'Focus Second Text Field',
  child: const Icon(Icons.edit),
),
```

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/cookbook/forms/focus](https://docs.flutter.dev/cookbook/forms/focus)

> *Bu sayfada  ›  Doğrulamalı bir form oluşturma (Build a form with validation)*

<a id="bolum-19"></a>

# Bölüm 19: Doğrulamalı Bir Form Oluşturma (Build a Form with Validation)

Flutter'da kullanıcı girdilerini doğrulayan güvenli bir formun nasıl inşa edileceği.

Uygulamalar sıklıkla kullanıcıların bir metin alanına bilgi girmesini gerektirir. Örneğin, kullanıcıların bir e-posta adresi ve şifre kombinasyonu ile giriş yapmasını isteyebilirsiniz.

Uygulamaları güvenli ve kullanımı kolay hale getirmek için kullanıcının sağladığı bilgilerin geçerli olup olmadığını kontrol edin. Kullanıcı formu doğru doldurduysa bilgileri işleyin; hatalı bilgi gönderdiyse neyin yanlış gittiğini bildiren samimi ve bilgilendirici bir hata mesajı gösterin.

Bu örnekte, aşağıdaki adımlarla tek bir metin alanına sahip bir forma doğrulama (*validation*) eklemeyi öğreneceksiniz:

1. Bir `GlobalKey` ile bir `Form` oluşturma.
2. Doğrulama mantığına sahip bir `TextFormField` ekleme.
3. Formu doğrulamak ve göndermek için bir buton oluşturma.

## 1. GlobalKey ile bir Form oluşturma

Bir [Form](https://api.flutter.dev/flutter/widgets/Form-class.html) oluşturun. `Form` widget'ı, birden çok form alanını gruplandırmak ve doğrulamak için bir kapsayıcı görevi görür.

Formu oluştururken bir [GlobalKey](https://api.flutter.dev/flutter/widgets/GlobalKey-class.html) sağlayın. Bu anahtar `Form`'unuza benzersiz bir tanımlayıcı atar ve daha sonra formu doğrulamanıza olanak tanır.

Formu bir `StatefulWidget` olarak oluşturun. Bu, bir kez benzersiz bir `GlobalKey<FormState>()` oluşturmanıza olanak tanır. Daha sonra bunu bir değişkende saklayabilir ve farklı noktalardan erişebilirsiniz. Bunu bir `StatelessWidget` yapsaydınız, kaynak açısından maliyetli olduğundan `build` metodu her çalıştığında yeni bir anahtar üretmek istemezdiniz.


```dart
import 'package:flutter/material.dart';

// Özel bir Form widget'ı tanımlayın.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  // Form widget'ını benzersiz şekilde tanımlayan ve formun
  // doğrulanmasını sağlayan bir global key oluşturun.
  //
  // Not: Bu bir `GlobalKey<FormState>` türüdür.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Yukarıda oluşturulan _formKey'i kullanarak bir Form oluşturun.
    return Form(
      key: _formKey,
      child: const Column(
        children: [
          // TextFormFields ve ElevatedButton buraya gelecek.
        ],
      ),
    );
  }
}
```


> **💡  İpucu:** Bir forma erişmek için GlobalKey kullanmak önerilen yoldur. Ancak daha karmaşık ve derin bir widget ağacınız varsa, iç içe geçmiş widget'lar içinden forma erişmek için Form.of() metodunu kullanabilirsiniz.


## 2. Doğrulama mantığıyla bir TextFormField ekleme

`Form` yerinde olsa da, kullanıcıların metin girmesi için bir yola ihtiyacı vardır. Bu görev bir [TextFormField](https://pub.dev/documentation/material_ui/latest/material_ui/TextFormField-class.html) tarafından yerine getirilir. `TextFormField` widget'ı bir Material Design metin alanı çizer ve doğrulama hataları meydana geldiğinde bunları otomatik olarak görüntüler.

`TextFormField`'a bir `validator()` fonksiyonu sağlayarak girdiyi doğrulayın. Kullanıcının girdisi geçerli değilse `validator` fonksiyonu bir hata mesajı içeren bir `String` döndürür. Hiçbir hata yoksa `null` döndürmelidir.


```dart
TextFormField(
  // validator kullanıcının girdiği metni parametre olarak alır.
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  },
),
```


> **💡  İpucu:** Kullanıcı alanlarla etkileşime girdikçe veya bir alan odağını kaybettiğinde alanları otomatik olarak doğrulamak için Form veya TextFormField üzerindeki autovalidateMode özelliğini AutovalidateMode kullanarak yapılandırın (örneğin AutovalidateMode.onUserInteraction veya AutovalidateMode.onUnfocus).


## 3. Formu doğrulamak ve göndermek için buton oluşturma

Kullanıcı formu göndermeye çalıştığında formun geçerli olup olmadığını kontrol edin. Geçerliyse bir başarı mesajı gösterin; geçerli değilse hata mesajını ekrana yansıtın:


```dart
ElevatedButton(
  onPressed: () {
    // Form geçerliyse validate() true, aksi halde false döndürür.
    if (_formKey.currentState!.validate()) {
      // Form geçerliyse bir snackbar gösterin. Gerçek dünyada
      // genellikle bir sunucuyu arar veya veritabanına kaydedersiniz.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  },
  child: const Text('Submit'),
),
```


## Bu mekanizma nasıl çalışır? (How does this work?)

Formu doğrulamak için 1. Adımda oluşturulan `_formKey`'i kullanın. Bir `Form` oluştururken Flutter tarafından otomatik olarak oluşturulan [FormState](https://api.flutter.dev/flutter/widgets/FormState-class.html)'e erişmek için `_formKey.currentState` erişimcisini kullanabilirsiniz.

`FormState` sınıfı `validate()` metodunu içerir. `validate()` metodu çağrıldığında, formdaki her bir metin alanı için `validator()` fonksiyonunu çalıştırır. Her alan geçerliyse `true` döndürür. Herhangi bir metin alanı hata içeriyorsa, `validate()` hata mesajlarını görüntülemek için formu yeniden oluşturur ve `false` döndürür.

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/cookbook/forms/validation](https://docs.flutter.dev/cookbook/forms/validation)

> *Bu sayfada  ›  Bir SnackBar görüntüleme*



---

## KISIM V: BİLDİRİMLER, EYLEMLER, KISAYOLLAR VE ODAK SİSTEMİ
> *ScaffoldMessenger ve SnackBar bildirimleri, Actions & Shortcuts mimarisi, niyetler (Intents), klavye olay yayılımı ve FocusScope sekme gezintisi.*

---

<a id="bolum-20"></a>

# Bölüm 20: Bir SnackBar Görüntüleme (Display a SnackBar)

Mesajları görüntülemek için snackbar bileşeni nasıl uygulanır.

Kullanıcılarınıza belirli eylemler gerçekleştiğinde kısa süreli bilgilendirmeler sunmak son derece faydalı olabilir. Örneğin, bir kullanıcı listedeki bir mesajı kaydırarak sildiğinde, mesajın başarıyla silindiğini bildirmek isteyebilirsiniz. Hatta kullanıcıya bu eylemi geri alma (*undo*) seçeneği sağlamak isteyebilirsiniz.


![Şekil 1: SnackBar Demo Ekranı](extracted_media/rId173_image20.png)
*Şekil 1: SnackBar Demo Ekranı*

Material Design sisteminde bu görev bir [SnackBar](https://api.flutter.dev/flutter/material/SnackBar-class.html) bileşenine aittir. Bu tarif, aşağıdaki adımları takip ederek bir snackbar uygular:

1. Bir `Scaffold` oluşturun.
2. Bir `SnackBar` görüntüleyin.
3. İsteğe bağlı bir eylem (*action*) sağlayın.

## 1. Bir Scaffold Oluşturma (Create a Scaffold)

Material Design yönergelerini takip eden uygulamalar geliştirirken uygulamanıza tutarlı ve standart bir görsel yapı kazandırın. Bu örnekte `SnackBar`'ı ekranın en alt kısmında, `FloatingActionButton` gibi diğer kritik widget'larla çakışmayacak ve onları kapatmayacak şekilde konumlandırın.

Material kütüphanesinde yer alan [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html) widget'ı, bu temel görsel yapıyı oluşturur ve önemli arayüz bileşenlerinin üst üste binmemesini garanti eder.


```dart
return MaterialApp(
  title: 'SnackBar Demo',
  home: Scaffold(
    appBar: AppBar(title: const Text('SnackBar Demo')),
    body: const SnackBarPage(),
  ),
);
```


## 2. Bir SnackBar Görüntüleme (Display a SnackBar)

`Scaffold` yapılandırıldıktan sonra bir `SnackBar` görüntüleyin. İlk olarak `SnackBar` nesnesini oluşturun, ardından bunu [ScaffoldMessenger](https://api.flutter.dev/flutter/material/ScaffoldMessenger-class.html) kullanarak ekranda gösterin.


```dart
const snackBar = SnackBar(content: Text('Yay! A SnackBar!'));

// Widget ağacında ScaffoldMessenger'ı bulun
// ve bir SnackBar göstermek için kullanın.
ScaffoldMessenger.of(context).showSnackBar(snackBar);
```


> **ℹ️  Not:** Daha fazla bilgi edinmek için ScaffoldMessenger widget'ına ilişkin iki dakikalık 'Widget of the Week' videosunu izleyebilirsiniz: ScaffoldMessenger Video Kılavuzu (YouTube)


![Widget of the Week — ScaffoldMessenger](extracted_media/rId178_image21.jpeg)
*Widget of the Week — ScaffoldMessenger*


## 3. İsteğe Bağlı Bir Eylem Sağlama (Provide an optional action)

`SnackBar` görüntülendiğinde kullanıcıya etkileşimli bir eylem sunmak isteyebilirsiniz. Örneğin kullanıcı listeden yanlışlıkla bir iletiyi silerse, `SnackBar` içerisindeki bir buton bu silme işlemini geri almayı (*undo*) mümkün kılabilir.

Aşağıdaki örnekte `SnackBar` widget'ına ek bir `SnackBarAction` tanımlanmıştır:


```dart
final snackBar = SnackBar(
  content: const Text('Yay! A SnackBar!'),
  action: SnackBarAction(
    label: 'Undo',
    onPressed: () {
      // Değişikliği geri almak için çalışacak kod.
    },
  ),
);
```


## Etkileşimli Örnek (Interactive example)


> **ℹ️  Not:** Bu örnekte SnackBar, kullanıcı butona dokunduğunda görüntülenir. Kullanıcı girişleriyle çalışma hakkında daha detaylı bilgi için rehberin Jestler (Gestures) bölümünü inceleyebilirsiniz.


```dart
import 'package:flutter/material.dart';

void main() => runApp(const SnackBarDemo());

class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SnackBar Demo'),
        ),
        body: const SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: const Text('Yay! Bir SnackBar!'),
            action: SnackBarAction(
              label: 'Geri Al (Undo)',
              onPressed: () {
                // Değişikliği geri alma mantığı
              },
            ),
          );

          // Widget ağacında ScaffoldMessenger'ı bulun
          // ve bir SnackBar göstermek için kullanın.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('SnackBar Göster'),
      ),
    );
  }
}
```

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/cookbook/design/snackbars](https://docs.flutter.dev/cookbook/design/snackbars)

> *Bu sayfada  ›  Eylemleri ve kısayolları kullanma*

<a id="bolum-21"></a>

# Bölüm 21: Eylemleri ve Kısayolları Kullanma (Using Actions and Shortcuts)

Flutter uygulamanızda Actions ve Shortcuts sistemini nasıl kullanırsınız.

Bu sayfa, fiziksel klavye olaylarının kullanıcı arayüzündeki eylemlere nasıl bağlanacağını açıklamaktadır. Örneğin uygulamanızda klavye kısayolları (*keyboard shortcuts*) tanımlamak istiyorsanız bu rehber tam size göredir.


## Genel Bakış (Overview)

Bir grafik kullanıcı arayüzü (GUI) uygulamasının herhangi bir iş yapabilmesi için eylemlere (`Action`) sahip olması gerekir: kullanıcılar uygulamaya bir şeyler *yapmasını* söyler. Eylemler genellikle eylemi doğrudan gerçekleştiren basit fonksiyonlardır (bir değer atamak veya bir dosya kaydetmek gibi). Ancak daha büyük ve karmaşık bir uygulamada işler farklılaşır: eylemi çağıran kod ile eylemin kendi kodu farklı katmanlarda veya dosyalarda bulunabilir. Kısayolların (*shortcuts / key bindings*), tetikledikleri eylemler hakkında hiçbir şey bilmeyen üst bir düzeyde tanımlanması gerekebilir.

İşte Flutter'ın eylemler ve kısayollar sistemi burada devreye girer. Geliştiricilerin, kendilerine bağlı niyetleri (`Intent`) yerine getiren eylemler tanımlamasına imkân tanır. Bu bağlamda bir **niyet (Intent)**, kullanıcının gerçekleştirmek istediği genel bir eylemdir ve bir [Intent](https://api.flutter.dev/flutter/widgets/Intent-class.html) sınıfı örneği Flutter'da bu kullanıcı niyetlerini temsil eder. Bir `Intent` genel amaçlı olabilir ve farklı bağlamlarda (*contexts*) farklı eylemler tarafından karşılanabilir. Bir [Action](https://api.flutter.dev/flutter/widgets/Action-class.html) ise basit bir geri çağırma (`CallbackAction` örneğinde olduğu gibi) ya da tüm bir geri alma/yineleme (*undo/redo*) mimarisiyle veya diğer iş mantıklarıyla bütünleşen daha karmaşık bir yapı olabilir.


![Şekil 2: Flutter Shortcuts ve Actions Mimarisi (Klavye Olayı Yayılımı, Niyet Karşılama ve Eylem Çağrısı)](extracted_media/rId182_image22.png)
*Şekil 2: Flutter Shortcuts ve Actions Mimarisi (Klavye Olayı Yayılımı, Niyet Karşılama ve Eylem Çağrısı)*

[Shortcuts](https://api.flutter.dev/flutter/widgets/Shortcuts-class.html), bir tuşa veya tuş kombinasyonuna basılarak etkinleştirilen tuş bağlamalarıdır (*key bindings*). Tuş kombinasyonları, bağlı oldukları niyetlerle birlikte bir tabloda bulunur. `Shortcuts` widget'ı bunları çağırdığında, eşleşen niyetlerini yerine getirilmek üzere eylemler alt sistemine (*actions subsystem*) gönderir.


### Eylemleri Niyetlerden (Intents) Neden Ayırmalıyız? (Why separate Actions from Intents?)

Şunu sorabilirsiniz: Neden bir tuş kombinasyonunu doğrudan bir eyleme eşlemiyoruz? Neden niyetlere ihtiyaç duyuyoruz? Bunun nedeni, tuş eşleme tanımlarının bulunduğu yer (genellikle üst düzeyde) ile eylem tanımlarının bulunduğu yer (genellikle alt düzeyde) arasında bir **sorumlulukların ayrımı (separation of concerns)** bulunmasının büyük kolaylık sağlamasıdır. Ayrıca tek bir tuş kombinasyonunun bir uygulamadaki hedeflenen işleme eşlenmesi ve odaklanan bağlam için bu işlemi yerine getiren eyleme otomatik olarak uyarlanması son derece önemlidir.

Örneğin Flutter, her bir kontrol türünü kendi ilgili `ActivateAction` sürümüne eşleyen bir `ActivateIntent` widget'ına sahiptir. Bu kodun çalışabilmesi için genellikle ilgili bileşene oldukça özel (*private*) bir erişime ihtiyacı vardır. Eğer `Intent`'lerin sağladığı bu ek dolaylama (*indirection*) katmanı olmasaydı, eylem tanımlarını `Shortcuts` widget'ının tanımlandığı üst seviyeye taşımak gerekirdi. Bu durum, kısayolların hangi eylemi çağıracakları hakkında gereğinden fazla ayrıntıya sahip olmasına ve normalde ihtiyaç duymayacakları durumlara erişmesine yol açardı.

Niyetler bir eylemi yapılandırarak aynı eylemin birden çok amaca hizmet etmesine olanak tanır. Bunun bir örneği, odağın hareket ettirileceği yönü parametre olarak alan ve `DirectionalFocusAction`'ın odağı hangi yöne taşıyacağını bilmesini sağlayan `DirectionalFocusIntent`'tir. Burada dikkat edilmesi gereken kural şudur: Bir eylemin tüm çağrıları için geçerli olan durumu niyetin (`Intent`) içine geçirmeyin; bu tür durumlar, niyetin çok fazla şey bilmesini önlemek adına doğrudan `Action`'ın kendi kurucusuna iletilmelidir.


### Neden Basit Geri Çağırmalar (Callbacks) Kullanmıyoruz? (Why not use callbacks?)

Bir `Action` nesnesi yerine neden sadece bir fonksiyon geri çağırması (*callback*) kullanmadığınızı da merak edebilirsiniz. Başlıca neden, eylemlerin `isEnabled` özelliğini uygulayarak o an etkinleştirilip etkinleştirilmediklerine kendilerinin karar verebilmesidir. Ayrıca tuş atamaları ile bu atamaların uygulamalarının farklı dosyalarda veya yerlerde olması mimari temizlik sunar.

Eğer `Actions` ve `Shortcuts` sisteminin tüm esnekliğine ihtiyaç duymuyorsanız ve sadece doğrudan geri çağırmalar istiyorsanız, [CallbackShortcuts](https://api.flutter.dev/flutter/widgets/CallbackShortcuts-class.html) widget'ını pratik bir alternatif olarak kullanabilirsiniz:


```dart
@override
Widget build(BuildContext context) {
  return CallbackShortcuts(
    bindings: <ShortcutActivator, VoidCallback>{
      const SingleActivator(LogicalKeyboardKey.arrowUp): () {
        setState(() => count = count + 1);
      },
      const SingleActivator(LogicalKeyboardKey.arrowDown): () {
        setState(() => count = count - 1);
      },
    },
    child: Focus(
      autofocus: true,
      child: Column(
        children: <Widget>[
          const Text('Sayacı artırmak için yukarı ok tuşuna basın'),
          const Text('Sayacı azaltmak için aşağı ok tuşuna basın'),
          Text('Sayaç değeri: $count'),
        ],
      ),
    ),
  );
}
```


## Kısayollar (Shortcuts)

Eylemler tek başlarına da kullanılabilir; ancak en yaygın kullanım senaryosu bunları klavye kısayollarına bağlamaktır. `Shortcuts` widget'ı tam olarak bu görevi yürütür.

Widget hiyerarşisine eklenerek belirli bir tuş kombinasyonuna basıldığında kullanıcının niyetini temsil eden eşlemeleri tanımlar. Bu amacı somut bir eyleme dönüştürmek için `Actions` widget'ı `Intent`'i bir `Action`'a eşler. Örneğin bir `SelectAllIntent` tanımlayıp bunu kendi `SelectAllAction` veya `CanvasSelectAllAction` eyleminize bağlayabilirsiniz. Böylece aynı tuş kombinasyonu (Ctrl+A), uygulamanın hangi bölümünün odakta olduğuna bağlı olarak doğru eylemi tetikler:


```dart
@override
Widget build(BuildContext context) {
  return Shortcuts(
    shortcuts: <LogicalKeySet, Intent>{
      LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyA):
          const SelectAllIntent(),
    },
    child: Actions(
      dispatcher: LoggingActionDispatcher(),
      actions: <Type, Action<Intent>>{
        SelectAllIntent: SelectAllAction(model),
      },
      child: Builder(
        builder: (context) => TextButton(
          onPressed: Actions.handler<SelectAllIntent>(
            context,
            const SelectAllIntent(),
          ),
          child: const Text('TÜMÜNÜ SEÇ (SELECT ALL)'),
        ),
      ),
    ),
  );
}
```


> **ℹ️  Not:** ShortcutActivator, eski LogicalKeySet yapısının modern alternatifidir. Kısayolların daha esnek ve hatasız tetiklenmesini sağlar. Örneğin SingleActivator, tek bir ana tuş ile birlikte isteğe bağlı yardımcı niteleyicileri (Ctrl, Alt, Shift vb.) alır. CharacterActivator ise fiziksel tuşlar yerine tuş dizisi sonucunda üretilen karaktere göre kısayolu çalıştırır.


## Kısayol Yöneticisi (The ShortcutManager)

`ShortcutManager`, `Shortcuts` widget'ından daha uzun ömürlü bir nesnedir ve aldığı tuş olaylarını ilgili yerlere iletir. Tuşların nasıl işleneceğine karar verme mantığını, ağaçta yukarı çıkarak diğer kısayol eşlemelerini bulma mantığını barındırır ve tuş kombinasyonları ile niyetler arasındaki haritayı yönetir.

Varsayılan davranış çoğu zaman yeterli olsa da, `Shortcuts` widget'ına özel bir `ShortcutManager` alt sınıfı vererek davranışı özelleştirebilirsiniz. Örneğin işlenen tüm tuşları günlüğe kaydetmek için:


```dart
class LoggingShortcutManager extends ShortcutManager {
  @override
  KeyEventResult handleKeypress(BuildContext context, KeyEvent event) {
    final KeyEventResult result = super.handleKeypress(context, event);
    if (result == KeyEventResult.handled) {
      print('Kısayol işlendi: $event bağlam: $context');
    }
    return result;
  }
}
```


## Eylemler (Actions) ve Tanımlanması (Defining actions)

`Actions`, bir `Intent` ile çağrılarak uygulamanın gerçekleştirebileceği operasyonların tanımlanmasını sağlar. Eylemler etkinleştirilebilir veya devre dışı bırakılabilir; ayrıca kendilerini yapılandırmak üzere tetikleyen niyet nesnesini bir argüman olarak alırlar.

Eylemler en temel halleriyle bir `invoke()` metodunu geçersiz kılan (*override*) `Action<Intent>` alt sınıflarıdır:


```dart
class SelectAllAction extends Action<SelectAllIntent> {
  SelectAllAction(this.model);
  final Model model;

  @override
  void invoke(covariant SelectAllIntent intent) => model.selectAll();
}
```

Ayrı bir sınıf oluşturmak yerine daha hızlı bir yöntem tercih ederseniz, `CallbackAction` kullanabilirsiniz:


```dart
CallbackAction(onInvoke: (intent) => model.selectAll());
```

Eyleminizi oluşturduktan sonra, `Intent` türlerini `Action`'lara bağlayan bir harita (*map*) alan `Actions` widget'ı ile uygulamanıza eklersiniz:


```dart
@override
Widget build(BuildContext context) {
  return Actions(
    actions: <Type, Action<Intent>>{
      SelectAllIntent: SelectAllAction(model),
    },
    child: child,
  );
}
```


## Eylemleri Çağırma (Invoking Actions)

Eylemleri çağırmanın en yaygın yolu klavye kısayolları olsa da, tuşlara bağlı olmayan eylemleri programatik olarak çağırmak da mümkündür. Belirli bir niyetle ilişkili bir eylemi bulmak için:


```dart
Action<SelectAllIntent>? selectAll = Actions.maybeFind<SelectAllIntent>(
  context,
);
```

Eğer eylem mevcutsa onu çağırmak için `Actions.of(context).invokeAction(selectAll, const SelectAllIntent())` çağrılır veya tek bir adımda şu şekilde birleştirilebilir:


```dart
Object? result = Actions.maybeInvoke<SelectAllIntent>(
  context,
  const SelectAllIntent(),
);
```

Bir buton tıklaması sonucu eylem tetiklemek için `Actions.handler<SelectAllIntent>(context, const SelectAllIntent())` kullanılır. Eğer eylem o an etkin değilse (`isEnabled == false`), fonksiyon `null` döndürür ve buton otomatik olarak devre dışı (disabled) kalır.

**Builder Widget'ının Önemi:** `Actions.handler` ve `Actions.invoke`, eylemleri verilen `BuildContext` içinde arar. Eğer `build` metodunun kendi bağlamı iletilirse, arama mevcut widget'ın üstünden başlar ve aynı metodun içinde tanımlanan eylemler bulunamaz. Bir `Builder` widget'ı kullanmak, alt seviyede taze bir bağlam oluşturarak aynı build fonksiyonunda tanımlanan eylemlerin güvenle bulunmasını sağlar.

## Eylem Dağıtıcıları (Action dispatchers)

Çoğu zaman bir eylemi tetikleyip gerisini düşünmezsiniz. Ancak eylemlerin çalıştırılmasını merkezi olarak kaydetmek (*log*), yetkilendirme veya geri alma işlemlerini takip etmek istediğinizde özel bir `ActionDispatcher` devreye girer.


```dart
class LoggingActionDispatcher extends ActionDispatcher {
  @override
  Object? invokeAction(
    covariant Action<Intent> action,
    covariant Intent intent, [
    BuildContext? context,
  ]) {
    print('Action invoked: $action($intent) from $context');
    super.invokeAction(action, intent, context);
    return null;
  }

  @override
  (bool, Object?) invokeActionIfEnabled(
    covariant Action<Intent> action,
    covariant Intent intent, [
    BuildContext? context,
  ]) {
    print('Action invoked: $action($intent) from $context');
    return super.invokeActionIfEnabled(action, intent, context);
  }
}
```

Bu dağıtıcı en üst düzey `Actions` widget'ına geçirildiğinde, her bir eylem yürütülüşünde konsola şu biçimde detaylı bilgi yazar:


```dart
flutter: Action invoked: SelectAllAction#906fc(SelectAllIntent#a98e3) from Builder
```


## Hepsini Bir Araya Getirme (Putting it together)

`Actions` ve `Shortcuts` kombinasyonu oldukça güçlüdür: widget düzeyinde belirli somut eylemlerle eşleşen genel amaçlı niyetler tanımlayabilirsiniz. Bir metin alanının yanında bulunan 'Tümünü Seç' ve 'Panoya Kopyala' butonları aynı eylemleri çağırabilirken, klavye kısayolları da bu eylemleri kusursuz şekilde tetikler.

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/ui/interactivity/actions-and-shortcuts](https://docs.flutter.dev/ui/interactivity/actions-and-shortcuts)

> *Bu sayfada  ›  Klavye odak sistemini anlama*

<a id="bolum-22"></a>

# Bölüm 22: Flutter'ın Klavye Odak Sistemini Anlama (Understanding Flutter's Keyboard Focus System)

Flutter uygulamanızda odak (focus) sistemini nasıl kullanırsınız.

Bu makale, klavye girdisinin nereye yönlendirileceğinin nasıl denetlendiğini açıklamaktadır. Masaüstü ve web uygulamaları gibi fiziksel bir klavye kullanan bir uygulama geliştiriyorsanız bu sayfa sizin için elzemdir.


## Genel Bakış (Overview)

Flutter, klavye girişini uygulamanın belirli bir bölümüne yönlendiren kapsamlı bir odak sistemine sahiptir. Kullanıcılar istenen arayüz bileşenine dokunarak veya tıklayarak girişi o öğeye odaklarlar. Bu gerçekleştikten sonra klavyeyle girilen metinler, odak başka bir öğeye taşınana dek ilgili bileşene akar. Odak ayrıca genellikle `Tab` tuşuna bağlı olan belirli bir klavye kısayoluyla da taşınabilir; bu işleme sekme gezintisi (*tab traversal*) denir.


## Odak Kullanım Senaryoları (Focus use cases)

- **Tuş olaylarını dinleme ve işleme:** Klavye tuş basımlarını yakalama ve filtreleme.
- **Odaklanabilir özel bir bileşen oluşturma:** Özel bir widget'ın klavye odağını kabul etmesini sağlama.
- **Odak değiştiğinde bildirim alma:** Kullanıcı alandan çıktığında veya alana girdiğinde haberdar olma.
- **Sekme sırasını (tab order) belirleme:** Odak gezintisinin sırasını ihtiyaca göre özelleştirme.
- **Birlikte gezilecek denetim gruplarını tanımlama:** Mantıksal widget grupları oluşturma.
- **Belirli denetimlerin odaklanmasını engelleme:** İstenmeyen öğeleri odak zincirinden hariç tutma.

## Terimler Sözlüğü (Glossary)

- **Odak ağacı (Focus tree):** Odak alabilen tüm widget'ları temsil eden ve widget ağacını seyrek olarak yansıtan odak düğümleri ağacı.
- **Odak düğümü (Focus node):** Odak ağacındaki tek bir düğüm. Odağı kabul edebilir ve odak zincirinin parçası olduğunda 'odağa sahip' sayılır. Yalnızca odağa sahipken tuş olaylarının işlenmesine katılır.
- **Birincil odak (Primary focus):** Odak ağacının kökünden en uzakta bulunan ve o anda odağa sahip olan odak düğümü. Tuş olayları buradan yayılmaya başlar.
- **Odak zinciri (Focus chain):** Birincil odak düğümünden başlayıp odak ağacının köküne kadar olan dalları takip eden sıralı odak düğümleri listesi.
- **Odak kapsamı (Focus scope):** Görevi diğer odak düğümlerinden oluşan bir grubu sarmalamak ve yalnızca bu düğümlerin odak almasına izin vermek olan özel bir odak düğümü. Alt ağacında daha önce hangi düğümün odaklandığı bilgisini saklar.
- **Odak gezintisi (Focus traversal):** Öngörülebilir bir sırada bir odaklanabilir düğümden diğerine geçme süreci (kullanıcı Tab tuşuna bastığında gerçekleşen geçiş gibi).

## FocusNode ve FocusScopeNode Nesneleri

`FocusNode` ve [FocusScopeNode](https://api.flutter.dev/flutter/widgets/FocusScopeNode-class.html) nesneleri odak sisteminin çalışma mekanizmasını oluşturur. Widget'lardan daha uzun ömürlü nesnelerdir (render nesnelerine benzerler) ve widget ağacının yeniden derlenmeleri (*builds*) arasında odak durumunu ve niteliklerini korurlar. Birlikte odak ağacı veri yapısını meydana getirirler.


### FocusNode Nesneleri Oluştururken En İyi Uygulamalar (Best practices)

- **❌ Her build çağrısında yeni bir FocusNode tahsis etmeyin.** Bu bellek sızıntılarına yol açar ve widget rebuild olduğunda odağın beklenmedik biçimde kaybolmasına neden olur.
- **✅ FocusNode ve FocusScopeNode nesnelerini bir StatefulWidget içinde oluşturun.** Bu nesnelerin işleri bittiğinde serbest bırakılması gerekir; bu nedenle dispose() metodunu geçersiz kılabileceğiniz bir State nesnesinde oluşturulmalıdırlar.
- **❌ Aynı FocusNode'u birden fazla widget için ortak kullanmayın.** Aksi takdirde widget'lar düğüm niteliklerini yönetmek için çakışır ve tutarsız davranışlar oluşur.
- **✅ Hata ayıklamayı kolaylaştırmak için debugLabel tanımlayın.** Odak sorunlarını teşhis ederken hangi düğümün odakta olduğunu konsolda net olarak görmenizi sağlar.
- **❌ Bir Focus widget'ı tarafından yönetiliyorsa düğüm üzerinde onKeyEvent ayarlamayın.** Bunun yerine doğrudan Focus widget'ının onKeyEvent özelliğini kullanın.
- **✅ Birincil odağı istemek için doğrudan requestFocus() çağırın.** Odağı devretmek istediğiniz düğüme requestFocus() göndermeniz yeterlidir.
- **✅ FocusScope.of(context).requestFocus(focusNode) yerine doğrudan focusNode.requestFocus() kullanın.** Bu kullanım hem daha sade hem de performans açısından daha verimlidir.

## Odaktan Çıkma / Odağı Bırakma (Unfocusing)

Bir düğüme 'odağı bırakmasını' bildirmek için `FocusNode.unfocus()` API'si kullanılır. Bu işlem düğümden odağı kaldırsa da, sistemde 'hiçbir şeyin odaklanmaması' gibi bir durumun bulunmadığını anlamak önemlidir. Odak bir düğümden ayrıldığında, sistemde daima bir birincil odak bulunması gerektiği için odak başka bir yere aktarılır.

`unfocus()` metodunun `disposition` parametresi iki mod sunar:

1. **UnfocusDisposition.scope (Varsayılan):** Odağı en yakın üst odak kapsamına verir. Bu durum, odağın bir sonraki sefere kapsamdaki 'ilk' odaklanabilir öğeden başlamasını sağlar.
2. **UnfocusDisposition.previouslyFocusedChild:** Kapsamda daha önce odaklanmış olan çocuk düğümü arar ve odağı ona iade eder.

> ℹ️  Dikkat (Beware): Eğer hiyerarşide başka bir kapsam bulunmuyorsa, odak sistemin kök kapsam düğümüne (FocusManager.rootScope) geçer. Bu genellikle istenmez, çünkü kök kapsam bir sonraki odaklanacak öğeyi belirlemek için gerekli bağlama sahip değildir. Uygulamanız sekme gezintisi yeteneğini aniden kaybederse sorun bundan kaynaklanabilir. Çözüm olarak odak düğümünün üstüne bir FocusScope ekleyin (MaterialApp ve CupertinoApp bunu varsayılan olarak sağlar).


## Focus Widget'ı (The Focus widget)

[Focus](https://api.flutter.dev/flutter/widgets/Focus-class.html) widget'ı bir odak düğümüne sahip olan ve onu yöneten ana iş gücü bileşenidir. Düğümün odak ağacına bağlanmasını ve ayrılmasını yönetir, nitelik ve geri çağırmaları idare eder.


```dart
class MyCustomWidget extends StatefulWidget {
  const MyCustomWidget({super.key});

  @override
  State<MyCustomWidget> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  Color _color = Colors.white;
  String _label = 'Unfocused';

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focused) {
        setState(() {
          _color = focused ? Colors.black26 : Colors.white;
          _label = focused ? 'Odaklandı (Focused)' : 'Odak Dışı (Unfocused)';
        });
      },
      child: Center(
        child: Container(
          width: 300,
          height: 50,
          alignment: Alignment.center,
          color: _color,
          child: Text(_label),
        ),
      ),
    );
  }
}
```


## Tuş Olayları (Key events)

Bir alt ağaçtaki tuş olaylarını dinlemek için `Focus` widget'ının `onKeyEvent` niteliğini ayarlayın. Eğer `KeyEventResult.handled` döndürülürse, tuş olayı tüketilmiş sayılır ve ağaçta yukarı doğru yayılımı durdurulur.


```dart
@override
Widget build(BuildContext context) {
  return Focus(
    onKeyEvent: (node, event) {
      // 'a' harfinin girilmesini engelle
      return (event.logicalKey == LogicalKeyboardKey.keyA)
          ? KeyEventResult.handled
          : KeyEventResult.ignored;
    },
    child: const TextField(),
  );
}
```


## Nelerin Odak Alacağını Kontrol Etme (Controlling what gets focus)

Bir widget'ın odak davranışını denetlemek için üç ana nitelik mevcuttur:

1. **canRequestFocus:** Bu widget'ın odak talep edip edemeyeceğini belirler. False ayarlanırsa odaklanamaz ve sekme gezintisinde atlanır.
2. **skipTraversal:** True ayarlandığında, widget sekme (Tab) gezintisinden çıkarılır; ancak programatik olarak veya tıklanarak yine de odaklanabilir.
3. **descendantsAreFocusable:** Bu düğümün altındaki tüm widget'ların odaklanabilirliğini topluca açıp kapatır (ExcludeFocus widget'ı bu şekilde çalışır).

## Bildirimler ve FocusNode Nesnesine Erişme

Odak değişikliklerini takip etmek için `Focus.onFocusChanged` veya doğrudan düğüm üzerinden `hasPrimaryFocus` kontrol edilebilir. Bir widget'ın altından odak düğümüne erişmek için `Focus.of(context)` kullanılır:


```dart
@override
Widget build(BuildContext context) {
  return Focus(
    child: Builder(
      builder: (context) {
        final bool hasPrimary = Focus.of(context).hasPrimaryFocus;
        print('Birincil odak durumu: $hasPrimary');
        return const SizedBox(width: 100, height: 100);
      },
    ),
  );
}
```


## FocusScope ve FocusableActionDetector

`FocusScope` widget'ı bir `FocusScopeNode` yöneterek odak düğümlerini alt ağaçlar halinde gruplar. [FocusableActionDetector](https://api.flutter.dev/flutter/widgets/FocusableActionDetector-class.html) ise `Actions`, `Shortcuts`, `MouseRegion` ve `Focus` widget'larının işlevlerini tek bir kullanışlı pakette birleştirir.


> **ℹ️  Not:** Daha fazla bilgi edinmek için FocusableActionDetector widget'ı hakkındaki kısa Widget of the Week videosuna göz atabilirsiniz: FocusableActionDetector (YouTube)


![Widget of the Week — FocusableActionDetector](extracted_media/rId190_image23.jpeg)
*Widget of the Week — FocusableActionDetector*


## Odak Gezintisini Kontrol Etme (Focus Traversal)

Flutter varsayılan olarak okuma sırasına göre gezinti yapan `ReadingOrderTraversalPolicy` politikasını kullanır. Ancak butonların sırasını özel bir sıralamayla (örneğin İKİ, BİR, ÜÇ) belirlemek isterseniz, `FocusTraversalGroup` ve `OrderedTraversalPolicy` ile birlikte `NumericFocusOrder` kullanabilirsiniz:


```dart
class OrderedButtonRow extends StatelessWidget {
  const OrderedButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      policy: OrderedTraversalPolicy(),
      child: Row(
        children: <Widget>[
          const Spacer(),
          FocusTraversalOrder(
            order: const NumericFocusOrder(2),
            child: TextButton(child: const Text('BİR (ONE)'), onPressed: () {}),
          ),
          const Spacer(),
          FocusTraversalOrder(
            order: const NumericFocusOrder(1),
            child: TextButton(child: const Text('İKİ (TWO)'), onPressed: () {}),
          ),
          const Spacer(),
          FocusTraversalOrder(
            order: const NumericFocusOrder(3),
            child: TextButton(child: const Text('ÜÇ (THREE)'), onPressed: () {}),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
```


## Odak Yöneticisi (The FocusManager)

`FocusManager`, sistemin o anki birincil odağını korur (`FocusManager.instance.primaryFocus`). Ayrıca dokunmatik ekran modu ile klavye/fare modu arasında geçiş yapıldığında odak vurgularını yönetmek için `highlightMode` ve `highlightStrategy` niteliklerini sağlar. `addHighlightModeListener` dinleyicisi ile mod değişiklikleri gerçek zamanlı izlenebilir.

Bu sayfanın içeriği yardımcı oldu mu?   👍  Evet     👎  Hayır

Aksi belirtilmedikçe, bu site Creative Commons Attribution 4.0 International License ile lisanslanmıştır ve kod örnekleri 3-Clause BSD License kapsamında lisanslıdır.

Şartlar  |  Marka  |  Gizlilik  |  Güvenlik  •  Orijinal Kaynak: [https://docs.flutter.dev/ui/interactivity/focus](https://docs.flutter.dev/ui/interactivity/focus)

