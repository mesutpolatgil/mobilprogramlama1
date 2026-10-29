**Uyarı:** Bu içerik, SCÜ Şarkışla UBYO Mobil Programlama I dersi kapsamında tamamen eğitim amaçlı çevrilmiş ve derlenmiştir. Orijinal dokümantasyon kaynakları (dart.dev, docs.flutter.dev) kendi orijinal lisanslarına (BSD-3-Clause, CC-BY 4.0) tabidir. Bu çalışmanın hiçbir ticari amacı yoktur.

---

# Flutter UI ve Widget'lar — Türkçe Dokümantasyon

> Bu doküman, [docs.flutter.dev](https://docs.flutter.dev) adresindeki resmi Flutter dokümantasyonunun Türkçe çevirisidir. Tüm kod örnekleri orijinal kaynaklardan alınmıştır.

## İçindekiler

1. [Flutter UI — Giriş](#1-flutter-ui--giriş)
2. [Widget Kataloğu — Genel Bakış](#2-widget-kataloğu--genel-bakış)
3. [Cupertino Widget'ları](#3-cupertino-widgetları)
4. [Material Widget'ları](#4-material-widgetları)
5. [Erişilebilirlik Widget'ları](#5-erişilebilirlik-widgetları)
6. [Animasyon ve Hareket Widget'ları](#6-animasyon-ve-hareket-widgetları)
7. [Varlıklar, Görseller ve İkonlar](#7-varlıklar-görseller-ve-i̇konlar)
8. [Asenkron Widget'lar](#8-asenkron-widgetlar)
9. [Temel Widget'lar](#9-temel-widgetlar)
10. [Girdi Widget'ları](#10-girdi-widgetları)
11. [Etkileşim Modeli Widget'ları](#11-etkileşim-modeli-widgetları)
12. [Düzen ve Yerleşim Widget'ları](#12-düzen-ve-yerleşim-widgetları)
13. [Boyama ve Efekt Widget'ları](#13-boyama-ve-efekt-widgetları)
14. [Kaydırma Widget'ları](#14-kaydırma-widgetları)
15. [Stil Widget'ları](#15-stil-widgetları)
16. [Metin Widget'ları](#16-metin-widgetları)

---

# 1. Flutter UI — Giriş

**Orijinal kaynak:** https://docs.flutter.dev/ui

## "Her Şey Bir Widget'tır" Felsefesi

Flutter'da neredeyse her şey bir widget'tır — yalnızca metin, düğme ve görsel gibi görsel öğeler değil, aynı zamanda düzen modelleri de. Diğer öğeleri düzenlemek, kısıtlamak ve hizalamak için kullanılan satırlar, sütunlar ve ızgaralar gibi göremediğiniz şeyler bile birer widget'tır.

Flutter, **bildirimsel** (declarative) bir model kullanır (metin alanının içeriğini `textView.setText("Merhaba")` gibi komutlarla elle değiştirdiğiniz zorunlu/imperative UI çerçevelerinin aksine). Kullanıcı arayüzünüzün mevcut yapılandırma ve durumuna göre nasıl görünmesi gerektiğini tanımlarsınız; çerçeve render etme ve güncellemeleri yönetir.

Karmaşık kullanıcı arayüzleri, basit widget'ları birbirinin içine yerleştirerek **bileşim** (composition) yoluyla oluşturulur ve bu, **Widget Ağacı** (Widget Tree) olarak bilinen bir ağaç yapısı oluşturur.

---

## Widget Nedir?

Widget'lar, bir Flutter uygulamasının kullanıcı arayüzünün atomik yapı taşlarıdır. Bunlar, görünümünüzün bir bölümü için değişmez (immutable) planlar (yapılandırma nesneleri) olarak işlev görür.

- **Görsel ve Görsel Olmayan:** Bir widget; yapısal öğeleri (düğme veya dolgu gibi), düzen kurallarını (satır veya sütun gibi) ya da stilistik özellikleri (metin biçimlendirme veya temalar gibi) tanımlayabilir.
- **Değişmezlik:** Widget'lar, oluşturulduktan sonra özelliklerini değiştiremez. Veriler değiştiğinde Flutter, eski widget ağacını (veya bölümlerini) atar ve yeni bir tane oluşturur. Arka planda, hafif temel temsiller (`Element`'ler ve `RenderObject`'ler) ekrana gerçekte ne çizileceğini verimli biçimde yönetir.

---

## Üç Ağaç

Flutter, perde arkasında üç ayrı ağaç yönetir:

1. **Widget Ağacı (Widget Tree):** Geliştiriciler tarafından yazılan değişmez yapılandırma planı.
2. **Element Ağacı (Element Tree):** Ağaçtaki widget'ların yaşam döngüsünü ve konumlandırmasını yönetir; yapılandırmaları ekran piksellerine köprüler.
3. **RenderObject Ağacı (RenderObject Tree):** Ekranda görünen düzen, geometri ve boyama görevlerini üstlenir.

---

## StatelessWidget ve StatefulWidget

### `StatelessWidget`

- **Değişmezdir.** Takip edilecek iç durumu yoktur.
- Görünümü tamamen yapılandırma parametrelerine (yapıcı aracılığıyla iletilen) ve `BuildContext`'e bağlıdır.
- **Kullanım alanı:** Metin etiketleri, ikonlar veya sabit düzen kapsayıcıları gibi statik bileşenler.

### `StatefulWidget`

- Kullanıcı etkileşimine veya veri akışına bağlı olarak zamanla dinamik biçimde değişmesi gereken widget'lar için tasarlanmıştır.
- Değiştirilebilir veri yönetimini, güncellenmiş verilerle widget'ı yeniden çizmesini Flutter'a bildiren `setState()` yöntemini kullanan ayrı bir `State` nesnesine devreder.
- **Kullanım alanı:** Onay kutuları, metin alanları, kaydırıcılar veya dinamik veri yükleyen listeler.

**Temel kod örneği:**

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Kök tasarım/navigasyon sarmalayıcısı
      home: Scaffold(   // Yapısal düzen ilkeli
        appBar: AppBar(title: const Text('Flutter\'a Hoş Geldiniz')),
        body: const Center(
          child: Text('Merhaba, Widget\'lar!'), // Metin görüntüleme widget'ı
        ),
      ),
    );
  }
}
```

---

## StatefulWidget Yaşam Döngüsü

Bir `StatefulWidget`, UI oluşturmasını ayrı bir yardımcı `State` nesnesine devreder. Bu `State` nesnesi belirgin bir yaşam döngüsünden geçer:

1. **`createState()`**: Bir `StatefulWidget`, widget ağacına eklendiği anda çerçeve tarafından çağrılır. Eşleşen `State` sınıfını başlatır.
2. **`initState()`**: Her durum nesnesi ömrü başına **bir kez** çağrılır. Yerel değişkenlerin, kontrolörlerin (örn. `TextEditingController`) kurulumu veya akışlara abone olma gibi tek seferlik başlatma görevleri için idealdir. Her zaman önce `super.initState()` çağrısı yapın.
3. **`didChangeDependencies()`**: `initState()`'den hemen sonra ve kalıtsal bir bağımlılık (örn. `InheritedWidget` veya `MediaQuery`) değiştiğinde çağrılır.
4. **`build()`**: `setState()` çağrıldığında, bağımlılıklar güncellendiğinde veya üst widget'lar yeniden oluşturulduğunda sık sık çağrılır. Bu durum için widget ağacı parçasını döndürür.
5. **`didUpdateWidget(Widget oldWidget)`**: Üst widget değişirse ve bu alt öğe için yeni bir yapılandırma örneğiyle yeniden oluşturulursa tetiklenir; `oldWidget`'ı `widget` ile karşılaştırmanıza olanak tanır.
6. **`deactivate()`**: `State` nesnesi widget ağacından kaldırıldığında çağrılır. Bazen daha sonra yeniden eklenebilir.
7. **`dispose()`**: `State` nesnesi ağaçtan kalıcı olarak kaldırıldığında çağrılır. Kaynakları temizlemek için bu yöntemi kullanın (örn. kontrolörleri elden çıkarma, abonelikleri iptal etme) ve bellek sızıntılarını önleyin.

---

## `setState()` — Yeniden Çizimi Tetikleme

`setState()`, bir `StatefulWidget` içindeki **geçici (yerel) durumu** yönetmek için birincil mekanizmadır.

```dart
int _counter = 0;

void _increment() {
  setState(() {
    _counter++; // Yerel durumu değiştirir
  });
}
```

`setState()` geri çağrısı içinde kod çalıştırdığınızda Flutter çerçevesine iç verilerin değiştiğini bildirirsiniz. Çerçeve bu durum nesnesini "kirli" olarak işaretler ve bir sonraki kare render penceresi sırasında `build()` yönteminin yeniden çalıştırılmasını planlar.

> **En İyi Uygulama:** `setState()`'i hafif tutun. `setState()` içinde ağır senkron görevler, asenkron işlemler (ağ çağrıları gibi) veya veri ayrıştırma gerçekleştirmeyin; önce değişkeni güncelleyin, ardından geri çağrı içine sarın.

---

## BuildContext

```dart
Widget build(BuildContext context) { ... }
```

- **Tanım:** `BuildContext`, genel Widget Ağacı içindeki bir widget'ın belirli konumuna ait bir tanıtıcıyı temsil eder. Her widget'ın kendi `BuildContext`'i vardır (bu, alt öğelerine üst öğe işlevi görür).
- **Neden önemlidir:**
  1. **Ataları Bulmak:** Bir widget'ın ağaçtaki atalardan bilgi almasına olanak tanır (örn. `MediaQuery.of(context)` aracılığıyla ekran boyutunu alma, `Theme.of(context)` aracılığıyla tema özelliklerini alma veya `Navigator.of(context)` aracılığıyla rota gezintisi yapma).
  2. **Kapsamlı Çalıştırma:** Bir iletişim kutusu veya snack bar gösterme gibi işlemlerin UI hiyerarşisinin doğru bölümünde gerçekleşmesini sağlar.

---

## InheritedWidget — Verileri Ağaç Boyunca Paylaşma

`setState()` tek bir widget dalı içinde sıkışmış yerel durumu yönetirken, **`InheritedWidget`** verileri widget ağacı boyunca *aşağıya* her yapıcıdan parametreleri manuel olarak geçirmek zorunda kalmadan verimli biçimde yayma olanağı sunar.

- **Mekanizma:** Alt widget'ların ağacın herhangi bir derinliğinde paylaşılan ata verilerine (örn. temalar, yerelleştirme verileri veya kullanıcı profilleri) verimli şekilde erişmesine olanak tanır.
- **Kullanım Deseni:**
  ```dart
  // Bir torun widget'ın build yöntemi içindeki standart desen:
  final theme = Theme.of(context); // Tema, arka planda InheritedWidget kullanır
  ```
- **Verimlilik:** Bir `InheritedWidget` güncellendiğinde, yalnızca buna (`dependOnInheritedWidgetOfExactType` aracılığıyla) açıkça bağımlı olan torun widget'lar için bir yeniden derleme tetikler. `InheritedWidget`, Provider gibi modern durum yönetimi çözümlerinin arkasındaki mimari plan işlevi görür.

---

## Key'ler — Widget'ları Ağaçta Tanımlama

Flutter varsayılan olarak widget'ları yeniden oluşturmalar sırasında çalışma zamanı türü ve sırasına göre eşleştirir. Öğelerin yeniden sıralanabildiği, eklenip silinebildiği dinamik listeler veya koleksiyonlarla çalışırken **Key'ler** benzersiz biçimde öğeleri ağaçta tanımlayarak bu sorunu çözer.

- **Key Kullanım Zamanı:** Durum bilgisi olan alt widget'lar içeren koleksiyonlar değiştirildiğinde (örn. bir `ListView`'daki öğeleri yeniden sıralamak veya silmek). Key'ler olmadan Flutter, kaydırılmış bileşenlerin durumunu karıştırabilir.
- **Yaygın Key Türleri:**
  - **`ValueKey<T>`:** Tanımlayıcı olarak ilkel bir değer (dize kimliği veya tamsayı dizini gibi) kullanır.
  - **`ObjectKey`:** Kimliği izlemek için belirli bir nesne örneği referansı kullanır.
  - **`UniqueKey`:** Benzersizliği garanti edilen global olarak benzersiz bir tanımlayıcı oluşturur.
  - **`GlobalKey`:** Uygulamanızın ağacının tamamen farklı bölümlerinden bir widget'ın durumuna, bağlamına veya render nesnesine erişmenize olanak tanır (hesaplama açısından daha ağır oldukları için dikkatli kullanın).

---

## Temel Düzen Mekanizması ve Kısıtlamalar

Flutter'da düzenim temel kuralı kısıtlamalarla yönetilir: **Kısıtlamalar aşağı iner. Boyut yukarı çıkar. Üst öğe konumu belirler.**

- Bir üst widget, minimum ve maksimum genişlik ve yükseklik kısıtlamalarını alt öğesine aşağı iletir.
- Alt öğe, bu kısıtlamalar dahilinde kendi boyutuna karar verir ve üst öğeye geri bildirir.
- Üst öğe daha sonra alt öğeyi 2D koordinat alanında nereye konumlandıracağına karar verir.

---

## Yaygın Düzen Widget'ları

### Üst Düzey Yapısal Widget'lar

- **`Scaffold` ve `AppBar`:** Temel ekran görsel yapısını ayarlayan, uygulama çubukları, kayan eylem düğmeleri, çekmeceler ve alt gezinme çubukları eklemeyi kolaylaştıran üst düzey Material Design bileşenleri.

### Çok Alt Öğeli Düzen Widget'ları

- **`Row` ve `Column`:** Alt widget'ları yatay (`Row`) veya dikey (`Column`) biçimde yerleştirmek için standart düzen araçları. `mainAxisAlignment` ve `crossAxisAlignment` kullanılarak ana ve çapraz eksenler boyunca hizalamayı kontrol edin.
- **`Stack`:** Widget'ların birbiri üstüne yığılmasına veya üst üste binmesine olanak tanır (mutlak konumlandırma katmanlarına benzer şekilde), çoğunlukla `Positioned` widget'larıyla birlikte kullanılır.
- **`ListView` / `GridView`:** Alt öğelerin kaydırılabilir doğrusal listelerini veya ızgara tabanlı matrislerini verimli biçimde işlemek için.

### Tek Alt Öğeli Düzen Widget'ları

- **`Container`:** Dolgu, kenar boşlukları, kenarlıklar, arka plan renkleri ve belirli boyut kısıtlamaları eklemek için çok amaçlı bir yardımcı kutu.
- **`Padding` ve `SizedBox`:** Öğelerin çevresine veya arasına aralık enjekte etmek ya da belirli bir genişlik/yükseklik kısıtlaması zorlamak için hafif widget'lar.
- **`Center` ve `Align`:** Bir alt widget'ı mevcut üst sınırlar içinde ortalar veya tam olarak hizalar.
- **`Expanded` / `Flexible`:** Bir `Row`, `Column` veya `Flex` içinde alt öğeleri orantılı biçimde mevcut boş alanı doldurmaya zorlamak için kullanılır.

---

## Tasarım Sistemleri: `material` ve `cupertino`

Flutter SDK, stil tarafsız bir temel çekirdek sağlar (`package:flutter/widgets.dart`), ancak çoğu uygulama önceden paketlenmiş tasarım sistemlerine dayanır:

- **`material` (`package:flutter/material.dart`)**: Google'ın Material Design spesifikasyonunu uygular (düğmeler, kartlar, scaffold'lar, gezinme çubukları).
- **`cupertino` (`package:flutter/cupertino.dart`)**: Çapraz platform uyumluluğu için iOS tarzı (Apple İnsan Arayüzü Kılavuzları) widget'larını uygular.

**İlgili API bağlantıları:**
- [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)
- [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
- [InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html)
- [Flutter Düzen Rehberi](https://docs.flutter.dev/ui/layout)

---

# 2. Widget Kataloğu — Genel Bakış

**Orijinal kaynak:** https://docs.flutter.dev/ui/widgets

## Genel Bakış

Flutter Widget Kataloğu, resmi Flutter dokümantasyonundaki geliştiricilerin çerçevede mevcut olan geniş UI yapı taşı yelpazesini keşfetmelerine, anlamalarına ve uygulamalarına yardımcı olmak için tasarlanmış yapılandırılmış bir referans kılavuzudur.

- **Keşfedilebilirlik:** Geliştiricilerin binlerce API sınıfını ezberlemek yerine işlevsellik tabanlı kategorileri tarayarak gereksinimlerini bulmalarını sağlar.
- **Kod Parçacıkları ve Örnekler:** Katalog girdilerinin çoğu açık, küçük görsel örnekler ve standart kod parçacıkları sunar.
- **Çapraz Referanslar:** Derinlemesine teknik parametreler, yapıcılar ve miras ayrıntıları için geliştiricileri ilgili API referansına (`api.flutter.dev`) yönlendirir.

---

## Temel Widget'lar

*İlk Flutter uygulamanızı oluşturmadan önce bilmeniz gereken widget'lar.*

| Widget | Açıklama |
|--------|----------|
| **`AppBar`** | Bir ekranın üstünde içerik ve eylemleri görüntüleyen kapsayıcı (genellikle Scaffold içinde kullanılır). |
| **`Column`** | Alt widget listesini dikey yönde düzenler. |
| **`Container`** | Yaygın boyama, konumlandırma ve boyutlandırma widget'larını birleştiren kolaylık sağlayan bir widget. |
| **`ElevatedButton`** | Basıldığında malzeme yüksekliği artan doldurulmuş bir Material Design düğmesi. |
| **`FlutterLogo`** | Widget biçiminde resmi Flutter logosu (mevcut `IconTheme`'e saygı duyar). |
| **`Icon`** | Material Design ikon grafiği. |
| **`Image`** | Bir görsel dosyasını veya ağ varlığını görüntüleyen widget. |
| **`Placeholder`** | Diğer içeriklerin/widget'ların ekleneceği yer tutucu temsil eden bir kutu çizer. |
| **`Row`** | Alt widget listesini yatay yönde düzenler. |
| **`Scaffold`** | Temel Material Design görsel düzen yapısını uygular; çekmeceler, snack bar'lar ve alt sayfalar için API'lar sağlar. |
| **`Text`** | Tek bir birleşik stille metin dizisi. |

---

## Widget Kategorileri

### Erişilebilirlik (Accessibility)
Engelli kişiler için uygulama kullanılabilirliğini artıran widget'lar.
- Örnekler: `Semantics`, `ExcludeSemantics`

### Animasyon ve Hareket (Animation & Motion)
Geçişler, fizik ve kontrollü animasyonlar için widget'lar.
- Örnekler: `AnimatedContainer`, `Hero`, `FadeTransition`

### Varlıklar, Görseller ve İkonlar (Assets, Images, & Icons)
Yerel görseller veya vektör ikonları gibi kod olmayan kaynakları yönetme araçları.
- Örnekler: `Image`, `Icon`

### Asenkron (Async)
Asenkron veri akışlarını veya Future'ları işleyen widget'lar.
- Örnekler: `FutureBuilder`, `StreamBuilder`

### Temel (Basics)
Her Flutter geliştiricisinin bilmesi gereken temel, günlük widget'lar.
- Örnekler: `Text`, `Row`, `Column`, `Stack`, `Container`

### Girdi (Input)
Formlar, düğmeler ve kullanıcı girişi toplama bileşenleri.
- Örnekler: `TextField`, `Form`, `Checkbox`

### Etkileşim Modelleri (Interaction Models)
Dokunma girişini, hareketleri, yönlendirmeyi ve geri bildirimi işleyen widget'lar.
- Örnekler: `GestureDetector`, `Dismissible`

### Düzen — Tek Alt Öğe (Layout — Single-Child)
Hizalama, dolgu, boyutlandırma veya kısıtlama için yapısal ilkeler.

Tam liste:
- `Align` — Alt öğesini kendi içinde hizalar ve isteğe bağlı olarak alt öğenin boyutuna göre kendini boyutlandırır.
- `AspectRatio` — Alt öğesini belirli bir en boy oranına boyutlandırmaya çalışır.
- `Center` — Alt öğesini yatay ve dikey olarak kendi içinde ortalar.
- `ConstrainedBox` — Alt öğesine ek boyutlandırma kısıtlamaları uygular.
- `Container` — Dolgu, kenar boşlukları, boyutlandırma ve boyama dekorasyonlarını birleştirir.
- `CustomSingleChildLayout` — Tek alt öğesinin düzenini bir temsilci işlevine devreder.
- `Expanded` — Bir `Row`, `Column` veya `Flex`'in alt öğesini ana eksen boyunca mevcut alanı doldurmak üzere zorlar.
- `FittedBox` — Alt öğesini belirli bir `BoxFit` düzenine göre kendi içinde ölçekler ve konumlandırır.
- `IntrinsicHeight` / `IntrinsicWidth` — Alt öğelerini çocuğun doğal içsel boyutlarına göre boyutlandırır.
- `LimitedBox` — Alt öğenin boyutunu yalnızca üst düzen tarafından kısıtlanmadığında sınırlandırır.
- `Offstage` — Alt öğeyi orada yokmuş gibi düzenler, tamamen görünümden gizler.
- `OverflowBox` — Alt öğesine daha az kısıtlama uygulayarak üst sınırları aşmasına izin verir.
- `Padding` — Alt öğesini verilen dolgu değeriyle girintiler.
- `SizedBox` — Alt widget için sabit genişlik ve/veya yükseklik belirtir.
- `SizedOverflowBox` — Belirli bir boyutta olan ancak alt öğesine farklı kısıtlamalar ileten bir widget.
- `Transform` — Alt öğesini boyamadan önce 3D matris dönüşümü uygular.

### Düzen — Çok Alt Öğe (Layout — Multi-Child)

Tam liste:
- `Column` — Alt öğeleri dikey olarak düzenler.
- `Row` — Alt öğeleri yatay olarak düzenler.
- `Stack` — Widget'ların birbiri üstüne katmanlanmasına izin verir.
- `IndexedStack` — Listedeki yalnızca tek bir alt öğeyi etkin dizine göre görüntüler.
- `GridView` — Widget'ları tekrarlayan dikey ve yatay ızgara hücre düzeninde düzenler.
- `ListView` — Kaydırılabilir, doğrusal bir alt öğe listesi.
- `Wrap` — Alt öğeleri bir eksen boyunca sıralı biçimde görüntüler; alan bittiğinde alt öğeleri bir sonraki satıra taşır.
- `Flow` — Alt öğeleri dönüşüm matrisleri aracılığıyla konumlandıran gelişmiş bir akış düzeni algoritması uygular.
- `Table` — Tablo stili hücre yapıları kullanan bir düzen widget'ı.
- `CustomMultiChildLayout` — Birden fazla alt öğeyi dinamik olarak konumlandırmak ve boyutlandırmak için temsilci kullanır.

### Boyama ve Efektler (Painting & Effects)
Görsel stil değiştiriciler.
- Örnekler: `Opacity`, `ClipRRect`, `Transform`

### Kaydırma (Scrolling)
Uzun listleri veya ızgaraları yöneten kapsayıcılar.
- Örnekler: `SingleChildScrollView`, `ListView`, `CustomScrollView`

### Stil (Styling)
Tema ile ilgili ve stil miras yardımcı araçları.

### Metin Widget'ları (Text Widgets)
- `Text` — Tek bir temel stille metin dizisi görüntülemek için standart widget.
- `RichText` — Birden fazla karışık stil, satır içi span veya entegre ikonları kullanan metni, `TextSpan` nesnelerinin bir ağacı kullanarak görüntüler.
- `DefaultTextStyle` — Açık stiller içermeyen torun `Text` widget'larına özyinelemeli olarak uygulanan varsayılan metin stilini (yazı tipi boyutu, rengi, ailesi) ayarlar.

### Görsel ve İkon Widget'ları (Assets, Images, and Icons)
- `Image` — Temel görsel widget. Yaygın yapıcılar:
  - `Image.asset` — Projenizin `pubspec.yaml` varlıklarından yerel olarak paketlenmiş bir görsel dosyası yükler.
  - `Image.network` — URL üzerinden doğrudan bir görsel getirir ve görüntüler.
  - `Image.file` — Yerel cihaz depolama dosya sisteminden bir görsel yükler.
  - `Image.memory` — `Uint8List` bellek baytlarından ham olarak bir görsel yükler.
- `Icon` — Bir yazı tipinden (Material Design'ın yerleşik ikon kütüphanesi gibi: `Icons.home`, `Icons.settings`) bir glif render eder.
- `ImageIcon` — Yazı tipi ikonu yerine `AssetImage` veya başka bir `ImageProvider` kullanarak özel grafik ikon görüntüler.

**İlgili API bağlantısı:** [widgets-library](https://api.flutter.dev/flutter/widgets/widgets-library.html)

---

# 3. Cupertino Widget'ları

**Orijinal kaynak:** https://docs.flutter.dev/ui/widgets/cupertino

## Genel Bakış

Flutter'ın **Cupertino** kütüphanesi (`package:flutter/cupertino.dart`), Apple'ın İnsan Arayüzü Kılavuzları'nı (HIG) uygulayan kapsamlı bir widget koleksiyonu sağlar. Bu widget'lar tipografi, renkler, kaydırma fiziği ve sayfa geçişleri dahil yerel görünüm ve hissiyle iOS tarzı uygulamalar oluşturmanıza olanak tanır.

**İlgili API bağlantısı:** [cupertino-library](https://api.flutter.dev/flutter/cupertino/cupertino-library.html)

---

## Bölüm 1: Uygulama Yapısı ve Gezinme

### `CupertinoApp`

iOS tarzı bir uygulama için yaygın olarak gereken bir dizi widget'ı (örn. `CupertinoTheme` ve `WidgetsApp`) saran kolaylık sağlayan bir widget. iOS için üst düzey yönlendiriciyi, yerelleştirmeyi ve genel görsel stilini yapılandırır.

```dart
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Cupertino Uygulama',
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.activeBlue,
      ),
      home: HomePage(),
    );
  }
}
```

---

### `CupertinoPageScaffold`

Üstte kalıcı bir gezinme çubuğu ve altında içerik gövdesi/sekme görünümü içeren standart iOS ekran düzen yapısı. Material Design'daki `Scaffold`'a eşdeğerdir.

---

### `CupertinoNavigationBar`

Bir `leading` widget (geri düğmesi gibi), `middle` widget (başlık metni gibi) ve `trailing` widget (eylem düğmesi gibi) desteğiyle iOS tarzı üst gezinme çubuğu ("NavBar"). Yarı saydamlık ve arka plan bulanıklaştırma efektlerini yerel olarak yönetir.

```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Cupertino Gezinme Çubuğu'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.add),
          onPressed: () {
            // Düğme basıldığında eylem
          },
        ),
      ),
      child: Center(
        child: CupertinoButton.filled(
          child: const Text('Tıkla'),
          onPressed: () {
            // Bir şey yap
          },
        ),
      ),
    );
  }
}
```

---

### `CupertinoTabScaffold`

Alt sekme gezintisi olan uygulamaları yönetmek için düzen yapısı.

### `CupertinoTabBar`

iOS tarzı alt sekme çubuğu widget'ı.

### `CupertinoTabView`

Bir `CupertinoTabScaffold` içindeki bireysel sekme gezinme yığınları için kök widget.

### `CupertinoPageRoute`

Yerel iOS kaydırmalı giriş/çıkış sayfa animasyonlarıyla geçiş yapan modal rota.

### `CupertinoSliverNavigationBar`

iOS tarzı büyük daralan başlıklar (kaydırılabilir gezinme çubukları için).

### `CupertinoFullscreenDialogTransition`

Alttan yukarı kayan tam ekran iOS modal iletişim kutusu sayfaları için tasarlanmış geçiş rotası.

---

## Bölüm 2: Düğmeler ve Girişler

### `CupertinoButton`
Basıldığında opaklığını değiştiren iOS tarzı düğme.

### `CupertinoTextField`
Yerel imleç stiline ve seçim tutamaçlarına sahip iOS tarzı metin giriş alanı.

### `CupertinoSearchTextField`
Büyüteç ve temizleme düğmesiyle birlikte arama filtreleri için özel olarak şekillendirilmiş metin alanı.

### `CupertinoSwitch`
iOS tarzı geçiş düğmesi widget'ı.

### `CupertinoCheckbox`
iOS tarzı onay kutusu widget'ı.

### `CupertinoRadio`
iOS tarzı radyo düğmesi girişi.

### `CupertinoSlider`
Apple'ın tasarım özelliklerini izleyen yatay kaydırıcı.

---

## Bölüm 3: Seçiciler (Pickers)

### `CupertinoDatePicker`
Tarih, saat veya her ikisini seçmek için kullanılan iOS tarzı dönen tekerlek seçici. Çeşitli modları destekler: `date`, `time`, `dateAndTime`.

### `CupertinoTimerPicker`
Saat, dakika ve saniye ayarlamak için kullanılan iOS tarzı geri sayım tekerlek seçici.

### `CupertinoPicker`
Kısa bir rastgele öğe listesinden (örn. ülke kodları, para birimleri) seçim yapmak için kullanılan genel iOS tarzı tekerlek seçici.

### `CupertinoPickerDefaultSelectionOverlay`
iOS tekerlek seçicileri genelinde görülen standart yarı saydam vurgulama yer paylaşımı.

---

## Bölüm 4: Seçim ve Segment Kontrolleri

### `CupertinoSlidingSegmentedControl`
Şu anda seçili seçeneği vurgulayan düzgün animasyonlu kayan arka plan başlığına sahip iOS tarzı segmentli kontrol.

### `CupertinoSegmentedControl`
Kayan animasyon olmadan seçilmekte olan seçenek anında vurgu rengi sınırlarını değiştiren geleneksel çok seçenekli geçiş kontrolü.

---

## Bölüm 5: İletişim Kutuları, Uyarılar ve Sayfalar

### `CupertinoAlertDialog`
Metin başlıkları ve yatay/dikey eylem düğmeleriyle iOS tarzı açılır uyarı iletişim kutusu.

### `CupertinoActionSheet`
Ekranın altından yukarı kayan ve genellikle bir seçenek veya eylem listesi sunan iOS tarzı eylem sayfası açılır penceresi.

### `CupertinoActionSheetAction`
Bir `CupertinoActionSheet` içinde yer almak üzere özel olarak tasarlanmış dokunulabilir düğme satırı öğesi.

### `CupertinoDialogAction`
Bir `CupertinoAlertDialog` içinde yerel görünmek için oluşturulmuş düğme biçimi.

### `CupertinoContextMenu`
Kullanıcı bir alt widget'a uzun bastığında iOS tarzı tam ekran modal bağlam menüsü yer paylaşımı tetikleyen sarmalayıcı.

### `CupertinoContextMenuAction`
Bir `CupertinoContextMenu` sayfası içinde çalıştırmak üzere özel olarak stillendirilmiş düğme eylemi.

### `CupertinoPopupSurface`
iOS yerel kayan sayfaları, uyarı iletişim kutularını veya eylem panellerini taklit etmek üzere şekillendirilmiş yuvarlak kapsayıcı yüzey.

---

## Bölüm 6: Formlar ve Düzen Organizasyonu

### `CupertinoFormSection`
iOS gruplu tablo görünümü bölüm kapsayıcısı (öğeleri yuvarlanmış kart bölümleri içinde iç gruplandırma stiliyle görüntüler).

### `CupertinoFormRow`
Standart iOS ayarları satırlarını taklit eden kapsayıcı düzen (solda açıklayıcı etiket widget'ını sağda girdi/kontrol widget'ıyla eşleştirir).

### `CupertinoTextFormFieldRow`
`CupertinoFormRow`'u form uyumlu bir `CupertinoTextField` ile birleştiren kolaylık sarmalayıcısı.

---

## Bölüm 7: Göstergeler, Geri Bildirim ve Kaydırma

### `CupertinoActivityIndicator`
Yükleme/ilerleme durumları için kullanılan iOS tarzı dönen daire göstergesi.

### `CupertinoScrollbar`
Bir kaydırılabilir görünüm sürüklendiğinde kayan görünümde soluklaşan iOS tarzı kaydırma çubuğu başparmak yer paylaşımı.

---

# 4. Material Widget'ları

**Orijinal kaynak:** https://docs.flutter.dev/ui/widgets/material

## Genel Bakış

Flutter'ın Material kütüphanesi (`import 'package:flutter/material.dart'`), Material Design (varsayılan olarak Material 3) uygulayan widget'lar sağlar. Bu widget'lar öncelikle Android ve çapraz platform uygulamalarını hedefler.

**İlgili API bağlantısı:** [material-library](https://api.flutter.dev/flutter/material/material-library.html)

---

## Bölüm 1: Uygulama Yapısı ve Gezinme

### `MaterialApp`

Material Design uygulamaları için yaygın olarak gereken birçok widget'ı saran kök düzey kolaylık widget'ı. Global yönlendirme (`navigator`), uygulama genelinde `theme` stil, yerelleştirme, başlık ve ilk ana ekranı kurar. Uygulamanın giriş noktasındaki `runApp()` işlevinin içine doğrudan yerleştirilir.

### `Scaffold`

Temel Material Design görsel düzen yapısını uygulayan bir düzen yapısı widget'ı. Çekmeceler, snack bar'lar, alt sayfalar, kayan eylem düğmeleri ve alt gezinme çubukları gibi standart ekran öğeleri için API'lar ve yapısal yuvalar sağlar. Uygulamanızdaki bireysel bir sayfa veya ekran için "iskelet" işlevi görür.

### `AppBar`

Material Design uygulama çubuğu. Genellikle `Scaffold`'un üstünde görüntülenen yatay çubuk. Araç çubuğu başlığı, gezinme ikonları, eylem düğmeleri (arama veya ayarlar ikonları gibi) ve sekme çubukları gibi öğeleri içerir.

### `SliverAppBar`

Kullanıcı kaydırdıkça daralan kaydırılabilir uygulama çubuğu, genellikle `CustomScrollView` içinde kullanılır.

### `TabBar` ve `TabBarView`

Yatay sayfalama ve sekme değiştirme.

### `NavigationBar` (Material 3 Alt Gezinme)

`BottomNavigationBar`'ın güncellenmiş Material 3 eşdeğeri.

### `BottomNavigationBar` (Material 2 stili)

Kullanıcıların 3 ila 5 hedef arasında geçiş yapmasına olanak tanıyan ekranın altında geleneksel mobil gezinme çubuğu.

### `NavigationRail`

Genellikle ekranın sol veya sağ tarafında görüntülenen dikey ray. Daha büyük ekranlar (tablet veya masaüstü) için tasarlanmıştır.

### `NavigationDrawer`

Ekranın kenarından (genellikle soldan) kayan Material 3 yan sayfa gezinme bileşeni.

### `Drawer`

`Scaffold`'un kenarından kayan klasik Flutter gezinme paneli (genellikle bir `ListView`, `UserAccountsDrawerHeader` ve `ListTile` öğeleriyle doldurulur).

**Temel Kod Örneği (MaterialApp + Scaffold + AppBar):**

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. MaterialApp global uygulama özelliklerini (tema, rotalar, başlık) ayarlar
    return MaterialApp(
      title: 'MaterialApp Örneği',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Scaffold görsel yapıyı / sayfa şablonunu sağlar
    return Scaffold(
      // 3. AppBar üst başlık çubuğunu sağlar
      appBar: AppBar(
        title: const Text('Ana Ekran'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Eylem mantığı buraya
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Merhaba, Flutter Material Widget\'ları!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

---

## Bölüm 2: Düğmeler ve Eylemler

### `FloatingActionButton` (FAB)

Birincil, en yaygın eylemi (örn. Oluştur, Ekle) tanıtmak için genellikle bir ekranın sağ alt köşesine yerleştirilen belirgin, dairesel düğme. `ExtendedFloatingActionButton` (etiket metniyle) olarak da kullanılabilir.

### `ElevatedButton`

Basıldığında malzeme yüksekliği artan (gölge eklenen) doldurulmuş düğme. Öne çıkması gereken birincil eylemler için kullanılır. Kullanımdan kaldırılan `RaisedButton`'ın yerini alır.

```dart
ElevatedButton(
  onPressed: () {
    // Tıklamada eylem
  },
  child: const Text('Tıkla'),
)
```

Stil uygulaması:

```dart
ElevatedButton.styleFrom(
  foregroundColor: Colors.white,
  backgroundColor: Colors.blue,
  elevation: 4.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  ),
)
```

### `TextButton`

Düz, yükseltilmemiş metin veya ikon olarak render edilen düğme. Genellikle daha az belirgin eylemler için kullanılır (örn. iletişim kutularındaki "İptal"). Kullanımdan kaldırılan `FlatButton`'ın yerini alır.

```dart
TextButton(
  onPressed: () {
    // Tıklamada eylem
  },
  child: const Text('İptal'),
)
```

### `OutlinedButton`

Görünür bir anahat/kenarlığa ve saydam arka plana sahip düğme. Orta önem eylemleri için kullanılır (`ElevatedButton`'ın ikincisi). Kullanımdan kaldırılan `OutlineButton`'ın yerini alır.

```dart
OutlinedButton(
  onPressed: () {
    // Tıklamada eylem
  },
  child: const Text('Daha Fazla Öğren'),
)
```

### `FilledButton` / `FilledButton.tonal`
Material 3 doldurulmuş düğme varyantları.

### `IconButton`
İkon grafiği görüntüleyen düğme.

### `PopupMenuButton`
Basıldığında seçenek listesi gösteren menü görüntüler.

### `DropdownButton`
Öğelerin açılır listesini gösterir.

### `SegmentedButton`
Bir veya birden fazla seçenek seçmek için Material 3 segmentli düğme kontrolü.

---

## Bölüm 3: Kapsayıcılar ve Yüzeyler

### `Card`

Hafif yuvarlak köşelere ve yükseklik gölgesine sahip Material Design sayfası/paneli. Kısa, ilgili bilgi parçalarını paketlemek için kullanılır (örn. albüm açıklaması, kullanıcı profili bloğu veya ürün ayrıntıları).

```dart
Card(
  elevation: 2.0,
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text('Kart Başlığı', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Bu, Material kartı içindeki gövde içeriğidir.'),
      ],
    ),
  ),
)
```

### `Divider` / `VerticalDivider`

Listeler, çekmeceler veya kapsayıcılar içindeki içeriği görsel olarak ayırmak için kullanılan ince yatay (veya dikey) çizgi.

### `ExpansionPanel` / `ExpansionTile`
Daraltılabilir kapsayıcı bileşenler.

---

## Bölüm 4: Seçim ve Girdi

### `TextField` / `TextFormField`
Kullanıcıların metin yazmasına, düzenlemesine ve göndermesine olanak tanıyan metin giriş alanları.

### `Checkbox`
Bir kullanıcının bir kümeden bir veya birden fazla seçenek seçmesine olanak tanıyan form kontrolü. İşaretlenmiş, işaretlenmemiş ve üç durumlu/null durumlarını destekler.

### `Radio`
Kullanıcının birbirini dışlayan bir seçenek kümesinden yalnızca bir seçenek seçmesine izin veren form kontrolü.

### `Switch`
Tek bir ayarın durumunu açık ve kapalı arasında değiştirmek için kullanılan geçiş kontrolü.

### `Slider` / `RangeSlider`
Kullanıcıların sürekli veya ayrık bir aralıktan sayısal bir değer seçmesine izin veren form kontrolleri.

### Chip Varyantları:

- `Chip` — Standart görüntüleme chip'i.
- `ActionChip` — Bir eylem tetikler.
- `FilterChip` — Geçiş gibi davranır (seçim/filtreleme).
- `InputChip` — Karmaşık bir bilgi parçasını temsil eder (silme desteğiyle).
- `ChoiceChip` — Bir kümeden tek seçim yapılmasına olanak tanır.

```dart
Chip(
  avatar: CircleAvatar(
    backgroundColor: Colors.grey.shade300,
    child: const Text('M'),
  ),
  label: const Text('Material Chip'),
)
```

---

## Bölüm 5: Bilgi Görüntüleme ve Listeler

### `ListTile`
Genellikle birincil metin (`title`), ikincil metin (`subtitle`) ve başlangıç/bitiş ikonları veya widget'ları içeren sabit yükseklikli satır. Sıklıkla `ListView`'lar içinde kullanılır.

### `DataTable`
Yapılandırılmış veriler için ızgara tabloları.

### `Tooltip`
Uzun basma/fareyle üzerine gelme sırasında bilgilendirici metin açılır pencereleri.

### `Badge`
İkonlar veya metin için bildirim rozetleri/noktaları.

### `ProgressIndicator`

- `CircularProgressIndicator` — Dönen dairesel yükleme göstergesi.
- `LinearProgressIndicator` — Yatay yükleme çubuğu.

---

## Bölüm 6: Geri Bildirim ve İletişim Kutuları (Modallar)

### `SnackBar`

Bir işlem hakkında kısa geri bildirim sağlayan ekranın altında geçici açılır mesaj (örn. "Öğe silindi" ve Geri Al düğmesiyle). `ScaffoldMessenger.of(context).showSnackBar()` aracılığıyla tetiklenir.

### `BottomSheet` / `showModalBottomSheet`

Ekranın altından kayan sayfa. Kalıcı veya modal olabilir (ekranın geri kalanıyla etkileşimi engeller).

### `AlertDialog`

Başlık, içerik alanı ve eylem düğmeleri içeren standart uyarı bildirimleri için önceden biçimlendirilmiş iletişim kutusu.

```dart
showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: const Text('Öğe Silinsin mi?'),
      content: const Text('Bu dosyayı kalıcı olarak silmek istediğinizden emin misiniz?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('İptal'),
        ),
        ElevatedButton(
          onPressed: () {
            // Silme işlemini gerçekleştir
            Navigator.of(context).pop();
          },
          child: const Text('Sil'),
        ),
      ],
    );
  },
);
```

### `SimpleDialog`
Kullanıcı için seçenek/tercih listesi görüntüler.

### `AboutDialog`
Uygulama sürüm bilgisi, ikonları ve yasal/lisans bilgileri gösteren yerleşik iletişim kutusu.

### `Banner`
İçeriğin üstünde köşegen pankart yer paylaşımları.

---

## Kapsamlı Material Widget Kod Örneği

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Widget\'ları Demosu',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const WidgetDemoScreen(),
    );
  }
}

class WidgetDemoScreen extends StatefulWidget {
  const WidgetDemoScreen({super.key});

  @override
  State<WidgetDemoScreen> createState() => _WidgetDemoScreenState();
}

class _WidgetDemoScreenState extends State<WidgetDemoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _switchValue = true;
  double _sliderValue = 40.0;
  bool _checkboxValue = false;
  int? _radioValue = 1;
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material Widget\'ları Vitrini'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.list), text: "Girişler ve Listeler"),
            Tab(icon: Icon(Icons.refresh), text: "İlerleme ve Daha Fazlası"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              const ListTile(
                leading: CircleAvatar(child: Icon(Icons.person)),
                title: Text('Kullanıcı Profili'),
                subtitle: Text('Ayar ayrıntılarını görüntülemek için dokunun'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
              const Divider(thickness: 1.5, height: 30),
              TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Adınızı girin',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                title: const Text('Bildirimleri Etkinleştir'),
                value: _switchValue,
                onChanged: (bool value) {
                  setState(() => _switchValue = value);
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kaydırıcı Değeri: ${_sliderValue.toStringAsFixed(1)}'),
                  Slider(
                    value: _sliderValue,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: _sliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() => _sliderValue = value);
                    },
                  ),
                ],
              ),
              const Divider(height: 30),
              CheckboxListTile(
                title: const Text('Şartlar ve koşulları kabul ediyorum'),
                value: _checkboxValue,
                onChanged: (bool? value) {
                  setState(() => _checkboxValue = value ?? false);
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Plan Seçin:', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              RadioListTile<int>(
                title: const Text('Temel Plan'),
                value: 1,
                groupValue: _radioValue,
                onChanged: (int? value) => setState(() => _radioValue = value),
              ),
              RadioListTile<int>(
                title: const Text('Premium Plan'),
                value: 2,
                groupValue: _radioValue,
                onChanged: (int? value) => setState(() => _radioValue = value),
              ),
            ],
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Yükleme İlerleme Göstergeleri',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  CircularProgressIndicator(),
                  SizedBox(height: 40),
                  LinearProgressIndicator(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

---

# 5. Erişilebilirlik Widget'ları

**Orijinal kaynak:** https://docs.flutter.dev/ui/widgets/accessibility

## Genel Bakış

Flutter'ın erişilebilirlik çerçevesi, Widget Ağacı ve Render Ağacıyla paralel olarak çalışan bir **Semantics (Anlambilim) Ağacı** üzerine kurulmuştur. **TalkBack** (Android) ve **VoiceOver** (iOS) gibi yardımcı teknolojiler, kullanıcı arayüzünü anlamak ve yorumlamak için bu ağaca güvenir. Flutter bu ağacı yönetmek için çeşitli temel widget'lar sağlar.

---

## `Semantics`

**Açıklama:** Erişilebilirlik araçları, arama motorları ve otomasyon yazılımları için widget'ların anlamının açıklamasıyla widget ağacını açıklar. Özel bileşenler veya uygun açıklamalardan yoksun standart widget'lar için meta verileri (etiketler, ipuçları, değerler, roller ve eylemler gibi) açıkça tanımlamanıza olanak tanır.

**Yaygın Özellikler:**
- `label` — Widget'ın metin açıklaması (örn. `"Profil fotoğrafı"`).
- `hint` — Widget'la etkileşim kurulduğunda ne olacağını açıklar (örn. `"Düzenlemek için çift dokunun"`).
- `value` — Widget'ın mevcut durumunu veya değerini açıklar (örn. bir kaydırıcı için `"50%"`).
- `button` — Alt öğeyi tıklanabilir düğme olarak ele alır (`true`/`false`).
- `header` — Metni veya widget'ı bölüm başlığı olarak tanımlar.
- `onTap`, `onLongPress`, `onIncrease`, `onDecrease` — Ekran okuyucular tarafından tetiklenen erişilebilirlik eylemleri.

```dart
Semantics(
  button: true,
  label: 'Sepete ekle',
  hint: 'Bu öğeyi alışveriş sepetinize eklemek için çift dokunun',
  child: IconButton(
    icon: Icon(Icons.add),
    onPressed: () {},
  ),
)
```

---

## `MergeSemantics`

**Açıklama:** Torun widget'larının anlambilimlerini tek bir birleşik anlambilim düğümünde birleştirir. Çoğunlukla bir UI bileşeni, görsel olarak gruplandırılmış birden fazla küçük widget kullanılarak oluşturulur (örn. İkon ve Metin etiketi içeren bir Row). Varsayılan olarak, ekran okuyucu her alt düğümü ayrı ayrı ele alır ve kullanıcıyı birden fazla kez kaydırmaya zorlar. `MergeSemantics`, ekran okuyucunun her şeyi tek bir birleşik öğe olarak duyurması için bunları birleştirir.

```dart
MergeSemantics(
  child: Row(
    children: [
      Icon(Icons.info),
      SizedBox(width: 8),
      Text('Sürüm 1.0.0'),
    ],
  ),
)
```

---

## `ExcludeSemantics`

**Açıklama:** Torunlarının tüm anlambilimlerini erişilebilirlik ağacından kaldırır. Aksi takdirde ekran okuyucu deneyimini karıştıracak veya karmaşıklaştıracak gereksiz, dekoratif veya saf görsel öğeleri (arka plan resimleri, dekoratif ikonlar veya yinelenen metin gibi) gizlemek için kullanışlıdır.

```dart
ExcludeSemantics(
  child: Icon(
    Icons.star,
    color: Colors.amber, // Zaten etiketlenmiş metnin yanındaki salt dekoratif yıldız
  ),
)
```

---

## `BlockSemantics`

**Açıklama:** Aynı anlambilim kapsayıcısında daha önce boyanan tüm widget'ların anlambilimlerini düşürür veya engeller.

**Kullanım Alanı:** Modal yer paylaşımları, iletişim kutuları, uyarılar veya gezinme çekmeceleri için yoğun biçimde kullanılır. Ekranın ana kullanıcı arayüzünün üstüne bir iletişim kutusu veya yan çekmece açıldığında, görsel olarak engellenseler de arka plan öğeleri ekran okuyucular tarafından teknik olarak erişilebilir veya okunabilir durumda olabilir. Modal/çekmece içeriğini `BlockSemantics` içine sarmak, yer paylaşımı kapatılana kadar erişilebilirlik araçlarının arkasındaki her şeyi tamamen yok saymasını sağlar.

**Temel Özellik:**
- `blocking` (bool): Varsayılan değeri `true`'dur. Anlambilim dışlamasının etkin olup olmadığını belirler.

---

## `IndexedSemantics`

**Açıklama:** Bir alt anlambilim düğümünü açık bir anlambilim diziniyle açıklar.

**Kullanım Alanı:** Öncelikle özel kaydırılabilir widget'larda veya listelerde kullanılır. Ekran okuyucular, konum güncellemelerini veya mevcut kaydırma durumlarını duyurmak için anlambilim dizinlerini kullanır (örn. *"10 öğeden 4'ü"*). Standart Flutter kaydırılabilirler (örn. `ListView.builder`) dizinlemeyi otomatik olarak yönetirken, özel düzenler veya özelleşmiş sliver'lar yardımcı araçlara listedeki öğenin dizinini açıkça söylemek için `IndexedSemantics`'e ihtiyaç duyabilir.

**Temel Özellik:**
- `index` (int): Anlambilim liste kapsayıcısındaki öğenin konum dizinini temsil eden tamsayı değeri.

---

## `SemanticsDebugger`

**Açıklama:** Uygulamanızın kullanıcı arayüzünün üstünde anlambilim ağacını görsel olarak katmanlayan bir hata ayıklama aracı (genellikle uygulamanın köküne sarılır). Ekran okuyucuların "gördüğünü" ve okuduğunu gösteren renkli kutular, sınırlar ve metin açıklamalarını doğrudan widget'larınızın üzerine çizer.

```dart
Widget build(BuildContext context) {
  return SemanticsDebugger(
    child: MaterialApp(
      home: HomeScreen(),
    ),
  );
}
```

**Alternatif Hata Ayıklama Yaklaşımı (MaterialApp aracılığıyla):**

```dart
MaterialApp(
  showSemanticsDebugger: true, // Ekranda anlambilim sınırlarını ve etiketleri vurgular
  home: HomeScreen(),
)
```

---

## Erişilebilirlik Widget'ları Özet Tablosu

| Widget | Açıklama |
|--------|----------|
| `Semantics` | Widget ağacını erişilebilirlik araçları için anlam açıklamasıyla işaretler. |
| `MergeSemantics` | Torunlarının anlambilimlerini birleştirir. |
| `ExcludeSemantics` | Torunlarının tüm anlambilimlerini kaldırır. |
| `BlockSemantics` | Aynı kapsayıcıda daha önce boyanan widget'ların anlambilimlerini engeller. |
| `IndexedSemantics` | Açık anlambilim diziniyle açıklar (listeler için). |
| `SemanticsDebugger` | Hata ayıklama için anlambilim ağacını ekranda görselleştirir. |

---

# 6. Animasyon ve Hareket Widget'ları

**Orijinal kaynak:** https://docs.flutter.dev/ui/widgets/animation

## Genel Bakış

Flutter animasyonları genel olarak iki kategoriye ayrılır:
1. **Örtük Animasyonlar (Implicit Animations)** — Özellikleri otomatik olarak geçiş yapan durum odaklı widget'lar; `AnimationController` gerekmez.
2. **Açık / Geçiş Animasyonları (Explicit / Transition Animations)** — `AnimationController`, `Tween` ve `AnimatedBuilder` tarafından yönlendirilen ayrıntılı widget'lar.

---

## Bölüm A: Örtük Animasyon Widget'ları (Durum Odaklı)

Bu widget'lar, durum güncellendiğinde belirli bir `duration` ve `curve` boyunca eski değerlerden yeni değerlere otomatik olarak geçiş yapar.

---

### `AnimatedAlign`

`Align`'ın örtük olarak animasyonlu versiyonu. Alt öğesinin konumunu eski `alignment` değerinden yeni `alignment` değerine sürekli animasyonla geçirir.

**Temel Özellikler:**
- `alignment` (AlignmentGeometry) — Hedef hizalama. Değişmek animasyonu tetikler.
- `duration` (Duration) — Geçiş süresi.
- `curve` (Curve) — Kolaylaştırma eğrisi (örn. `Curves.easeInOut`).
- `child` (Widget) — Yeniden konumlandırılan widget.
- `onEnd` (VoidCallback?) — Animasyon bittiğinde isteğe bağlı geri çağrı.

```dart
class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});
  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
      },
      child: Container(
        width: double.infinity,
        height: 200,
        color: Colors.blueGrey.shade50,
        child: AnimatedAlign(
          alignment: _selected ? Alignment.topRight : Alignment.bottomLeft,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          child: const FlutterLogo(size: 50.0),
        ),
      ),
    );
  }
}
```

---

### `AnimatedContainer`

En çok yönlü örtük animasyon widget'ı. Dolgu, kenar boşluğu, genişlik, yükseklik, renk, şekil ve kenarlıkları eş zamanlı olarak animasyonla geçirebilir.

**Nasıl çalışır:** `setState()` çağrısı içinde bir özelliği değiştirdiğinizde widget, belirtilen `duration` ve `curve` boyunca eski değerden yeni değere otomatik olarak interpolasyon yapar.

```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  curve: Curves.easeInOut,
  width: isExpanded ? 200 : 100,
  height: isExpanded ? 200 : 100,
  color: isExpanded ? Colors.blue : Colors.red,
)
```

---

### `AnimatedCrossFade`

**İki** alt öğe arasında çapraz solma yapar ve boyutlarını eş zamanlı olarak animasyonla geçirir.

```dart
class AnimatedCrossFadeExample extends StatefulWidget {
  const AnimatedCrossFadeExample({super.key});
  @override
  State<AnimatedCrossFadeExample> createState() => _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  bool _isFirst = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 500),
          firstChild: Container(
            color: Colors.amber,
            height: 100,
            width: 100,
            child: const Center(child: Text('İlk Widget')),
          ),
          secondChild: Container(
            color: Colors.cyan,
            height: 150,
            width: 150,
            child: const Center(child: Text('İkinci Widget')),
          ),
          crossFadeState: _isFirst
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() { _isFirst = !_isFirst; });
          },
          child: const Text('CrossFade\'i Değiştir'),
        ),
      ],
    );
  }
}
```

---

### Diğer Örtük Animasyon Widget'ları

| Widget | Açıklama |
|--------|----------|
| `AnimatedDefaultTextStyle` | Torun metin widget'ları için metin stili değişikliklerini otomatik animasyonla geçirir. |
| `AnimatedList` | Öğeler dinamik olarak eklendiğinde veya kaldırıldığında otomatik animasyon yapan kaydırılabilir kapsayıcı. |
| `AnimatedModalBarrier` | Bir modal bariyerin opaklığını/rengini animasyonla geçirir. |
| `AnimatedOpacity` | Alt öğesinin opaklığını (şeffaflığını) düzgünce değiştirir. |
| `AnimatedPadding` | Alt öğesi etrafındaki dolgu değerlerindeki değişiklikleri animasyonla geçirir. |
| `AnimatedPhysicalModel` | Yükseklik, gölge rengi ve kenarlık yarıçapı gibi fiziksel model özelliklerini otomatik animasyonla geçirir. |
| `AnimatedPositioned` | Bir `Stack` içindeki widget'ın konumundaki değişiklikleri otomatik olarak animasyonlar. |
| `AnimatedPositionedDirectional` | `AnimatedPositioned` ile aynı, ancak metin yönüne (LTR/RTL) saygı duyar. |
| `AnimatedRotation` | Bir widget'ı belirtilen sayıda dönüşle düzgünce döndürür. |
| `AnimatedScale` | Bir widget'ın ölçek dönüşümünü (zum içeri/dışarı) düzgünce animasyonlar. |
| `AnimatedSize` | Alt öğesinin düzeni değiştiğinde boyutunu otomatik olarak geçirir. |
| `AnimatedSlide` | Bir widget'ı kesirli ofsetlere göre X ve Y ekseni boyunca öteleme/kaydırma yapar. |
| `AnimatedSwitcher` | Bir alt widget başka bir yenisiyle değiştirildiğinde düzgünce geçiş yapar. |
| `AnimatedTheme` | Uygulama veya widget temalarındaki değişiklikleri otomatik olarak animasyonlar. |

---

## Bölüm B: Açık Animasyon Widget'ları (Kontrolör Odaklı)

### `AnimationController` (Motor)

Ekran her yenilendiğinde `Ticker` tarafından yönlendirilen yeni bir değer (`0.0` ile `1.0` arasında) üretir.

**Yaşam döngüsü gereksinimleri:** Başlatılmalı (genellikle `SingleTickerProviderStateMixin` kullanılarak) ve bellek sızıntılarını önlemek için **her zaman** `dispose()` içinde elden çıkarılmalıdır.

**Yetenekler:** `.forward()`, `.reverse()`, `.repeat()`, `.stop()` çağrılarına izin verir.

---

### `Tween<T>` (Değer Eşleyici)

`AnimationController`'dan ham 0.0–1.0 aralığını alır ve farklı bir aralığa veya veri türüne eşler. Örneğin `Tween<double>(begin: 50.0, end: 200.0)` veya `ColorTween`. `.animate(controller)` aracılığıyla bir kontrolöre bağlanır.

---

### `AnimatedBuilder` (Düzen Oluşturucu)

Bir `Listenable` (animasyon veya `AnimationController` gibi) değer değiştirdiğinde UI'nın bir bölümünü yeniden oluşturmak için tasarlanmış genel amaçlı düzen widget'ı. Her kare değişiminde statik widget alt ağaçlarının gereksiz yere yeniden oluşturulmasını önlemek için `child` parametresini kullanır.

---

### `AnimatedWidget`

Özel animasyonlu widget'lar için soyut temel sınıf. Bir `listenable` (bir `Animation` gibi) ileterek genişletin; Flutter animasyon her tiklendiğinde widget'ı otomatik olarak yeniden oluşturur.

---

### `TweenAnimationBuilder`

Belirtilen bir süre boyunca `Tween` kullanarak herhangi bir özel değeri veya özelliği `begin`'den `end` hedefine animasyonla geçirmenizi sağlayan oluşturucu widget.

---

### Tam Açık Animasyon Örneği (AnimationController + Tween + AnimatedBuilder)

```dart
class PulseWidget extends StatefulWidget {
  const PulseWidget({super.key});
  @override
  State<PulseWidget> createState() => _PulseWidgetState();
}

