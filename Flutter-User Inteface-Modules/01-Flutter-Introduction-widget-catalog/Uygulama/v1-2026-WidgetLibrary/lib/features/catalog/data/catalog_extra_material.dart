import 'package:flutter/material.dart';

import '../domain/models/widget_item.dart';
import 'extra_widget_helper.dart';

/// Material component cards from the official widget catalog that are not
/// already part of the hand-curated catalog.
final List<WidgetItem> catalogExtraMaterial = [
  extraWidget(
    id: 'extended_fab',
    name: 'ExtendedFloatingActionButton',
    categoryId: 'material',
    subCategory: 'Butonlar',
    description: 'Simge ve metni bir arada taşıyan geniş yüzen eylem butonu.',
    snippet: r'''FloatingActionButton.extended(
  onPressed: () {},
  icon: const Icon(Icons.add),
  label: const Text('Yeni görev'),
)''',
    properties: ['onPressed', 'icon', 'label', 'elevation', 'backgroundColor'],
    icon: Icons.add_circle_outline,
  ),
  extraWidget(
    id: 'icon_button',
    name: 'IconButton',
    categoryId: 'material',
    subCategory: 'Butonlar',
    description: 'Yalnızca bir simgeden oluşan, dokunma alanı geniş buton.',
    snippet: r'''IconButton(
  onPressed: () {},
  tooltip: 'Favorilere ekle',
  icon: const Icon(Icons.favorite_border),
)''',
    properties: ['onPressed', 'icon', 'tooltip', 'iconSize', 'color'],
    icon: Icons.touch_app_outlined,
  ),
  extraWidget(
    id: 'segmented_button',
    name: 'SegmentedButton',
    categoryId: 'material',
    subCategory: 'Butonlar',
    description:
        'Birden çok seçeneği bitişik parçalar halinde sunan seçim butonu.',
    snippet: r'''SegmentedButton<String>(
  segments: const [
    ButtonSegment(value: 'gun', label: Text('Gün')),
    ButtonSegment(value: 'hafta', label: Text('Hafta')),
    ButtonSegment(value: 'ay', label: Text('Ay')),
  ],
  selected: const {'gun'},
  onSelectionChanged: (selection) {},
)''',
    properties: [
      'segments',
      'selected',
      'onSelectionChanged',
      'multiSelectionEnabled'
    ],
    icon: Icons.view_week_outlined,
  ),
  extraWidget(
    id: 'badge',
    name: 'Badge',
    categoryId: 'material',
    subCategory: 'İletişim',
    description: 'Bir simgenin köşesine sayaç veya kısa durum etiketi ekler.',
    snippet: r'''Badge(
  label: const Text('3'),
  child: IconButton(
    onPressed: () {},
    icon: const Icon(Icons.notifications_outlined),
  ),
)''',
    properties: ['label', 'isLabelVisible', 'backgroundColor', 'child'],
    icon: Icons.badge_outlined,
  ),
  extraWidget(
    id: 'linear_progress_indicator',
    name: 'LinearProgressIndicator',
    categoryId: 'material',
    subCategory: 'İletişim',
    description:
        'Tamamlanan oranı yatay bir çubukla gösteren ilerleme göstergesi.',
    snippet: r'''const LinearProgressIndicator(
  value: 0.65,
  minHeight: 6,
  backgroundColor: Colors.black12,
  color: Colors.indigo,
)''',
    properties: ['value', 'minHeight', 'backgroundColor', 'color'],
    icon: Icons.linear_scale,
  ),
  extraWidget(
    id: 'snack_bar',
    name: 'SnackBar',
    categoryId: 'material',
    subCategory: 'İletişim',
    description: 'Ekranın altında kısa süreli bilgi ve eylem gösterir.',
    snippet: r'''ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: const Text('Değişiklikler kaydedildi'),
    action: SnackBarAction(label: 'Geri al', onPressed: () {}),
  ),
)''',
    properties: [
      'content',
      'action',
      'duration',
      'behavior',
      'backgroundColor'
    ],
    icon: Icons.message_outlined,
  ),
  extraWidget(
    id: 'alert_dialog',
    name: 'AlertDialog',
    categoryId: 'material',
    subCategory: 'Yüzeyler',
    description:
        'Kullanıcıdan karar veya onay isteyen ortalanmış iletişim penceresi.',
    snippet: r'''AlertDialog(
  title: const Text('Kaydı sil?'),
  content: const Text('Bu işlem geri alınamaz.'),
  actions: [
    TextButton(onPressed: () {}, child: const Text('Vazgeç')),
    FilledButton(onPressed: () {}, child: const Text('Sil')),
  ],
)''',
    properties: ['title', 'content', 'actions', 'scrollable'],
    icon: Icons.chat_bubble_outline,
  ),
  extraWidget(
    id: 'bottom_sheet',
    name: 'BottomSheet',
    categoryId: 'material',
    subCategory: 'Yüzeyler',
    description:
        'Ekranın altından yükselen, ek içerik ve seçenekler sunan yüzey.',
    snippet: r'''showModalBottomSheet<void>(
  context: context,
  builder: (context) => const Padding(
    padding: EdgeInsets.all(24),
    child: Text('Seçenekler burada görünür'),
  ),
)''',
    properties: ['builder', 'isScrollControlled', 'shape', 'backgroundColor'],
    icon: Icons.vertical_align_bottom,
  ),
  extraWidget(
    id: 'divider',
    name: 'Divider',
    categoryId: 'material',
    subCategory: 'Yüzeyler',
    description: 'Liste ve bölümleri ince bir çizgiyle ayırır.',
    snippet: r'''const Column(
  children: [
    ListTile(title: Text('Birinci öğe')),
    Divider(height: 1, thickness: 1),
    ListTile(title: Text('İkinci öğe')),
  ],
)''',
    properties: ['height', 'thickness', 'indent', 'endIndent', 'color'],
    icon: Icons.horizontal_rule,
  ),
  extraWidget(
    id: 'app_bar',
    name: 'AppBar',
    categoryId: 'material',
    subCategory: 'Gezinme',
    description: 'Ekranın üstünde başlık, eylemler ve menü taşıyan çubuk.',
    snippet: r'''Scaffold(
  appBar: AppBar(
    title: const Text('Proje ayarları'),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_vert),
      ),
    ],
  ),
)''',
    properties: [
      'title',
      'actions',
      'leading',
      'centerTitle',
      'backgroundColor'
    ],
    icon: Icons.view_headline,
  ),
  extraWidget(
    id: 'bottom_app_bar',
    name: 'BottomAppBar',
    categoryId: 'material',
    subCategory: 'Gezinme',
    description: 'Ekranın altında gezinme ve temel eylemleri barındıran çubuk.',
    snippet: r'''Scaffold(
  bottomNavigationBar: BottomAppBar(
    child: Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      ],
    ),
  ),
)''',
    properties: ['child', 'color', 'elevation', 'shape', 'notchMargin'],
    icon: Icons.space_bar,
  ),
  extraWidget(
    id: 'navigation_drawer',
    name: 'NavigationDrawer',
    categoryId: 'material',
    subCategory: 'Gezinme',
    description:
        'Kenardan açılan, uygulamanın ana bölümlerini listeleyen çekmece.',
    snippet: r'''NavigationDrawer(
  children: [
    NavigationDrawerDestination(
      icon: Icon(Icons.home_outlined),
      label: Text('Ana sayfa'),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.settings_outlined),
      label: Text('Ayarlar'),
    ),
  ],
)''',
    properties: ['children', 'selectedIndex', 'onDestinationSelected'],
    icon: Icons.menu_open,
  ),
  extraWidget(
    id: 'navigation_rail',
    name: 'NavigationRail',
    categoryId: 'material',
    subCategory: 'Gezinme',
    description:
        'Tablet ve masaüstünde sol kenarda duran dikey gezinme çubuğu.',
    snippet: r'''NavigationRail(
  selectedIndex: 0,
  labelType: NavigationRailLabelType.all,
  destinations: const [
    NavigationRailDestination(
      icon: Icon(Icons.home_outlined),
      label: Text('Ana sayfa'),
    ),
    NavigationRailDestination(
      icon: Icon(Icons.search),
      label: Text('Ara'),
    ),
  ],
)''',
    properties: ['destinations', 'selectedIndex', 'labelType', 'extended'],
    icon: Icons.view_sidebar_outlined,
  ),
  extraWidget(
    id: 'tab_bar',
    name: 'TabBar',
    categoryId: 'material',
    subCategory: 'Gezinme',
    description: 'Aynı ekrandaki farklı görünümleri sekmelerle ayırır.',
    snippet: r'''TabBar(
  tabs: const [
    Tab(text: 'Özet'),
    Tab(text: 'Ayrıntılar'),
    Tab(text: 'Geçmiş'),
  ],
)''',
    properties: ['tabs', 'controller', 'isScrollable', 'indicatorColor'],
    icon: Icons.tab,
  ),
  extraWidget(
    id: 'checkbox',
    name: 'Checkbox',
    categoryId: 'material',
    subCategory: 'Seçim',
    description: 'Birden çok seçenekten istenenleri işaretlemeyi sağlar.',
    snippet: r'''Checkbox(
  value: true,
  onChanged: (value) {},
  tristate: false,
)''',
    properties: ['value', 'onChanged', 'tristate', 'activeColor', 'shape'],
    icon: Icons.check_box_outlined,
  ),
  extraWidget(
    id: 'date_picker',
    name: 'DatePicker',
    categoryId: 'material',
    subCategory: 'Seçim',
    description: 'Takvimden tek bir tarih veya tarih aralığı seçtirir.',
    snippet: r'''showDatePicker(
  context: context,
  firstDate: DateTime(2020),
  lastDate: DateTime(2030),
  initialDate: DateTime.now(),
)''',
    properties: [
      'context',
      'firstDate',
      'lastDate',
      'initialDate',
      'initialDatePickerMode'
    ],
    icon: Icons.calendar_today_outlined,
  ),
  extraWidget(
    id: 'menu_anchor',
    name: 'MenuAnchor',
    categoryId: 'material',
    subCategory: 'Seçim',
    description: 'Bir düğmeye bağlı, geçici seçenek listesi açar.',
    snippet: r'''MenuAnchor(
  builder: (context, controller, child) => TextButton(
    onPressed: () => controller.open(),
    child: const Text('Menüyü aç'),
  ),
  menuChildren: [
    MenuItemButton(onPressed: () {}, child: const Text('Düzenle')),
    MenuItemButton(onPressed: () {}, child: const Text('Sil')),
  ],
)''',
    properties: ['builder', 'menuChildren', 'alignmentOffset', 'style'],
    icon: Icons.list_alt,
  ),
  extraWidget(
    id: 'radio',
    name: 'Radio',
    categoryId: 'material',
    subCategory: 'Seçim',
    description:
        'Seçenekler arasından yalnızca bir tanesinin seçilmesini sağlar.',
    snippet: r'''Radio<int>(
  value: 1,
  groupValue: 1,
  onChanged: (value) {},
)''',
    properties: ['value', 'groupValue', 'onChanged', 'activeColor'],
    icon: Icons.radio_button_checked,
  ),
  extraWidget(
    id: 'time_picker',
    name: 'TimePicker',
    categoryId: 'material',
    subCategory: 'Seçim',
    description: 'Saat ve dakika seçmek için kadranlı bir pencere açar.',
    snippet: r'''showTimePicker(
  context: context,
  initialTime: TimeOfDay.now(),
)''',
    properties: ['context', 'initialTime', 'initialEntryMode', 'builder'],
    icon: Icons.access_time,
  ),
];
