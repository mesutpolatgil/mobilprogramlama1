import 'package:flutter/material.dart';

import '../domain/models/widget_item.dart';
import 'extra_widget_helper.dart';

/// Interaction widgets that do not have a dedicated playground yet.
final List<WidgetItem> catalogExtraInteraction = [
  extraWidget(
    id: 'absorb_pointer',
    name: 'AbsorbPointer',
    categoryId: 'interaction',
    subCategory: 'İşaretçi',
    description: 'Altındaki içeriğin dokunma ve işaretçi olaylarını yutar.',
    snippet: r'''AbsorbPointer(
  absorbing: true,
  child: ElevatedButton(
    onPressed: () {},
    child: const Text('Devre dışı'),
  ),
)''',
    properties: ['absorbing', 'child'],
    icon: Icons.block,
  ),
  extraWidget(
    id: 'dismissible',
    name: 'Dismissible',
    categoryId: 'interaction',
    subCategory: 'Jestler',
    description:
        'Bir öğeyi kaydırarak kaldırmayı ve animasyonla silmeyi sağlar.',
    snippet: r'''Dismissible(
  key: const ValueKey('gorev-1'),
  background: Container(color: Colors.red),
  onDismissed: (direction) {},
  child: const ListTile(title: Text('Kaydırarak sil')),
)''',
    properties: [
      'key',
      'direction',
      'background',
      'confirmDismiss',
      'onDismissed'
    ],
    icon: Icons.swipe,
  ),
  extraWidget(
    id: 'drag_target',
    name: 'DragTarget',
    categoryId: 'interaction',
    subCategory: 'Sürükle-bırak',
    description: 'Sürüklenen bir öğenin bırakılabileceği hedef alan oluşturur.',
    snippet: r'''DragTarget<String>(
  onAcceptWithDetails: (details) {},
  builder: (context, candidateData, rejectedData) => Container(
    height: 80,
    color: Colors.blue.shade50,
    child: const Center(child: Text('Buraya bırak')),
  ),
)''',
    properties: ['onWillAcceptWithDetails', 'onAcceptWithDetails', 'builder'],
    icon: Icons.ads_click,
  ),
  extraWidget(
    id: 'draggable',
    name: 'Draggable',
    categoryId: 'interaction',
    subCategory: 'Sürükle-bırak',
    description: 'Bir içeriği basılı tutup başka bir hedefe taşımayı sağlar.',
    snippet: r'''Draggable<String>(
  data: 'etiket',
  feedback: const Card(
    child: Padding(
      padding: EdgeInsets.all(12),
      child: Text('Sürükleniyor'),
    ),
  ),
  child: const Chip(label: Text('Beni sürükle')),
)''',
    properties: [
      'data',
      'feedback',
      'child',
      'dragAnchorStrategy',
      'onDragEnd'
    ],
    icon: Icons.drag_indicator,
  ),
  extraWidget(
    id: 'ignore_pointer',
    name: 'IgnorePointer',
    categoryId: 'interaction',
    subCategory: 'İşaretçi',
    description: 'İçeriği görünür tutarken dokunma olaylarını yok sayar.',
    snippet: r'''IgnorePointer(
  ignoring: true,
  child: ElevatedButton(
    onPressed: () {},
    child: const Text('Dokunulamaz'),
  ),
)''',
    properties: ['ignoring', 'child'],
    icon: Icons.touch_app_outlined,
  ),
  extraWidget(
    id: 'interactive_viewer',
    name: 'InteractiveViewer',
    categoryId: 'interaction',
    subCategory: 'İşaretçi',
    description:
        'İçeriği yakınlaştırma, kaydırma ve döndürme hareketleriyle inceler.',
    snippet: r'''InteractiveViewer(
  minScale: 0.8,
  maxScale: 4,
  child: Image.asset('assets/images/logo.png'),
)''',
    properties: [
      'minScale',
      'maxScale',
      'panEnabled',
      'scaleEnabled',
      'boundaryMargin'
    ],
    icon: Icons.zoom_in,
  ),
  extraWidget(
    id: 'long_press_draggable',
    name: 'LongPressDraggable',
    categoryId: 'interaction',
    subCategory: 'Sürükle-bırak',
    description: 'Uzun basma ile başlayan sürükleme davranışı ekler.',
    snippet: r'''LongPressDraggable<String>(
  data: 'kart',
  feedback: const Card(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Text('Uzun bas ve sürükle'),
    ),
  ),
  child: const ListTile(title: Text('Basılı tut')),
)''',
    properties: ['data', 'feedback', 'child', 'delay', 'hapticFeedbackOnStart'],
    icon: Icons.pan_tool_outlined,
  ),
  extraWidget(
    id: 'navigator',
    name: 'Navigator',
    categoryId: 'interaction',
    subCategory: 'Gezinme',
    description:
        'Sayfa yığınını yönetir; sayfa açar, kapatır ve sonuç döndürür.',
    snippet: r'''Navigator.of(context).push(
  MaterialPageRoute<void>(
    builder: (context) => const Scaffold(
      body: Center(child: Text('Yeni sayfa')),
    ),
  ),
)''',
    properties: ['push', 'pop', 'pushReplacement', 'canPop', 'pages'],
    icon: Icons.route,
  ),
];