class _PulseWidgetState extends State<PulseWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // 1. AnimationController'ı başlat
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true); // İleri geri döngü

    // 2. Kontrolör tarafından yönlendirilen 50.0'dan 200.0'a Tween tanımla
    _animation = Tween<double>(begin: 50.0, end: 200.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Kontrolörleri her zaman elden çıkarın!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 3. Kare başına yalnızca kapsayıcıyı yeniden oluşturmak için AnimatedBuilder kullan
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: _animation.value,
          height: _animation.value,
          color: Colors.greenAccent,
        );
      },
    );
  }
}
```

---

## Bölüm C: Geçiş Widget'ları (Açık, `Animation<T>` alır)

| Widget | Açıklama |
|--------|----------|
| `AlignTransition` | Animasyona dayalı hizalama özelliğini geçiren `Align`'ın animasyonlu versiyonu. |
| `DecoratedBoxTransition` | `Decoration`'ın özelliklerini (arka plan rengi, degradeler, kenarlıklar) animasyonlar. |
| `DefaultTextStyleTransition` | Metin stillerini geçiren `DefaultTextStyle`'ın animasyonlu versiyonu. |
| `FadeTransition` | Bir widget'ın opaklığını (solma efekti) animasyonlar. |
| `PositionedTransition` | Göreli bir `Rect` animasyonuna dayalı `Stack` içindeki alt öğenin konumunu animasyonlar. |
| `RotationTransition` | Bir widget'ın dönüş açısını animasyonlar. |
| `ScaleTransition` | Bir widget'ın ölçeğini (zum içeri/dışarı) animasyonlar. |
| `SizeTransition` | Belirli bir eksen boyunca kendi boyutunu animasyonlar. |
| `SlideTransition` | Bir widget'ın konumunu normal konumuna göre bir offset kullanarak animasyonlar. |
| `SliverFadeTransition` | Bir sliver widget'ın opaklığını animasyonlar. |

---

## Bölüm D: Liste / Izgara Animasyon Widget'ları

| Widget | Açıklama |
|--------|----------|
| `AnimatedList` | Öğeler dinamik olarak eklendiğinde veya kaldırıldığında animasyonları otomatik tetikleyen özel liste görünümü. |
| `SliverAnimatedList` | Özel kaydırma görünümlerinde kullanım için `AnimatedList`'in sliver eşdeğeri. |
| `AnimatedGrid` | Öğeler eklendiğinde veya kaldırıldığında animasyon yapan ızgara kapsayıcısı. |
| `SliverAnimatedGrid` | `AnimatedGrid`'in sliver eşdeğeri. |

---

## Bölüm E: Özel Hareket Widget'ları

### `Hero`

Material Design "Hero" animasyon desenini uygular; gezinme sırasında bir UI öğesini (görsel veya kart gibi) bir ekrandan diğerine sorunsuzca geçirmenize olanak tanır.

---

## Karar Rehberi (Örtük vs Açık)

- Standart UI geçişlerinin yaklaşık %80'i için **`AnimatedContainer`** kullanın — minimum şablon kodu.
- Sürekli döngüler, birden fazla widget arasında senkronizasyon, manuel hareket tabanlı kaydırma veya karmaşık özel render gerektiğinde **`AnimationController` + `Tween` + `AnimatedBuilder`** kullanın.

---

# 7. Varlıklar, Görseller ve İkonlar

**Orijinal kaynak:** https://docs.flutter.dev/ui/widgets/assets

## Genel Bakış

Flutter'ın varlık sistemi, uygulamayla birlikte paketlenen statik kaynakları ve ağdan, dosya sisteminden ve bellekten yüklenen görselleri yönetir.

---

## `Image`

Çeşitli kaynaklardan görsel görüntülemek için birincil çok yönlü widget. Birden fazla yapıcıyı destekler:

- **`Image.asset()`** — Uygulama paketine yerleştirilmiş yerel görselleri yükler (`pubspec.yaml`'da bildirilmiş).
- **`Image.network()`** — Görselleri URL aracılığıyla internet üzerinden dinamik olarak yükler.
- **`Image.file()`** — Cihazın yerel dosya sisteminden görselleri yükler.
- **`Image.memory()`** — Ham görsel baytlarını (`Uint8List`) doğrudan bellekten yükler.

```dart
const Image(
  image: NetworkImage('https://example.com/image.jpg'),
)
```

**pubspec.yaml yapılandırması (Image.asset için gereklidir):**

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
```

