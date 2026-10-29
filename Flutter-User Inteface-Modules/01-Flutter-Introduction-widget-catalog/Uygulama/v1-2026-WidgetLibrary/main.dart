import 'dart:async';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:material_ui/material_ui.dart';

void main() => runApp(const FlutterWidgetLabApp());

class FlutterWidgetLabApp extends StatefulWidget {
  const FlutterWidgetLabApp({super.key});

  @override
  State<FlutterWidgetLabApp> createState() => _FlutterWidgetLabAppState();
}

class _FlutterWidgetLabAppState extends State<FlutterWidgetLabApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme() => setState(() {
        _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
      });

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF8B5CF6);
    return MaterialApp(
      title: 'Flutter Widget Lab',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.light),
        scaffoldBackgroundColor: const Color(0xFFF6F5FA),
        cardTheme: const CardThemeData(elevation: 0, margin: EdgeInsets.zero),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.dark),
        scaffoldBackgroundColor: const Color(0xFF101018),
        cardTheme: const CardThemeData(elevation: 0, margin: EdgeInsets.zero),
      ),
      home: HomeScreen(isDark: _themeMode == ThemeMode.dark, onToggleTheme: _toggleTheme),
    );
  }
}

class WidgetItem {
  const WidgetItem(this.name, this.description);
  final String name;
  final String description;
}

class WidgetCategory {
  const WidgetCategory({
    required this.title,
    required this.subtitle,
    required this.path,
    required this.icon,
    required this.items,
  });
  final String title;
  final String subtitle;
  final String path;
  final IconData icon;
  final List<WidgetItem> items;
}

