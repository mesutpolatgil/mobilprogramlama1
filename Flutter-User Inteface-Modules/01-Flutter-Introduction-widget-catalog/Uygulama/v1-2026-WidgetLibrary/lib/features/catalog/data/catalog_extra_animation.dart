import 'package:flutter/material.dart';

import '../domain/models/widget_item.dart';
import 'extra_widget_helper.dart';

/// Implicit, explicit and transition animation widgets.
final List<WidgetItem> catalogExtraAnimation = [
  extraWidget(
    id: 'align_transition',
    name: 'AlignTransition',
    categoryId: 'animation',
    subCategory: 'Geçişler',
    description: 'Hizalama değerini animasyonla yumuşak biçimde değiştirir.',
    snippet: r'''AlignTransition(
  alignment: alignmentAnimasyonu,
  child: const FlutterLogo(size: 72),
)''',
    properties: ['alignment', 'child'],
    icon: Icons.align_horizontal_center,
  ),
  extraWidget(
    id: 'animated_align',
    name: 'AnimatedAlign',
    categoryId: 'animation',
    subCategory: 'Dolaylı',
    description: 'Hizalama değişikliklerini kendiliğinden animasyonla uygular.',
    snippet: r'''AnimatedAlign(
  alignment: Alignment.centerRight,
  duration: const Duration(milliseconds: 300),
  curve: Curves.easeOut,
  child: const FlutterLogo(size: 72),
)''',
    properties: ['alignment', 'duration', 'curve', 'child'],
    icon: Icons.align_horizontal_left,
  ),
  extraWidget(
    id: 'animated_builder',
    name: 'AnimatedBuilder',
    categoryId: 'animation',
    subCategory: 'Yapı taşları',
    description:
        'Bir animasyon dinleyicisine bağlı olarak arayüzü yeniden kurar.',
    snippet: r'''AnimatedBuilder(
  animation: controller,
  builder: (context, child) => Transform.rotate(
    angle: controller.value * 6.28,
    child: child,
  ),
  child: const FlutterLogo(size: 72),
)''',
    properties: ['animation', 'builder', 'child'],
    icon: Icons.animation,
  ),
  extraWidget(
    id: 'animated_cross_fade',
    name: 'AnimatedCrossFade',
    categoryId: 'animation',
    subCategory: 'Dolaylı',
    description:
        'İki çocuk arasında yumuşak bir geçişle görünürlük değiştirir.',
    snippet: r'''AnimatedCrossFade(
  firstChild: const Text('Birinci görünüm'),
  secondChild: const Text('İkinci görünüm'),
  crossFadeState: CrossFadeState.showFirst,
  duration: const Duration(milliseconds: 300),
)''',
    properties: ['firstChild', 'secondChild', 'crossFadeState', 'duration'],
    icon: Icons.compare_arrows,
  ),
  extraWidget(
    id: 'animated_default_text_style',
    name: 'AnimatedDefaultTextStyle',
    categoryId: 'animation',
    subCategory: 'Dolaylı',
    description: 'Varsayılan metin stilindeki değişimi animasyonla uygular.',
    snippet: r'''AnimatedDefaultTextStyle(
  style: TextStyle(
    fontSize: 24,
    color: vurgulu ? Colors.indigo : Colors.black,
  ),
  duration: const Duration(milliseconds: 300),
  child: const Text('Yumuşak stil geçişi'),
)''',
    properties: ['style', 'duration', 'curve', 'child'],
    icon: Icons.text_format,
  ),
  extraWidget(
    id: 'animated_list',
    name: 'AnimatedList',
    categoryId: 'animation',
    subCategory: 'Dolaylı',
    description:
        'Öğe ekleme ve çıkarma işlemlerini animasyonla gösteren liste.',
    snippet: r'''final listKey = GlobalKey<AnimatedListState>();

AnimatedList(
  key: listKey,
  initialItemCount: 3,
  itemBuilder: (context, index, animation) => SizeTransition(
    sizeFactor: animation,
    child: ListTile(title: Text('Öğe $index')),
  ),
)''',
    properties: ['initialItemCount', 'itemBuilder', 'controller', 'padding'],
    icon: Icons.playlist_play,
  ),
  extraWidget(
    id: 'animated_list_state',
    name: 'AnimatedListState',
    categoryId: 'animation',
    subCategory: 'Yapı taşları',
    description:
        'Animasyonlu listenin öğelerini çalışma zamanında ekleyip çıkarır.',
    snippet: r'''final state = listKey.currentState;
state?.insertItem(0, duration: const Duration(milliseconds: 300));
state?.removeItem(0, (context, animation) => const SizedBox.shrink());''',
    properties: ['insertItem', 'removeItem'],
    icon: Icons.playlist_add_check,
  ),
  extraWidget(
    id: 'animated_modal_barrier',
    name: 'AnimatedModalBarrier',
    categoryId: 'animation',
    subCategory: 'Dolaylı',
    description:
        'Modal yüzeylerin arkasındaki bariyerin rengini animasyonla değiştirir.',
    snippet: r'''AnimatedModalBarrier(
  color: renkAnimasyonu,
  dismissible: true,
)''',
    properties: [
      'color',
      'dismissible',
      'onDismiss',
      'barrierSemanticsDismissible'
    ],
    icon: Icons.layers_outlined,
  ),
  extraWidget(
    id: 'animated_physical_model',
    name: 'AnimatedPhysicalModel',
    categoryId: 'animation',
    subCategory: 'Dolaylı',
    description: 'Yükseklik, renk ve gölge değişimlerini animasyonla uygular.',
    snippet: r'''AnimatedPhysicalModel(
  duration: const Duration(milliseconds: 300),
  shape: BoxShape.rectangle,
  elevation: 8,
  color: Colors.white,
  shadowColor: Colors.black45,
  child: const SizedBox(width: 120, height: 120),
)''',
    properties: ['shape', 'elevation', 'color', 'shadowColor', 'duration'],
    icon: Icons.view_in_ar_outlined,
  ),
  extraWidget(
    id: 'animated_positioned',
    name: 'AnimatedPositioned',
    categoryId: 'animation',
    subCategory: 'Dolaylı',
    description: 'Stack içindeki konum değişikliklerini animasyonla taşır.',
    snippet: r'''AnimatedPositioned(
  duration: const Duration(milliseconds: 300),
  left: 24,
  top: 24,
  width: 120,
  height: 120,
  child: Container(color: Colors.blue),
)''',
    properties: [
      'left',
      'top',
      'right',
      'bottom',
      'width',
      'height',
      'duration'
    ],
    icon: Icons.place_outlined,
  ),
  extraWidget(
    id: 'animated_scale',
    name: 'AnimatedScale',
    categoryId: 'animation',
    subCategory: 'Dolaylı',
    description: 'Ölçek değişikliklerini yumuşak bir animasyonla uygular.',
    snippet: r'''AnimatedScale(
  scale: 1.2,
  duration: const Duration(milliseconds: 250),
  curve: Curves.easeInOut,
  child: const FlutterLogo(size: 72),
)''',
    properties: ['scale', 'duration', 'curve', 'alignment', 'child'],
    icon: Icons.zoom_out_map,
  ),
  extraWidget(
    id: 'animated_size',
    name: 'AnimatedSize',
    categoryId: 'animation',
    subCategory: 'Dolaylı',
    description: 'Çocuğun boyutu değiştiğinde geçişi animasyonla yumuşatır.',
    snippet: r'''AnimatedSize(
  duration: const Duration(milliseconds: 300),
  curve: Curves.easeOut,
  child: Container(
    width: genis ? 200 : 100,
    height: 100,
    color: Colors.teal,
  ),
)''',
    properties: ['duration', 'curve', 'alignment', 'clipBehavior', 'child'],
    icon: Icons.open_in_full,
  ),
  extraWidget(
    id: 'animated_widget',
    name: 'AnimatedWidget',
    categoryId: 'animation',
    subCategory: 'Yapı taşları',
    description: 'Bir animasyonu dinleyip kendini yeniden kuran widget tabanı.',
    snippet: r'''class DonenLogo extends AnimatedWidget {
  const DonenLogo({super.key, required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform.rotate(
      angle: animation.value * 6.28,
      child: const FlutterLogo(size: 72),
    );
  }
}''',
    properties: ['listenable', 'build'],
    icon: Icons.widgets_outlined,
  ),
  extraWidget(
    id: 'implicitly_animated_widget',
    name: 'ImplicitlyAnimatedWidget',
    categoryId: 'animation',
    subCategory: 'Yapı taşları',
    description:
        'Özellik değişimlerini kendiliğinden animasyona çeviren taban sınıf.',
    snippet: r'''class RenkKutusu extends ImplicitlyAnimatedWidget {
  const RenkKutusu({
    super.key,
    required this.color,
    required super.duration,
  });

  final Color color;

  @override
  AnimatedWidgetBaseState<RenkKutusu> createState() =>
      _RenkKutusuState();
}''',
    properties: ['duration', 'curve', 'onEnd'],
    icon: Icons.auto_awesome,
  ),
  extraWidget(
    id: 'decorated_box_transition',
    name: 'DecoratedBoxTransition',
    categoryId: 'animation',
    subCategory: 'Geçişler',
    description: 'Dekorasyon değerlerini animasyonla yumuşakça değiştirir.',
    snippet: r'''DecoratedBoxTransition(
  decoration: decorationAnimasyonu,
  child: const SizedBox(width: 160, height: 100),
)''',
    properties: ['decoration', 'position', 'child'],
    icon: Icons.gradient,
  ),
  extraWidget(
    id: 'default_text_style_transition',
    name: 'DefaultTextStyleTransition',
    categoryId: 'animation',
    subCategory: 'Geçişler',
    description: 'Varsayılan metin stilini animasyonlu bir değerle besler.',
    snippet: r'''DefaultTextStyleTransition(
  style: styleAnimasyonu,
  child: const Text('Yumuşakça değişen stil'),
)''',
    properties: ['style', 'child'],
    icon: Icons.text_fields,
  ),
  extraWidget(
    id: 'fade_transition',
    name: 'FadeTransition',
    categoryId: 'animation',
    subCategory: 'Geçişler',
    description: 'Çocuğun saydamlığını bir animasyon değerine bağlar.',
    snippet: r'''FadeTransition(
  opacity: opacityAnimasyonu,
  child: const FlutterLogo(size: 72),
)''',
    properties: ['opacity', 'child', 'alwaysIncludeSemantics'],
    icon: Icons.opacity,
  ),
  extraWidget(
    id: 'hero',
    name: 'Hero',
    categoryId: 'animation',
    subCategory: 'Hero',
    description: 'İki sayfa arasında ortak bir öğeyi uçarak taşır.',
    snippet: r'''Hero(
  tag: 'avatar',
  child: const CircleAvatar(
    radius: 40,
    backgroundImage: AssetImage('assets/avatar.png'),
  ),
)''',
    properties: [
      'tag',
      'child',
      'flightShuttleBuilder',
      'transitionOnUserGestures'
    ],
    icon: Icons.flight_takeoff,
  ),
  extraWidget(
    id: 'matrix_transition',
    name: 'MatrixTransition',
    categoryId: 'animation',
    subCategory: 'Geçişler',
    description: 'Animasyon değerini dönüşüm matrisine çevirerek uygular.',
    snippet: r'''MatrixTransition(
  animation: controller,
  onTransform: (value) => Matrix4.rotationZ(value),
  child: const FlutterLogo(size: 72),
)''',
    properties: [
      'animation',
      'onTransform',
      'alignment',
      'filterQuality',
      'child'
    ],
    icon: Icons.transform,
  ),
  extraWidget(
    id: 'positioned_transition',
    name: 'PositionedTransition',
    categoryId: 'animation',
    subCategory: 'Geçişler',
    description:
        'Stack içindeki bir çocuğun dikdörtgen konumunu animasyonla taşır.',
    snippet: r'''PositionedTransition(
  rect: rectAnimasyonu,
  child: const FlutterLogo(size: 72),
)''',
    properties: ['rect', 'child'],
    icon: Icons.place,
  ),
  extraWidget(
    id: 'relative_positioned_transition',
    name: 'RelativePositionedTransition',
    categoryId: 'animation',
    subCategory: 'Geçişler',
    description:
        'Konumu ebeveyn boyutuna göre oransal olarak animasyonla değiştirir.',
    snippet: r'''RelativePositionedTransition(
  rect: rectAnimasyonu,
  size: const Size(120, 80),
  child: const FlutterLogo(),
)''',
    properties: ['rect', 'size', 'child'],
    icon: Icons.photo_size_select_large,
  ),
  extraWidget(
    id: 'repeating_animation_builder',
    name: 'RepeatingAnimationBuilder',
    categoryId: 'animation',
    subCategory: 'Yapı taşları',
    description:
        'Sürekli döngüde çalışan bir animasyon değeriyle arayüz kurar.',
    snippet: r'''RepeatingAnimationBuilder(
  duration: const Duration(seconds: 2),
  builder: (context, value, child) => Opacity(
    opacity: 0.4 + value * 0.6,
    child: child,
  ),
  child: const FlutterLogo(size: 72),
)''',
    properties: ['duration', 'builder', 'child', 'curve', 'reverse'],
    icon: Icons.repeat,
  ),
  extraWidget(
    id: 'rotation_transition',
    name: 'RotationTransition',
    categoryId: 'animation',
    subCategory: 'Geçişler',
    description: 'Çocuğu bir animasyon değerine göre döndürür.',
    snippet: r'''RotationTransition(
  turns: turnsAnimasyonu,
  child: const FlutterLogo(size: 72),
)''',
    properties: ['turns', 'alignment', 'filterQuality', 'child'],
    icon: Icons.rotate_right,
  ),
  extraWidget(
    id: 'scale_transition',
    name: 'ScaleTransition',
    categoryId: 'animation',
    subCategory: 'Geçişler',
    description: 'Çocuğun ölçeğini bir animasyon değerine bağlar.',
    snippet: r'''ScaleTransition(
  scale: scaleAnimasyonu,
  alignment: Alignment.center,
  child: const FlutterLogo(size: 72),
)''',
    properties: ['scale', 'alignment', 'filterQuality', 'child'],
    icon: Icons.zoom_in,
  ),
  extraWidget(
    id: 'size_transition',
    name: 'SizeTransition',
    categoryId: 'animation',
    subCategory: 'Geçişler',
    description:
        'Çocuğun boyutunu bir animasyon değerine göre açar veya daraltır.',
    snippet: r'''SizeTransition(
  sizeFactor: sizeAnimasyonu,
  axis: Axis.vertical,
  child: const Card(
    child: ListTile(title: Text('Açılan içerik')),
  ),
)''',
    properties: ['sizeFactor', 'axis', 'axisAlignment', 'child'],
    icon: Icons.height,
  ),
  extraWidget(
    id: 'slide_transition',
    name: 'SlideTransition',
    categoryId: 'animation',
    subCategory: 'Geçişler',
    description: 'Çocuğu kendi boyutuna göre oransal olarak kaydırır.',
    snippet: r'''SlideTransition(
  position: positionAnimasyonu,
  child: const Card(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Text('Kayarak gelen içerik'),
    ),
  ),
)''',
    properties: ['position', 'transformHitTests', 'textDirection', 'child'],
    icon: Icons.swap_horiz,
  ),
  extraWidget(
    id: 'sliver_fade_transition',
    name: 'SliverFadeTransition',
    categoryId: 'animation',
    subCategory: 'Geçişler',
    description: 'Bir sliverın saydamlığını animasyon değerine bağlar.',
    snippet: r'''SliverFadeTransition(
  opacity: opacityAnimasyonu,
  sliver: SliverToBoxAdapter(
    child: const Padding(
      padding: EdgeInsets.all(16),
      child: Text('Sliver içerik'),
    ),
  ),
)''',
    properties: ['opacity', 'sliver', 'alwaysIncludeSemantics'],
    icon: Icons.blur_linear,
  ),
];