---

## `AssetBundle`

**Açıklama:** Uygulama tarafından gereken statik kaynakları (görseller, yazı tipleri, JSON dosyaları) yöneten merkezi depo arayüzü.

**Temel Alt Sınıflar/Örnekler:**
- **`rootBundle`** — Derlemeyle paketlenmiş varlıklara erişmek için kullanılan global statik nesne (`package:flutter/services.dart`).
- **`DefaultAssetBundle`** — `rootBundle`'ı doğrudan çağırmak yerine pakete erişmenin güçlü biçimde tavsiye edilen yolu (`DefaultAssetBundle.of(context)` aracılığıyla). Ata widget'larının çalışma zamanında özel veya geçersiz kılınmış varlık paketleri enjekte etmesine olanak tanır.

---

## `NetworkImage`

**Açıklama:** Belirtilen URL ağ uç noktasından ham görsel verilerini almaktan sorumlu bir `ImageProvider` (doğrudan widget değil). Aynı URL'lerin daha önce indirilen görsel akışlarını verimli biçimde yeniden kullanması için önbelleği yönetir.

```dart
const Image(
  image: NetworkImage('https://example.com/image.jpg'),
)
```

---

## `AssetImage`

**Açıklama:** Derleme zamanında uygulama ile yerel olarak paketlenmiş görsel varlıklarını yükler.