const widgetCategories = <WidgetCategory>[
  WidgetCategory(title: 'Cupertino widgets', subtitle: 'Apple tarzı arayüz bileşenleri', path: 'cupertino', icon: Icons.phone_iphone_rounded, items: [
    WidgetItem('CupertinoActionSheet', 'iOS tarzı seçenekler menüsü.'),
    WidgetItem('CupertinoActivityIndicator', 'iOS tarzı yükleniyor göstergesi.'),
    WidgetItem('CupertinoAlertDialog', 'iOS tarzı uyarı penceresi.'),
    WidgetItem('CupertinoButton', 'iOS tarzı basılabilir düğme.'),
    WidgetItem('CupertinoCheckbox', 'macOS tarzı onay kutusu.'),
    WidgetItem('CupertinoDatePicker', 'iOS tarzı tarih seçici.'),
    WidgetItem('CupertinoDialogAction', 'iOS uyarı penceresi eylemi.'),
    WidgetItem('CupertinoNavigationBar', 'iOS tarzı gezinme çubuğu.'),
    WidgetItem('CupertinoPicker', 'Tekerlek biçiminde seçenek seçici.'),
    WidgetItem('CupertinoSegmentedControl', 'Segmentli seçenek kontrolü.'),
    WidgetItem('CupertinoSlider', 'iOS tarzı değer kaydırıcısı.'),
    WidgetItem('CupertinoSlidingSegmentedControl', 'Kaydırmalı segment kontrolü.'),
    WidgetItem('CupertinoSwitch', 'iOS tarzı açma kapama anahtarı.'),
    WidgetItem('CupertinoTabBar', 'iOS tarzı alt gezinme.'),
    WidgetItem('CupertinoTextField', 'iOS tarzı metin alanı.'),
  ]),
  WidgetCategory(title: 'Material component widgets', subtitle: 'Material 3 bileşenleri', path: 'material', icon: Icons.widgets_rounded, items: [
    WidgetItem('AppBar', 'Ekranın üstündeki uygulama çubuğu.'),
    WidgetItem('BottomNavigationBar', 'Alt gezinme öğeleri.'),
    WidgetItem('Button', 'Düğme türleri ve durumları.'),
    WidgetItem('Card', 'İçeriği bir yüzey üzerinde gruplar.'),
    WidgetItem('Checkbox', 'Bir seçeneği işaretleme kontrolü.'),
    WidgetItem('Chip', 'Kısa bilgi veya filtre etiketi.'),
    WidgetItem('CircularProgressIndicator', 'Dairesel ilerleme göstergesi.'),
    WidgetItem('Dialog', 'Modal iletişim penceresi.'),
    WidgetItem('Drawer', 'Yan gezinme çekmecesi.'),
    WidgetItem('FloatingActionButton', 'Vurgulu yüzen eylem düğmesi.'),
    WidgetItem('IconButton', 'Simge biçiminde düğme.'),
    WidgetItem('ListTile', 'Başlık ve yardımcı metin içeren satır.'),
    WidgetItem('NavigationBar', 'Material 3 alt gezinme çubuğu.'),
    WidgetItem('ProgressIndicator', 'İşlem ilerlemesini gösterir.'),
    WidgetItem('Radio', 'Bir seçenek grubundan tek seçim.'),
    WidgetItem('Scaffold', 'Material sayfa düzeninin temel iskeleti.'),
    WidgetItem('Slider', 'Belirli aralıktan değer seçimi.'),
    WidgetItem('SnackBar', 'Ekranın altında kısa bildirim.'),
    WidgetItem('Switch', 'Açma ve kapama kontrolü.'),
    WidgetItem('TabBar', 'Sekmeler arasında geçiş.'),
    WidgetItem('TextButton', 'Düz metin düğmesi.'),
    WidgetItem('TextField', 'Kullanıcıdan metin alır.'),
  ]),
  WidgetCategory(title: 'Accessibility widgets', subtitle: 'Erişilebilirlik ve anlamsal bilgi', path: 'accessibility', icon: Icons.accessibility_new_rounded, items: [
    WidgetItem('ExcludeSemantics', 'Alt bileşenlerin anlamsal bilgisini dışlar.'),
    WidgetItem('MergeSemantics', 'Birden çok anlamsal düğümü birleştirir.'),
    WidgetItem('Semantics', 'Ekran okuyuculara bileşenin anlamını açıklar.'),
    WidgetItem('Tooltip', 'Bileşen hakkında kısa ipucu gösterir.'),
    WidgetItem('Focus', 'Klavye odağını yönetir.'),
  ]),
  WidgetCategory(title: 'Animation and motion widgets', subtitle: 'Hareket ve geçiş efektleri', path: 'animation', icon: Icons.animation_rounded, items: [
    WidgetItem('AnimatedAlign', 'Çocuğun hizasını animasyonla değiştirir.'),
    WidgetItem('AnimatedContainer', 'Boyut, renk ve köşeleri yumuşak değiştirir.'),
    WidgetItem('AnimatedCrossFade', 'İki bileşen arasında çapraz geçiş yapar.'),
    WidgetItem('AnimatedOpacity', 'Saydamlığı animasyonla değiştirir.'),
    WidgetItem('AnimatedScale', 'Ölçeği animasyonla değiştirir.'),
    WidgetItem('AnimatedSize', 'Boyut değişimini animasyonla gösterir.'),
    WidgetItem('FadeTransition', 'Solma animasyonu uygular.'),
    WidgetItem('Hero', 'Ekranlar arasında ortak öğe geçişi.'),
    WidgetItem('RotationTransition', 'Döndürme animasyonu.'),
    WidgetItem('ScaleTransition', 'Ölçekleme animasyonu.'),
    WidgetItem('SlideTransition', 'Kayma animasyonu.'),
  ]),
  WidgetCategory(title: 'Assets, images, and icon widgets', subtitle: 'Görseller, simgeler ve uygulama varlıkları', path: 'assets', icon: Icons.image_rounded, items: [
    WidgetItem('AssetBundle', 'Uygulama paketindeki kaynaklara erişim.'),
    WidgetItem('Icon', 'Material simgesi gösterir.'),
    WidgetItem('Image', 'Bir görseli ekranda gösterir.'),
    WidgetItem('RawImage', 'dart:ui.Image nesnesini gösterir.'),
    WidgetItem('FlutterLogo', 'Flutter logosunun widget karşılığı.'),
  ]),
  WidgetCategory(title: 'Async widgets', subtitle: 'Asenkron veri ve bekleme durumları', path: 'async', icon: Icons.sync_rounded, items: [
    WidgetItem('FutureBuilder', 'Future sonucuna göre ekranı günceller.'),
    WidgetItem('StreamBuilder', 'Stream üzerinden gelen veriyi gösterir.'),
  ]),
  WidgetCategory(title: 'Basic widgets', subtitle: 'Temel widget yapı taşları', path: 'basics', icon: Icons.dashboard_customize_rounded, items: [
    WidgetItem('AppBar', 'Üst uygulama çubuğu.'),
    WidgetItem('Column', 'Çocuklarını dikey dizer.'),
    WidgetItem('Container', 'Boyut, boşluk ve dekorasyonu birleştirir.'),
    WidgetItem('ElevatedButton', 'Yükseltilmiş Material düğmesi.'),
    WidgetItem('FlutterLogo', 'Flutter logosu.'),
    WidgetItem('Icon', 'Simge gösterir.'),
    WidgetItem('Image', 'Görsel gösterir.'),
    WidgetItem('Placeholder', 'Henüz tamamlanmamış alanı belirtir.'),
    WidgetItem('Row', 'Çocuklarını yatay dizer.'),
    WidgetItem('Scaffold', 'Temel sayfa iskeleti.'),
    WidgetItem('Text', 'Metin gösterir.'),
  ]),
  WidgetCategory(title: 'Input widgets', subtitle: 'Formlar ve kullanıcı girdileri', path: 'input', icon: Icons.edit_note_rounded, items: [
    WidgetItem('Autocomplete', 'Yazdıkça öneriler sunar.'),
    WidgetItem('Form', 'Birden fazla alanı birlikte yönetir.'),
    WidgetItem('FormField', 'Form alanı durumunu ve doğrulamayı yönetir.'),
    WidgetItem('KeyboardListener', 'Klavye olaylarını yakalar.'),
    WidgetItem('TextField', 'Metin girişi.'),
    WidgetItem('TextFormField', 'Form doğrulamasıyla metin girişi.'),
    WidgetItem('Checkbox', 'Onay kutusu girdisi.'),
    WidgetItem('Slider', 'Sayısal değer girdisi.'),
    WidgetItem('Switch', 'İkili durum girdisi.'),
    WidgetItem('DropdownButton', 'Listeden seçim girdisi.'),
  ]),
  WidgetCategory(title: 'Interaction model widgets', subtitle: 'Dokunma, sürükleme ve hareketler', path: 'interaction', icon: Icons.touch_app_rounded, items: [
    WidgetItem('AbsorbPointer', 'Alt öğelere gelen işaretçi olaylarını durdurur.'),
    WidgetItem('Dismissible', 'Kaydırarak kaldırılabilen öğe.'),
    WidgetItem('DragTarget', 'Sürüklenen öğeyi bırakma alanı.'),
    WidgetItem('Draggable', 'Sürüklenebilir öğe.'),
    WidgetItem('GestureDetector', 'Dokunma hareketlerini algılar.'),
    WidgetItem('InkWell', 'Mürekkep dalgası efektli dokunma alanı.'),
    WidgetItem('Listener', 'Ham işaretçi olaylarını dinler.'),
    WidgetItem('LongPressDraggable', 'Uzun basınca sürüklenebilir öğe.'),
    WidgetItem('MouseRegion', 'Fare bölgesine giriş ve çıkışı algılar.'),
    WidgetItem('IgnorePointer', 'Alt öğelerin işaretçi olaylarını yok sayar.'),
  ]),
  WidgetCategory(title: 'Layout widgets', subtitle: 'Hizalama, boyutlandırma ve düzen', path: 'layout', icon: Icons.view_quilt_rounded, items: [
    WidgetItem('Align', 'Çocuğu belirli bir konumda hizalar.'),
    WidgetItem('AspectRatio', 'Genişlik-yükseklik oranını korur.'),
    WidgetItem('Baseline', 'Metin taban çizgisine göre hizalar.'),
    WidgetItem('Center', 'Çocuğu ortalar.'),
    WidgetItem('ConstrainedBox', 'Çocuğa boyut sınırları uygular.'),
    WidgetItem('Container', 'Boyut, boşluk ve görünümü yönetir.'),
    WidgetItem('Expanded', 'Kalan alanı doldurur.'),
    WidgetItem('FittedBox', 'İçeriği kullanılabilir alana sığdırır.'),
    WidgetItem('Flexible', 'Esnek alan paylaşımı sağlar.'),
    WidgetItem('FractionallySizedBox', 'Ebeveyn boyutunun oranını kullanır.'),
    WidgetItem('LayoutBuilder', 'Mevcut kısıtlara göre düzen kurar.'),
    WidgetItem('Padding', 'Çocuğun çevresine iç boşluk ekler.'),
    WidgetItem('Row', 'Yatay düzen kurar.'),
    WidgetItem('SizedBox', 'Sabit boyut veya boşluk sağlar.'),
    WidgetItem('Stack', 'Öğeleri üst üste yerleştirir.'),
    WidgetItem('Wrap', 'Sığmayan öğeleri yeni satıra taşır.'),
    WidgetItem('Column', 'Dikey düzen kurar.'),
  ]),
  WidgetCategory(title: 'Painting and effect widgets', subtitle: 'Çizim, kırpma ve görsel efektler', path: 'painting', icon: Icons.brush_rounded, items: [
    WidgetItem('BackdropFilter', 'Arka planı filtreler.'),
    WidgetItem('ClipOval', 'Çocuğu oval biçimde kırpar.'),
    WidgetItem('ClipPath', 'Çocuğu özel bir yola göre kırpar.'),
    WidgetItem('ClipRect', 'Çocuğu dikdörtgen alanda kırpar.'),
    WidgetItem('CustomPaint', 'Canvas üzerinde özel çizim yapar.'),
    WidgetItem('DecoratedBox', 'Çocuğun arkasına veya önüne dekorasyon çizer.'),
    WidgetItem('FractionalTranslation', 'Çocuğu oranlı olarak kaydırır.'),
    WidgetItem('Opacity', 'Saydamlığı kontrol eder.'),
    WidgetItem('RotatedBox', 'Çocuğu çeyrek tur adımlarıyla döndürür.'),
    WidgetItem('Transform', 'Döndürme, ölçekleme ve taşıma uygular.'),
  ]),
  WidgetCategory(title: 'Scrolling widgets', subtitle: 'Kaydırılabilir listeler ve sayfalar', path: 'scrolling', icon: Icons.swipe_rounded, items: [
    WidgetItem('CarouselView', 'Kaydırılabilir kart galerisi.'),
    WidgetItem('CustomScrollView', 'Sliver tabanlı kaydırma düzeni.'),
    WidgetItem('DraggableScrollableSheet', 'Sürüklenerek boyutu değişen kaydırma alanı.'),
    WidgetItem('GridView', 'Öğeleri ızgarada gösterir.'),
    WidgetItem('ListView', 'Kaydırılabilir liste gösterir.'),
    WidgetItem('NestedScrollView', 'İç içe kaydırma alanlarını koordine eder.'),
    WidgetItem('PageView', 'Sayfalar arasında yatay/dikey gezinir.'),
    WidgetItem('RefreshIndicator', 'Aşağı çekerek yenileme hareketi.'),
    WidgetItem('ReorderableListView', 'Liste öğelerinin sırasını değiştirir.'),
    WidgetItem('SingleChildScrollView', 'Tek bir içeriği kaydırılabilir yapar.'),
  ]),
  WidgetCategory(title: 'Styling widgets', subtitle: 'Tema, boşluk ve uyarlanabilir arayüz', path: 'styling', icon: Icons.palette_rounded, items: [
    WidgetItem('MediaQuery', 'Ekran ve kullanıcı arayüzü bilgilerine erişir.'),
    WidgetItem('Padding', 'İç boşluk ayarlar.'),
    WidgetItem('Theme', 'Alt widgetlara tema uygular.'),
    WidgetItem('SafeArea', 'Sistem çentiklerinden güvenli boşluk bırakır.'),
    WidgetItem('DefaultTextStyle', 'Alt metinlere varsayılan stil verir.'),
    WidgetItem('IconTheme', 'Alt simgelerin varsayılan stilini belirler.'),
  ]),
  WidgetCategory(title: 'Text widgets', subtitle: 'Metin gösterimi ve biçimlendirme', path: 'text', icon: Icons.text_fields_rounded, items: [
    WidgetItem('DefaultTextStyle', 'Alt metinler için varsayılan yazı stili.'),
    WidgetItem('RichText', 'Tek paragrafta birden çok metin stili.'),
    WidgetItem('Text', 'Tek biçimli metin gösterimi.'),
  ]),
];

