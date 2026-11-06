import 'package:flutter/material.dart';

import '../domain/models/widget_item.dart';
import 'extra_widget_helper.dart';

/// Single-child and multi-child layout widgets from the official catalog.
final List<WidgetItem> catalogExtraLayout = [
  extraWidget(
    id: 'aspect_ratio',
    name: 'AspectRatio',
    categoryId: 'layout',
    subCategory: 'Tek çocuk',
    description: 'İçeriği sabit bir genişlik/yükseklik oranında boyutlandırır.',
    snippet: r'''AspectRatio(
  aspectRatio: 16 / 9,
  child: Container(color: Colors.blue.shade100),
)''',
    properties: ['aspectRatio', 'child'],
    icon: Icons.aspect_ratio,
  ),
  extraWidget(
    id: 'baseline',
    name: 'Baseline',
    categoryId: 'layout',
    subCategory: 'Tek çocuk',
    description: 'İçeriği metnin taban çizgisine göre konumlandırır.',
    snippet: r'''Baseline(
  baseline: 24,
  baselineType: TextBaseline.alphabetic,
  child: const Text('Taban çizgisine hizalı'),
)''',
    properties: ['baseline', 'baselineType', 'child'],
    icon: Icons.text_fields,
  ),
  extraWidget(
    id: 'center',
    name: 'Center',
    categoryId: 'layout',
    subCategory: 'Tek çocuk',
    description: 'İçeriği kullanılabilir alanın tam ortasına yerleştirir.',
    snippet: r'''Container(
  height: 120,
  color: Colors.grey.shade100,
  child: const Center(child: Text('Ortalanmış içerik')),
)''',
    properties: ['child', 'widthFactor', 'heightFactor'],
    icon: Icons.center_focus_strong,
  ),
  extraWidget(
    id: 'constrained_box',
    name: 'ConstrainedBox',
    categoryId: 'layout',
    subCategory: 'Tek çocuk',
    description: 'İçeriğe en küçük ve en büyük boyut sınırları uygular.',
    snippet: r'''ConstrainedBox(
  constraints: const BoxConstraints(
    minWidth: 160,
    maxWidth: 240,
    minHeight: 80,
  ),
  child: const Card(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Text('Sınırlı kutu'),
    ),
  ),
)''',
    properties: ['constraints', 'child'],
    icon: Icons.crop_free,
  ),
  extraWidget(
    id: 'custom_single_child_layout',
    name: 'CustomSingleChildLayout',
    categoryId: 'layout',
    subCategory: 'Tek çocuk',
    description: 'Tek bir çocuğun ölçü ve konumunu özel bir delegeye devreder.',
    snippet: r'''CustomSingleChildLayout(
  delegate: MyLayoutDelegate(),
  child: const Text('Özel yerleşim'),
)''',
    properties: ['delegate', 'child'],
    icon: Icons.dashboard_customize_outlined,
  ),
  extraWidget(
    id: 'expanded',
    name: 'Expanded',
    categoryId: 'layout',
    subCategory: 'Tek çocuk',
    description: 'Row veya Column içindeki çocuğu kalan boşluğa yayar.',
    snippet: r'''Row(
  children: const [
    Expanded(child: Text('Esnek alan')),
    SizedBox(width: 12),
    Icon(Icons.star),
  ],
)''',
    properties: ['flex', 'child'],
    icon: Icons.open_in_full,
  ),
  extraWidget(
    id: 'fitted_box',
    name: 'FittedBox',
    categoryId: 'layout',
    subCategory: 'Tek çocuk',
    description: 'Çocuğu verilen sığdırma kuralına göre ölçekler ve hizalar.',
    snippet: r'''FittedBox(
  fit: BoxFit.contain,
  child: Container(
    width: 300,
    height: 150,
    color: Colors.teal,
  ),
)''',
    properties: ['fit', 'alignment', 'clipBehavior', 'child'],
    icon: Icons.fit_screen,
  ),
  extraWidget(
    id: 'fractionally_sized_box',
    name: 'FractionallySizedBox',
    categoryId: 'layout',
    subCategory: 'Tek çocuk',
    description: 'Çocuğu mevcut alanın belirli bir oranı kadar boyutlandırır.',
    snippet: r'''FractionallySizedBox(
  widthFactor: 0.7,
  heightFactor: 0.4,
  child: Container(color: Colors.orange.shade200),
)''',
    properties: ['widthFactor', 'heightFactor', 'alignment', 'child'],
    icon: Icons.photo_size_select_large,
  ),
  extraWidget(
    id: 'intrinsic_height',
    name: 'IntrinsicHeight',
    categoryId: 'layout',
    subCategory: 'Tek çocuk',
    description:
        'Çocuğu kendi içeriğinin doğal yüksekliğine göre boyutlandırır.',
    snippet: r'''IntrinsicHeight(
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: const [
      Text('Kısa'),
      VerticalDivider(),
      Text('Daha uzun metin'),
    ],
  ),
)''',
    properties: ['child'],
    icon: Icons.height,
  ),
  extraWidget(
    id: 'intrinsic_width',
    name: 'IntrinsicWidth',
    categoryId: 'layout',
    subCategory: 'Tek çocuk',
    description:
        'Çocuğu kendi içeriğinin doğal genişliğine göre boyutlandırır.',
    snippet: r'''IntrinsicWidth(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: const [
      Text('Kısa'),
      Text('Daha uzun bir metin'),
    ],
  ),
)''',
    properties: ['child'],
    icon: Icons.swap_horiz,
  ),
  extraWidget(
    id: 'limited_box',
    name: 'LimitedBox',
    categoryId: 'layout',
    subCategory: 'Tek çocuk',
    description: 'Yalnızca sınırsız alanda çocuğa en büyük boyut sınırı koyar.',
    snippet: r'''LimitedBox(
  maxWidth: 200,
  maxHeight: 100,
  child: Container(color: Colors.blue.shade50),
)''',
    properties: ['maxWidth', 'maxHeight', 'child'],
    icon: Icons.crop_square,
  ),
  extraWidget(
    id: 'offstage',
    name: 'Offstage',
    categoryId: 'layout',
    subCategory: 'Tek çocuk',
    description: 'Çocuğu ağaçta tutar ama çizmez ve dokunmalara kapatır.',
    snippet: r'''Offstage(
  offstage: true,
  child: const Text('Görünmez ama ağaçta'),
)''',
    properties: ['offstage', 'child'],
    icon: Icons.visibility_off_outlined,
  ),
  extraWidget(
    id: 'overflow_box',
    name: 'OverflowBox',
    categoryId: 'layout',
    subCategory: 'Tek çocuk',
    description:
        'Çocuğa ebeveynden farklı sınırlar vererek taşmasına izin verir.',
    snippet: r'''OverflowBox(
  maxWidth: 280,
  maxHeight: 280,
  child: Container(
    width: 200,
    height: 200,
    color: Colors.purple.shade100,
  ),
)''',
    properties: [
      'minWidth',
      'maxWidth',
      'minHeight',
      'maxHeight',
      'alignment',
      'child'
    ],
    icon: Icons.zoom_out_map,
  ),
  extraWidget(
    id: 'sized_box',
    name: 'SizedBox',
    categoryId: 'layout',
    subCategory: 'Tek çocuk',
    description: 'Sabit boyutlu bir kutu oluşturur veya boşluk bırakır.',
    snippet: r'''const SizedBox(
  width: 160,
  height: 80,
  child: Card(
    child: Center(child: Text('Sabit boyut')),
  ),
)''',
    properties: ['width', 'height', 'child'],
    icon: Icons.crop_16_9,
  ),
  extraWidget(
    id: 'sized_overflow_box',
    name: 'SizedOverflowBox',
    categoryId: 'layout',
    subCategory: 'Tek çocuk',
    description: 'Kendi boyutunu sabitler, çocuğa ise özgün sınırları geçirir.',
    snippet: r'''SizedOverflowBox(
  size: const Size(120, 80),
  child: Container(
    width: 180,
    height: 140,
    color: Colors.cyan.shade100,
  ),
)''',
    properties: ['size', 'alignment', 'child'],
    icon: Icons.aspect_ratio,
  ),
  extraWidget(
    id: 'custom_multi_child_layout',
    name: 'CustomMultiChildLayout',
    categoryId: 'layout',
    subCategory: 'Çok çocuk',
    description:
        'Birden çok çocuğun ölçü ve konumunu özel bir delegeyle belirler.',
    snippet: r'''CustomMultiChildLayout(
  delegate: MyMultiLayoutDelegate(),
  children: const [
    LayoutId(id: 'baslik', child: Text('Başlık')),
    LayoutId(id: 'icerik', child: Text('İçerik')),
  ],
)''',
    properties: ['delegate', 'children'],
    icon: Icons.dashboard_customize_outlined,
  ),
  extraWidget(
    id: 'carousel_view',
    name: 'CarouselView',
    categoryId: 'layout',
    subCategory: 'Çok çocuk',
    description: 'Yatay kaydırılan, öğe boyutları değişebilen kart şeridi.',
    snippet: r'''CarouselView(
  itemExtent: 240,
  children: List.generate(
    6,
    (index) => Card(
      child: Center(child: Text('Kart ${index + 1}')),
    ),
  ),
)''',
    properties: ['itemExtent', 'children', 'onTap', 'shrinkExtent'],
    icon: Icons.view_carousel_outlined,
  ),
  extraWidget(
    id: 'flow',
    name: 'Flow',
    categoryId: 'layout',
    subCategory: 'Çok çocuk',
    description: 'Çocukları özel bir delegeyle akış halinde konumlandırır.',
    snippet: r'''Flow(
  delegate: MyFlowDelegate(),
  children: const [
    Text('Birinci'),
    Text('İkinci'),
    Text('Üçüncü'),
  ],
)''',
    properties: ['delegate', 'children'],
    icon: Icons.waves,
  ),
  extraWidget(
    id: 'indexed_stack',
    name: 'IndexedStack',
    categoryId: 'layout',
    subCategory: 'Çok çocuk',
    description: 'Çocukları üst üste tutar, yalnızca seçilen indeksi gösterir.',
    snippet: r'''IndexedStack(
  index: 0,
  children: const [
    Text('Birinci sayfa'),
    Text('İkinci sayfa'),
  ],
)''',
    properties: ['index', 'alignment', 'sizing', 'children'],
    icon: Icons.layers_outlined,
  ),
  extraWidget(
    id: 'layout_builder',
    name: 'LayoutBuilder',
    categoryId: 'layout',
    subCategory: 'Çok çocuk',
    description: 'Ebeveynin sunduğu boyut sınırlarına göre arayüz kurar.',
    snippet: r'''LayoutBuilder(
  builder: (context, constraints) {
    final genis = constraints.maxWidth > 600;
    return Text(genis ? 'Geniş düzen' : 'Dar düzen');
  },
)''',
    properties: ['builder'],
    icon: Icons.build_outlined,
  ),
  extraWidget(
    id: 'list_body',
    name: 'ListBody',
    categoryId: 'layout',
    subCategory: 'Çok çocuk',
    description:
        'Çocukları belirli bir eksende sırayla dizer, kaydırma yapmaz.',
    snippet: r'''ListBody(
  children: const [
    ListTile(title: Text('Birinci satır')),
    ListTile(title: Text('İkinci satır')),
  ],
)''',
    properties: ['mainAxis', 'reverse', 'children'],
    icon: Icons.view_list_outlined,
  ),
  extraWidget(
    id: 'overflow_bar',
    name: 'OverflowBar',
    categoryId: 'layout',
    subCategory: 'Çok çocuk',
    description:
        'Sığdığında yatay, sığmadığında dikey düzene geçen eylem çubuğu.',
    snippet: r'''OverflowBar(
  spacing: 8,
  children: [
    FilledButton(onPressed: () {}, child: const Text('Kaydet')),
    TextButton(onPressed: () {}, child: const Text('Vazgeç')),
  ],
)''',
    properties: ['spacing', 'overflowAlignment', 'overflowSpacing', 'children'],
    icon: Icons.view_agenda_outlined,
  ),
  extraWidget(
    id: 'table',
    name: 'Table',
    categoryId: 'layout',
    subCategory: 'Çok çocuk',
    description: 'İçeriği satır ve sütunlardan oluşan bir tabloda hizalar.',
    snippet: r'''Table(
  border: TableBorder.all(),
  children: const [
    TableRow(children: [Text('Ad'), Text('Rol')]),
    TableRow(children: [Text('Ada'), Text('Tasarımcı')]),
  ],
)''',
    properties: ['children', 'columnWidths', 'defaultColumnWidth', 'border'],
    icon: Icons.table_chart_outlined,
  ),
];
