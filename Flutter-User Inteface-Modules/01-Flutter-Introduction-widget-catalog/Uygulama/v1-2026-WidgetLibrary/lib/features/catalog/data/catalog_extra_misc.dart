import 'package:flutter/material.dart';

import '../domain/models/widget_item.dart';
import 'extra_widget_helper.dart';

/// Async, painting, asset, styling and accessibility widgets.
final List<WidgetItem> catalogExtraMisc = [
  extraWidget(
    id: 'stream_builder',
    name: 'StreamBuilder',
    categoryId: 'async',
    subCategory: 'Stream',
    description: 'Bir akıştan gelen her yeni değerde arayüzü yeniler.',
    snippet: r'''StreamBuilder<int>(
  stream: sayacAkisi,
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return const CircularProgressIndicator();
    }
    return Text('Sayaç: ${snapshot.data}');
  },
)''',
    properties: ['stream', 'builder', 'initialData'],
    icon: Icons.stream,
  ),
  extraWidget(
    id: 'backdrop_filter',
    name: 'BackdropFilter',
    categoryId: 'painting',
    subCategory: 'Efektler',
    description:
        'Arkasındaki içeriğe bulanıklık gibi görsel filtreler uygular.',
    snippet: r'''BackdropFilter(
  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
  child: Container(color: Colors.black26),
)''',
    properties: ['filter', 'child', 'enabled'],
    icon: Icons.blur_on,
  ),
  extraWidget(
    id: 'clip_oval',
    name: 'ClipOval',
    categoryId: 'painting',
    subCategory: 'Kırpma',
    description: 'İçeriği daire veya elips biçiminde kırpar.',
    snippet: r'''ClipOval(
  child: Container(
    width: 120,
    height: 120,
    color: Colors.teal,
    child: const Center(
      child: Text('Daire', style: TextStyle(color: Colors.white)),
    ),
  ),
)''',
    properties: ['clipper', 'clipBehavior', 'child'],
    icon: Icons.circle_outlined,
  ),
  extraWidget(
    id: 'clip_path',
    name: 'ClipPath',
    categoryId: 'painting',
    subCategory: 'Kırpma',
    description: 'İçeriği özel bir yol tanımına göre kırpar.',
    snippet: r'''ClipPath(
  clipper: MyTriangleClipper(),
  child: Container(
    width: 160,
    height: 160,
    color: Colors.deepOrange,
  ),
)''',
    properties: ['clipper', 'clipBehavior', 'child'],
    icon: Icons.polyline_outlined,
  ),
  extraWidget(
    id: 'clip_rect',
    name: 'ClipRect',
    categoryId: 'painting',
    subCategory: 'Kırpma',
    description:
        'İçeriği dikdörtgen sınırların dışına taşmayacak şekilde kırpar.',
    snippet: r'''ClipRect(
  child: Align(
    alignment: Alignment.topLeft,
    widthFactor: 0.5,
    child: Container(
      width: 200,
      height: 100,
      color: Colors.indigo,
    ),
  ),
)''',
    properties: ['clipper', 'clipBehavior', 'child'],
    icon: Icons.crop_landscape,
  ),
  extraWidget(
    id: 'custom_paint',
    name: 'CustomPaint',
    categoryId: 'painting',
    subCategory: 'Çizim',
    description: 'Canvas üzerinde özel çizim yapmak için zemin hazırlar.',
    snippet: r'''CustomPaint(
  size: const Size(200, 120),
  painter: MyPainter(),
  child: const SizedBox.shrink(),
)''',
    properties: ['painter', 'foregroundPainter', 'size', 'child'],
    icon: Icons.brush_outlined,
  ),
  extraWidget(
    id: 'decorated_box',
    name: 'DecoratedBox',
    categoryId: 'painting',
    subCategory: 'Çizim',
    description: 'Çocuğun arkasına veya önüne dekorasyon çizer.',
    snippet: r'''DecoratedBox(
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [Colors.blue, Colors.purple],
    ),
    borderRadius: BorderRadius.circular(16),
  ),
  child: const Padding(
    padding: EdgeInsets.all(24),
    child: Text('Dekorlu kutu', style: TextStyle(color: Colors.white)),
  ),
)''',
    properties: ['decoration', 'position', 'child'],
    icon: Icons.format_paint,
  ),
  extraWidget(
    id: 'fractional_translation',
    name: 'FractionalTranslation',
    categoryId: 'painting',
    subCategory: 'Dönüşümler',
    description: 'Çocuğu kendi boyutunun bir oranı kadar kaydırır.',
    snippet: r'''FractionalTranslation(
  translation: const Offset(0.25, -0.1),
  child: Container(
    width: 120,
    height: 80,
    color: Colors.amber,
  ),
)''',
    properties: ['translation', 'transformHitTests', 'child'],
    icon: Icons.open_with,
  ),
  extraWidget(
    id: 'rotated_box',
    name: 'RotatedBox',
    categoryId: 'painting',
    subCategory: 'Dönüşümler',
    description:
        'Çocuğu çeyrek tur adımlarıyla döndürür ve yerleşimi de döndürür.',
    snippet: r'''RotatedBox(
  quarterTurns: 1,
  child: const Text('Döndürülmüş metin'),
)''',
    properties: ['quarterTurns', 'child'],
    icon: Icons.screen_rotation,
  ),
  extraWidget(
    id: 'transform_widget',
    name: 'Transform',
    categoryId: 'painting',
    subCategory: 'Dönüşümler',
    description: 'Çocuğa öteleme, döndürme, ölçekleme veya eğme uygular.',
    snippet: r'''Transform.rotate(
  angle: 0.2,
  child: const Card(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: Text('Dönüşüm'),
    ),
  ),
)''',
    properties: ['transform', 'alignment', 'origin', 'filterQuality', 'child'],
    icon: Icons.transform,
  ),
  extraWidget(
    id: 'asset_bundle',
    name: 'AssetBundle',
    categoryId: 'assets',
    subCategory: 'Paket',
    description: 'Pakete gömülü metin, görsel ve diğer dosyalara erişir.',
    snippet:
        r'''final data = await rootBundle.loadString('assets/aciklama.txt');
final bytes = await rootBundle.load('assets/images/logo.png');''',
    properties: ['load', 'loadString', 'loadStructuredData'],
    icon: Icons.folder_zip_outlined,
  ),
  extraWidget(
    id: 'image_widget',
    name: 'Image',
    categoryId: 'assets',
    subCategory: 'Görseller',
    description: 'Varlık, ağ veya bellekten gelen bir görseli gösterir.',
    snippet: r'''Image.asset(
  'assets/images/logo.png',
  width: 120,
  height: 120,
  fit: BoxFit.contain,
)''',
    properties: [
      'image',
      'fit',
      'width',
      'height',
      'alignment',
      'errorBuilder'
    ],
    icon: Icons.image_outlined,
  ),
  extraWidget(
    id: 'raw_image',
    name: 'RawImage',
    categoryId: 'assets',
    subCategory: 'Görseller',
    description: 'Hazır bir görüntü nesnesini doğrudan çizer.',
    snippet: r'''RawImage(
  image: image,
  width: 200,
  height: 120,
  fit: BoxFit.cover,
)''',
    properties: ['image', 'width', 'height', 'fit', 'scale', 'filterQuality'],
    icon: Icons.photo_outlined,
  ),
  extraWidget(
    id: 'media_query',
    name: 'MediaQuery',
    categoryId: 'styling',
    subCategory: 'Duyarlı',
    description: 'Ekran boyutu, yönelim ve erişilebilirlik ayarlarını sağlar.',
    snippet: r'''final size = MediaQuery.sizeOf(context);
final genis = size.width > 600;
final karanlik = MediaQuery.platformBrightnessOf(context) ==
    Brightness.dark;''',
    properties: ['size', 'padding', 'platformBrightness', 'textScaler'],
    icon: Icons.devices_outlined,
  ),
  extraWidget(
    id: 'exclude_semantics',
    name: 'ExcludeSemantics',
    categoryId: 'accessibility',
    subCategory: 'Anlamlandırma',
    description:
        'Altındaki içeriği ekran okuyucuların anlam ağacından çıkarır.',
    snippet: r'''ExcludeSemantics(
  child: Icon(Icons.star, color: Colors.amber),
)''',
    properties: ['excluding', 'child'],
    icon: Icons.visibility_off_outlined,
  ),
  extraWidget(
    id: 'merge_semantics',
    name: 'MergeSemantics',
    categoryId: 'accessibility',
    subCategory: 'Anlamlandırma',
    description: 'Altındaki anlam düğümlerini tek bir açıklamada birleştirir.',
    snippet: r'''MergeSemantics(
  child: Row(
    children: const [
      Icon(Icons.download),
      SizedBox(width: 8),
      Text('Raporu indir'),
    ],
  ),
)''',
    properties: ['child'],
    icon: Icons.merge_type,
  ),
];