const _palette = <Color>[
  Color(0xFF8B5CF6), Color(0xFF06B6D4), Color(0xFF22C55E), Color(0xFFF97316),
  Color(0xFFEF4444), Color(0xFFEC4899), Color(0xFF3B82F6), Color(0xFF64748B),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.isDark, required this.onToggleTheme, super.key});
  final bool isDark;
  final VoidCallback onToggleTheme;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final filtered = widgetCategories.where((c) =>
      c.title.toLowerCase().contains(_query.toLowerCase()) ||
      c.subtitle.toLowerCase().contains(_query.toLowerCase()) ||
      c.items.any((i) => i.name.toLowerCase().contains(_query.toLowerCase()))).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widget Lab', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [IconButton(tooltip: 'Temayı değiştir', onPressed: widget.onToggleTheme, icon: Icon(widget.isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded))],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
                      colors: [scheme.primary.withOpacity(.95), const Color(0xFF4338CA), const Color(0xFF111827)]),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Row(children: [Icon(Icons.science_rounded, color: Colors.white, size: 30), SizedBox(width: 10), Text('Widget Playground', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800))]),
                    const SizedBox(height: 10),
                    Text('Oku geç. Dokun, dene, değiştir.', style: TextStyle(color: Colors.white.withOpacity(.9), fontSize: 15)),
                    const SizedBox(height: 15),
                    Wrap(spacing: 8, runSpacing: 8, children: [
                      _HeroTag(text: '${widgetCategories.length} kategori'),
                      _HeroTag(text: '${widgetCategories.fold<int>(0, (n, c) => n + c.items.length)} widget örneği'),
                      const _HeroTag(text: 'Canlı önizleme'),
                    ]),
                  ]),
                ),
                const SizedBox(height: 20),
                TextField(
                  onChanged: (value) => setState(() => _query = value),
                  decoration: InputDecoration(
                    hintText: 'Kategori veya widget ara…', prefixIcon: const Icon(Icons.search_rounded),
                    filled: true, fillColor: scheme.surfaceContainerHighest.withOpacity(.55),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 17),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(_query.isEmpty ? 'Kategoriler' : 'Arama sonuçları', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
                  Text('${filtered.length} başlık', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: scheme.onSurfaceVariant)),
                ]),
                const SizedBox(height: 10),
              ]),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 28),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.03),
              delegate: SliverChildBuilderDelegate((context, index) {
                final category = filtered[index];
                return _CategoryCard(category: category, onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => CategoryScreen(category: category, isDark: widget.isDark, onToggleTheme: widget.onToggleTheme, initialQuery: _query))));
              }, childCount: filtered.length),
            ),
          ),
          SliverToBoxAdapter(child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 24),
            child: Card(color: scheme.surfaceContainerHighest.withOpacity(.55), child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Resmî dokümantasyon', style: TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 5),
              const Text('Başlıklar Flutter UI ve Widget Catalog dokümanlarına göre düzenlendi. Bu uygulama etkileşimli bir öğrenme alanıdır; her platform widget’ının tüm API seçeneklerini birebir kopyalamaz.'),
              const SizedBox(height: 8),
              const SelectableText('https://docs.flutter.dev/ui/widgets'),
            ]))),
          )),
        ],
      ),
    );
  }
}