**Özellik:** Çözünürlük farkında — hedef cihazın piksel oranıyla eşleşen en uygun varlık varyantını otomatik olarak seçer (örn. `1.5x`, `2.0x`, `3.0x`).

```dart
Image(image: AssetImage('assets/images/logo.png'))
// Veya kolaylık yapıcısı kullanarak:
Image.asset('assets/images/logo.png')
```

---

## `MemoryImage`

**Açıklama:** Bellekte depolanan ham bayt verilerinden (`Uint8List`) görselleri görüntüler.

**Kullanım Alanları:** Anında işlenen kullanıcı yüklü resimleri oluşturma, dinamik olarak oluşturulan grafikleri (QR kodları gibi) görüntüleme, yerel veritabanından baytları yükleme.

```dart
Uint8List imageBytes = ...;
Image(image: MemoryImage(imageBytes))
// Veya kolaylık yapıcısı kullanarak:
Image.memory(imageBytes)
```

---

## `FileImage`

**Açıklama:** Cihazın yerel dosya sistemindeki standart bir dosyadan görselleri yükler.

**Kullanım Alanları:** `image_picker` aracılığıyla seçilen görselleri (cihaz galerisinden veya kameradan) ya da uygulamanın yerel uygulama belgeleri dizinine kaydedilen dosyaları görüntüleme.

```dart
File imageFile = File('/path/to/image.png');
Image(image: FileImage(imageFile))
// Veya kolaylık yapıcısı kullanarak:
Image.file(imageFile)
```

---

## `ImageProvider<T>`

**Açıklama:** Görsel verilerinin nasıl alınacağını veya çözüleceğini tanımlayan soyut temel sınıf. Görseli doğrudan görüntülemez — `Image`, `CircleAvatar` veya `DecorationImage` gibi widget'lara ham görsel verileri sağlayan bir köprü işlevi görür.

**Temel Alt Sınıflar:** `AssetImage`, `NetworkImage`, `FileImage`, `MemoryImage`, `ExactAssetImage`, `ResizeImage`.

---

## `ImageStream`

**Açıklama:** Etkin olarak yüklenen veya yüklenmiş somut görsel verilerine bir tanıtıcı.

**Veri Akışı:**
```
[pubspec.yaml / Baytlar / Dosya]
           │
           ▼
   (ImageProvider'lar)
   • AssetImage       ──┐
   • MemoryImage      ──┼──► .resolve() aracılığıyla veri düzeni yönergeleri sağlar
   • FileImage        ──┤
   • NetworkImage     ──┘
           │
           ▼
     [ImageStream]  ──► Asenkron yükleme yaşam döngüsünü yönetir
           │
           ▼
[Image.asset() / Image.memory() / Image.file()] ──► Ekranda render eder
```

---

## `FadeInImage`

**Açıklama:** Hedef görsel verisi yüklenirken yer tutucu görsel görüntüleyen ve kullanılabilir hale gelince son görsele düzgünce geçen (solarak görünen) widget.

**Kullanım Alanı:** Kaydırma veya internet üzerinden görsel yüklenirken rahatsız edici boş alanları veya ani belirmeleri önlemek için ağ görsellerini yüklemede yaygın olarak kullanılır.

---

## `Icon`

**Açıklama:** Bir yazı tipinden glif kullanılarak çizilen grafik ikon widget'ı (Material Design ikonları gibi).

**Kullanım Alanı:** Uygulama genelinde standart ikonları görüntüler (örn. `Icon(Icons.home)`, `Icon(Icons.settings)`). Ortam `IconTheme`'ine (renk, boyut için) otomatik olarak saygı duyar ve ekran okuyucular için anlambilim etiketlerini destekler.

---

## `RawImage`

**Açıklama:** Ham dart UI görselini (`dart:ui.Image`) doğrudan görüntüleyen düşük seviyeli widget.

**Kullanım Alanı:** Standart `Image` widget'ının aksine (varlıklar, dosyalar veya ağ URL'lerinden otomatik olarak yükleme yapar), `RawImage`, bellekte zaten düşük seviyeli, çözülmüş bir görsel nesneniz olduğunda kullanılır.

---

## Varlık Widget'ları Özet Tablosu

| Widget | Açıklama |
|--------|----------|
| `Image` | Varlık, ağ, dosya veya bellekten görsel görüntüler. |
| `AssetBundle` | Paketlenmiş uygulama varlıklarını yönetir. |
| `NetworkImage` | Ağ URL'leri için ImageProvider. |
| `AssetImage` | Paketlenmiş varlıklar için çözünürlük farkında ImageProvider. |
| `MemoryImage` | Bellekteki ham baytlardan ImageProvider. |
| `FileImage` | Cihaz dosya sisteminden ImageProvider. |
| `ImageProvider<T>` | Tüm görsel kaynakları için soyut temel sınıf. |
| `ImageStream` | Yükleme/yüklenmiş görsel verilerine tanıtıcı. |
| `FadeInImage` | Yer tutucu + yüklenen görsele solma geçişi. |
| `Icon` | Yazı tipinden glif ikonu (örn. Material ikonları). |
| `RawImage` | `dart:ui.Image`'ın düşük seviyeli görüntülenmesi. |

---

# 8. Asenkron Widget'lar

**Orijinal kaynak:** https://docs.flutter.dev/ui/widgets/async

## Genel Bakış

Flutter, `Future`'lar ve `Stream`'ler gibi asenkron hesaplamaların yaşam döngüsüne dayalı reaktif kullanıcı arayüzleri oluşturmaya yardımcı olmak için özelleşmiş **asenkron widget'lar** sağlar. İki birincil widget **`FutureBuilder`** ve **`StreamBuilder`**'dır. Her ikisi de hesaplama durumunu temsil etmek için **`AsyncSnapshot`** nesnesini ve **`ConnectionState`** enum'unu kullanır.

---

## `FutureBuilder<T>`

**Açıklama:** Bir `Future`'ı değerlendiren ve o `Future` ile en son etkileşim anlık görüntüsüne dayalı olarak kendini yeniden oluşturan widget. REST API'sinden veri alma, yerel dosya okuma veya veritabanı sorgulama gibi tek seferlik asenkron işlemler için idealdir.

```dart
Future<String> fetchData() async {
  // Ağ gecikmesini simüle et
  await Future.delayed(const Duration(seconds: 2));
  return "Future'dan merhaba!";
}

@override
Widget build(BuildContext context) {
  return FutureBuilder<String>(
    future: fetchData(), // Future döndüren işlev
    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      // Future'ın durumunu kontrol et
      switch (snapshot.connectionState) {
        case ConnectionState.none:
        case ConnectionState.waiting:
          return const CircularProgressIndicator(); // Yükleme durumu

        case ConnectionState.active:
        case ConnectionState.done:
          if (snapshot.hasError) {
            return Text('Hata: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return Text('Veri: ${snapshot.data}');
          } else {
            return const Text('Veri mevcut değil');
          }
      }
    },
  );
}
```

---

## `StreamBuilder<T>`

**Açıklama:** Bir `Stream`'e bağlanır ve akış yeni bir olay, değer veya hata yaydığında yeniden oluşturur. Gerçek zamanlı sohbet mesajları, Firebase Firestore belge güncellemeleri, GPS izleme veya WebSockets gibi sürekli, çok değerli veri akışları için tasarlanmıştır.

```dart
Stream<int> counterStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}

@override
Widget build(BuildContext context) {
  return StreamBuilder<int>(
    stream: counterStream(), // Dinlenen Stream
    initialData: 0,          // İsteğe bağlı başlangıç verisi
    builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
      if (snapshot.hasError) {
        return Text('Hata: ${snapshot.error}');
      }

      switch (snapshot.connectionState) {
        case ConnectionState.none:
          return const Text('Akış bağlı değil');
        case ConnectionState.waiting:
          return const Text('Akış verisi bekleniyor...');
        case ConnectionState.active:
          return Text('Canlı Sayım: ${snapshot.data}');
        case ConnectionState.done:
          return const Text('Akış kapatıldı');
      }
    },
  );
}
```

---

## `AsyncSnapshot<T>`

**Açıklama:** Asenkron bir hesaplamayla (`Future` veya `Stream` gibi) en son etkileşimin değişmez bir temsili. Hem `FutureBuilder` hem de `StreamBuilder`, oluşturucu işlevlerine bir `AsyncSnapshot` nesnesi iletir.

**Temel Özellikler ve Alıcılar:**
- `connectionState` (`ConnectionState`) — Asenkron göreve bağlantının mevcut durumu.
- `data` (`T?`) — Asenkron hesaplamadan alınan en son veri.
- `error` (`Object?`) — Yürütme sırasında oluşan en son hata nesnesi (varsa).
- `hasData` (`bool`) — `data` null olmayan bir değere sahipse doğrudur.
- `hasError` (`bool`) — Hata nesnesi mevcutsa doğrudur.
- `requireData` (`T`) — Veri null değilse döndürür; aksi takdirde `StateError` fırlatır.

---

## `ConnectionState` Enum'u

**Açıklama:** Asenkron görevin yaşam döngüsü aşamasını izler.

**Değerler ve anlamları:**

1. **`ConnectionState.none`**
   - Anlam: Herhangi bir asenkron hesaplamaya bağlı değil.
   - Yaygın neden: Oluşturucuya iletilen `future` veya `stream` özelliği şu anda `null`'dur.

2. **`ConnectionState.waiting`**
   - Anlam: Bir hesaplamaya bağlı, ancak şu anda etkileşim/veri bekleniyor.
   - Yaygın neden: Future tetiklendi, ancak henüz tamamlanmadı. Genellikle `data == null` verir.

3. **`ConnectionState.active`**
   - Anlam: Etkin, devam eden bir hesaplamaya bağlı.
   - Yaygın neden: `StreamBuilder` ile yoğun biçimde kullanılır. Akışın en az bir değer yaydığını ancak hâlâ açık olduğunu ve daha fazlasını dinlediğini belirtir.

4. **`ConnectionState.done`**
   - Anlam: Sonlandırılmış/tamamlanmış bir hesaplamaya bağlı.
   - Yaygın neden: Future yürütmeyi tamamladı (veri döndürerek veya hata fırlatarak) ya da Stream kapatıldı.

---

## Alternatif FutureBuilder Deseni (daha temiz koşullu stil)

```dart
Future<String> fetchUserData() async {
  await Future.delayed(const Duration(seconds: 2));
  return "Merhaba, Flutter!";
}

@override
Widget build(BuildContext context) {
  return FutureBuilder<String>(
    future: fetchUserData(),
    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      // 1. Bekleme durumunu işle
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      // 2. Hata durumunu işle
      if (snapshot.hasError) {
        return Center(child: Text('Hata: ${snapshot.error}'));
      }

      // 3. Veri/başarı durumunu işle
      if (snapshot.hasData) {
        return Center(child: Text(snapshot.data!));
      }

      // 4. ConnectionState.none veya boş durumlar için geri dönüş
      return const Center(child: Text('Veri mevcut değil'));
    },
  );
}
```

---

## En İyi Uygulamalar ve Yaygın Tuzaklar

> **Uyarı — `build()` İçinde Future/Stream Oluşturmaktan Kaçının:**
> `future` veya `stream`'i widget'ın `build()` yöntemi içinde doğrudan tanımlarsanız, widget her yeniden oluşturulduğunda (örn. `setState` çağrıldığında) asenkron işlemi **yeniden tetikleyecek ve yeniden başlatacaktır**. Future'larınızı/Stream'lerinizi her zaman `initState()` içinde önbelleğe alın veya durum değişkeninde saklayın.

**Her Zaman Durumları Açıkça Yönetin:**
Uygulamanızın dayanıklı olmasını ve açık UI geri bildirimi sağlamasını sağlamak için her zaman yükleme göstergelerini (`ConnectionState.waiting`) ve hata koşullarını (`snapshot.hasError`) yönetin.

**FutureBuilder vs StreamBuilder:**
- Tek seferlik asenkron işlemler için **`FutureBuilder`** kullanın (API çağrısı, dosya okuma, DB sorgusu).
- Sürekli, çok değerli veri akışları için **`StreamBuilder`** kullanın (gerçek zamanlı güncellemeler, WebSocket, GPS, Firebase).

---

## Asenkron Widget'lar Özet Tablosu

| Widget | Açıklama |
|--------|----------|
| `FutureBuilder<T>` | Future'ın anlık görüntüsüne dayalı UI oluşturur. |
| `StreamBuilder<T>` | Stream'in anlık görüntülerine dayalı UI oluşturur. |
| `AsyncSnapshot<T>` | Asenkron hesaplama durumunun değişmez anlık görüntüsü. |
| `ConnectionState` (enum) | `none`, `waiting`, `active`, `done` yaşam döngüsü durumları. |

---

# 9. Temel Widget'lar

**Orijinal kaynak:** https://docs.flutter.dev/ui/widgets/basics

## Genel Bakış

Flutter'da **"her şey bir widget'tır"**. Widget'lar, kullanıcı arayüzünüzün değişmez planını oluşturur; yapısal düzenden (`Row`, `Column`) görsel öğelere (`Text`, `Button`) ve stiline kadar her şeyi tanımlar. Flutter bu nesneleri hiyerarşik bir **Widget Ağacı** içinde düzenler. UI bildirimsel biçimde oluşturulur: uygulama durumu değiştiğinde Flutter widget ağacını yeniden oluşturur.

Her Flutter uygulaması `main()` işlevinde başlar. Uygulamayı başlatmak için kök widget'ınızı `runApp()` işlevine iletirsiniz:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
```

- **`main()`** — Herhangi bir Dart uygulamasının zorunlu başlangıç noktası.
- **`runApp()`** — Verilen Widget'ı alır ve onu widget ağacının kökü yapar.

---

## `Text`

Tek bir stille metin dizisi. Ekranda string'leri görüntülemek için kullanılır.

**Temel Özellikler:**
- `style` — Yazı tipleri, renkler, kalınlıklar için `TextStyle` kabul eder.
- `textAlign`
- `maxLines`
- `overflow`

```dart
Text(
  'Merhaba, Flutter!',
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
)
```

---

## `Container`

Yaygın boyama, konumlandırma ve boyutlandırma widget'larını birleştiren kolaylık widget'ı. Web geliştirmedeki `<div>` gibi dolgu, kenar boşlukları, kenarlıklar, arka planlar ve boyutlar için kullanılan esnek bir kutu gibi düşünün.

**Temel Özellikler:**
- `width`, `height`
- `padding`, `margin`
- `decoration`
- `color`
- `child`

```dart
Container(
  padding: EdgeInsets.all(16.0),
  color: Colors.amber,
  child: Text('Container İçinde'),
)
```

---

## `Row`

Alt widget listesini **yatay** yönde düzenleyen çok alt öğeli düzen widget'ı.

**Temel Özellikler:**
- `children`
- `mainAxisAlignment` — Yatay hizalama (örn. `MainAxisAlignment.spaceAround`, `center`, `spaceBetween`)
- `crossAxisAlignment` — Dikey hizalama

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Text('Öğe 1'),
    Text('Öğe 2'),
  ],
)
```

---

## `Column`

Alt widget listesini **dikey** yönde düzenleyen çok alt öğeli düzen widget'ı.

