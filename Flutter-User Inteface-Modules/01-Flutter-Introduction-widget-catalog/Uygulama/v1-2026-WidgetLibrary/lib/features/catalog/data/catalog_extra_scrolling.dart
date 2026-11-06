import 'package:flutter/material.dart';

import '../domain/models/widget_item.dart';
import 'extra_widget_helper.dart';

/// Scrollable containers, slivers and scroll-aware helpers.
final List<WidgetItem> catalogExtraScrolling = [
  extraWidget(
    id: 'custom_scroll_view',
    name: 'CustomScrollView',
    categoryId: 'scrolling',
    subCategory: 'Sliver',
    description:
        'Birden çok sliver parçasını tek bir kaydırma alanında birleştirir.',
    snippet: r'''CustomScrollView(
  slivers: [
    const SliverAppBar(title: Text('Başlık')),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(title: Text('Öğe $index')),
        childCount: 20,
      ),
    ),
  ],
)''',
    properties: ['slivers', 'controller', 'scrollDirection', 'reverse'],
    icon: Icons.view_stream_outlined,
  ),
  extraWidget(
    id: 'draggable_scrollable_sheet',
    name: 'DraggableScrollableSheet',
    categoryId: 'scrolling',
    subCategory: 'Kaydırma',
    description: 'Alt paneli sürükleyerek büyütüp küçültmeyi sağlar.',
    snippet: r'''DraggableScrollableSheet(
  initialChildSize: 0.4,
  minChildSize: 0.2,
  maxChildSize: 0.9,
  builder: (context, scrollController) => ListView.builder(
    controller: scrollController,
    itemCount: 20,
    itemBuilder: (context, index) =>
        ListTile(title: Text('Öğe $index')),
  ),
)''',
    properties: ['initialChildSize', 'minChildSize', 'maxChildSize', 'builder'],
    icon: Icons.vertical_align_top,
  ),
  extraWidget(
    id: 'nested_scroll_view',
    name: 'NestedScrollView',
    categoryId: 'scrolling',
    subCategory: 'Kaydırma',
    description:
        'Bir başlık sliverı ile iç içe kaydırılan gövdeyi birleştirir.',
    snippet: r'''NestedScrollView(
  headerSliverBuilder: (context, innerBoxIsScrolled) => const [
    SliverAppBar(title: Text('Başlık')),
  ],
  body: ListView.builder(
    itemCount: 20,
    itemBuilder: (context, index) =>
        ListTile(title: Text('Öğe $index')),
  ),
)''',
    properties: ['headerSliverBuilder', 'body', 'floatHeaderSlivers'],
    icon: Icons.unfold_more,
  ),
  extraWidget(
    id: 'notification_listener',
    name: 'NotificationListener',
    categoryId: 'scrolling',
    subCategory: 'Kaydırma',
    description: 'Kaydırma ve ölçü bildirimlerini dinleyip tepki verir.',
    snippet: r'''NotificationListener<ScrollNotification>(
  onNotification: (notification) {
    return false;
  },
  child: ListView.builder(
    itemCount: 20,
    itemBuilder: (context, index) =>
        ListTile(title: Text('Öğe $index')),
  ),
)''',
    properties: ['onNotification', 'child'],
    icon: Icons.notifications_outlined,
  ),
  extraWidget(
    id: 'page_view',
    name: 'PageView',
    categoryId: 'scrolling',
    subCategory: 'Kaydırma',
    description: 'Sayfaları yatay veya dikey olarak tek tek kaydırır.',
    snippet: r'''PageView(
  children: const [
    Center(child: Text('Sayfa 1')),
    Center(child: Text('Sayfa 2')),
    Center(child: Text('Sayfa 3')),
  ],
)''',
    properties: ['children', 'controller', 'scrollDirection', 'onPageChanged'],
    icon: Icons.view_carousel_outlined,
  ),
  extraWidget(
    id: 'refresh_indicator',
    name: 'RefreshIndicator',
    categoryId: 'scrolling',
    subCategory: 'Kaydırma',
    description: 'Aşağı çekince içeriği yenileyen gösterge ekler.',
    snippet: r'''RefreshIndicator(
  onRefresh: () async {},
  child: ListView.builder(
    itemCount: 20,
    itemBuilder: (context, index) =>
        ListTile(title: Text('Öğe $index')),
  ),
)''',
    properties: ['onRefresh', 'child', 'color', 'displacement', 'edgeOffset'],
    icon: Icons.refresh,
  ),
  extraWidget(
    id: 'reorderable_list_view',
    name: 'ReorderableListView',
    categoryId: 'scrolling',
    subCategory: 'Listeler',
    description:
        'Öğelerin sürükleyerek yeniden sıralanabildiği liste oluşturur.',
    snippet: r'''ReorderableListView(
  onReorder: (oldIndex, newIndex) {},
  children: const [
    ListTile(key: ValueKey('a'), title: Text('Birinci')),
    ListTile(key: ValueKey('b'), title: Text('İkinci')),
  ],
)''',
    properties: [
      'onReorder',
      'children',
      'buildDefaultDragHandles',
      'proxyDecorator'
    ],
    icon: Icons.reorder,
  ),
  extraWidget(
    id: 'scroll_configuration',
    name: 'ScrollConfiguration',
    categoryId: 'scrolling',
    subCategory: 'Kaydırma',
    description: 'Altındaki kaydırma alanlarının davranışını özelleştirir.',
    snippet: r'''ScrollConfiguration(
  behavior: const ScrollBehavior().copyWith(overscroll: false),
  child: ListView.builder(
    itemCount: 20,
    itemBuilder: (context, index) =>
        ListTile(title: Text('Öğe $index')),
  ),
)''',
    properties: ['behavior', 'child'],
    icon: Icons.settings_suggest_outlined,
  ),
  extraWidget(
    id: 'scrollable',
    name: 'Scrollable',
    categoryId: 'scrolling',
    subCategory: 'Kaydırma',
    description: 'Kaydırma jestlerini ve konumunu yöneten alt düzey kapsayıcı.',
    snippet: r'''Scrollable(
  axisDirection: AxisDirection.down,
  viewportBuilder: (context, position) => Viewport(
    offset: position,
    slivers: const [
      SliverToBoxAdapter(child: Text('Kaydırılabilir içerik')),
    ],
  ),
)''',
    properties: ['axisDirection', 'viewportBuilder', 'controller', 'physics'],
    icon: Icons.swap_vert,
  ),
  extraWidget(
    id: 'scrollbar',
    name: 'Scrollbar',
    categoryId: 'scrolling',
    subCategory: 'Kaydırma',
    description:
        'Kaydırılabilir içeriğin neresinde olduğunu gösteren çubuk ekler.',
    snippet: r'''Scrollbar(
  thumbVisibility: true,
  child: ListView.builder(
    itemCount: 20,
    itemBuilder: (context, index) =>
        ListTile(title: Text('Öğe $index')),
  ),
)''',
    properties: [
      'thumbVisibility',
      'thickness',
      'radius',
      'controller',
      'child'
    ],
    icon: Icons.linear_scale,
  ),
  extraWidget(
    id: 'single_child_scroll_view',
    name: 'SingleChildScrollView',
    categoryId: 'scrolling',
    subCategory: 'Kaydırma',
    description: 'Tek bir çocuğu, sığmadığında kaydırılabilir hale getirir.',
    snippet: r'''SingleChildScrollView(
  padding: const EdgeInsets.all(16),
  child: Column(
    children: List.generate(
      20,
      (index) => ListTile(title: Text('Öğe $index')),
    ),
  ),
)''',
    properties: [
      'scrollDirection',
      'padding',
      'physics',
      'controller',
      'child'
    ],
    icon: Icons.swap_vert,
  ),
  extraWidget(
    id: 'sliver_app_bar',
    name: 'SliverAppBar',
    categoryId: 'scrolling',
    subCategory: 'Sliver',
    description: 'Kaydırmayla büyüyüp küçülen, sabitlenebilen uygulama çubuğu.',
    snippet: r'''CustomScrollView(
  slivers: [
    const SliverAppBar(
      pinned: true,
      expandedHeight: 160,
      flexibleSpace: FlexibleSpaceBar(title: Text('Başlık')),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(title: Text('Öğe $index')),
        childCount: 20,
      ),
    ),
  ],
)''',
    properties: [
      'pinned',
      'floating',
      'expandedHeight',
      'flexibleSpace',
      'snap'
    ],
    icon: Icons.web_asset,
  ),
  extraWidget(
    id: 'sliver_child_builder_delegate',
    name: 'SliverChildBuilderDelegate',
    categoryId: 'scrolling',
    subCategory: 'Sliver',
    description: 'Sliver çocuklarını istek üzerine oluşturan tembel delege.',
    snippet: r'''SliverList(
  delegate: SliverChildBuilderDelegate(
    (context, index) => ListTile(title: Text('Öğe $index')),
    childCount: 20,
  ),
)''',
    properties: [
      'builder',
      'childCount',
      'addAutomaticKeepAlives',
      'addRepaintBoundaries'
    ],
    icon: Icons.build_circle_outlined,
  ),
  extraWidget(
    id: 'sliver_child_list_delegate',
    name: 'SliverChildListDelegate',
    categoryId: 'scrolling',
    subCategory: 'Sliver',
    description: 'Hazır bir çocuk listesini sliver içine yerleştiren delege.',
    snippet: r'''SliverList(
  delegate: SliverChildListDelegate([
    const ListTile(title: Text('Birinci')),
    const ListTile(title: Text('İkinci')),
  ]),
)''',
    properties: ['children', 'addAutomaticKeepAlives', 'addRepaintBoundaries'],
    icon: Icons.list_alt,
  ),
  extraWidget(
    id: 'sliver_fill_remaining',
    name: 'SliverFillRemaining',
    categoryId: 'scrolling',
    subCategory: 'Sliver',
    description: 'Kalan görünüm alanını tek bir çocukla doldurur.',
    snippet: r'''CustomScrollView(
  slivers: [
    const SliverToBoxAdapter(child: Text('Üst içerik')),
    SliverFillRemaining(
      hasScrollBody: false,
      child: Center(child: const Text('Kalan alan')),
    ),
  ],
)''',
    properties: ['hasScrollBody', 'fillOverscroll', 'child'],
    icon: Icons.vertical_distribute,
  ),
  extraWidget(
    id: 'sliver_fixed_extent_list',
    name: 'SliverFixedExtentList',
    categoryId: 'scrolling',
    subCategory: 'Sliver',
    description:
        'Tüm öğelerin aynı yüksekliğe sahip olduğu verimli sliver liste.',
    snippet: r'''SliverFixedExtentList(
  itemExtent: 56,
  delegate: SliverChildBuilderDelegate(
    (context, index) => ListTile(title: Text('Öğe $index')),
    childCount: 20,
  ),
)''',
    properties: ['itemExtent', 'delegate'],
    icon: Icons.view_day_outlined,
  ),
  extraWidget(
    id: 'sliver_grid',
    name: 'SliverGrid',
    categoryId: 'scrolling',
    subCategory: 'Sliver',
    description: 'Öğeleri iki boyutlu ızgara düzeninde yerleştiren sliver.',
    snippet: r'''SliverGrid(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
  ),
  delegate: SliverChildBuilderDelegate(
    (context, index) => Card(child: Center(child: Text('Öğe $index'))),
    childCount: 8,
  ),
)''',
    properties: ['gridDelegate', 'delegate'],
    icon: Icons.grid_view,
  ),
  extraWidget(
    id: 'sliver_list',
    name: 'SliverList',
    categoryId: 'scrolling',
    subCategory: 'Sliver',
    description: 'Öğeleri ana eksen boyunca sıralayan sliver liste.',
    snippet: r'''SliverList(
  delegate: SliverChildBuilderDelegate(
    (context, index) => ListTile(title: Text('Öğe $index')),
    childCount: 20,
  ),
)''',
    properties: ['delegate'],
    icon: Icons.view_list_outlined,
  ),
  extraWidget(
    id: 'sliver_padding',
    name: 'SliverPadding',
    categoryId: 'scrolling',
    subCategory: 'Sliver',
    description: 'Bir sliverın çevresine boşluk ekler.',
    snippet: r'''SliverPadding(
  padding: const EdgeInsets.all(16),
  sliver: SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) => ListTile(title: Text('Öğe $index')),
      childCount: 10,
    ),
  ),
)''',
    properties: ['padding', 'sliver'],
    icon: Icons.padding,
  ),
  extraWidget(
    id: 'sliver_persistent_header',
    name: 'SliverPersistentHeader',
    categoryId: 'scrolling',
    subCategory: 'Sliver',
    description: 'Kaydırma sırasında boyutu değişebilen kalıcı başlık ekler.',
    snippet: r'''SliverPersistentHeader(
  pinned: true,
  delegate: MyHeaderDelegate(),
)''',
    properties: ['delegate', 'pinned', 'floating'],
    icon: Icons.vertical_align_center,
  ),
  extraWidget(
    id: 'sliver_to_box_adapter',
    name: 'SliverToBoxAdapter',
    categoryId: 'scrolling',
    subCategory: 'Sliver',
    description: 'Normal bir widgetı sliver alanına yerleştirir.',
    snippet: r'''SliverToBoxAdapter(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: const Text('Sliver içine normal widget'),
  ),
)''',
    properties: ['child'],
    icon: Icons.view_agenda_outlined,
  ),
];