class _HeroTag extends StatelessWidget {
  const _HeroTag({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), decoration: BoxDecoration(color: Colors.white.withOpacity(.14), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white.withOpacity(.22))), child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)));
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({required this.category, required this.onTap});
  final WidgetCategory category;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.antiAlias,
      color: scheme.surfaceContainer,
      child: InkWell(onTap: onTap, child: Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(width: 44, height: 44, decoration: BoxDecoration(color: scheme.primaryContainer, borderRadius: BorderRadius.circular(14)), child: Icon(category.icon, color: scheme.onPrimaryContainer, size: 24)),
        const Spacer(),
        Text(category.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
        const SizedBox(height: 3),
        Text(category.subtitle, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant, height: 1.2)),
        const SizedBox(height: 9),
        Row(children: [Text('${category.items.length} örnek', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: scheme.primary, fontWeight: FontWeight.w700)), const Spacer(), Icon(Icons.arrow_forward_rounded, size: 18, color: scheme.primary)]),
      ]))),
    );
  }
}

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({required this.category, required this.isDark, required this.onToggleTheme, this.initialQuery = '', super.key});
  final WidgetCategory category;
  final bool isDark;
  final VoidCallback onToggleTheme;
  final String initialQuery;
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late String _query;
  @override
  void initState() { super.initState(); _query = widget.initialQuery; }
  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final items = widget.category.items.where((i) => i.name.toLowerCase().contains(_query.toLowerCase()) || i.description.toLowerCase().contains(_query.toLowerCase())).toList();
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.title, style: const TextStyle(fontWeight: FontWeight.w800)), actions: [IconButton(onPressed: widget.onToggleTheme, tooltip: 'Temayı değiştir', icon: Icon(widget.isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded))]),
      body: ListView(padding: const EdgeInsets.fromLTRB(18, 10, 18, 28), children: [
        Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: scheme.primaryContainer.withOpacity(.7), borderRadius: BorderRadius.circular(22)), child: Row(children: [Container(width: 54, height: 54, decoration: BoxDecoration(color: scheme.surface.withOpacity(.75), borderRadius: BorderRadius.circular(17)), child: Icon(widget.category.icon, size: 29, color: scheme.primary)), const SizedBox(width: 14), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(widget.category.subtitle, style: const TextStyle(fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text('${widget.category.items.length} alt başlık • Bir örnek seç ve canlı olarak dene.', style: Theme.of(context).textTheme.bodySmall)]))])),
        const SizedBox(height: 16),
        TextField(onChanged: (v) => setState(() => _query = v), decoration: InputDecoration(hintText: 'Bu kategoride ara…', prefixIcon: const Icon(Icons.search_rounded), filled: true, fillColor: scheme.surfaceContainerHighest.withOpacity(.5), border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none))),
        const SizedBox(height: 13),
        ...items.map((item) => Padding(padding: const EdgeInsets.only(bottom: 9), child: Card(color: scheme.surfaceContainer, child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          leading: Container(width: 42, height: 42, decoration: BoxDecoration(color: scheme.primaryContainer, borderRadius: BorderRadius.circular(13)), child: Icon(_iconFor(item.name), color: scheme.onPrimaryContainer)),
          title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.w700)),
          subtitle: Padding(padding: const EdgeInsets.only(top: 4), child: Text(item.description, maxLines: 2, overflow: TextOverflow.ellipsis)),
          trailing: Icon(Icons.tune_rounded, color: scheme.primary),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SimulatorScreen(category: widget.category, item: item, isDark: widget.isDark, onToggleTheme: widget.onToggleTheme))),
        )))),
        const SizedBox(height: 12),
        Text('Kaynak: https://docs.flutter.dev/ui/widgets/${widget.category.path}', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant)),
      ]),
    );
  }
}

IconData _iconFor(String name) {
  final n = name.toLowerCase();
  if (n.contains('text') || n.contains('form') || n.contains('input')) return Icons.text_fields_rounded;
  if (n.contains('button') || n.contains('action')) return Icons.smart_button_rounded;
  if (n.contains('image') || n.contains('asset') || n.contains('icon')) return Icons.image_rounded;
  if (n.contains('anim') || n.contains('transition')) return Icons.animation_rounded;
  if (n.contains('scroll') || n.contains('list') || n.contains('grid') || n.contains('view')) return Icons.view_agenda_rounded;
  if (n.contains('switch') || n.contains('check') || n.contains('slider') || n.contains('radio')) return Icons.toggle_on_rounded;
  if (n.contains('container') || n.contains('row') || n.contains('column') || n.contains('align') || n.contains('padding')) return Icons.view_quilt_rounded;
  return Icons.widgets_rounded;
}

class SimulatorScreen extends StatefulWidget {
  const SimulatorScreen({required this.category, required this.item, required this.isDark, required this.onToggleTheme, super.key});
  final WidgetCategory category;
  final WidgetItem item;
  final bool isDark;
  final VoidCallback onToggleTheme;
  @override
  State<SimulatorScreen> createState() => _SimulatorScreenState();
}

class _SimulatorScreenState extends State<SimulatorScreen> {
  double _scale = 1;
  double _padding = 16;
  double _radius = 16;
  double _opacity = 1;
  double _rotation = 0;
  double _fontSize = 18;
  double _duration = 450;
  double _sliderValue = 0.55;
  bool _enabled = true;
  bool _showIcon = true;
  bool _alternate = false;
  bool _checked = true;
  bool _switchValue = true;
  bool _loading = false;
  bool _previewDark = false;
  int _tapCount = 0;
  int _selectedColor = 0;
  int _selectedTab = 0;
  int _selectedDropdown = 0;
  final TextEditingController _textController = TextEditingController(text: 'Merhaba Flutter!');
  Future<String> _future = Future<String>.value('Veri başarıyla yüklendi');
  final List<String> _listItems = ['Birinci öğe', 'İkinci öğe', 'Üçüncü öğe', 'Dördüncü öğe'];

  Color get _accent => _palette[_selectedColor];
  String get _name => widget.item.name;
  String get _category => widget.category.title;
  String get _text => _textController.text;
  bool get _isText => _name.toLowerCase().contains('text') || _name == 'RichText' || _name == 'DefaultTextStyle';