**Temel Özellikler:**
- `children`
- `mainAxisAlignment` — Dikey hizalama
- `crossAxisAlignment` — Yatay hizalama

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('Başlık'),
    Text('Alt Başlık'),
  ],
)
```

---

## `Scaffold`

Temel Material Design düzen yapısı widget'ı. Uygulama çubukları, çekmeceler, snack bar'lar ve alt gezinme gibi modern mobil uygulamalara standart görsel yapılar için API'lar ve varsayılan yuvalar sağlar.

**Temel Özellikler:**
- `appBar`
- `body`
- `floatingActionButton`
- `drawer`
- `bottomNavigationBar`

```dart
Scaffold(
  appBar: AppBar(title: Text('Uygulama Başlığım')),
  body: Center(child: Text('Merhaba Dünya')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
)
```

---

## `AppBar`

Genellikle bir uygulama ekranının üstünde görünen Material Design üst uygulama çubuğu (`Scaffold.appBar`). Genellikle araç çubuğu, başlık, başlangıç gezinme düğmesi ve eylem düğmeleri içerir.

```dart
AppBar(
  title: Text('Ana Sayfam'),
  actions: [
    IconButton(icon: Icon(Icons.search), onPressed: () {}),
  ],
)
```

---

## `Image`

Çeşitli görsel biçimlerini render etmeye adanmış widget.

**Yaygın Yapıcılar:**
- `Image.asset('path/to/image.png')` — `pubspec.yaml`'da tanımlanan yerel proje varlıklarından görsel yükler.
- `Image.network('https://example.com/image.jpg')` — Bir URL'den doğrudan görsel yükler.

```dart
Image.asset('assets/logo.png', width: 100, height: 100)
```

---

## `Icon`

Material Design ikon kütüphanesinden glif kullanarak grafik ikon render eder.

```dart
Icon(Icons.home, color: Colors.blue, size: 30.0)
```

---

## Düğme Widget'ları

> **Not:** `RaisedButton`, `FlatButton` ve `OutlineButton` gibi eski düğme türleri kullanımdan kaldırılmış ve modern muadilleriyle değiştirilmiştir (`ElevatedButton`, `TextButton` ve `OutlinedButton`).

### `ElevatedButton`

Malzeme yüksekliği gölgesiyle yükseltilen doldurulmuş düğme. Birincil veya önemli eylemler için kullanılır (örn. "Gönder", "Giriş Yap").

```dart
ElevatedButton(
  onPressed: () { /* Eylem */ },
  child: Text('Tıkla'),
)
```

### `TextButton`

Varsayılan olarak arka plan dolgusu veya kenarlık olmayan düz, metin tabanlı düğme. Daha az belirgin veya ikincil eylemler için en iyi kullanılır (örn. "İptal", "Daha Fazla Öğren").

```dart
TextButton(
  onPressed: () { /* Eylem */ },
  child: Text('İptal'),
)
```

### `OutlinedButton`

Belirgin kenarlık anahat ve saydam arka plana sahip düğme. Genellikle `TextButton`'dan daha fazla görsel ağırlık gerektiren ikincil eylemler için kullanılır.

```dart
OutlinedButton(
  onPressed: () { /* Eylem */ },
  child: Text('Kayıt Ol'),
)
```

### `IconButton`

Basıldığında mürekkep sıçrama animasyonuyla tıklanabilir ikon görüntüleyen özel düğme. Genellikle `AppBar.actions` satırında veya araç çubuklarında kullanılır.

```dart
IconButton(
  icon: Icon(Icons.settings),
  onPressed: () { /* Eylem */ },
)
```

---

## Widget Durum Mimarisi

Flutter'da UI bildirimsel biçimde oluşturulur. Widget'lar, durum koruyup korumadıklarına göre iki birincil sınıflandırmaya ayrılır.

### `StatelessWidget`

- **Tanım:** Değiştirilebilir duruma ihtiyaç duymayan widget. Değişmezdir; bir kez örneklendiğinde özellikleri değişemez.
- **Ne zaman kullanılır:** Kullanıcı etkileşimine veya veri akışlarına göre dinamik olarak değişmeyen statik UI bileşenleri için (örn. statik ikon, sabit başlık etiketi veya şablon düzen kartı).

```dart
class MyStaticHeader extends StatelessWidget {
  const MyStaticHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Hoş Geldiniz!');
  }
}
```

### `StatefulWidget`

- **Tanım:** Değiştirilebilir duruma sahip widget. Zaman içinde veri değişikliklerini dinamik olarak izler ve veri güncellendiğinde `setState()` aracılığıyla UI yeniden oluşturmayı zorlar.
- **Temel Yapı:** İki sınıf gerektirir:
  1. `StatefulWidget`'ın kendisi (değişmez ve durum nesnesini oluşturur).
  2. Eşlik eden `State<T>` alt sınıfı (değiştirilebilir mantığın ve `build()` yönteminin yaşadığı yer).

```dart
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++; // UI yeniden oluşturmayı tetikler
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Sayım: $_counter'),
        ElevatedButton(
          onPressed: _increment, 
          child: Text('Artır'),
        ),
      ],
    );
  }
}
```

---

## Tam Şablon Örneği (Temel Sayfa)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widget Kataloğu Temelleri',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold görsel yapısal düzen çerçevesini sağlar
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temel Katalog Örneği'),
      ),
      body: const Center(
        // Column alt öğeleri dikey olarak yığar
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter Temellerine Hoş Geldiniz!'),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: null, // Örnek için devre dışı durumu
              child: Text('Tıkla'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

# 10. Girdi Widget'ları

**Orijinal kaynak:** https://docs.flutter.dev/ui/widgets/input

## Genel Bakış

Flutter, serbest biçimli metinden ikili geçişlere, sayısal aralıklara ve yapılandırılmış seçimlere kadar kullanıcı verilerini yakalamak için tasarlanmış kapsamlı bir girdi widget seti sağlar. Girdi widget'ları `widgets` kütüphanesi, `material` kütüphanesi ve `cupertino` kütüphanesi arasında düzenlenir.

---

## Metin Giriş Widget'ları

### `TextField`

Kullanıcıların metin yazmasına ve düzenlemesine (tek satırlı veya çok satırlı) olanak tanıyan standart, en yaygın kullanılan metin giriş widget'ı.

**Temel Özellikler:**
- `InputDecoration` aracılığıyla yüksek düzeyde özelleştirilebilir görünüm (kenarlıklar, etiketler, ipuçları, ikonlar ve yardımcı metin için).
- `TextEditingController` kullanılarak yönetilir.
- `TextFormField` içine sarılmadığı sürece bir `Form` durum doğrulama ağacına içsel olarak ait değildir.

```dart
TextField(
  controller: _controller,
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Adınızı girin',
    hintText: 'örn. Ahmet Yılmaz',
  ),
)
```

---

### `TextFormField`

Üst `Form` widget'ıyla entegre olacak şekilde özel olarak tasarlanmış `TextField` etrafında özelleşmiş sarmalayıcı.

**Temel Özellikler:**
- Tüm `TextField` stil özelliklerini devralır.
- Yerleşik form doğrulama özellikleri ekler (`validator` geri çağrısı).
- `FormState` aracılığıyla birleşik kaydetme/sıfırlama davranışları.

```dart
TextFormField(
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Lütfen bir metin girin';
    }
    return null;
  },
  decoration: InputDecoration(
    labelText: 'E-posta',
    hintText: 'E-postanızı girin',
  ),
)
```

---

### `EditableText` (Düşük Seviye)

`TextField` ve `CupertinoTextField` gibi üst düzey metin alanlarının kalbinde yer alan düşük seviyeli, temel metin düzenleme kontrolü. Sistemin `TextInput` hizmetiyle doğrudan etkileşim kurar.

> **Kullanım:** Özel bir tasarım sistemi veya sıfırdan tamamen özel bir metin giriş yüzeyi oluşturmadığınız sürece nadiren doğrudan kullanılır.

---

## Yapısal Form Kapsayıcıları

### `Form`

Birden fazla form alanı widget'ını (örn. `TextFormField` veya özel `FormField`'lar) bir araya getiren isteğe bağlı kapsayıcı widget.

**Temel Özellikler:**
- `GlobalKey<FormState>` kullanarak alt alanlar arasında toplu işlemlere olanak tanıyan kapsayıcı işlevi görür.
- Tüm kapalı girişleri eş zamanlı olarak kolayca **doğrulamanıza**, **kaydetmenize** veya **sıfırlamanıza** olanak tanır.

```dart
final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) return 'Gerekli';
          return null;
        },
      ),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Tüm alanlar geçerli — devam et
          }
        },
        child: Text('Gönder'),
      ),
    ],
  ),
)
```

---

### `FormField<T>`

Bir form alanının durumunu koruyan tek genel temel widget.

**Amaç:** `TextFormField` gibi widget'lar tarafından kullanılır. Kullanıcı girişi, mevcut durum değerleri ve doğrulama hata mesajları arasındaki etkileşimi yönetir.

---

## Seçim ve Boolean Widget'ları

### `Checkbox`

Kullanıcıların bir seçeneği işaretlemesine veya işaretini kaldırmasına olanak tanıyan ikili seçim widget'ı (genellikle çoktan seçmeli listeler veya anlaşma kutuları için kullanılır).

```dart
bool _isChecked = false;

Checkbox(
  value: _isChecked,
  onChanged: (bool? value) {
    setState(() {
      _isChecked = value!;
    });
  },
)
```

---

### `Radio<T>`

Kullanıcının bir gruptan yalnızca **bir** öğe seçebildiği birbirini dışlayan seçenekler kümesi sunar.

```dart
Radio<String>(
  value: 'secenek1',
  groupValue: _selectedValue,
  onChanged: (String? value) {
    setState(() {
      _selectedValue = value!;
    });
  },
)
```

---

### `Switch`

Bir seçeneği veya boolean ayarı açık veya kapalı arasında değiştirmek için kullanılan kayan geçiş widget'ı.

```dart
Switch(
  value: _isSwitched,
  onChanged: (bool value) {
    setState(() {
      _isSwitched = value;
    });
  },
)
```

---

## Aralık Giriş Widget'ları

### `Slider`

Kullanıcıların bir başparmağı parça boyunca sürükleyerek sürekli veya ayrık bir aralıktan sayısal değer seçmesine olanak tanır (örn. ses veya parlaklık kontrolleri).

```dart
Slider(
  value: _currentSliderValue,
  min: 0,
  max: 100,
  divisions: 5,
  label: _currentSliderValue.round().toString(),
  onChanged: (double value) {
    setState(() {
      _currentSliderValue = value;
    });
  },
)
```

### `RangeSlider`

`Slider` gibi, ancak kullanıcının bir aralık seçmesine (iki başparmak — başlangıç ve bitiş değerleri) olanak tanır.

---

## Açılır Girdi

### `DropdownButton<T>`

Kullanıcının açılır menü kullanarak önceden tanımlanmış küçük seçenek listesinden tek bir değer seçmesine olanak tanır.

```dart
String? selectedValue = 'Seçenek 1';

DropdownButton<String>(
  value: selectedValue,
  hint: const Text('Bir seçenek seçin'),
  items: <String>['Seçenek 1', 'Seçenek 2', 'Seçenek 3'].map((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
  onChanged: (String? newValue) {
    setState(() {
      selectedValue = newValue;
    });
  },
)
```

---

## Tarih ve Saat Seçicileri

### `showDatePicker`

Yerel Material takvim iletişim kutusu açan asenkron işlev. Kullanıcı bir tarih seçtiğinde veya iptal ettiğinde çözümlenen `Future<DateTime?>` döndürür.

```dart
Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );
  
  if (picked != null) {
    setState(() {
      // Seçilen tarihi işle
    });
  }
}
```

### `showTimePicker`

Asenkron Material saat iletişim kutusu tetikler. `hour` ve `minute` özelliklerini içeren `TimeOfDay` nesnesi sağlayan `Future<TimeOfDay?>` döndürür.

```dart
Future<void> _selectTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (picked != null) {
    setState(() {
      // Seçilen saati işle (örn. picked.format(context))
    });
  }
}
```

---

## `Autocomplete<T>`

Kullanıcı bir metin alanına yazarken öneri seçeneklerinin listesini görüntülemek için kullanılan esnek, genel widget.

```dart
const List<String> _kOptions = <String>[
  'Elma',
  'Muz',
  'Kiraz',
  'Hurma',
  'Üzüm',
];

Autocomplete<String>(
  optionsBuilder: (TextEditingValue textEditingValue) {
    if (textEditingValue.text == '') {
      return const Iterable<String>.empty();
    }
    return _kOptions.where((String option) {
      return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
    });
  },
  onSelected: (String selection) {
    debugPrint('$selection seçildi');
  },
)
```

---

## Platform'a Özgü (Cupertino) Girdi Widget'ları

### `CupertinoTextField`

Yerel `UITextField` ve düzenlenebilir `UITextView` kontrollerinin tasarım kurallarıyla eşleşen Apple iOS tarzı metin giriş widget'ı. Yerel iOS metin seçim menüleri, büyüteçler, temizleme düğmeleri, önek/sonek widget'lar ve yuvarlak kenarlıklar için yerleşik destek sağlar.

**Yardımcı Widget'lar:**
- `CupertinoTextFormFieldRow` — Bir `CupertinoTextField`'i form doğrulamasıyla entegre eder.
- `CupertinoSearchTextField` — Yer tutucu metin, arama ikonu ve temizleme düğmesi içeren özel arama tarzı varyant.

---

## Girdi Widget'ları Taksonomi Tablosu

| Kategori | Material | Cupertino | Çekirdek |
|----------|----------|-----------|----------|
| Metin Girişi | `TextField`, `TextFormField` | `CupertinoTextField`, `CupertinoTextFormFieldRow`, `CupertinoSearchTextField` | `EditableText` |
| Boolean | `Checkbox`, `CheckboxListTile`, `Switch`, `SwitchListTile` | — | — |
| Seçim | `Radio`, `RadioListTile`, `DropdownButton`, `DropdownButtonFormField` | — | — |
| Aralık | `Slider`, `RangeSlider` | `CupertinoSlider` | — |
| Eylem Düğmeleri | `ElevatedButton`, `TextButton`, `OutlinedButton`, `IconButton`, `FloatingActionButton` | `CupertinoButton` | — |
| Tarih/Saat | `showDatePicker`, `showTimePicker` | `CupertinoDatePicker`, `CupertinoTimerPicker` | — |
| Form Kapsayıcısı | `Form`, `FormField<T>` | — | — |
| Otomatik Tamamlama | `Autocomplete<T>` | — | — |

**İlgili bağlantılar:**
- [Formlar ve Doğrulama](https://docs.flutter.dev/cookbook/forms/validation)

---

# 11. Etkileşim Modeli Widget'ları

**Orijinal kaynak:** https://docs.flutter.dev/ui/widgets/interaction

## Genel Bakış

Flutter'da etkileşim modeli widget'ları, kullanıcıların uygulamaya nasıl dokunduğunu, tıkladığını, sürüklediğini ve etkileşim kurduğunu yönetir. Ham işaretçi olaylarını anlambilimsel hareketlere (dokunmalar, çift dokunmalar, uzun basmalar, panning, ölçeklendirme, sürüklemeler) çevirir ve görsel geri bildirim ya da veri iletim mekanizmaları sağlar.

**İlgili bağlantılar:**
- [Hareketler](https://docs.flutter.dev/ui/interactivity/gestures)

---

## Hareket Algılama

### `GestureDetector`

Ham işaretçi olaylarını algılayan ve anlambilimsel hareketlere çeviren görsel olmayan, düşük seviyeli temel widget (dokunmalar, çift dokunmalar, uzun basmalar, panning, ölçeklendirme ve yatay/dikey sürüklemeler gibi).

**Görsel Geri Bildirim:** Yok. Bir alt widget'ı sarar ve görünümünü değiştirmeden hareketleri dinler (renk değişikliği yok, dalgalanma yok).

**Tasarım Sistemi Bağımsız:** Çekirdek `widgets` kütüphanesine (`package:flutter/widgets.dart`) aittir ve Material Design atası gerektirmez.

**İsabet Test Davranışı (`behavior`):**
- `HitTestBehavior.deferToChild` *(Varsayılan)*: Alt öğenin gerçekten piksel boyayan yalnızca bölümleri dokunuşlara yanıt verir.
- `HitTestBehavior.opaque`: Tüm sınırlayıcı kutu dokunuşları yakalar, altındaki widget'ları engeller.
- `HitTestBehavior.translucent`: Tüm sınırlayıcı kutu dokunuşları yakalar, ancak altındaki widget'lar yine de bunları alabilir.

```dart
GestureDetector(
  onTap: () {
    print('Kapsayıcıya dokunuldu!');
  },
  child: Container(
    color: Colors.blue,
    width: 100,
    height: 100,
    child: const Center(child: Text('Dokun')),
  ),
);
```

**Yaygın geri çağrılar:**
- `onTap` — Tek dokunma
- `onDoubleTap` — Çift dokunma
- `onLongPress` — Uzun basma
- `onPanUpdate` — Sürükleme/panning hareketi
- `onScaleUpdate` — Sıkıştırarak zum yapma

---

### `InkWell`

Standart görsel dokunma geri bildirimi — özellikle Material kurallarıyla tanımlanan imza **mürekkep sıçrama (ripple) animasyonu** ve vurgulama efektleri — sağlamak için `GestureDetector`'ı saran özelleşmiş Material Design widget'ı.

**Görsel Geri Bildirim:** Dokunma noktasından başlayan genişleyen mürekkep dalgalanması oluşturur.

**Material Gereksinimi:** Mürekkep efektlerini düzgün biçimde render etmek için widget ağacında `Material` widget atasına sahip olmalıdır.

```dart
Card(
  child: InkWell(
    onTap: () {
      print('Kart dalgalanma efektiyle dokunuldu!');
    },
    child: const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text('Material Kartı'),
    ),
  ),
);
```

---

## Sürükleme ve Bırakma

### `Draggable<T>`

Başlangıç konumundan bir `DragTarget`'a sürüklenebilen widget. Kullanıcı sürüklemeye başladığında işaretçiyi/parmağı izleyen özelleştirilebilir `feedback` widget'ı görüntüler.

```dart
Draggable<String>(
  data: 'OgeVerisi',
  // Kullanıcının parmağını sürüklerken takip eden widget:
  feedback: Material(
    child: Container(
      padding: const EdgeInsets.all(10),
      color: Colors.amber,
      child: const Text('Sürükleniyor...'),
    ),
  ),
  // Sürükleme gerçekleşirken ağaçta geride bırakılan widget:
  child: const Text('Bu öğeyi sürükle'),
);
```

---

### `LongPressDraggable<T>`

Sürükleme hareketini başlatmadan önce uzun basma (dokunma ve tutma) gerektiren `Draggable` varyasyonu. Kaydırılabilir listeler içinde kaydırma ve sürükleme arasındaki çakışmaları önlemek için sıklıkla kullanılır.

---

### `DragTarget<T>`

Gelen `Draggable` nesnelerini dinleyen ve bırakıldıklarında kabul eden yardımcı widget; veri eşleştirmeye dayalı oluşturucuları veya geri çağrıları (`onAccept` gibi) yürütür.

---

## Kaydırılabilir Etkileşim

### `Dismissible`

Belirtilen bir yönde sürüklenerek veya fırlatılarak kapatılabilen (kaldırılabilen/sililebilen) widget. Sürüklendiğinde alt öğe ekrandan kayar ve isteğe bağlı arka plan widget'larını tetikler (örn. altında çöp kutusu ikonu olan kırmızı arka plan).

**Yaygın Kullanım Alanları:** Kaydırarak silme liste öğeleri, bildirim kartlarını kapatma veya e-postaları arşivleme.

---

### `InteractiveViewer`

Herhangi bir alt widget'a panning, zum yapma (sıkıştırarak zum) ve döndürme yetenekleri ekleyen güçlü yardımcı widget.

**Temel Özellikler:**
- **Ölçek Kontrolü:** `minScale` ve `maxScale` sınırlarını ayarlayın.
- **Sınır Kenar Boşlukları:** `boundaryMargin` kullanarak kullanıcının içeriğin kenarının ötesine ne kadar pan yapabileceğini kontrol edin.
- **Kontrolör Desteği:** Mevcut matris dönüşümünü programatik olarak okumak veya değiştirmek için `TransformationController` kullanın.

**Yaygın Kullanım Alanları:** Görsel görüntüleyiciler, haritalar, grafikler, planlar veya tuval tarzı kullanıcı arayüzleri.

---

### `DraggableScrollableSheet`

Kullanıcıların daha fazla içerik ortaya çıkarmak için yukarı veya aşağı çekip sürükleyebildiği (haritalar veya alt sayfalarda yaygın olarak görülen) kaydırılabilir bir sayfayı saran kapsayıcı.

---

### `Scrollable`

Kaydırılabilir widget'lar için temel etkileşim modelini uygulayan temel, daha düşük seviyeli yapı taşı (hareket tanıma, görünüm penceresi fiziği ve balistik kaydırma dahil). Günlük geliştiriciler genellikle `Scrollable`'a dahili olarak dayanan `ListView`, `GridView` veya `SingleChildScrollView` gibi üst düzey soyutlamaları kullanır.

---

## İşaretçi Olay Kontrolü

### `AbsorbPointer`

İsabet testi sırasında bunları emerek alt ağacının işaretçi olaylarını (dokunmalar, hareketler veya kaydırmalar gibi) almasını engeller.

**Temel Davranış:**
- Widget isabet testine **katılır**, yani işaretçi olayını tamamen durdurur.
- Başka bir etkileşimli widget'ın üzerine yerleştirilirse, altındaki widget dokunma olayını **almaz**.

**Yaygın Kullanım Alanı:** Kullanıcıların altındaki düğmelere dokunmasını engelleyen yükleme yer paylaşımı veya ilerleme modalı gösterme.

**Temel Özellik:** `absorbing` (varsayılan olarak `true`). Etkileşimleri yeniden etkinleştirmek için `false` olarak ayarlayın.

---

### `IgnorePointer`

Alt ağacının tamamını işaretçi olaylarına karşı görünmez kılar.

**Temel Davranış:**
- `AbsorbPointer`'ın aksine, `IgnorePointer` **isabet testine katılmaz**.
- İşaretçi olayları, sanki orada değilmiş gibi doğrudan geçer.
- `Stack` içinde `IgnorePointer`'ın *altında* başka bir etkileşimli widget varsa, altındaki widget dokunma olayını **alır**.

**Yaygın Kullanım Alanı:** Belirli bir widget'ı veya katmanı geçici olarak devre dışı bırakırken dokunuşların arkasındaki öğelere geçmesine izin verme.

> **Özet Fark (`AbsorbPointer` vs `IgnorePointer`):**
> Her ikisi de alt widget'ların etkileşimli olmasını engeller. **`AbsorbPointer`** olayı yutar/emer (temel katmanları engeller), **`IgnorePointer`** ise olayın altındaki katmanlara geçmesine izin verir.

---

## Fare / Masaüstü Etkileşimi

### `MouseRegion`

Bir fare işaretçisinin alt widget'ının kapladığı alana girdiğinde, çıktığında veya hareket ettiğinde izler. Öncelikle masaüstü ve web uygulamaları için tasarlanmıştır.

**Temel Özellikler:**
- `onEnter` — İşaretçi bölgeye girdiğinde tetiklenir.
- `onExit` — İşaretçi bölgeden çıktığında tetiklenir.
- `onHover` — İşaretçi bölge içinde hareket ettiğinde tetiklenir.
- `cursor` — Fare imlecinin görünümünü değiştirir (örn. `SystemMouseCursors.click`).

---

### `Listener`

Alt widget'ı boyunca ham işaretçi olaylarını (işaretçi aşağı, işaretçi yukarı, hareket, ölçek veya kaydırma tekerleği eylemleri gibi) dinleyen düşük seviyeli widget. Hareketleri yorumlayan yüksek seviyeli hareket algılayıcıların (`GestureDetector`) aksine, `Listener` tam fiziksel dokunma veya fare olayları hakkında ham akış verisi verir.

**Temel Özellikler:**
- `onPointerDown` — Bir işaretçi ekranla temas ettiğinde tetiklenir.
- `onPointerMove` — Bir işaretçi konumunu değiştirdiğinde tetiklenir.
- `onPointerUp` — Bir işaretçi ekranla teması kestiğinde tetiklenir.

---

## Hızlı Karşılaştırma Tablosu

| Özellik | `GestureDetector` | `InkWell` | `Draggable` |
|---------|-------------------|-----------|-------------|
| **Birincil Amaç** | Dokunmaları, panning, ölçeklendirme ve ham hareketleri yakalamak | Material dalgalanma geri bildirimiyle dokunmaları işlemek | Sürükle-bırak etkileşimlerini başlatmak |
| **Görsel Geri Bildirim** | Yok | Mürekkep sıçraması / Dalgalanma | Kayan `feedback` widget kopyası |
| **Tasarım Kütüphanesi** | Çekirdek `widgets` (Tasarım bağımsız) | `material` bileşenleri | Çekirdek `widgets` / etkileşim modeli |
| **Material Atası Gerekli** | Hayır | Evet | Hayır |

---

# 12. Düzen ve Yerleşim Widget'ları

**Orijinal kaynak:** https://docs.flutter.dev/ui/widgets/layout

## Genel Bakış

Flutter'da düzen widget'ları, diğer widget'ları ekranda organize etmek, yapılandırmak, boyutlandırmak ve hizalamak için kullanılan temel yapı taşlarıdır. Piksel görüntülemezler (görünür widget'lar gibi `Text` veya `Image`), bunun yerine alt widget'larının nasıl davranacağını belirlerler. Düzen widget'ları iki kategoriye ayrılır:

1. **Tek alt öğeli düzen widget'ları** — Bir alt öğeyi sarar (örn. `Container`, `Center`, `Padding`)
2. **Çok alt öğeli düzen widget'ları** — Birden fazla alt öğeyi sarar (örn. `Row`, `Column`, `Stack`, `ListView`, `GridView`)

> **Flutter'ın Temel Düzen Kuralı:** "Kısıtlamalar aşağı iner. Boyutlar yukarı çıkar. Üst öğe konumu belirler."

**İlgili bağlantılar:**
- [Flutter Düzen Rehberi](https://docs.flutter.dev/ui/layout)
- [Material Kütüphanesi API](https://api.flutter.dev/flutter/material/material-library.html)

---

## Doğrusal Düzenler (Flex tabanlı)

`Row` ve `Column`, `Flex`'ten miras alır. Alt öğeleri yatay (`Row`) veya dikey (`Column`) olarak düzenler.

### `Row`

Alt öğelerini yatay bir çizgide yerleştirir.
- **Ana Eksen:** Yatay (`mainAxisAlignment` ile kontrol edilir)
- **Çapraz Eksen:** Dikey (`crossAxisAlignment` ile kontrol edilir)

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Text('Öğe 1'),
    Text('Öğe 2'),
    Text('Öğe 3'),
  ],
)
```

