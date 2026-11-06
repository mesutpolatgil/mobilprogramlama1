import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../domain/models/widget_category.dart';
import '../domain/models/widget_item.dart';
import 'catalog_extra_data.dart';

class CatalogData {
  static const List<WidgetCategory> categories = [
    WidgetCategory(
      id: 'basics',
      name: 'Temeller',
      description: 'Uygulamanın iskeletini kuran temel widget\'lar.',
      icon: Icons.widgets_outlined,
      subCategories: ['Yapısal', 'Görsel'],
    ),
    WidgetCategory(
      id: 'material',
      name: 'Material Bileşenleri',
      description: 'Material 3 görünümündeki butonlar, kartlar ve yüzeyler.',
      icon: Icons.layers_outlined,
      subCategories: ['Butonlar', 'Yüzeyler', 'Gezinme', 'İletişim', 'Seçim'],
    ),
    WidgetCategory(
      id: 'cupertino',
      name: 'Cupertino (iOS)',
      description: 'iPhone görünümünü yakalayan iOS tarzı kontroller.',
      icon: CupertinoIcons.device_phone_portrait,
      subCategories: [
        'Gezinme',
        'Kontroller',
        'Seçiciler',
        'Metin girişi',
        'Listeler',
        'Kaydırma',
        'Diyaloglar',
        'Metin Seçimi',
        'Stil',
      ],
    ),
    WidgetCategory(
      id: 'layout',
      name: 'Düzen',
      description: 'İçeriği satır, sütun ve katmanlarla düzenle.',
      icon: Icons.dashboard_customize_outlined,
      subCategories: ['Tek çocuk', 'Çok çocuk'],
    ),
    WidgetCategory(
      id: 'text',
      name: 'Metin ve Tipografi',
      description: 'Metni okunaklı ve etkileyici hale getir.',
      icon: Icons.text_fields_outlined,
      subCategories: ['Stil'],
    ),
    WidgetCategory(
      id: 'input',
      name: 'Giriş ve Formlar',
      description: 'Form alanları, anahtarlar ve kaydırıcılarla veri topla.',
      icon: Icons.input_outlined,
      subCategories: ['Metin girişi', 'Seçim', 'Form', 'Girdi'],
    ),
    WidgetCategory(
      id: 'interaction',
      name: 'Etkileşim',
      description: 'Dokunma, sürükleme ve jestlerle etkileşim kur.',
      icon: Icons.touch_app_outlined,
      subCategories: ['Jestler', 'Sürükle-bırak', 'İşaretçi', 'Gezinme'],
    ),
    WidgetCategory(
      id: 'scrolling',
      name: 'Kaydırma ve Listeler',
      description: 'Listeler, ızgaralar ve kaydırılabilir koleksiyonlar.',
      icon: Icons.format_list_bulleted_outlined,
      subCategories: ['Listeler', 'Izgaralar', 'Kaydırma', 'Sliver'],
    ),
    WidgetCategory(
      id: 'animation',
      name: 'Animasyon ve Hareket',
      description: 'Hareket ekleyerek arayüze canlılık kazandır.',
      icon: Icons.animation_outlined,
      subCategories: ['Dolaylı', 'Geçişler', 'Hero', 'Yapı taşları'],
    ),
    WidgetCategory(
      id: 'async',
      name: 'Asenkron',
      description: 'Bekleyen verileri yüklenme ve sonuç durumlarıyla göster.',
      icon: Icons.sync_alt_outlined,
      subCategories: ['Future', 'Stream'],
    ),
    WidgetCategory(
      id: 'painting',
      name: 'Çizim ve Efektler',
      description: 'Kırpma, saydamlık ve çizimle görsel efektler uygula.',
      icon: Icons.brush_outlined,
      subCategories: ['Kırpma', 'Dönüşümler', 'Efektler', 'Çizim'],
    ),
    WidgetCategory(
      id: 'assets',
      name: 'Görseller ve İkonlar',
      description: 'Fotoğraf, ikon ve vektör içeriklerini göster.',
      icon: Icons.image_outlined,
      subCategories: ['Görseller', 'İkonlar', 'Paket'],
    ),
    WidgetCategory(
      id: 'styling',
      name: 'Stil ve Tema',
      description: 'Renk, tipografi ve duyarlı düzeni tek yerden yönet.',
      icon: Icons.palette_outlined,
      subCategories: ['Tema', 'Duyarlı'],
    ),
    WidgetCategory(
      id: 'accessibility',
      name: 'Erişilebilirlik',
      description: 'Herkesin rahatça kullanabildiği arayüzler tasarla.',
      icon: Icons.accessibility_new_outlined,
      subCategories: ['Anlamlandırma', 'Yardımcı'],
    ),
  ];