  void _reset() {
    setState(() {
      _scale = 1; _padding = 16; _radius = 16; _opacity = 1; _rotation = 0; _fontSize = 18; _duration = 450;
      _sliderValue = .55; _enabled = true; _showIcon = true; _alternate = false; _checked = true;
      _switchValue = true; _loading = false; _previewDark = false; _tapCount = 0; _selectedColor = 0;
      _selectedTab = 0; _selectedDropdown = 0; _textController.text = 'Merhaba Flutter!';
      _future = Future<String>.value('Veri başarıyla yüklendi');
      _listItems..clear()..addAll(['Birinci öğe', 'İkinci öğe', 'Üçüncü öğe', 'Dördüncü öğe']);
    });
  }

  @override
  void dispose() { _textController.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(_name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800)), Text(_category, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: scheme.onSurfaceVariant))]),
        actions: [IconButton(tooltip: 'Sıfırla', onPressed: _reset, icon: const Icon(Icons.restart_alt_rounded)), IconButton(tooltip: 'Temayı değiştir', onPressed: widget.onToggleTheme, icon: Icon(widget.isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded))],
      ),
      body: ListView(padding: const EdgeInsets.fromLTRB(16, 8, 16, 30), children: [
        Row(children: [Icon(Icons.science_outlined, color: scheme.primary), const SizedBox(width: 8), Text('Canlı simülasyon', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)), const Spacer(), Container(padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5), decoration: BoxDecoration(color: scheme.tertiaryContainer, borderRadius: BorderRadius.circular(20)), child: Text('ETKİLEŞİMLİ', style: TextStyle(color: scheme.onTertiaryContainer, fontSize: 10, fontWeight: FontWeight.w800)))]),
        const SizedBox(height: 5),
        Text(widget.item.description, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: scheme.onSurfaceVariant)),
        const SizedBox(height: 14),
        _buildPreviewCard(context),
        const SizedBox(height: 18),
        Row(children: [Text('Özellikleri ayarla', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)), const Spacer(), TextButton.icon(onPressed: _reset, icon: const Icon(Icons.restart_alt_rounded, size: 18), label: const Text('Sıfırla'))]),
        const SizedBox(height: 8),
        _buildSettings(context),
        const SizedBox(height: 18),
        Card(color: scheme.surfaceContainer, child: Padding(padding: const EdgeInsets.all(15), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [Icon(Icons.link_rounded, color: scheme.primary), const SizedBox(width: 8), const Text('Resmî dokümantasyon', style: TextStyle(fontWeight: FontWeight.w800))]),
          const SizedBox(height: 6),
          SelectableText('https://docs.flutter.dev/ui/widgets/${widget.category.path}', style: TextStyle(color: scheme.primary, fontSize: 13)),
          const SizedBox(height: 5),
          Text('Önizleme ayarları bu ekrana özeldir. Gerçek projede aynı widget’ın API parametrelerini ve uygulama davranışını koduna aktarabilirsin.', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant)),
        ]))),
      ]),
    );
  }

  Widget _buildPreviewCard(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final surface = _previewDark ? const Color(0xFF171923) : const Color(0xFFF1F3F9);
    final foreground = _previewDark ? Colors.white : const Color(0xFF202437);
    return Card(clipBehavior: Clip.antiAlias, color: scheme.surfaceContainer, child: Padding(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [Text('ÖNİZLEME', style: Theme.of(context).textTheme.labelSmall?.copyWith(letterSpacing: 1.2, fontWeight: FontWeight.w800, color: scheme.onSurfaceVariant)), const Spacer(), IconButton(visualDensity: VisualDensity.compact, tooltip: 'Önizleme zeminini değiştir', onPressed: () => setState(() => _previewDark = !_previewDark), icon: const Icon(Icons.contrast_rounded, size: 19))]),
      AnimatedContainer(
        duration: Duration(milliseconds: _duration.round()),
        curve: Curves.easeInOutCubic,
        constraints: const BoxConstraints(minHeight: 230),
        width: double.infinity,
        padding: EdgeInsets.all(_padding.clamp(0, 42).toDouble()),
        decoration: BoxDecoration(color: surface, borderRadius: BorderRadius.circular(20), border: Border.all(color: scheme.outlineVariant.withOpacity(.65))),
        child: Center(child: Transform.rotate(angle: _rotation * 3.1415926535 / 180, child: Opacity(opacity: _opacity.clamp(0, 1).toDouble(), child: Transform.scale(scale: _scale.clamp(.5, 1.5).toDouble(), child: Theme(data: _previewDark ? ThemeData.dark(useMaterial3: true) : ThemeData.light(useMaterial3: true), child: DefaultTextStyle(style: TextStyle(color: foreground, fontSize: _fontSize), child: _buildDemo(context))))))),
      ),
      const SizedBox(height: 10),
      Row(children: [Icon(Icons.touch_app_outlined, size: 16, color: scheme.onSurfaceVariant), const SizedBox(width: 6), Expanded(child: Text('Önizlemenin içindeki öğelere dokunarak etkileşimi dene.', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant)))]),
    ])));
  }

  Widget _buildDemo(BuildContext context) {
    final name = _name.toLowerCase();
    final displayText = _text.isEmpty ? _name : _text;
    final style = TextStyle(fontSize: _fontSize, fontWeight: _alternate ? FontWeight.w800 : FontWeight.w500, color: _accent);

    if (widget.category.path == 'async' || name.contains('futurebuilder') || name.contains('streambuilder')) {
      if (name.contains('streambuilder')) {
        return StreamBuilder<int>(stream: Stream<int>.periodic(const Duration(milliseconds: 700), (i) => i + _tapCount).take(100), builder: (context, snapshot) => Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.sensors_rounded, color: _accent, size: 40), const SizedBox(height: 8), Text('StreamBuilder', style: style), Text('Gelen değer: ${snapshot.data ?? 0}', style: const TextStyle(fontSize: 14)), const SizedBox(height: 8), FilledButton(onPressed: () => setState(() => _tapCount++), child: const Text('Sayaç tabanını artır'))]));
      }
      return Column(mainAxisSize: MainAxisSize.min, children: [Icon(_loading ? Icons.cloud_download_rounded : Icons.cloud_done_rounded, color: _accent, size: 40), const SizedBox(height: 9), FutureBuilder<String>(future: _future, builder: (context, snapshot) { if (snapshot.connectionState != ConnectionState.done) return const CircularProgressIndicator(); if (snapshot.hasError) return const Text('Bir hata oluştu'); return Text(snapshot.data ?? 'Veri yok', textAlign: TextAlign.center, style: style); }), const SizedBox(height: 12), FilledButton.icon(onPressed: _reloadFuture, icon: const Icon(Icons.refresh_rounded), label: const Text('Tekrar yükle'))]);
    }

    if (widget.category.path == 'cupertino' || name.startsWith('cupertino')) {
      if (name.contains('switch')) return CupertinoSwitch(value: _switchValue, onChanged: _enabled ? (v) => setState(() => _switchValue = v) : null, activeTrackColor: _accent);
      if (name.contains('slider')) return SizedBox(width: 230, child: CupertinoSlider(value: _sliderValue, onChanged: _enabled ? (v) => setState(() => _sliderValue = v) : null, activeColor: _accent));
      if (name.contains('indicator')) return CupertinoActivityIndicator(radius: 17 + _sliderValue * 8, color: _accent);
      if (name.contains('textfield')) return SizedBox(width: 235, child: CupertinoTextField(placeholder: 'Bir şey yaz…', controller: _textController, enabled: _enabled, padding: const EdgeInsets.all(12)));
      if (name.contains('navigationbar') || name.contains('tabbar')) return Column(mainAxisSize: MainAxisSize.min, children: [const Text('CupertinoNavigationBar'), const SizedBox(height: 14), CupertinoSlidingSegmentedControl<int>(groupValue: _selectedTab, children: const {0: Text('Ana sayfa'), 1: Text('Ara'), 2: Text('Profil')}, onValueChanged: (v) => setState(() => _selectedTab = v ?? 0))]);
      return CupertinoButton.filled(onPressed: _enabled ? () => setState(() => _tapCount++) : null, child: Row(mainAxisSize: MainAxisSize.min, children: [if (_showIcon) const Icon(CupertinoIcons.hand_tap, size: 18), if (_showIcon) const SizedBox(width: 8), Text('$_name • $_tapCount') ]));
    }

    if (_isText || name == 'text') {
      if (name.contains('textfield') || name.contains('formfield') || name.contains('autocomplete')) return SizedBox(width: 245, child: TextField(controller: _textController, enabled: _enabled, decoration: InputDecoration(labelText: _name, hintText: 'Metin yaz…', border: const OutlineInputBorder(), prefixIcon: _showIcon ? const Icon(Icons.edit_rounded) : null)));
      if (name == 'richtext') return RichText(text: TextSpan(style: TextStyle(fontSize: _fontSize, color: _accent), children: const [TextSpan(text: 'Rich ', style: TextStyle(fontWeight: FontWeight.bold)), TextSpan(text: 'Text ', style: TextStyle(fontStyle: FontStyle.italic)), TextSpan(text: 'örneği', style: TextStyle(decoration: TextDecoration.underline))]));
      return ConstrainedBox(constraints: const BoxConstraints(maxWidth: 260), child: Text(displayText, textAlign: TextAlign.center, maxLines: _alternate ? 1 : 4, overflow: TextOverflow.ellipsis, style: style));
    }

    if (widget.category.path == 'input' || name.contains('textfield') || name.contains('checkbox') || name.contains('slider') || name == 'switch' || name.contains('dropdown') || name == 'radio') {
      if (name.contains('checkbox')) return Row(mainAxisSize: MainAxisSize.min, children: [Checkbox(value: _checked, onChanged: _enabled ? (v) => setState(() => _checked = v ?? false) : null, activeColor: _accent), Text(_checked ? 'Seçili' : 'Seçili değil')]);
      if (name == 'switch') return Row(mainAxisSize: MainAxisSize.min, children: [Switch(value: _switchValue, activeColor: _accent, onChanged: _enabled ? (v) => setState(() => _switchValue = v) : null), Text(_switchValue ? 'Açık' : 'Kapalı')]);
      if (name.contains('slider')) return SizedBox(width: 240, child: Column(mainAxisSize: MainAxisSize.min, children: [Slider(value: _sliderValue, activeColor: _accent, onChanged: _enabled ? (v) => setState(() => _sliderValue = v) : null), Text('Değer: ${(_sliderValue * 100).round()}%')]));
      if (name.contains('dropdown')) return DropdownButton<int>(value: _selectedDropdown, items: const [DropdownMenuItem(value: 0, child: Text('Flutter')), DropdownMenuItem(value: 1, child: Text('Dart')), DropdownMenuItem(value: 2, child: Text('Widget'))], onChanged: _enabled ? (v) => setState(() => _selectedDropdown = v ?? 0) : null);
      if (name == 'radio') return Column(mainAxisSize: MainAxisSize.min, children: [for (int i = 0; i < 3; i++) Row(mainAxisSize: MainAxisSize.min, children: [Radio<int>(value: i, groupValue: _selectedDropdown, onChanged: _enabled ? (v) => setState(() => _selectedDropdown = v ?? 0) : null, activeColor: _accent), Text(['Birinci', 'İkinci', 'Üçüncü'][i])])]);
      return SizedBox(width: 240, child: TextField(controller: _textController, enabled: _enabled, decoration: InputDecoration(labelText: _name, hintText: 'Metin gir…', border: const OutlineInputBorder(), prefixIcon: _showIcon ? const Icon(Icons.edit_rounded) : null)));
    }

    if (widget.category.path == 'animation' || name.contains('animated') || name.contains('transition') || name == 'hero') {
      return GestureDetector(onTap: () => setState(() => _alternate = !_alternate), child: AnimatedContainer(duration: Duration(milliseconds: _duration.round()), curve: Curves.easeInOutCubic, width: _alternate ? 180 : 125, height: _alternate ? 105 : 125, alignment: _alternate ? Alignment.bottomRight : Alignment.topLeft, padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: _alternate ? _accent : _accent.withOpacity(.25), borderRadius: BorderRadius.circular(_alternate ? 32 : _radius.clamp(0, 38).toDouble())), child: Icon(Icons.auto_awesome_rounded, color: _alternate ? Colors.white : _accent, size: 34)));
    }

    if (widget.category.path == 'layout' || name == 'row' || name == 'column' || name == 'stack' || name == 'center' || name == 'align' || name.contains('sizedbox') || name == 'padding' || name == 'wrap' || name == 'expanded' || name == 'flexible') {
      final boxes = <Widget>[
        _layoutBox(_accent, 'A'), _layoutBox(_accent.withOpacity(.72), 'B'), _layoutBox(_accent.withOpacity(.45), 'C'),
      ];
      if (name == 'column') return Column(mainAxisSize: MainAxisSize.min, children: boxes.map((w) => Padding(padding: const EdgeInsets.all(4), child: w)).toList());
      if (name == 'stack') return SizedBox(width: 175, height: 130, child: Stack(alignment: Alignment.center, children: [Positioned(left: 8, top: 8, child: boxes[0]), Positioned(right: 8, top: 22, child: boxes[1]), Positioned(bottom: 8, child: boxes[2])]));
      if (name == 'center' || name == 'align') return SizedBox(width: 220, height: 150, child: Align(alignment: _alternate ? Alignment.bottomRight : Alignment.center, child: boxes[0]));
      if (name == 'wrap') return SizedBox(width: 210, child: Wrap(spacing: 5, runSpacing: 5, children: [...boxes, ...boxes]));
      return Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: boxes.map((w) => Padding(padding: const EdgeInsets.all(3), child: w)).toList());
    }

    if (widget.category.path == 'scrolling' || name.contains('listview') || name == 'gridview' || name == 'pageview' || name.contains('carousel')) {
      if (name.contains('gridview')) {
        return SizedBox(
          width: 230,
          height: 170,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            children: List.generate(
              9,
              (i) => Container(
                decoration: BoxDecoration(
                  color: _palette[i % _palette.length].withOpacity(.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text('${i + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
        );
      }
      if (name.contains('pageview') || name.contains('carousel')) {
        return SizedBox(
          width: 250,
          height: 145,
          child: PageView.builder(
            onPageChanged: (v) => setState(() => _selectedTab = v),
            itemCount: 4,
            itemBuilder: (context, i) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(color: _palette[i % _palette.length], borderRadius: BorderRadius.circular(18)),
              child: Center(
                child: Text('Sayfa ${i + 1}', style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        );
      }
      return SizedBox(
        width: 240,
        height: 175,
        child: ListView.builder(
          itemCount: _listItems.length,
          itemBuilder: (context, i) => Card(
            child: ListTile(
              dense: true,
              leading: CircleAvatar(
                backgroundColor: _accent.withOpacity(.15),
                child: Text('${i + 1}', style: TextStyle(color: _accent)),
              ),
              title: Text(_listItems[i]),
              trailing: IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () => setState(() => _listItems.removeAt(i)),
              ),
            ),
          ),
        ),
      );
    }

    if (widget.category.path == 'painting' || name.contains('opacity') || name.contains('transform') || name.contains('clip') || name.contains('rotated') || name.contains('decorated') || name.contains('custompaint') || name.contains('backdropfilter')) {
      Widget shape = Container(width: 130, height: 100, alignment: Alignment.center, decoration: BoxDecoration(color: _accent.withOpacity(.22), border: Border.all(color: _accent, width: 3), borderRadius: BorderRadius.circular(_radius)), child: Icon(Icons.flutter_dash, size: 48, color: _accent));
      if (name.contains('clipoval')) shape = ClipOval(child: shape);
      if (name.contains('cliprect')) shape = ClipRect(child: shape);
      return Transform.rotate(angle: _rotation * 3.1415926535 / 180, child: Opacity(opacity: _opacity.clamp(0, 1).toDouble(), child: shape));
    }

    if (widget.category.path == 'assets' || name == 'icon' || name == 'image' || name == 'flutterlogo' || name == 'rawimage' || name == 'assetbundle') {
      if (name == 'flutterlogo') return const FlutterLogo(size: 90);
      if (name == 'image' || name == 'rawimage' || name == 'assetbundle') return Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.image_rounded, size: 70, color: _accent), const SizedBox(height: 8), Text('Yerel görsel alanı', style: style), const Text('Projeye asset ekleyerek değiştir.', style: TextStyle(fontSize: 12))]);
      return Icon(_showIcon ? Icons.flutter_dash : Icons.widgets_rounded, size: 70, color: _accent);
    }

    if (widget.category.path == 'accessibility' || name.contains('semantics') || name == 'tooltip' || name == 'focus') {
      return Semantics(label: _text.isEmpty ? _name : _text, button: true, child: Tooltip(message: 'Erişilebilirlik ipucu', child: FilledButton.icon(onPressed: _enabled ? () => setState(() => _tapCount++) : null, icon: const Icon(Icons.accessibility_new_rounded), label: Text('Odak / $_tapCount'), style: FilledButton.styleFrom(backgroundColor: _accent))));
    }

    if (name.contains('dialog') || name.contains('actionsheet')) return FilledButton(onPressed: () => showDialog<void>(context: context, builder: (ctx) => AlertDialog(title: Text(_name), content: const Text('Bu, etkileşimli bir modal örneğidir.'), actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Kapat'))])), child: const Text('Pencereyi aç'));
    if (name.contains('snackbar')) return FilledButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$_name çalıştı!'))), child: const Text('SnackBar göster'));
    if (name.contains('dismissible')) return Dismissible(key: ValueKey(_tapCount), onDismissed: (_) => setState(() => _tapCount++), background: Container(color: Colors.red, alignment: Alignment.centerLeft, padding: const EdgeInsets.all(12), child: const Icon(Icons.delete, color: Colors.white)), child: Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: _accent.withOpacity(.15), borderRadius: BorderRadius.circular(12)), child: Text('Kaydırarak sil • $_tapCount')));
    if (name.contains('draggable') || name.contains('dragtarget')) return DragTarget<int>(onAcceptWithDetails: (_) => setState(() => _tapCount++), builder: (context, candidates, rejected) => Container(width: 160, height: 110, decoration: BoxDecoration(color: candidates.isNotEmpty ? _accent.withOpacity(.25) : _accent.withOpacity(.08), border: Border.all(color: _accent), borderRadius: BorderRadius.circular(16)), child: Center(child: Draggable<int>(data: 1, feedback: Material(color: Colors.transparent, child: Icon(Icons.star_rounded, size: 50, color: _accent)), childWhenDragging: const Icon(Icons.open_with_rounded, color: Colors.grey, size: 35), child: Icon(Icons.star_rounded, size: 45, color: _accent)))));
    if (name.contains('progressindicator') || name.contains('progress')) return SizedBox(width: 160, child: Column(mainAxisSize: MainAxisSize.min, children: [CircularProgressIndicator(value: _sliderValue, color: _accent, backgroundColor: _accent.withOpacity(.14)), const SizedBox(height: 10), Text('${(_sliderValue * 100).round()}%') ]));
    if (name.contains('switch')) return Switch(value: _switchValue, onChanged: (v) => setState(() => _switchValue = v));
    if (name.contains('checkbox')) return Checkbox(value: _checked, onChanged: (v) => setState(() => _checked = v ?? false));
    if (name.contains('button') || name.contains('fab') || name.contains('iconbutton')) return FilledButton.icon(onPressed: _enabled ? () => setState(() => _tapCount++) : null, icon: _showIcon ? const Icon(Icons.touch_app_rounded) : const SizedBox.shrink(), label: Text('$_name • $_tapCount'));
    if (name.contains('scaffold') || name.contains('appbar')) return Container(width: 230, padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: _accent.withOpacity(.1), borderRadius: BorderRadius.circular(12), border: Border.all(color: _accent.withOpacity(.5))), child: Column(mainAxisSize: MainAxisSize.min, children: [Row(children: [Icon(Icons.menu_rounded, color: _accent), const SizedBox(width: 9), Text('Örnek uygulama', style: TextStyle(color: _accent, fontWeight: FontWeight.bold))]), const Divider(), Text(displayText, textAlign: TextAlign.center), const SizedBox(height: 4), const Text('Gövde içeriği', style: TextStyle(fontSize: 12))]));
    return GestureDetector(onTap: _enabled ? () => setState(() { _tapCount++; _alternate = !_alternate; }) : null, child: AnimatedContainer(duration: Duration(milliseconds: _duration.round()), padding: EdgeInsets.all(_padding.clamp(4, 40).toDouble()), decoration: BoxDecoration(color: _accent.withOpacity(_alternate ? .3 : .14), borderRadius: BorderRadius.circular(_radius), border: Border.all(color: _accent, width: 1.5)), child: Column(mainAxisSize: MainAxisSize.min, children: [if (_showIcon) Icon(_iconFor(_name), color: _accent, size: 34), const SizedBox(height: 7), Text(_name, style: style, textAlign: TextAlign.center), Text('Dokunma: $_tapCount', style: const TextStyle(fontSize: 12))])));
  }

  Widget _layoutBox(Color color, String label) => Container(width: 48, height: 48, alignment: Alignment.center, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(9)), child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)));

  void _reloadFuture() {
    setState(() {
      _loading = true;
      _future = Future<String>.delayed(Duration(milliseconds: _duration.round() + 250), () => 'Veri başarıyla yüklendi');
    });
    _future.whenComplete(() { if (mounted) setState(() => _loading = false); });
  }

  Widget _buildSettings(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(children: [
      _settingPanel(context, title: 'Metin ve görünüm', icon: Icons.text_fields_rounded, child: Column(children: [
        TextField(controller: _textController, onChanged: (_) => setState(() {}), decoration: const InputDecoration(labelText: 'Önizleme metni', border: OutlineInputBorder(), isDense: true)),
        const SizedBox(height: 14),
        Row(children: [Text('Vurgu rengi', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)), const Spacer(), Text('#${_accent.value.toRadixString(16).substring(2).toUpperCase()}', style: Theme.of(context).textTheme.labelSmall)]),
        const SizedBox(height: 10),
        Wrap(spacing: 11, runSpacing: 10, children: List.generate(_palette.length, (i) => InkWell(onTap: () => setState(() => _selectedColor = i), borderRadius: BorderRadius.circular(30), child: Container(width: 31, height: 31, decoration: BoxDecoration(color: _palette[i], shape: BoxShape.circle, border: Border.all(color: _selectedColor == i ? scheme.onSurface : Colors.transparent, width: 3)), child: _selectedColor == i ? const Icon(Icons.check_rounded, color: Colors.white, size: 17) : null)))),
      ])),
      const SizedBox(height: 10),
      _settingPanel(context, title: 'Boyut ve boşluk', icon: Icons.open_in_full_rounded, child: Column(children: [
        _sliderSetting('Ölçek', _scale, .5, 1.5, (v) => setState(() => _scale = v), suffix: '×'),
        _sliderSetting('İç boşluk', _padding, 0, 40, (v) => setState(() => _padding = v), suffix: ' px'),
        _sliderSetting('Köşe yuvarlaklığı', _radius, 0, 40, (v) => setState(() => _radius = v), suffix: ' px'),
      ])),
      const SizedBox(height: 10),
      _settingPanel(context, title: 'Efekt ve animasyon', icon: Icons.motion_photos_auto_rounded, child: Column(children: [
        _sliderSetting('Saydamlık', _opacity, 0, 1, (v) => setState(() => _opacity = v), suffix: '%', display: '${(_opacity * 100).round()}%'),
        _sliderSetting('Döndürme', _rotation, -180, 180, (v) => setState(() => _rotation = v), suffix: '°'),
        _sliderSetting('Yazı boyutu', _fontSize, 10, 36, (v) => setState(() => _fontSize = v), suffix: ' px'),
        _sliderSetting('Animasyon süresi', _duration, 100, 1500, (v) => setState(() => _duration = v), suffix: ' ms'),
      ])),
      const SizedBox(height: 10),
      _settingPanel(context, title: 'Davranış', icon: Icons.touch_app_rounded, child: Column(children: [
        SwitchListTile(contentPadding: EdgeInsets.zero, title: const Text('Etkileşimi etkinleştir'), subtitle: const Text('Düğme ve girişlerin kullanılabilirliğini değiştirir.'), value: _enabled, onChanged: (v) => setState(() => _enabled = v)),
        SwitchListTile(contentPadding: EdgeInsets.zero, title: const Text('Simge göster'), value: _showIcon, onChanged: (v) => setState(() => _showIcon = v)),
        SwitchListTile(contentPadding: EdgeInsets.zero, title: const Text('Alternatif durum'), subtitle: const Text('Örnek bileşenin ikinci görünümünü açar.'), value: _alternate, onChanged: (v) => setState(() => _alternate = v)),
        SwitchListTile(contentPadding: EdgeInsets.zero, title: const Text('Onay kutusu'), value: _checked, onChanged: (v) => setState(() => _checked = v)),
        SwitchListTile(contentPadding: EdgeInsets.zero, title: const Text('Anahtar durumu'), value: _switchValue, onChanged: (v) => setState(() => _switchValue = v)),
        _sliderSetting('Örnek değer', _sliderValue, 0, 1, (v) => setState(() => _sliderValue = v), suffix: '%', display: '${(_sliderValue * 100).round()}%'),
      ])),
    ]);
  }

  Widget _settingPanel(BuildContext context, {required String title, required IconData icon, required Widget child}) {
    final scheme = Theme.of(context).colorScheme;
    return Card(color: scheme.surfaceContainer, child: Padding(padding: const EdgeInsets.fromLTRB(15, 15, 15, 12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [Icon(icon, size: 20, color: scheme.primary), const SizedBox(width: 9), Text(title, style: const TextStyle(fontWeight: FontWeight.w800))]),
      const SizedBox(height: 14), child,
    ])));
  }

  Widget _sliderSetting(String title, double value, double min, double max, ValueChanged<double> onChanged, {String suffix = '', String? display}) {
    final text = display ?? '${value.round()}$suffix';
    return Padding(padding: const EdgeInsets.only(bottom: 3), child: Column(children: [Row(children: [Expanded(child: Text(title)), Text(text, style: TextStyle(fontWeight: FontWeight.w800, color: Theme.of(context).colorScheme.primary))]), Slider(value: value.clamp(min, max).toDouble(), min: min, max: max, onChanged: onChanged)]));
  }
}