---

### `Column`

Alt öğelerini dikey bir çizgide yerleştirir.
- **Ana Eksen:** Dikey (`mainAxisAlignment` ile kontrol edilir)
- **Çapraz Eksen:** Yatay (`crossAxisAlignment` ile kontrol edilir)

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    Text('Başlık'),
    Text('Alt Başlık'),
    ElevatedButton(onPressed: () {}, child: Text('Eylem')),
  ],
)
```

---

## Flex İçinde Alan Kontrolü (`Row`/`Column`)

### `Expanded`

Bir `Row` veya `Column`'un ana ekseni boyunca *kalan* mevcut alanı doldurmak için bir alt widget'ı zorlar.

```dart
Row(
  children: [
    Expanded(
      flex: 2,
      child: Container(color: Colors.red, height: 50),
    ),
    Expanded(
      flex: 1,
      child: Container(color: Colors.blue, height: 50),
    ),
  ],
)
```

---

### `Flexible`

`Expanded`'a benzer, ancak alt öğenin gerekli değilse mevcut alandan *daha küçük* olmasına izin verir (`FlexFit.loose` kullanır).

**`flex` özelliği:** Hem `Expanded` hem de `Flexible`, tamsayı `flex` faktörü kabul eder. `flex: 2` ve `flex: 1` olan iki alt öğeniz varsa, birincisi kalan alanın 2/3'ünü, ikincisi ise 1/3'ünü alır.

---

## Üst Üste Binen Düzenler

### `Stack`

Widget'ların birbiri üstüne binmesine olanak tanır (grafik tasarımdaki katmanlar gibi). Varsayılan olarak listedeki ilk widget yığının altında, sonraki widget'lar ise üstünde katmanlanır.

**Temel Yardımcı Widget:** Bir `Stack` içinde öğeleri yığın sınırlarına göre `top`, `bottom`, `left`, `right` veya `width` ve `height` özellikleri kullanarak konumlandırmak için **`Positioned`** kullanın.

```dart
Stack(
  children: [
    Container(color: Colors.blue, width: 200, height: 200),
    Positioned(
      top: 20,
      left: 20,
      child: Text('Üst Üste Binen Metin', style: TextStyle(color: Colors.white)),
    ),
  ],
)
```

---

## Kaydırılabilir Düzenler

> İçerik ekran yüksekliğini veya genişliğini aştığında, statik `Column` veya `Row` kullanmak sarı-siyah şeritli **taşma hatasına** yol açar. Dinamik içerik için kaydırılabilir düzenler kullanın.

### `ListView`

Kaydırılabilir widget doğrusal listesi.

**Varyantlar:**
- `ListView()` — Az sayıda, sabit alt öğe listesi için en iyisi (hepsi tek seferde oluşturulur).
- `ListView.builder()` — Dinamik veya uzun/sonsuz listeler için en iyisi; öğeleri ekrana kaydırıldıkça isteğe bağlı oluşturur (performans için tembel yükleme). **Çoğu kullanım için önerilir.**
- `ListView.separated()` — `ListView.builder()` gibi, ancak öğeler arasına otomatik olarak ayırıcı widget'lar ekler.

```dart
ListView.builder(
  itemCount: 20,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text('Öğe $index'),
    );
  },
)
```

---

### `GridView`

Kaydırılabilir 2D ızgara düzeni.

**Varyantlar:**
- `GridView.count()` — Sabit sütun sayısı düzenleri için kullanışlı.
- `GridView.builder()` — İstek üzerine öğeleri dinamik olarak ızgara biçiminde oluşturur.

```dart
GridView.count(
  crossAxisCount: 2,
  children: List.generate(20, (index) {
    return Center(
      child: Text('Öğe $index'),
    );
  }),
)
```

---

## Hizalama ve Konumlandırma Widget'ları (Tek Alt Öğe)

### `Align`

Alt öğesini kendi içinde hizalar ve isteğe bağlı olarak alt öğenin boyutuna göre kendini boyutlandırır.

```dart
Align(
  alignment: Alignment.topRight,
  child: Text("Merhaba"),
)
```

---

### `Center`

Alt öğesini kendi içinde ortalar. `Center`, `alignment`'ı `Alignment.center` olarak önceden ayarlanmış bir `Align` widget'ından başka bir şey değildir.

```dart
Center(
  child: Text("Ortalandım"),
)
```

---

### `Padding`

Alt öğesini verilen dolgu miktarıyla girintiler. `EdgeInsets` geometrisi argümanı alır.

```dart
Padding(
  padding: EdgeInsets.all(16.0),
  child: Text("Dolgulu metin"),
)
```

---

### `SizedBox`

Bir widget'ı belirli bir genişliğe ve/veya yüksekliğe zorlar veya boş boşluk işlevi görür. Hafif olduğu ve `const` olarak bildirilebildiği için `SizedBox`, bir `Column` veya `Row` içindeki öğeler arasına sabit aralık eklemenin tercih edilen aracıdır.

```dart
Column(
  children: [
    Text("Üst"),
    SizedBox(height: 20), // 20 piksel dikey boşluk ekler
    Text("Alt"),
  ],
)
```

---

## Kısıtlama Widget'ları (Tek Alt Öğe)

### `ConstrainedBox`

Alt öğesine üst öğesinden devraldığının ötesinde ek kısıtlamalar uygular.

```dart
ConstrainedBox(
  constraints: BoxConstraints(
    minWidth: 200.0,
    minHeight: 50.0,
  ),
  child: ElevatedButton(
    onPressed: () {},
    child: Text('Tıkla'),
  ),
)
```

---

### `IntrinsicHeight`

Alt öğesini en yüksek içsel yüksekliğine boyutlandırır. Bir `Row` içindeki alt öğeleri en uzun öğenin yüksekliğiyle eşleşmeye zorlar.

> **Performans Uyarısı:** Ek düzen geçişleri gerektirir. Dikkatli kullanın.

```dart
IntrinsicHeight(
  child: Row(
    children: [
      Container(color: Colors.red, width: 50, height: 100),
      Container(color: Colors.blue, width: 50, height: 40), // 100 yüksekliğe kadar uzar
    ],
  ),
)
```

---

### `IntrinsicWidth`

Alt öğesini en geniş içsel genişliğine boyutlandırır. Bir sütundaki birden fazla öğeyi en geniş alt öğeye göre tam olarak aynı genişliği paylaşmaya zorlar.

> **Performans Uyarısı:** `IntrinsicHeight` ile aynı — dikkatli kullanın.

---

## Duyarlı Düzen

### `LayoutBuilder`

Üst widget'ın boyut kısıtlamalarına bağlı olabilen bir widget ağacı oluşturur. **Düzen zamanında** üst öğesi tarafından sağlanan `BoxConstraints` nesnesini `builder` işlevi aracılığıyla gösterir.

```dart
LayoutBuilder(
  builder: (BuildContext context, BoxConstraints constraints) {
    if (constraints.maxWidth > 600) {
      return Text('Masaüstü Görünümü');
    } else {
      return Text('Mobil Görünümü');
    }
  },
)
```

---

## Taşma ve Sarma Düzenleri

### `Wrap`

Alt öğelerini birden fazla yatay veya dikey satırda görüntüleyen çok alt öğeli düzen widget'ı. `Row` veya `Column`'un aksine `Wrap`, taşan öğeleri otomatik olarak bir sonraki satıra kaydırır. Etiketler, chip'ler veya dinamik düğmeler için mükemmeldir.

```dart
Wrap(
  spacing: 8.0,    // Bitişik chip'ler arası boşluk
  runSpacing: 4.0, // Satırlar arası boşluk
  children: [
    Chip(label: Text('Flutter')),
    Chip(label: Text('Widget\'lar')),
    Chip(label: Text('Düzen')),
  ],
)
```

---

## Ölçeklendirme ve Oran Widget'ları

### `FittedBox`

Alt öğesini belirli bir fit'e göre kendi içinde ölçekler ve konumlandırır.

```dart
FittedBox(
  fit: BoxFit.contain,
  child: Text("Bu uzun metin kapsayıcı genişliğine sığacak şekilde küçülecektir"),
)
```

---

### `AspectRatio`

Alt öğeyi belirli bir en boy oranına (genişlik/yükseklik olarak ifade edilir, örn. `16 / 9` veya `4 / 3`) boyutlandırmaya çalışır.

```dart
AspectRatio(
  aspectRatio: 16 / 9,
  child: Container(color: Colors.blue),
)
```

---

## Düzen Widget'ları Özet Tablosu

| Widget | Kategori | Amaç | Kaydırılabilir? |
|--------|----------|-------|-----------------|
| `Row` | Çok alt öğeli (flex) | Widget'ları yatay düzenle | Hayır |
| `Column` | Çok alt öğeli (flex) | Widget'ları dikey düzenle | Hayır |
| `Expanded` | Flex değiştirici | Alt öğeyi Row/Column'da kalan alanı doldurmaya zorla | Hayır |
| `Flexible` | Flex değiştirici | Alt öğenin kalan alanı esnek biçimde paylaşmasına izin ver | Hayır |
| `Stack` | Çok alt öğeli (katman) | Birden fazla widget'ı birbiri üstüne yerleştir | Hayır |
| `Positioned` | Stack alt öğesi | Bir Stack içinde öğeyi açıkça konumlandır | Hayır |
| `ListView` | Çok alt öğeli | Kaydırılabilir doğrusal liste (dikey veya yatay) | **Evet** |
| `GridView` | Çok alt öğeli | Kaydırılabilir 2D ızgara düzeni | **Evet** |
| `Align` | Tek alt öğeli | Alt öğeyi üst öğe içinde hizala | Hayır |
| `Center` | Tek alt öğeli | Alt öğeyi üst öğe içinde ortala | Hayır |
| `Padding` | Tek alt öğeli | Alt öğeyi dolguyla girintile | Hayır |
| `SizedBox` | Tek alt öğeli | Belirli boyutu zorla veya boşluk boşluğu oluştur | Hayır |
| `Wrap` | Çok alt öğeli | Sarma özelliğiyle yatay/dikey çalışma düzeni | Hayır |
| `FittedBox` | Tek alt öğeli | Alt öğeyi üst kutu içinde ölçekle/sığdır | Hayır |
| `AspectRatio` | Tek alt öğeli | Alt öğeyi belirli en boy oranına boyutlandır | Hayır |
| `ConstrainedBox` | Tek alt öğeli | Alt öğeye ekstra kısıtlamalar uygula | Hayır |
| `IntrinsicHeight` | Tek alt öğeli | En uzun kardeşin yüksekliğini eşleştir | Hayır |
| `IntrinsicWidth` | Tek alt öğeli | En geniş kardeşin genişliğini eşleştir | Hayır |
| `LayoutBuilder` | Tek alt öğeli | Üst kısıtlamalara göre duyarlı oluştur | Hayır |

---

# 13. Boyama ve Efekt Widget'ları

**Orijinal kaynak:** https://docs.flutter.dev/ui/widgets/painting

## Genel Bakış

Boyama ve efekt widget'ları, **düzenlerini, boyutlarını veya widget ağacındaki konumlarını değiştirmeden** alt öğelerine görsel geliştirmeler, dekorasyonlar veya dönüşümler uygular. Bu widget'lar yalnızca boyama aşamasında çalışır — şeylerin nasıl göründüğünü değiştirirler, nasıl düzenlendiklerini değil.

---

## `BackdropFilter`

**Açıklama:** Üstüne alt öğesini boyamadan önce widget'ın **altında boyanan mevcut içeriğe** filtre (bulanıklaştırma veya renk matrisi gibi) uygular. En yaygın olarak arka planı bulanıklaştırarak "buzlu cam" efekti oluşturmak için kullanılır.

**Temel Not:** `BackdropFilter` varsayılan olarak üst öğesinin düzen sınırlarını doldurur. Bulanıklaştırmayı belirli bir şekle kısıtlamak için `ClipRRect`, `ClipOval` veya `ClipPath` gibi kırpma widget'ı içine **sarmanız gerekir**.

```dart
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

Stack(
  children: [
    // Arka plan görseli veya içerik
    Image.network('https://example.com/bg.jpg', fit: BoxFit.cover),
    // Buzlu cam yer paylaşımı
    ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.white.withOpacity(0.2),
          alignment: Alignment.center,
          child: const Text('Buzlu Cam', style: TextStyle(color: Colors.white)),
        ),
      ),
    ),
  ],
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/BackdropFilter-class.html

---

## `ClipOval`

**Açıklama:** Alt öğesini **oval** şekil kullanarak kırpar. Alt öğe kare ise kırpma daire üretir.

**Kullanım Alanları:** Dairesel avatar görselleri, dairesel ikon düğmeleri, yuvarlak profil fotoğrafları.