  static final List<WidgetItem> widgets = [
    ..._curatedWidgets,
    ...CatalogExtraData.widgets,
  ];

  static const List<WidgetItem> _curatedWidgets = [
    // 1. BASICS
    WidgetItem(
      id: 'container',
      name: 'Container',
      categoryId: 'basics',
      subCategory: 'Yapısal',
      description:
          'Bir içeriği boyut, boşluk, arka plan ve gölgeyle tek kutuda biçimlendirir.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/basics#container',
      isPlaygroundReady: true,
      tags: ['basics', 'layout', 'box', 'styling'],
      defaultCodeSnippet: '''Container(
  width: 180,
  height: 180,
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.blueAccent,
    borderRadius: BorderRadius.circular(20),
    boxShadow: const [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
  ),
  child: const Center(
    child: Text(
      'Etkileşimli kutu',
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  ),
)''',
      keyProperties: [
        'alignment',
        'padding',
        'color',
        'decoration',
        'width',
        'height',
        'margin'
      ],
    ),
    WidgetItem(
      id: 'scaffold',
      name: 'Scaffold',
      categoryId: 'basics',
      subCategory: 'Yapısal',
      description:
          'Uygulamanın üst çubuğunu, gövdesini ve yüzen aksiyonunu bir araya getirir.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/material#scaffold',
      isPlaygroundReady: false,
      tags: ['basics', 'material', 'structure', 'appbar'],
      defaultCodeSnippet: '''Scaffold(
  appBar: AppBar(title: const Text('Scaffold Örneği')),
  body: const Center(child: Text('Ana içerik')),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
)''',
      keyProperties: [
        'appBar',
        'body',
        'floatingActionButton',
        'drawer',
        'bottomNavigationBar'
      ],
    ),
    WidgetItem(
      id: 'row',
      name: 'Row',
      categoryId: 'basics',
      subCategory: 'Yapısal',
      description: 'Öğeleri yatay olarak yan yana dizer.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/layout#row',
      isPlaygroundReady: true,
      tags: ['basics', 'layout', 'horizontal', 'flex'],
      defaultCodeSnippet: '''Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: const [
    Icon(Icons.star, color: Colors.amber),
    Text('Row Öğesi 1'),
    Icon(Icons.favorite, color: Colors.red),
  ],
)''',
      keyProperties: [
        'mainAxisAlignment',
        'crossAxisAlignment',
        'mainAxisSize',
        'children'
      ],
    ),
    WidgetItem(
      id: 'column',
      name: 'Column',
      categoryId: 'basics',
      subCategory: 'Yapısal',
      description: 'Öğeleri dikey olarak alt alta dizer.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/layout#column',
      isPlaygroundReady: true,
      tags: ['basics', 'layout', 'vertical', 'flex'],
      defaultCodeSnippet: '''Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: const [
    Text('Üst öğe', style: TextStyle(fontWeight: FontWeight.bold)),
    SizedBox(height: 8),
    Text('Alt başlık metni'),
    SizedBox(height: 8),
    Icon(Icons.thumb_up, color: Colors.blue),
  ],
)''',
      keyProperties: [
        'mainAxisAlignment',
        'crossAxisAlignment',
        'mainAxisSize',
        'children'
      ],
    ),
    WidgetItem(
      id: 'flutter_logo',
      name: 'FlutterLogo',
      categoryId: 'basics',
      subCategory: 'Görsel',
      description:
          'Flutter logosunu ölçeklenebilir bir widget olarak gösterir.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/basics#flutterlogo',
      isPlaygroundReady: true,
      tags: ['basics', 'logo', 'branding'],
      defaultCodeSnippet: '''const FlutterLogo(
  size: 100,
  style: FlutterLogoStyle.markOnly,
)''',
      keyProperties: ['size', 'style', 'duration', 'curve'],
    ),
    WidgetItem(
      id: 'placeholder',
      name: 'Placeholder',
      categoryId: 'basics',
      subCategory: 'Görsel',
      description: 'Henüz eklenmemiş içerik için geçici bir yer tutucu çizer.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/basics#placeholder',
      isPlaygroundReady: true,
      tags: ['basics', 'mockup', 'wireframe'],
      defaultCodeSnippet: '''const Placeholder(
  fallbackWidth: 120,
  fallbackHeight: 80,
  color: Colors.blueGrey,
  strokeWidth: 2.0,
)''',
      keyProperties: [
        'color',
        'strokeWidth',
        'fallbackWidth',
        'fallbackHeight'
      ],
    ),

    // 2. MATERIAL COMPONENTS
    WidgetItem(
      id: 'elevated_button',
      name: 'ElevatedButton',
      categoryId: 'material',
      subCategory: 'Butonlar',
      description: 'Öne çıkan eylemler için yükseltilmiş, dolgulu bir buton.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/material#elevatedbutton',
      isPlaygroundReady: true,
      tags: ['material', 'button', 'action', 'm3'],
      defaultCodeSnippet: '''ElevatedButton.icon(
  onPressed: () {},
  icon: const Icon(Icons.rocket_launch),
  label: const Text('İşlemi başlat'),
  style: ElevatedButton.styleFrom(
    elevation: 4,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
)''',
      keyProperties: ['onPressed', 'style', 'child', 'icon'],
    ),
    WidgetItem(
      id: 'card',
      name: 'Card',
      categoryId: 'material',
      subCategory: 'Yüzeyler',
      description:
          'İçeriği fotoğraf, başlık ve gölgeyle tek bir yüzeyde toplar.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/material#card',
      isPlaygroundReady: true,
      tags: ['material', 'surface', 'container', 'm3'],
      defaultCodeSnippet: '''Card(
  elevation: 3,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  child: const Padding(
    padding: EdgeInsets.all(16.0),
    child: Text('Kart içeriği'),
  ),
)''',
      keyProperties: ['elevation', 'color', 'shape', 'margin', 'clipBehavior'],
    ),
    WidgetItem(
      id: 'floating_action_button',
      name: 'FloatingActionButton',
      categoryId: 'material',
      subCategory: 'Butonlar',
      description:
          'Ekranın üzerinde duran, ana eylemi öne çıkaran yuvarlak buton.',
      docsUrl:
          'https://docs.flutter.dev/ui/widgets/material#floatingactionbutton',
      isPlaygroundReady: true,
      tags: ['material', 'fab', 'button', 'action'],
      defaultCodeSnippet: '''FloatingActionButton.extended(
  onPressed: () {},
  icon: const Icon(Icons.add),
  label: const Text('Görev ekle'),
)''',
      keyProperties: ['onPressed', 'tooltip', 'child', 'elevation', 'shape'],
    ),
    WidgetItem(
      id: 'chip',
      name: 'Chip',
      categoryId: 'material',
      subCategory: 'Butonlar',
      description:
          'Etiket, filtre veya seçimleri kompakt bir parça olarak gösterir.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/material#chip',
      isPlaygroundReady: true,
      tags: ['material', 'chip', 'tag', 'filter'],
      defaultCodeSnippet: '''Chip(
  avatar: const CircleAvatar(child: Text('F')),
  label: const Text('Flutter 3.x'),
  onDeleted: () {},
)''',
      keyProperties: [
        'avatar',
        'label',
        'onDeleted',
        'deleteIcon',
        'backgroundColor'
      ],
    ),
    WidgetItem(
      id: 'list_tile',
      name: 'ListTile',
      categoryId: 'material',
      subCategory: 'Yüzeyler',
      description: 'Fotoğraf, başlık ve alt bilgiyi tek satırda düzenler.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/material#listtile',
      isPlaygroundReady: true,
      tags: ['material', 'list', 'row', 'tile'],
      defaultCodeSnippet: '''ListTile(
  leading: const Icon(Icons.folder, color: Colors.amber),
  title: const Text('Proje varlıkları'),
  subtitle: const Text('12 öğe • Bugün güncellendi'),
  trailing: const Icon(Icons.chevron_right),
  onTap: () {},
)''',
      keyProperties: [
        'leading',
        'title',
        'subtitle',
        'trailing',
        'onTap',
        'dense'
      ],
    ),
    WidgetItem(
      id: 'navigation_bar',
      name: 'NavigationBar',
      categoryId: 'material',
      subCategory: 'Gezinme',
      description: 'Alt gezinme çubuğuyla ana bölümler arasında geçiş yapar.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/material#navigationbar',
      isPlaygroundReady: false,
      tags: ['material', 'navigation', 'bottombar', 'm3'],
      defaultCodeSnippet: '''NavigationBar(
  selectedIndex: 0,
  destinations: const [
    NavigationDestination(icon: Icon(Icons.home), label: 'Ana sayfa'),
    NavigationDestination(icon: Icon(Icons.search), label: 'Ara'),
    NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
  ],
)''',
      keyProperties: ['destinations', 'selectedIndex', 'onDestinationSelected'],
    ),

    // 3. CUPERTINO (iOS Style)
    WidgetItem(
      id: 'cupertino_button',
      name: 'CupertinoButton',
      categoryId: 'cupertino',
      subCategory: 'Kontroller',
      description: 'iOS görünümünde, basınca yumuşakça solan buton.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/cupertino#cupertinobutton',
      isPlaygroundReady: true,
      tags: ['cupertino', 'ios', 'button'],
      defaultCodeSnippet: '''CupertinoButton.filled(
  onPressed: () {},
  child: const Text('iOS tarzı işlem'),
)''',
      keyProperties: [
        'child',
        'onPressed',
        'color',
        'borderRadius',
        'pressedOpacity'
      ],
    ),
    WidgetItem(
      id: 'cupertino_switch',
      name: 'CupertinoSwitch',
      categoryId: 'cupertino',
      subCategory: 'Kontroller',
      description: 'iOS tarzı açık/kapalı anahtarı.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/cupertino#cupertinoswitch',
      isPlaygroundReady: true,
      tags: ['cupertino', 'ios', 'switch', 'toggle'],
      defaultCodeSnippet: '''CupertinoSwitch(
  value: true,
  activeColor: CupertinoColors.activeGreen,
  onChanged: (bool value) {},
)''',
      keyProperties: ['value', 'onChanged', 'activeColor', 'trackColor'],
    ),
    WidgetItem(
      id: 'cupertino_activity_indicator',
      name: 'CupertinoActivityIndicator',
      categoryId: 'cupertino',
      subCategory: 'Kontroller',
      description: 'iOS tarzı dönen yükleme göstergesi.',
      docsUrl:
          'https://docs.flutter.dev/ui/widgets/cupertino#cupertinoactivityindicator',
      isPlaygroundReady: true,
      tags: ['cupertino', 'ios', 'loader', 'progress'],
      defaultCodeSnippet: '''const CupertinoActivityIndicator(
  radius: 16.0,
  animating: true,
)''',
      keyProperties: ['animating', 'radius'],
    ),

    // 4. LAYOUT
    WidgetItem(
      id: 'padding',
      name: 'Padding',
      categoryId: 'layout',
      subCategory: 'Tek çocuk',
      description: 'İçeriğin çevresine eşit boşluk ekler.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/layout#padding',
      isPlaygroundReady: true,
      tags: ['layout', 'spacing', 'insets'],
      defaultCodeSnippet: '''Padding(
  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  child: Container(
    color: Colors.blueAccent.withOpacity(0.2),
    height: 60,
    child: const Center(child: Text('Dolgulu içerik')),
  ),
)''',
      keyProperties: ['padding', 'child'],
    ),
    WidgetItem(
      id: 'align',
      name: 'Align',
      categoryId: 'layout',
      subCategory: 'Tek çocuk',
      description: 'İçeriği kendi alanı içinde seçilen köşeye yerleştirir.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/layout#align',
      isPlaygroundReady: true,
      tags: ['layout', 'alignment', 'position'],
      defaultCodeSnippet: '''Container(
  height: 120,
  width: double.infinity,
  color: Colors.grey.shade200,
  child: const Align(
    alignment: Alignment.bottomRight,
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('Sağ alta hizalı'),
    ),
  ),
)''',
      keyProperties: ['alignment', 'widthFactor', 'heightFactor', 'child'],
    ),
    WidgetItem(
      id: 'stack',
      name: 'Stack',
      categoryId: 'layout',
      subCategory: 'Çok çocuk',
      description:
          'Fotoğraf ve kartları üst üste katmanlayarak derinlik oluşturur.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/layout#stack',
      isPlaygroundReady: true,
      tags: ['layout', 'overlay', 'positioned', 'layer'],
      defaultCodeSnippet: '''Stack(
  alignment: Alignment.center,
  children: [
    Container(width: 150, height: 150, color: Colors.blue.shade200),
    Container(width: 100, height: 100, color: Colors.blue.shade500),
    const Text('Üst katman', style: TextStyle(color: Colors.white)),
  ],
)''',
      keyProperties: ['alignment', 'fit', 'clipBehavior', 'children'],
    ),
    WidgetItem(
      id: 'wrap',
      name: 'Wrap',
      categoryId: 'layout',
      subCategory: 'Çok çocuk',
      description:
          'Sığmayan öğeleri alt satıra taşıyarak akışkan bir düzen kurar.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/layout#wrap',
      isPlaygroundReady: true,
      tags: ['layout', 'flow', 'tags', 'chips'],
      defaultCodeSnippet: '''Wrap(
  spacing: 8.0,
  runSpacing: 4.0,
  children: const [
    Chip(label: Text('Dart')),
    Chip(label: Text('Flutter')),
    Chip(label: Text('Riverpod')),
    Chip(label: Text('GoRouter')),
    Chip(label: Text('Material 3')),
  ],
)''',
      keyProperties: ['spacing', 'runSpacing', 'direction', 'alignment'],
    ),

    // 5. TEXT & TYPOGRAPHY
    WidgetItem(
      id: 'text_widget',
      name: 'Text',
      categoryId: 'text',
      subCategory: 'Stil',
      description:
          'Tek satır veya paragraf metni ölçek, ağırlık ve renkle biçimlendirir.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/text#text',
      isPlaygroundReady: true,
      tags: ['text', 'typography', 'label', 'string'],
      defaultCodeSnippet: '''Text(
  'Flutter Tasarım Sistemi',
  textAlign: TextAlign.center,
  style: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    color: Colors.blue.shade800,
  ),
)''',
      keyProperties: ['style', 'textAlign', 'maxLines', 'overflow'],
    ),
    WidgetItem(
      id: 'rich_text',
      name: 'RichText',
      categoryId: 'text',
      subCategory: 'Stil',
      description: 'Bir cümle içinde farklı stilleri bir arada kullanır.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/text#richtext',
      isPlaygroundReady: true,
      tags: ['text', 'spans', 'formatting'],
      defaultCodeSnippet: '''RichText(
  text: const TextSpan(
    text: 'Flutter ile ',
    style: TextStyle(color: Colors.black, fontSize: 18),
    children: [
      TextSpan(
        text: 'etkileşimli',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
      ),
      TextSpan(text: ' keşfet!'),
    ],
  ),
)''',
      keyProperties: ['text', 'textAlign', 'overflow'],
    ),

    // 6. INPUT & FORMS
    WidgetItem(
      id: 'text_field',
      name: 'TextField',
      categoryId: 'input',
      subCategory: 'Metin girişi',
      description: 'Kullanıcıdan metin veya e-posta girişi alır.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/input#textfield',
      isPlaygroundReady: true,
      tags: ['input', 'form', 'text', 'keyboard'],
      defaultCodeSnippet: '''TextField(
  decoration: InputDecoration(
    labelText: 'E-posta adresi',
    hintText: 'user@example.com',
    prefixIcon: const Icon(Icons.email_outlined),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  ),
)''',
      keyProperties: [
        'controller',
        'decoration',
        'keyboardType',
        'obscureText',
        'onChanged'
      ],
    ),
    WidgetItem(
      id: 'slider',
      name: 'Slider',
      categoryId: 'input',
      subCategory: 'Seçim',
      description: 'Bir değeri sürükleyerek seçmeyi sağlar.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/input#slider',
      isPlaygroundReady: true,
      tags: ['input', 'slider', 'range', 'controls'],
      defaultCodeSnippet: '''Slider(
  value: 45.0,
  min: 0.0,
  max: 100.0,
  divisions: 10,
  label: '45%',
  onChanged: (double newValue) {},
)''',
      keyProperties: ['value', 'min', 'max', 'divisions', 'label', 'onChanged'],
    ),
    WidgetItem(
      id: 'switch_widget',
      name: 'Switch',
      categoryId: 'input',
      subCategory: 'Seçim',
      description: 'Açık/kapalı ayarları tek dokunuşla değiştirir.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/input#switch',
      isPlaygroundReady: true,
      tags: ['input', 'switch', 'toggle', 'boolean'],
      defaultCodeSnippet: '''Switch(
  value: true,
  onChanged: (bool value) {},
)''',
      keyProperties: ['value', 'onChanged', 'activeColor', 'thumbIcon'],
    ),

    // 7. INTERACTION MODELS
    WidgetItem(
      id: 'gesture_detector',
      name: 'GestureDetector',
      categoryId: 'interaction',
      subCategory: 'Jestler',
      description: 'Dokunma, çift dokunma ve uzun basma hareketlerini dinler.',
      docsUrl:
          'https://docs.flutter.dev/ui/widgets/interaction#gesturedetector',
      isPlaygroundReady: true,
      tags: ['interaction', 'gestures', 'touch', 'events'],
      defaultCodeSnippet: '''GestureDetector(
  onTap: () {},
  onDoubleTap: () {},
  child: Container(
    padding: const EdgeInsets.all(16),
    color: Colors.teal.shade100,
    child: const Text('Bana dokun veya çift dokun'),
  ),
)''',
      keyProperties: ['onTap', 'onDoubleTap', 'onLongPress', 'onPanUpdate'],
    ),
    WidgetItem(
      id: 'ink_well',
      name: 'InkWell',
      categoryId: 'interaction',
      subCategory: 'Jestler',
      description: 'Dokunuşa mürekkep dalgasıyla görsel geri bildirim verir.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/material#inkwell',
      isPlaygroundReady: true,
      tags: ['interaction', 'ripple', 'touch', 'material'],
      defaultCodeSnippet: '''InkWell(
  onTap: () {},
  borderRadius: BorderRadius.circular(12),
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    child: const Text('Mürekkep dalgası için dokun'),
  ),
)''',
      keyProperties: ['onTap', 'splashColor', 'highlightColor', 'borderRadius'],
    ),

    // 8. SCROLLING & LISTS
    WidgetItem(
      id: 'list_view',
      name: 'ListView',
      categoryId: 'scrolling',
      subCategory: 'Listeler',
      description:
          'Uzun listeleri kaydırarak, yalnızca görünenleri yükleyerek gösterir.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/scrolling#listview',
      isPlaygroundReady: true,
      tags: ['scrolling', 'list', 'lazy', 'performance'],
      defaultCodeSnippet: '''ListView.separated(
  itemCount: 20,
  separatorBuilder: (context, index) => const Divider(),
  itemBuilder: (context, index) => ListTile(
    leading: CircleAvatar(child: Text('\${index + 1}')),
    title: Text('Liste öğesi #\${index + 1}'),
  ),
)''',
      keyProperties: [
        'itemBuilder',
        'itemCount',
        'separatorBuilder',
        'scrollDirection'
      ],
    ),
    WidgetItem(
      id: 'grid_view',
      name: 'GridView',
      categoryId: 'scrolling',
      subCategory: 'Izgaralar',
      description: 'Fotoğraf ve kartları ızgara düzeninde gösterir.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/scrolling#gridview',
      isPlaygroundReady: true,
      tags: ['scrolling', 'grid', 'columns', 'tiles'],
      defaultCodeSnippet: '''GridView.count(
  crossAxisCount: 2,
  mainAxisSpacing: 10,
  crossAxisSpacing: 10,
  children: List.generate(
    6,
    (index) => Container(
      color: Colors.indigo.shade100,
      child: Center(child: Text('Kart #\$index')),
    ),
  ),
)''',
      keyProperties: [
        'crossAxisCount',
        'mainAxisSpacing',
        'crossAxisSpacing',
        'children'
      ],
    ),

    // 9. ANIMATION & MOTION
    WidgetItem(
      id: 'animated_container',
      name: 'AnimatedContainer',
      categoryId: 'animation',
      subCategory: 'Dolaylı',
      description:
          'Boyut, renk ve köşe yarıçapını yumuşak bir animasyonla değiştirir.',
      docsUrl:
          'https://docs.flutter.dev/ui/widgets/animation#animatedcontainer',
      isPlaygroundReady: true,
      tags: ['animation', 'implicit', 'container', 'motion'],
      defaultCodeSnippet: '''AnimatedContainer(
  duration: const Duration(milliseconds: 500),
  curve: Curves.fastOutSlowIn,
  width: 150,
  height: 150,
  decoration: BoxDecoration(
    color: Colors.purpleAccent,
    borderRadius: BorderRadius.circular(24),
  ),
)''',
      keyProperties: [
        'duration',
        'curve',
        'width',
        'height',
        'color',
        'decoration'
      ],
    ),
    WidgetItem(
      id: 'animated_opacity',
      name: 'AnimatedOpacity',
      categoryId: 'animation',
      subCategory: 'Dolaylı',
      description: 'Bir içeriği yumuşakça soldurur veya geri getirir.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/animation#animatedopacity',
      isPlaygroundReady: true,
      tags: ['animation', 'fade', 'opacity'],
      defaultCodeSnippet: '''AnimatedOpacity(
  opacity: 1.0,
  duration: const Duration(milliseconds: 400),
  child: const FlutterLogo(size: 80),
)''',
      keyProperties: ['opacity', 'duration', 'curve', 'child'],
    ),

    // 10. ASYNC WIDGETS
    WidgetItem(
      id: 'future_builder',
      name: 'FutureBuilder',
      categoryId: 'async',
      subCategory: 'Future',
      description:
          'Bir Future tamamlanırken yüklenme, hata ve sonuç durumlarını yönetir.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/async#futurebuilder',
      isPlaygroundReady: false,
      tags: ['async', 'future', 'builder', 'snapshot'],
      defaultCodeSnippet: '''FutureBuilder<String>(
  future: fetchUserData(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    }
    if (snapshot.hasError) {
      return Text('Hata: \${snapshot.error}');
    }
    return Text('Kullanıcı verisi: \${snapshot.data}');
  },
)''',
      keyProperties: ['future', 'builder', 'initialData'],
    ),

    // 11. PAINTING & EFFECTS
    WidgetItem(
      id: 'clip_rrect',
      name: 'ClipRRect',
      categoryId: 'painting',
      subCategory: 'Kırpma',
      description: 'Fotoğrafı yuvarlatılmış bir çerçeve içinde kırpar.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/painting#cliprrect',
      isPlaygroundReady: true,
      tags: ['painting', 'clipping', 'rounded', 'border'],
      defaultCodeSnippet: '''ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: Container(
    width: 140,
    height: 140,
    color: Colors.deepOrangeAccent,
    child: const Center(child: Text('Kırpılmış kutu', style: TextStyle(color: Colors.white))),
  ),
)''',
      keyProperties: ['borderRadius', 'clipBehavior', 'child'],
    ),
    WidgetItem(
      id: 'opacity_widget',
      name: 'Opacity',
      categoryId: 'painting',
      subCategory: 'Efektler',
      description: 'İçeriğin saydamlığını tek bir değerle ayarlar.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/painting#opacity',
      isPlaygroundReady: true,
      tags: ['painting', 'transparency', 'alpha'],
      defaultCodeSnippet: '''Opacity(
  opacity: 0.6,
  child: Container(
    width: 120,
    height: 80,
    color: Colors.indigo,
    child: const Center(child: Text('%60 opaklık', style: TextStyle(color: Colors.white))),
  ),
)''',
      keyProperties: ['opacity', 'alwaysIncludeSemantics', 'child'],
    ),

    // 12. ASSETS, IMAGES & ICONS
    WidgetItem(
      id: 'icon_widget',
      name: 'Icon',
      categoryId: 'assets',
      subCategory: 'İkonlar',
      description: 'Anlam taşıyan vektörel bir ikon gösterir.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/assets#icon',
      isPlaygroundReady: true,
      tags: ['assets', 'icons', 'glyph', 'material'],
      defaultCodeSnippet: '''Icon(
  Icons.favorite,
  color: Colors.pink,
  size: 48.0,
  semanticLabel: 'Kalp simgesi',
)''',
      keyProperties: ['icon', 'size', 'color', 'semanticLabel'],
    ),

    // 13. STYLING & THEMING
    WidgetItem(
      id: 'theme_widget',
      name: 'Theme',
      categoryId: 'styling',
      subCategory: 'Tema',
      description:
          'Altındaki widget\'lara ortak renk ve tipografi teması uygular.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/styling#theme',
      isPlaygroundReady: false,
      tags: ['styling', 'theme', 'colorScheme', 'typography'],
      defaultCodeSnippet: '''Theme(
  data: ThemeData(
    colorSchemeSeed: Colors.deepPurple,
    useMaterial3: true,
  ),
  child: const ElevatedButton(
    onPressed: null,
    child: Text('Temalı buton'),
  ),
)''',
      keyProperties: ['data', 'child'],
    ),

    // 14. ACCESSIBILITY
    WidgetItem(
      id: 'tooltip',
      name: 'Tooltip',
      categoryId: 'accessibility',
      subCategory: 'Yardımcı',
      description:
          'Uzun basınca veya üzerine gelince kısa bir açıklama gösterir.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/accessibility#tooltip',
      isPlaygroundReady: true,
      tags: ['accessibility', 'tooltip', 'label', 'assistive'],
      defaultCodeSnippet: '''Tooltip(
  message: 'Belgeyi PDF olarak indir',
  child: IconButton(
    icon: const Icon(Icons.download),
    onPressed: () {},
  ),
)''',
      keyProperties: ['message', 'waitDuration', 'showDuration', 'child'],
    ),
    WidgetItem(
      id: 'semantics',
      name: 'Semantics',
      categoryId: 'accessibility',
      subCategory: 'Anlamlandırma',
      description:
          'Ekran okuyucular için içeriğin anlamını ve eylemini tanımlar.',
      docsUrl: 'https://docs.flutter.dev/ui/widgets/accessibility#semantics',
      isPlaygroundReady: false,
      tags: ['accessibility', 'semantics', 'screenreader'],
      defaultCodeSnippet: '''Semantics(
  label: 'Ses parçasını oynat',
  button: true,
  child: IconButton(
    icon: const Icon(Icons.play_arrow),
    onPressed: () {},
  ),
)''',
      keyProperties: ['label', 'hint', 'button', 'enabled', 'child'],
    ),
  ];
}
