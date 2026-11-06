import 'package:flutter/cupertino.dart';

import '../domain/models/widget_item.dart';
import 'extra_widget_helper.dart';

/// Cupertino navigation, pages and routes.
final List<WidgetItem> catalogExtraCupertinoNavigation = [
  extraWidget(
    id: 'cupertino_app',
    name: 'CupertinoApp',
    categoryId: 'cupertino',
    subCategory: 'Gezinme',
    description: 'iOS görünümünü temel alan uygulama kabuğunu kurar.',
    snippet: r'''CupertinoApp(
  home: CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(
      middle: Text('Ana sayfa'),
    ),
    child: const Center(child: Text('Merhaba iOS')),
  ),
)''',
    properties: [
      'home',
      'routes',
      'theme',
      'localizationsDelegates',
      'debugShowCheckedModeBanner'
    ],
    icon: CupertinoIcons.device_phone_portrait,
  ),
  extraWidget(
    id: 'cupertino_page',
    name: 'CupertinoPage',
    categoryId: 'cupertino',
    subCategory: 'Gezinme',
    description:
        'Navigator sayfa yığınında Cupertino tarzı bir sayfa tanımlar.',
    snippet: r'''Navigator(
  pages: const [
    CupertinoPage<void>(
      child: Center(child: Text('Sayfa içeriği')),
    ),
  ],
  onPopPage: (route, result) => route.didPop(result),
)''',
    properties: ['child', 'name', 'arguments', 'restorationId'],
    icon: CupertinoIcons.doc,
  ),
  extraWidget(
    id: 'cupertino_page_route',
    name: 'CupertinoPageRoute',
    categoryId: 'cupertino',
    subCategory: 'Gezinme',
    description: 'Yeni sayfayı iOS tarzı yatay geçişle açar.',
    snippet: r'''Navigator.of(context).push(
  CupertinoPageRoute<void>(
    builder: (context) => const CupertinoPageScaffold(
      child: Center(child: Text('Yeni sayfa')),
    ),
  ),
)''',
    properties: ['builder', 'fullscreenDialog', 'maintainState', 'title'],
    icon: CupertinoIcons.arrow_right,
  ),
  extraWidget(
    id: 'cupertino_page_scaffold',
    name: 'CupertinoPageScaffold',
    categoryId: 'cupertino',
    subCategory: 'Gezinme',
    description: 'iOS tarzı sayfa için gezinme çubuğu ve gövde düzeni sağlar.',
    snippet: r'''CupertinoPageScaffold(
  navigationBar: const CupertinoNavigationBar(
    middle: Text('Profil'),
  ),
  child: const Center(child: Text('Sayfa gövdesi')),
)''',
    properties: [
      'navigationBar',
      'child',
      'backgroundColor',
      'resizeToAvoidBottomInset'
    ],
    icon: CupertinoIcons.device_phone_portrait,
  ),
  extraWidget(
    id: 'cupertino_page_transition',
    name: 'CupertinoPageTransition',
    categoryId: 'cupertino',
    subCategory: 'Gezinme',
    description: 'Sayfalar arası iOS yatay geçiş animasyonunu uygular.',
    snippet: r'''CupertinoPageTransition(
  primaryRouteAnimation: primaryAnimasyon,
  secondaryRouteAnimation: secondaryAnimasyon,
  linearTransition: false,
  child: const Text('Sayfa geçişi'),
)''',
    properties: [
      'primaryRouteAnimation',
      'secondaryRouteAnimation',
      'linearTransition',
      'child'
    ],
    icon: CupertinoIcons.arrow_right,
  ),
  extraWidget(
    id: 'cupertino_navigation_bar',
    name: 'CupertinoNavigationBar',
    categoryId: 'cupertino',
    subCategory: 'Gezinme',
    description: 'iOS görünümünde üst gezinme çubuğu oluşturur.',
    snippet: r'''CupertinoNavigationBar(
  middle: const Text('Kitaplık'),
  trailing: CupertinoButton(
    padding: EdgeInsets.zero,
    onPressed: () {},
    child: const Icon(CupertinoIcons.add),
  ),
)''',
    properties: ['middle', 'leading', 'trailing', 'backgroundColor', 'border'],
    icon: CupertinoIcons.chevron_up,
  ),
  extraWidget(
    id: 'cupertino_navigation_bar_back_button',
    name: 'CupertinoNavigationBarBackButton',
    categoryId: 'cupertino',
    subCategory: 'Gezinme',
    description: 'iOS gezinme çubuğunda önceki sayfaya dönen buton.',
    snippet: r'''CupertinoNavigationBar(
  middle: const Text('Ayrıntılar'),
  leading: CupertinoNavigationBarBackButton(
    previousPageTitle: 'Geri',
    onPressed: () {},
  ),
)''',
    properties: ['previousPageTitle', 'onPressed', 'color'],
    icon: CupertinoIcons.back,
  ),
  extraWidget(
    id: 'cupertino_tab_bar',
    name: 'CupertinoTabBar',
    categoryId: 'cupertino',
    subCategory: 'Gezinme',
    description: 'Alt kenarda duran iOS tarzı sekme çubuğu.',
    snippet: r'''CupertinoTabBar(
  items: const [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: 'Ana sayfa',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.settings),
      label: 'Ayarlar',
    ),
  ],
)''',
    properties: [
      'items',
      'currentIndex',
      'onTap',
      'backgroundColor',
      'activeColor'
    ],
    icon: CupertinoIcons.list_bullet,
  ),
  extraWidget(
    id: 'cupertino_tab_controller',
    name: 'CupertinoTabController',
    categoryId: 'cupertino',
    subCategory: 'Gezinme',
    description: 'Cupertino sekme yapısının seçili indeksini yönetir.',
    snippet: r'''final controller = CupertinoTabController(initialIndex: 0);
controller.index = 1;''',
    properties: ['initialIndex', 'index'],
    icon: CupertinoIcons.settings,
  ),
  extraWidget(
    id: 'cupertino_tab_scaffold',
    name: 'CupertinoTabScaffold',
    categoryId: 'cupertino',
    subCategory: 'Gezinme',
    description: 'Sekme çubuğu ile sekme içeriklerini birlikte düzenler.',
    snippet: r'''CupertinoTabScaffold(
  tabBar: CupertinoTabBar(
    items: const [
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        label: 'Ana sayfa',
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.settings),
        label: 'Ayarlar',
      ),
    ],
  ),
  tabBuilder: (context, index) => CupertinoTabView(
    builder: (context) => Center(child: Text('Sekme $index')),
  ),
)''',
    properties: ['tabBar', 'tabBuilder', 'controller', 'backgroundColor'],
    icon: CupertinoIcons.device_phone_portrait,
  ),
  extraWidget(
    id: 'cupertino_tab_view',
    name: 'CupertinoTabView',
    categoryId: 'cupertino',
    subCategory: 'Gezinme',
    description: 'Bir sekmenin kendi gezinme yığınını barındırmasını sağlar.',
    snippet: r'''CupertinoTabView(
  builder: (context) => const CupertinoPageScaffold(
    child: Center(child: Text('Sekme içeriği')),
  ),
)''',
    properties: ['builder', 'routes', 'navigatorKey', 'onGenerateRoute'],
    icon: CupertinoIcons.doc,
  ),
  extraWidget(
    id: 'cupertino_fullscreen_dialog_transition',
    name: 'CupertinoFullscreenDialogTransition',
    categoryId: 'cupertino',
    subCategory: 'Gezinme',
    description: 'Tam ekran diyalogların iOS tarzı açılış geçişini uygular.',
    snippet: r'''CupertinoFullscreenDialogTransition(
  primaryRouteAnimation: primaryAnimasyon,
  secondaryRouteAnimation: secondaryAnimasyon,
  linearTransition: false,
  child: const Text('Tam ekran diyalog'),
)''',
    properties: [
      'primaryRouteAnimation',
      'secondaryRouteAnimation',
      'linearTransition',
      'child'
    ],
    icon: CupertinoIcons.arrow_up,
  ),
  extraWidget(
    id: 'cupertino_dialog_route',
    name: 'CupertinoDialogRoute',
    categoryId: 'cupertino',
    subCategory: 'Gezinme',
    description: 'iOS tarzı diyalogları gösteren özel bir rota.',
    snippet: r'''Navigator.of(context).push(
  CupertinoDialogRoute<void>(
    context: context,
    builder: (context) => const CupertinoAlertDialog(
      title: Text('Başlık'),
      content: Text('İçerik'),
    ),
  ),
)''',
    properties: ['builder', 'context', 'barrierDismissible', 'barrierColor'],
    icon: CupertinoIcons.chat_bubble,
  ),
  extraWidget(
    id: 'cupertino_modal_popup_route',
    name: 'CupertinoModalPopupRoute',
    categoryId: 'cupertino',
    subCategory: 'Gezinme',
    description: 'Ekranın altından yükselen iOS tarzı açılır pencere açar.',
    snippet: r'''Navigator.of(context).push(
  CupertinoModalPopupRoute<void>(
    builder: (context) => const CupertinoActionSheet(
      title: Text('Seçenekler'),
    ),
  ),
)''',
    properties: [
      'builder',
      'barrierDismissible',
      'barrierLabel',
      'semanticsDismissible'
    ],
    icon: CupertinoIcons.arrow_up,
  ),
];