```dart
ClipOval(
  child: Image.network(
    'https://example.com/avatar.jpg',
    width: 100,
    height: 100,
    fit: BoxFit.cover,
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/ClipOval-class.html

---

## `ClipPath`

**Açıklama:** Alt öğesini `CustomClipper<Path>` tarafından tanımlanan **özel geometrik yol** kullanarak kırpar. Herhangi bir keyfi şekle olanak tanır.

**Kullanım Alanları:** Çapraz kesimler, dalga şekilleri, özel dekoratif kenarlıklar, çokgen şekilleri.

```dart
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Kullanım:
ClipPath(
  clipper: TriangleClipper(),
  child: Container(
    color: Colors.blue,
    height: 80,
    width: 220,
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/ClipPath-class.html

---

## `ClipRect`

**Açıklama:** Alt öğesini **dikdörtgen** kullanarak kırpar. Dikdörtgen sınırların dışına uzanan alt öğenin herhangi bir bölümü kesilir ve render edilmez.

```dart
ClipRect(
  child: Align(
    alignment: Alignment.topCenter,
    heightFactor: 0.5, // Yalnızca üst yarıyı göster
    child: Image.network('https://example.com/image.jpg'),
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/ClipRect-class.html

---

## `ClipRRect`

**Açıklama:** Alt öğesini **yuvarlak dikdörtgen** kullanarak kırpar. Görsellerin, kapsayıcıların veya özel içeriklerin köşelerini yuvarlatmak için yaygın olarak kullanılır.

```dart
ClipRRect(
  borderRadius: BorderRadius.circular(12.0),
  child: Image.network(
    'https://example.com/photo.jpg',
    width: 200,
    height: 150,
    fit: BoxFit.cover,
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/ClipRRect-class.html

---

## `ColorFiltered`

**Açıklama:** Boyamadan önce alt öğesine **renk filtresi** uygular. Renk filtreleri matriks işlemleri kullanarak renkleri dönüştürebilir (örn. gri tonlama, sepya, ters çevirme).

```dart
ColorFiltered(
  colorFilter: const ColorFilter.matrix(<double>[
    0.2126, 0.7152, 0.0722, 0, 0, // Gri tonlama matrisi
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0,      0,      0,      1, 0,
  ]),
  child: Image.network('https://example.com/colorful.jpg'),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/ColorFiltered-class.html

---

## `CustomPaint`

**Açıklama:** Boyama aşamasında özel şekiller, yollar, metin veya görseller çizebileceğiniz bir **tuval** sağlar. Bir `painter` (alt öğeden önce çizer) ve/veya `foregroundPainter` (alt öğeden sonra çizer) kabul eder. Her ikisi de `CustomPainter`'ı alt sınıfa alarak `paint(Canvas canvas, Size size)` uygulamanızı gerektirir.

```dart
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      50,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Kullanım:
CustomPaint(
  size: const Size(200, 200),
  painter: MyPainter(),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/CustomPaint-class.html

---

## `DecoratedBox`

**Açıklama:** `position` parametresine bağlı olarak alt öğesi boyamadan **önce veya sonra** bir `Decoration` (arka plan rengi, degrade, kenarlık veya yuvarlanmış arka plan görseli gibi) boyar.

**Not:** Geniş çapta kullanılan `Container` widget'ı, dekorasyon özellikleri sağlandığında arka planda `DecoratedBox`'ı sarar.

```dart
DecoratedBox(
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [Colors.blue, Colors.purple],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  child: const Padding(
    padding: EdgeInsets.all(20.0),
    child: Text('Merhaba', style: TextStyle(color: Colors.white, fontSize: 20)),
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/DecoratedBox-class.html

---

## `FractionalTranslation`

**Açıklama:** Boyamadan önce alt öğesine (ve düzenden sonra) **kutunun boyutunun bir kesiri olarak ifade edilen öteleme ofseti** uygular. Örneğin `Offset(0.5, 0.0)` ofseti, alt öğeyi kendi genişliğinin yarısı kadar sağa kaydırır.

```dart
FractionalTranslation(
  translation: const Offset(0.25, 0.0), // Kendi genişliğinin %25'i kadar sağa kaydır
  child: Container(
    width: 100,
    height: 100,
    color: Colors.red,
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/FractionalTranslation-class.html

---

## `Opacity`

**Açıklama:** Alt öğesini `0.0` (tamamen saydam) ile `1.0` (tamamen opak) arasında bir alfa ölçekleme değeri uygulayarak **kısmen (veya tamamen) saydam** yapar.

> **⚠️ Performans Uyarısı:** Ara tampon nedeniyle `0.0` ile `1.0` arasındaki `Opacity` değerleri görece pahalı olabilir. Basit renk soldurma veya tek alt öğeli opaklık için, rengin alfa değerini doğrudan ayarlamayı veya animasyonlar için `FadeTransition`'ı tercih edin.

```dart
Opacity(
  opacity: 0.5, // %50 saydam
  child: Container(
    width: 100,
    height: 100,
    color: Colors.blue,
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/Opacity-class.html

---

## `RotatedBox`

**Açıklama:** Alt öğesini **çeyrek dönüş sayısına** (0, 1, 2 veya 3; 0°, 90°, 180°, 270° temsil eder) döndürür. `Transform.rotate`'ın aksine `RotatedBox`, döndürmeyi **düzenden önce** uygular; bu nedenle döndürülmüş boyut çevreleyen widget'ların düzenini gerçekten etkiler.

```dart
RotatedBox(
  quarterTurns: 1, // 90 derece saat yönünde döndür
  child: const Text('Döndürülmüş Metin'),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/RotatedBox-class.html

---

## `ShaderMask`

**Açıklama:** Belirli bir `BlendMode` kullanarak alt öğesine **Shader** (degrade veya görsel shader gibi) tarafından oluşturulan bir maske uygular. Genellikle degrade metin efektleri veya shimmer yükleme yer tutucuları için kullanılır.

```dart
ShaderMask(
  shaderCallback: (Rect bounds) {
    return const LinearGradient(
      colors: [Colors.blue, Colors.purple, Colors.pink],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(bounds);
  },
  child: const Text(
    'Degrade Metin!',
    style: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Colors.white, // Shader'ın görünmesi için beyaz olmalıdır
    ),
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/ShaderMask-class.html

---

## `Transform`

**Açıklama:** Boyamadan önce (ancak düzenden sonra) alt öğesine ölçeklendirme, döndürme, eğme veya öteleme için genel bir **matris dönüşümü** (`Matrix4`) uygular. Uygun adlandırılmış yapıcılar sunar: `Transform.rotate()`, `Transform.scale()`, `Transform.translate()`, `Transform.flip()`.

**Not:** `Transform`, düzenden sonra uygulandığından çevreleyen widget'lar dönüşümden etkilenmez. Alt öğe hâlâ orijinal düzen alanını kaplar.

```dart
// Döndürme
Transform.rotate(
  angle: 0.1, // Radyan
  child: Container(width: 100, height: 100, color: Colors.green),
)

// Ölçeklendirme
Transform.scale(
  scale: 1.5,
  child: const Icon(Icons.star, size: 40, color: Colors.amber),
)

// Öteleme
Transform.translate(
  offset: const Offset(50, 0), // 50px sağa taşı
  child: Container(width: 80, height: 80, color: Colors.red),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/Transform-class.html

---

## Boyama Widget'ları İlgili API Bağlantıları

- https://api.flutter.dev/flutter/widgets/BackdropFilter-class.html
- https://api.flutter.dev/flutter/widgets/ClipOval-class.html
- https://api.flutter.dev/flutter/widgets/ClipPath-class.html
- https://api.flutter.dev/flutter/widgets/ClipRect-class.html
- https://api.flutter.dev/flutter/widgets/ClipRRect-class.html
- https://api.flutter.dev/flutter/widgets/ColorFiltered-class.html
- https://api.flutter.dev/flutter/widgets/CustomPaint-class.html
- https://api.flutter.dev/flutter/widgets/DecoratedBox-class.html
- https://api.flutter.dev/flutter/widgets/FractionalTranslation-class.html
- https://api.flutter.dev/flutter/widgets/Opacity-class.html
- https://api.flutter.dev/flutter/widgets/RotatedBox-class.html
- https://api.flutter.dev/flutter/widgets/ShaderMask-class.html
- https://api.flutter.dev/flutter/widgets/Transform-class.html

---

# 14. Kaydırma Widget'ları

**Orijinal kaynak:** https://docs.flutter.dev/ui/widgets/scrolling

## Genel Bakış

Flutter, taşan içerikleri, listeleri, ızgaraları ve programatik kaydırma kontrolünü yönetmek için zengin yerleşik kaydırma widget'ları ve kontrolörleri sunar. Kaydırılabilir widget'lar, davranışlarına, yapılarına ve kullanım durumlarına göre kategorize edilir. Sliver'lar, Flutter'ın gelişmiş, birleştirilebilir kaydırma sisteminin yapı taşlarıdır — bir "sliver", kendi düzen ve animasyon kurallarını içerebilen kaydırılabilir bir alan bölümüdür.

---

## `CustomScrollView`

**Açıklama:** **Sliver'lar** kullanarak özel kaydırma efektleri oluşturan `ScrollView`. `ListView` veya `GridView` gibi kutudan çıkar çıkmaz tekdüze düzenleri yöneten daha basit kaydırma widget'larının aksine, `CustomScrollView` birden fazla kaydırılabilir bileşeni (daralan başlıklar, yapışkan ızgaralar, karışık listeler) tek bir uyumlu kaydırma yüzeyinde birleştirmek için doğrudan sliver'lar sağlamanıza olanak tanır.

**Yaygın alt öğeler:** `SliverAppBar`, `SliverList`, `SliverGrid`, `SliverToBoxAdapter`, `SliverPadding`, `SliverPersistentHeader`.

```dart
CustomScrollView(
  slivers: <Widget>[
    const SliverAppBar(
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Özel Kaydırma Görünümü'),
      ),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return ListTile(title: Text('Öğe $index'));
        },
        childCount: 20,
      ),
    ),
  ],
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html

---

## `DraggableScrollableSheet`

**Açıklama:** Kullanıcıların sayfayı dinamik olarak sürükleyip genişletip daraltabildiği ekranın altından kayan **kaydırılabilir sayfa** görüntüleyen widget.

**Özellikler:** `initialChildSize` (varsayılan ekran yüksekliği bölümü), `minChildSize` (minimum daraltılmış boyut), `maxChildSize` (maksimum genişletilmiş boyut).

```dart
DraggableScrollableSheet(
  initialChildSize: 0.4,
  minChildSize: 0.2,
  maxChildSize: 0.95,
  builder: (BuildContext context, ScrollController sheetScrollController) {
    return Material(
      elevation: 16.0,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: ListView.builder(
        controller: sheetScrollController,
        itemCount: 30,
        itemBuilder: (context, index) => ListTile(title: Text('Öğe $index')),
      ),
    );
  },
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/DraggableScrollableSheet-class.html

---

## `GridView`

**Açıklama:** Öğeleri **2D tekrarlayan düzende** (satırlar ve sütunlar halinde düzenlenmiş hücreler) görüntüler.

**Varyantlar:**
- `GridView()`: Az sayıda, sabit alt öğe için.
- `GridView.count()`: Sabit çapraz eksen sayısı düzenleri için kullanışlı.
- `GridView.extent()`: Sabit maksimum-çapraz-eksen-genişliği düzenleri için.
- `GridView.builder()`: Büyük veya dinamik ızgaralar için en iyisi — öğeleri görünüme kaydırıldıkça **tembelce** oluşturur.

```dart
GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,      // Satır başına 2 öğe
    crossAxisSpacing: 8.0,
    mainAxisSpacing: 8.0,
  ),
  itemCount: 50,
  itemBuilder: (context, index) {
    return Card(child: Center(child: Text('Izgara Öğesi $index')));
  },
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/GridView-class.html

---

## `ListWheelScrollView`

**Açıklama:** Alt öğelerini **3D silindirik tekerlek benzeri düzene** dönüştüren özelleşmiş kaydırma görünümü. Öğeler kaydırıldıkça bir silindir etrafında eğiliyormuş gibi görünür.

**Kullanım Alanları:** Tarih/saat seçiciler, sayı seçiciler, slot makinesi tarzı seçiciler.

```dart
ListWheelScrollView(
  itemExtent: 60,
  perspective: 0.005,
  diameterRatio: 1.5,
  physics: const FixedExtentScrollPhysics(),
  children: List.generate(20, (index) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue.shade100,
      child: Text('Öğe $index', style: const TextStyle(fontSize: 18)),
    );
  }),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/ListWheelScrollView-class.html

---

## `ListView`

**Açıklama:** Kaydırılabilir, **doğrusal widget listesi**. Flutter'daki en yaygın kullanılan kaydırma widget'ı.

**Varyantlar:**
- `ListView()`: Doğrudan iletilen az sayıda, sabit alt öğe için iyidir. Tüm alt öğeleri tek seferde oluşturur.
- `ListView.builder()`: Öğeleri **isteğe bağlı** oluşturur (tembel yükleme). Uzun, tekrarlayan veya sonsuz listeler için oldukça performanslı. **Çoğu kullanım durumu için önerilir.**
- `ListView.separated()`: `ListView.builder()` gibi, ancak öğeler arasına otomatik olarak ayırıcı widget'lar ekler.
- `ListView.custom()`: Özel `SliverChildDelegate` kabul eder.

```dart
// ListView.builder — uzun listeler için önerilir
ListView.builder(
  itemCount: 100,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text('Öğe $index'),
    );
  },
)

// ListView.separated — ayıraçlarla
ListView.separated(
  itemCount: 25,
  separatorBuilder: (context, index) => const Divider(),
  itemBuilder: (context, index) {
    return ListTile(title: Text('Öğe $index'));
  },
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/ListView-class.html

---

## `NestedScrollView`

**Açıklama:** **Bir kaydırılabilir görünümün başka bir kaydırılabilir görünümün içine yerleştirildiği durumlarda** kullanılan özelleşmiş kaydırma widget'ı. Dış ve iç kaydırma konumlarını birbirine bağlayarak tek bir birim olarak kaydırılmalarını sağlar.

```dart
DefaultTabController(
  length: 2,
  child: NestedScrollView(
    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverAppBar(
          title: const Text('NestedScrollView'),
          pinned: true,
          expandedHeight: 200.0,
          forceElevated: innerBoxIsScrolled,
          bottom: const TabBar(
            tabs: [Tab(text: 'Sekme 1'), Tab(text: 'Sekme 2')],
          ),
        ),
      ];
    },
    body: TabBarView(
      children: [
        ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) => ListTile(title: Text('Sekme 1 Öğe $index')),
        ),
        ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) => ListTile(title: Text('Sekme 2 Öğe $index')),
        ),
      ],
    ),
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html

---

## `PageView`

**Açıklama:** Her alt öğenin genellikle **tüm görünüm alanını kapladığı** kaydırılabilir alt öğe listesi. Sürekli değil sayfa sayfa (her seferinde tam bir sayfa) kaydırır. `PageController` ile çalışır.

**Kullanım Alanları:** Katılım ekranları, görsel karuselleri, sekme benzeri yatay kaydırma, giriş sihirbazları.

```dart
PageView(
  controller: PageController(),
  onPageChanged: (int page) {
    print('Mevcut sayfa: $page');
  },
  children: const [
    Center(child: Text('Sayfa 1', style: TextStyle(fontSize: 32))),
    Center(child: Text('Sayfa 2', style: TextStyle(fontSize: 32))),
    Center(child: Text('Sayfa 3', style: TextStyle(fontSize: 32))),
  ],
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/PageView-class.html

---

## `ReorderableListView`

**Açıklama:** Kullanıcıların öğeleri uzun basma ve sürükleme tutamaçlarıyla **etkileşimli olarak yeniden sıralamasına** olanak tanıyan özelleşmiş liste görünümü.

```dart
ReorderableListView(
  onReorder: (int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex--;
      final item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
    });
  },
  children: [
    for (final item in items)
      ListTile(
        key: ValueKey(item),
        title: Text(item),
        trailing: const Icon(Icons.drag_handle),
      ),
  ],
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/material/ReorderableListView-class.html

---

## `Scrollbar`

**Açıklama:** Herhangi bir kaydırılabilir widget'ın (örn. `ListView` veya `CustomScrollView`) etrafına sarılarak bunu bekleyen platformlarda yerel görünümlü kaydırma çubuğu tutamacı görüntüleyen **görsel gösterge widget'ı**.

```dart
final ScrollController _scrollController = ScrollController();

Scrollbar(
  controller: _scrollController,
  thumbVisibility: true,
  child: ListView.builder(
    controller: _scrollController,
    itemCount: 30,
    itemBuilder: (context, index) => ListTile(title: Text('Öğe $index')),
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/material/Scrollbar-class.html

---

## `ScrollNotification` (Soyut sınıf / Bildirim sistemi)

**Açıklama:** Kaydırmayla ilgili bildirimler için soyut temel sınıf. Kaydırılabilir widget'lar, widget ağacında kaydırmayla ilgili değişiklikler hakkında ata widget'larını uyarmak için bildirimler kullanır.

**Alt Sınıflar (Yaşam döngüsü olayları):**
- `ScrollStartNotification`: Widget kaydırmaya başladı.
- `ScrollUpdateNotification`: Kaydırma konumu değişti.
- `OverscrollNotification`: Sınırların ötesine kaydırma girişimi.
- `UserScrollNotification`: Kullanıcının kaydırma yönü değişti.
- `ScrollEndNotification`: Widget kaydırmayı durdurdu.

```dart
NotificationListener<ScrollNotification>(
  onNotification: (ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      print('Kaydırıldı: ${notification.metrics.pixels}');
    }
    return false; // Bildirim balonlanmasını iptal etmek için true döndür
  },
  child: ListView.builder(
    itemCount: 50,
    itemBuilder: (context, index) => ListTile(title: Text('Öğe $index')),
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/ScrollNotification-class.html

---

## `SingleChildScrollView`

**Açıklama:** **Tek alt öğe** (genellikle `Column` veya `Row`) alır ve ekran boyutlarını aştığında kaydırılmasına olanak tanır.

> **⚠️ Performans Uyarısı:** Tüm alt öğelerini **tek seferde** oluşturur. Uzun veya dinamik listeler için KULLANMAYIN — yüzlerce ekran dışı öğeyi eş zamanlı render etmek performansı olumsuz etkiler.

**Ne zaman kullanılır:** Öğe sayısının az ve önceden bilinen kısa, statik formlar, ayarlar sayfaları veya ayrıntı görünümleri.

```dart
SingleChildScrollView(
  child: Column(
    children: [
      const TextField(decoration: InputDecoration(labelText: 'Ad')),
      const TextField(decoration: InputDecoration(labelText: 'E-posta')),
      const TextField(decoration: InputDecoration(labelText: 'Telefon')),
      ElevatedButton(onPressed: () {}, child: const Text('Gönder')),
    ],
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html

---

## Sliver Widget'ları (CustomScrollView İçinde Kullanılır)

### `SliverAppBar`

Kullanıcı kaydırırken **daralan, geren veya kayan** Material Design uygulama çubuğu. Özellikler: `expandedHeight`, `pinned`, `floating`, `snap`.

### `SliverList`

**ListView'ın sliver eşdeğeri**. Ana eksen boyunca birden fazla kutu alt öğesini doğrusal dizide yerleştirir.

```dart
SliverList(
  delegate: SliverChildBuilderDelegate(
    (context, index) => ListTile(title: Text('Öğe $index')),
    childCount: 20,
  ),
)
```

### `SliverGrid`

**GridView'ın sliver eşdeğeri**. Alt öğeleri 2D düzende yerleştirir.

```dart
SliverGrid(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
  ),
  delegate: SliverChildBuilderDelegate(
    (context, index) => Card(child: Center(child: Text('$index'))),
    childCount: 30,
  ),
)
```

### `SliverToBoxAdapter`

Bir `CustomScrollView` içine **normal kutu widget'ları** (standart `Container` veya `Padding` gibi) yerleştirmenize olanak tanıyan köprü widget'ı.

### `SliverPadding`

Diğer sliver'ların çevresine **dolgu** ekler.

### `SliverPersistentHeader`

Bir sonraki başlık tarafından itilene kadar görünüm alanının üstünde kalan **yapışkan başlıklar** oluşturur.

---

## `ScrollController`

Kaydırılabilir widget'larla programatik olarak etkileşim kurmak için kullanılır.

1. **Konumu Oku:** `controller.offset` — mevcut kaydırma piksel konumu.
2. **Animasyonla:** `controller.animateTo(offset, duration, curve)` — yumuşak animasyonlu kaydırma.
3. **Atla:** `controller.jumpTo(offset)` — animasyonsuz anlık atlama.
4. **Dinle:** `controller.addListener(() { ... })` — kaydırma olaylarını izle.

> **⚠️ Bellek Notu:** Bellek sızıntılarını önlemek için `dispose()` içinde her zaman `controller.dispose()` çağrısı yapın.

```dart
class MyScrollableWidget extends StatefulWidget {
  const MyScrollableWidget({super.key});
  @override
  State<MyScrollableWidget> createState() => _MyScrollableWidgetState();
}

class _MyScrollableWidgetState extends State<MyScrollableWidget> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      print('Kaydırma konumu: ${_scrollController.offset}');
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 50,
        itemBuilder: (context, index) => ListTile(title: Text('Öğe $index')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
```

---

## Kaydırma Widget'ları Karar Rehberi

| Gereksinim | Önerilen Widget |
|------------|-----------------|
| Kısa, karışık içerik (formlar, profiller) | `SingleChildScrollView` + `Column` |
| Uzun veya sonsuz benzer öğe listesi | `ListView.builder` |
| Öğe ızgarası (fotoğraf galerileri, ürün kartları) | `GridView.builder` |
| Daralan uygulama çubuğu + karışık kaydırma içeriği | Sliver'larla `CustomScrollView` |
| Başlığı paylaşan sekmeli kaydırma içeriği | `NestedScrollView` |
| Sayfa sayfa kaydırma | `PageView` |
| Genişleyip daralan alt sayfa | `DraggableScrollableSheet` |
| Dairesel seçici / tarih-saat seçici | `ListWheelScrollView` |
| Elektronik tablo / 2D kaydırma | `TwoDimensionalScrollView` |
| Programatik kaydırma kontrolü | Herhangi kaydırılabilir + `ScrollController` |
| Yeniden oluşturma olmadan kaydırma olaylarını dinleme | `NotificationListener<ScrollNotification>` |

---

# 15. Stil Widget'ları

**Orijinal kaynak:** https://docs.flutter.dev/ui/widgets/styling

## Genel Bakış

Flutter'daki stil widget'ları, widget'ların her birini manuel olarak stillemek zorunda kalmadan bir widget alt ağacında veya uygulamanın tamamında tutarlı görsel tasarım uygulamak için temaları, görsel stilleri, yazı tipi varsayılanlarını, duyarlı medya sorgularını ve aralığı yönetir.

---

## `AnimatedDefaultTextStyle`

**Açıklama:** Belirtilen bir süre boyunca varsayılan metin stili değiştiğinde **geçişleri otomatik olarak animasyonlar**. `DefaultTextStyle`'ın animasyonlu karşılığı.

```dart
AnimatedDefaultTextStyle(
  style: isSelected
      ? const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue)
      : const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
  duration: const Duration(milliseconds: 300),
  child: const Text('Animasyonlu Stil Değişimi'),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/AnimatedDefaultTextStyle-class.html

---

## `AnimatedTheme`

**Açıklama:** Temeldeki `ThemeData` değiştiğinde (örn. açık ve karanlık mod arasında geçiş yaparken) renkleri ve tipografik özellikleri belirli bir süre boyunca otomatik olarak **düzgünce geçiren** `Theme`'in animasyonlu versiyonu.

```dart
AnimatedTheme(
  data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
  duration: const Duration(milliseconds: 400),
  child: MaterialApp(
    home: HomeScreen(),
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/material/AnimatedTheme-class.html

---

## `DefaultTextEditingOptions`

**Açıklama:** Bir alt ağaç boyunca torun metin düzenleme widget'ları (örn. `EditableText` veya `TextField`) için **varsayılan davranışı ve platform-etkileşim seçeneklerini** yapılandırır. Bağlam menüleri, yazım denetimi, otomatik düzeltme vb. için platform varsayılanlarını geçersiz kılabilir.

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/DefaultTextEditingOptions-class.html

---

## `DefaultTextStyle`

**Açıklama:** Açık `style` özelliği tanımlanmamış bir alt ağaçtaki tüm torun `Text` widget'ları için varsayılan metin stilini (yazı tipi ailesi, renk, boyut vb.) oluşturan **inherited widget**.

**Erişim:** Mevcut stile programatik olarak erişmek için `DefaultTextStyle.of(context).style` kullanın.

```dart
DefaultTextStyle(
  style: const TextStyle(
    fontSize: 16,
    color: Colors.grey,
    fontFamily: 'Roboto',
  ),
  child: Column(
    children: const [
      Text('Gri rengi ve 16sp boyutu devralır'),
      Text(
        'Bu rengi geçersiz kılar',
        style: TextStyle(color: Colors.black),
      ),
    ],
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/DefaultTextStyle-class.html

---

## `MediaQuery`

**Açıklama:** **Cihazın ekranı ve kullanıcı arayüzü hakkında veri** sağlayan bir alt ağaç oluşturur. `MediaQuery.of(context)` kullanılarak fiziksel kısıtlamalar ve sistem yapılandırmaları sorgulanabilir.

**`MediaQuery.of(context)` aracılığıyla mevcut veriler:**
- `size` — Ekran boyutları (genişlik, yükseklik).
- `orientation` — Dikey veya yatay.
- `padding` — Sistem UI dolgusu (çentik, durum çubuğu vb.).
- `viewInsets` — Klavye veya diğer sistem yer paylaşımları tarafından kullanılan alan.
- `textScaleFactor` — Kullanıcı tarafından ayarlanan yazı tipi ölçekleme tercihi.
- `platformBrightness` — Açık veya karanlık platform parlaklık modu.
- `devicePixelRatio` — Fiziksel pikselden mantıksal piksele oran.

```dart
Widget build(BuildContext context) {
  final mediaQuery = MediaQuery.of(context);
  final screenWidth = mediaQuery.size.width;
  final screenHeight = mediaQuery.size.height;
  final systemPadding = mediaQuery.padding;
  final isWideScreen = screenWidth > 600;

  return Padding(
    padding: EdgeInsets.fromLTRB(
      16.0,
      systemPadding.top + 16.0,   // Durum çubuğunu / çentiği dikkate al
      16.0,
      systemPadding.bottom + 16.0, // Alt gezinme çubuğunu dikkate al
    ),
    child: Center(
      child: SizedBox(
        width: isWideScreen ? 400 : screenWidth * 0.85,
        child: Text('Genişlik: ${screenWidth.toStringAsFixed(1)}px'),
      ),
    ),
  );
}
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/MediaQuery-class.html

---

## `Padding`

**Açıklama:** Alt widget'ını belirli bir miktarda `EdgeInsets` geometrisi kullanarak **girintiler**. Alt öğesinin etrafına boş alan ekler. Nefes alma alanı ve hizalama için en sık kullanılan düzen ilkellerinden biridir.

**Yaygın `EdgeInsets` yapıcıları:**
- `EdgeInsets.all(value)` — Dört tarafın tamamında aynı.
- `EdgeInsets.symmetric(horizontal, vertical)` — Simetrik yatay/dikey.
- `EdgeInsets.only(left, top, right, bottom)` — Yalnızca belirli taraflar.
- `EdgeInsets.fromLTRB(left, top, right, bottom)` — Dördünü ayrı ayrı.

```dart
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  child: Text('16px yatay, 8px dikey dolgulu metin'),
)

// EdgeInsets.only ile
Padding(
  padding: const EdgeInsets.only(top: 20.0, left: 12.0),
  child: Icon(Icons.star),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/Padding-class.html

---

## `Theme`

**Açıklama:** Belirli bir `ThemeData` yapılandırmasını (renkler, tipografi, bileşen temaları) **torun widget'larına** uygular. Bir alt ağacı `Theme` içine sararak düğmeler, metin ve arka planlar gibi bileşenlerin görünümünü açık/karanlık modları veya özel markalaşmayı eşleştirecek şekilde dinamik olarak değiştirebilirsiniz.

**Temel API'lar:**
- `Theme.of(context)` — Bağlamdan en yakın `ThemeData`'ya erişin.
- `Theme.of(context).copyWith(...)` — Mevcut temanın değiştirilmiş bir kopyasını oluşturun.
- `Theme.of(context).colorScheme` — Renk şemasına erişin (primary, secondary, surface vb.).
- `Theme.of(context).textTheme` — Metin stili rollerine erişin (titleLarge, bodyMedium vb.).

```dart
// Bir alt ağaca özel tema uygulama
Theme(
  data: Theme.of(context).copyWith(
    colorScheme: Theme.of(context).colorScheme.copyWith(
      primary: Colors.green,
    ),
  ),
  child: Column(
    children: [
      ElevatedButton(onPressed: () {}, child: const Text('Yeşil Birincil Düğme')),
      const TextField(decoration: InputDecoration(labelText: 'Girdi')),
    ],
  ),
)

// Tema değerlerine erişme
Widget build(BuildContext context) {
  final theme = Theme.of(context);
  return Text(
    'Temalı metin',
    style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
  );
}
```

**API bağlantısı:** https://api.flutter.dev/flutter/material/Theme-class.html

---

## Tam Örnek: Theme + AnimatedTheme + MediaQuery + Padding Birlikte

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() => setState(() => _isDarkMode = !_isDarkMode);

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      duration: const Duration(milliseconds: 400),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(isDarkMode: _isDarkMode, onToggle: _toggleTheme),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggle;

  const HomeScreen({super.key, required this.isDarkMode, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final systemPadding = mediaQuery.padding;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stil Demosu'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: onToggle,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, systemPadding.top + 16, 16, systemPadding.bottom + 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Mevcut Tema: ${isDarkMode ? "Karanlık" : "Açık"}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              Text('Ekran genişliği: ${screenWidth.toStringAsFixed(1)}px'),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: onToggle, child: const Text('Temayı Değiştir')),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

## Stil Widget'ları İlgili API Bağlantıları

- https://api.flutter.dev/flutter/widgets/DefaultTextStyle-class.html
- https://api.flutter.dev/flutter/widgets/AnimatedDefaultTextStyle-class.html
- https://api.flutter.dev/flutter/material/Theme-class.html
- https://api.flutter.dev/flutter/material/AnimatedTheme-class.html
- https://api.flutter.dev/flutter/widgets/MediaQuery-class.html
- https://api.flutter.dev/flutter/widgets/Padding-class.html
- https://api.flutter.dev/flutter/widgets/DefaultTextEditingOptions-class.html

---

# 16. Metin Widget'ları

**Orijinal kaynak:** https://docs.flutter.dev/ui/widgets/text

## Genel Bakış

Flutter'da metin görüntüleme ve stillendirme, basit, tek stilden birden fazla biçimlendirme, satır içi widget'lar ve hareketler içeren karmaşık paragraflara uzanır. `Text`, `RichText`, `DefaultTextStyle`, `SelectableText`, `EditableText` ve `TextSpan`'ı anlamak, tipografiyi etkin biçimde yönetmek için esastır.

---

## `DefaultTextStyle`

**Açıklama:** Açıkça tanımlanmış bir stilden yoksun tüm torun `Text` widget'ları için temel metin stili oluşturan **inherited widget** (`InheritedWidget`). Açık `style` özelliği olmayan herhangi bir alt `Text` widget'ı, en yakın `DefaultTextStyle` tarafından tanımlanan yazı tipi boyutu, renk, kalınlık veya aileye otomatik olarak geri döner.

**Programatik erişim:** `DefaultTextStyle.of(context).style` — bir `RichText` widget'ı içinde kök `TextSpan` oluştururken sık sık gereklidir.

```dart
DefaultTextStyle(
  style: const TextStyle(
    fontSize: 16,
    color: Colors.grey,
  ),
  child: Column(
    children: const [
      Text('Bu metin gri rengi ve 16sp boyutu devralır.'),
      Text(
        'Bu metin kendi rengini geçersiz kılar.',
        style: TextStyle(color: Colors.black),
      ),
    ],
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/DefaultTextStyle-class.html

---

## `EditableText`

**Açıklama:** Ham klavye girişini, imleç hareketini, metin seçimi düzenlemeyi ve oluşturma bölgelerini işleyen **temel, düşük seviyeli metin düzenleme widget'ı**. `TextField` ve `CupertinoTextField` gibi üst düzey bileşenlerin arkasındaki motorudur.

**Gerekli parametreler:** `controller` (`TextEditingController`), `focusNode` (`FocusNode`), `style`, `cursorColor`, `backgroundCursorColor`.

> **⚠️ Not:** Uygulama geliştiricileri tarafından nadiren doğrudan kullanılır. Tamamen özel bir metin giriş sistemi oluşturmadığınız sürece `TextField` veya `TextFormField` kullanın.

```dart
EditableText(
  controller: TextEditingController(text: 'Beni düzenle!'),
  focusNode: FocusNode(),
  style: const TextStyle(color: Colors.black, fontSize: 16),
  cursorColor: Colors.blue,
  backgroundCursorColor: Colors.grey,
  showCursor: true,
  autofocus: false,
  maxLines: 1,
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/EditableText-class.html

---

## `RichText`

**Açıklama:** Tek bir biçimlendirme bloğu içinde **birden fazla farklı stil** kullanan metni görüntüler. `TextSpan` nesnelerinin ağacı tarafından yönlendirilir. Hareket tanıyıcılar aracılığıyla etkileşimli segmentlere olanak tanır (örn. tıklanabilir bağlantılar). `WidgetSpan` aracılığıyla metin dışı widget'lar yerleştirmeyi destekler.

> **⚠️ Önemli:** `Text`'in aksine, `RichText`, kök `TextSpan`'da açıkça bir temel stil tanımlamadığınız veya bunun yerine `Text.rich` kullanmadığınız sürece çevreleyen `DefaultTextStyle`'dan **otomatik olarak miras almaz**.

**Kullanım Alanları:** Hashtag/mention içeren sosyal medya gönderileri, hizmet koşulları bağlantıları, kalın anahtar kelimeler içeren yerelleştirilmiş string'ler, satır içi ikonlar/rozetler.

```dart
import 'package:flutter/gestures.dart';

RichText(
  text: TextSpan(
    // ÖNEMLİ: Beyaz arka planda beyaz metni önlemek için tema stillerini manuel devral
    style: DefaultTextStyle.of(context).style,
    children: <TextSpan>[
      const TextSpan(text: 'Merhaba '),
      const TextSpan(
        text: 'kalın',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
      ),
      const TextSpan(text: ' dünya! '),
      TextSpan(
        text: 'buraya',
        style: const TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            print('Bağlantıya dokunuldu!');
          },
      ),
      const TextSpan(text: ' tıklayın.'),
    ],
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/RichText-class.html

---

## `SelectableText`

**Açıklama:** Kullanıcıların doğrudan ekrandan metni **uzun basarak ve sürükleyerek vurgulayıp seçip kopyalamasına** olanak tanıyan özelleşmiş metin widget'ı. Yerel metin seçim mekaniğini (Kopyalama, Tümünü Seç vb. için bağlam menüleriyle) etkinleştiren standart `Text` widget'ı gibi davranır.

**Varyantlar:**
- `SelectableText(string)`: Düz seçilebilir metin.
- `SelectableText.rich(TextSpan)`: Karışık stillemeli seçilebilir zengin metin.

**Kullanım Alanları:** Hata günlükleri, kullanıcı profil ayrıntıları, sohbet mesajları, kod parçacıkları, referans numaraları, sıklıkla kopyalanması gereken URL'ler.

**İlgili:** Uygulamanın büyük bölümlerini veya birden fazla metin widget'ını eş zamanlı olarak seçilebilir yapmak için bunun yerine daha geniş `SelectionArea` widget'ını kullanın.

```dart
// Temel seçilebilir metin
const SelectableText(
  'Bu metin kullanıcı tarafından vurgulanabilir ve kopyalanabilir.',
  style: TextStyle(fontSize: 16, color: Colors.indigo),
)

// Zengin seçilebilir metin
SelectableText.rich(
  TextSpan(
    text: 'Ayrıca ',
    style: const TextStyle(color: Colors.black, fontSize: 15),
    children: const [
      TextSpan(
        text: 'SelectableText.rich ',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
      ),
      TextSpan(text: 'özelliğini kullanarak karışık stillendirilmiş metinleri seçilebilir yapabilirsiniz!'),
    ],
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/material/SelectableText-class.html

---

## `Text`

**Açıklama:** **Tek, tekdüze bir stille metin dizisi** görüntülemenin standart, en yaygın yolu. Açık `style` özelliği sağlanmazsa, en yakın `DefaultTextStyle` atasından stilini otomatik olarak devralır.

**Temel özellikler:**
- `style` — Tüm metin için `TextStyle`.
- `textAlign` — Hizalama (left, right, center, justify, start, end).
- `maxLines` — Görüntülenecek maksimum satır sayısı.
- `overflow` — `TextOverflow.ellipsis`, `TextOverflow.clip`, `TextOverflow.fade`.
- `softWrap` — Metnin yumuşak satır sonlarında sarılıp sarılmayacağı.
- `textScaleFactor` — Metni ölçeklendirme faktörü.

**Varyant:** `Text.rich(TextSpan)` — Varsayılan stilleri ve ölçekleri uyarlarken bir span ağacı render eder.

```dart
// Basit Metin
Text(
  'Merhaba, Flutter!',
  style: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  ),
)

// Taşma yönetimiyle Metin
Text(
  'Bu kapsayıcı sınırlarını aşabilecek çok uzun bir metin...',
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
  style: const TextStyle(fontSize: 14),
)

// Text.rich kısayolu
Text.rich(
  TextSpan(
    text: 'Merhaba ',
    children: const [
      TextSpan(
        text: 'kalın',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(text: ' dünya!'),
    ],
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/Text-class.html

---

## `TextSpan` — Zengin Metnin Yapı Taşı

`TextSpan`, `RichText` veya `Text.rich` tarafından kullanılan metin segmentleri ağacını tanımlayan **değişmez bir nesnedir (widget'ın kendisi değil)**. Yinelemeli ağaç yapısı oluşturur.

**Temel özellikler:**
- `text` — Bu belirli span için string parçası.
- `style` — Bu span'e ve torunlarına uygulanan `TextStyle` (geçersiz kılınmadıkça).
- `children` — İç içe geçmiş alt `TextSpan` veya `WidgetSpan` nesnelerinin listesi.
- `recognizer` — Belirli alt string'leri etkileşimli/tıklanabilir yapmak için `GestureRecognizer` (genellikle `TapGestureRecognizer`).

```dart
TextSpan(
  text: 'Bu ',
  style: const TextStyle(fontSize: 16, color: Colors.black),
  children: [
    const TextSpan(
      text: 'önemli',
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
    ),
    const TextSpan(text: ' bilgidir.'),
    TextSpan(
      text: ' Daha fazla öğren',
      style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
      recognizer: TapGestureRecognizer()
        ..onTap = () { print('Bağlantıya dokunuldu'); },
    ),
  ],
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/painting/TextSpan-class.html

---

## `WidgetSpan` — Metin İçine Widget Yerleştirme

`WidgetSpan`, `TextSpan` alt öğeler listesi içinde **herhangi bir Flutter widget'ını metinle satır içine yerleştirmenize** olanak tanır. Bir paragraf içindeki satır içi ikonlar, rozetler veya küçük etkileşimli öğeler için kullanışlıdır.

```dart
RichText(
  text: TextSpan(
    style: const TextStyle(color: Colors.black87, fontSize: 16),
    children: [
      const TextSpan(text: 'Favorilemek için '),
      // Metne gömülü satır içi ikon
      WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: const Icon(Icons.star, size: 18, color: Colors.amber),
      ),
      const TextSpan(text: ' simgesine tıklayın. Bu rozeti de kontrol edin: '),
      WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'YENİ',
            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  ),
)
```

**API bağlantısı:** https://api.flutter.dev/flutter/widgets/WidgetSpan-class.html

---

## Tam Metin Widget'ları Kod Örneği

```dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(const TextWidgetsDemoApp());

class TextWidgetsDemoApp extends StatelessWidget {
  const TextWidgetsDemoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Metin Widget\'ları Demosu',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TextWidgetsHomePage(),
    );
  }
}

class TextWidgetsHomePage extends StatefulWidget {
  const TextWidgetsHomePage({super.key});
  @override
  State<TextWidgetsHomePage> createState() => _TextWidgetsHomePageState();
}

class _TextWidgetsHomePageState extends State<TextWidgetsHomePage> {
  late TextEditingController _editableTextController;
  late FocusNode _editableTextFocusNode;

  @override
  void initState() {
    super.initState();
    _editableTextController = TextEditingController(text: 'Düşük seviyeli EditableText ile beni düzenleyin!');
    _editableTextFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _editableTextController.dispose();
    _editableTextFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text, RichText, Seçilebilir ve Düzenlenebilir Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Temel Text
            const Text(
              'Flutter Metin Widget\'ları',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // 2. RichText ile TextSpan
            const Text('RichText ile TextSpan örneği:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  const TextSpan(text: 'Normal metin, '),
                  const TextSpan(
                    text: 'kalın kırmızı',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  const TextSpan(text: ' ve '),
                  TextSpan(
                    text: 'tıklanabilir bağlantı',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Bağlantıya dokunuldu!')),
                        );
                      },
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 3. SelectableText
            const Text('SelectableText örneği:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SelectableText(
              'Bu metin seçilebilir. Uzun basın ve sürükleyin!',
              style: TextStyle(fontSize: 16, color: Colors.indigo),
            ),
            const SizedBox(height: 16),

            // 4. WidgetSpan ile RichText
            const Text('WidgetSpan örneği:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black87, fontSize: 16),
                children: [
                  const TextSpan(text: 'Metinle birlikte ikon: '),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: const Icon(Icons.star, size: 20, color: Colors.amber),
                  ),
                  const TextSpan(text: ' ve rozet: '),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'YENİ',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## Metin Widget'ları Özet Tablosu

| Widget | Açıklama | API Bağlantısı |
|--------|----------|----------------|
| `Text` | Tek stilinde metin görüntüler. | [Text-class](https://api.flutter.dev/flutter/widgets/Text-class.html) |
| `RichText` | Birden fazla stil/span içeren metin. | [RichText-class](https://api.flutter.dev/flutter/widgets/RichText-class.html) |
| `DefaultTextStyle` | Torun metin widget'ları için varsayılan stil. | [DefaultTextStyle-class](https://api.flutter.dev/flutter/widgets/DefaultTextStyle-class.html) |
| `SelectableText` | Kopyalanabilir/seçilebilir metin. | [SelectableText-class](https://api.flutter.dev/flutter/material/SelectableText-class.html) |
| `EditableText` | Düşük seviyeli metin düzenleme motoru. | [EditableText-class](https://api.flutter.dev/flutter/widgets/EditableText-class.html) |
| `TextSpan` | RichText için metin segmenti nesnesi. | [TextSpan-class](https://api.flutter.dev/flutter/painting/TextSpan-class.html) |
| `WidgetSpan` | Metin içine widget yerleştirme. | [WidgetSpan-class](https://api.flutter.dev/flutter/widgets/WidgetSpan-class.html) |

---

*Bu doküman, [docs.flutter.dev](https://docs.flutter.dev) adresindeki resmi Flutter dokümantasyonundan Türkçeye çevrilmiştir. Tüm Dart kod örnekleri orijinal kaynaklardan alınmış ve değiştirilmeden korunmuştur. Orijinal lisanslar (BSD-3-Clause, CC-BY 4.0) geçerliliğini korumaktadır.*
