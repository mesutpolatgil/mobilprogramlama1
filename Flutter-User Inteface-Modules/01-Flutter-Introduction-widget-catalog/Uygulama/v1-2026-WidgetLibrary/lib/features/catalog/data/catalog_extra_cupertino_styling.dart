import 'package:flutter/cupertino.dart';

import '../domain/models/widget_item.dart';
import 'extra_widget_helper.dart';

/// Cupertino colors, themes and text themes.
final List<WidgetItem> catalogExtraCupertinoStyling = [
  extraWidget(
    id: 'cupertino_colors',
    name: 'CupertinoColors',
    categoryId: 'cupertino',
    subCategory: 'Stil',
    description: 'iOS estetiğine uygun hazır renk sabitleri sunar.',
    snippet: r'''const renk = CupertinoColors.activeBlue;
const arkaPlan = CupertinoColors.systemGroupedBackground;''',
    properties: [
      'activeBlue',
      'activeGreen',
      'systemBackground',
      'label',
      'separator'
    ],
    icon: CupertinoIcons.paintbrush,
  ),
  extraWidget(
    id: 'cupertino_dynamic_color',
    name: 'CupertinoDynamicColor',
    categoryId: 'cupertino',
    subCategory: 'Stil',
    description:
        'Açık ve koyu görünüme göre kendiliğinden değişen renk tanımlar.',
    snippet: r'''const renk = CupertinoDynamicColor.withBrightness(
  color: CupertinoColors.white,
  darkColor: CupertinoColors.black,
);''',
    properties: ['color', 'darkColor', 'highContrastColor', 'resolveFrom'],
    icon: CupertinoIcons.color_filter,
  ),
  extraWidget(
    id: 'cupertino_theme',
    name: 'CupertinoTheme',
    categoryId: 'cupertino',
    subCategory: 'Stil',
    description:
        'Altındaki Cupertino widgetlarına ortak görünüm teması uygular.',
    snippet: r'''CupertinoTheme(
  data: const CupertinoThemeData(
    primaryColor: CupertinoColors.activeBlue,
  ),
  child: const CupertinoButton(
    onPressed: null,
    child: Text('Temalı buton'),
  ),
)''',
    properties: ['data', 'child'],
    icon: CupertinoIcons.paintbrush,
  ),
  extraWidget(
    id: 'cupertino_theme_data',
    name: 'CupertinoThemeData',
    categoryId: 'cupertino',
    subCategory: 'Stil',
    description:
        'Cupertino arayüzünün renk, metin ve çubuk stillerini tanımlar.',
    snippet: r'''const tema = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: CupertinoColors.activeBlue,
  barBackgroundColor: CupertinoColors.systemGrey5,
);''',
    properties: [
      'brightness',
      'primaryColor',
      'barBackgroundColor',
      'textTheme',
      'scaffoldBackgroundColor'
    ],
    icon: CupertinoIcons.paintbrush,
  ),
  extraWidget(
    id: 'cupertino_text_theme_data',
    name: 'CupertinoTextThemeData',
    categoryId: 'cupertino',
    subCategory: 'Stil',
    description: 'iOS arayüzündeki başlık ve metin stillerini tanımlar.',
    snippet: r'''const metinTemasi = CupertinoTextThemeData(
  navLargeTitleTextStyle: TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
  ),
);''',
    properties: [
      'navLargeTitleTextStyle',
      'navTitleTextStyle',
      'textStyle',
      'actionTextStyle'
    ],
    icon: CupertinoIcons.textformat,
  ),
  extraWidget(
    id: 'cupertino_localizations',
    name: 'CupertinoLocalizations',
    categoryId: 'cupertino',
    subCategory: 'Stil',
    description: 'Cupertino widgetlarının dil ve metin kaynaklarını sağlar.',
    snippet: r'''final localizations = CupertinoLocalizations.of(context);''',
    properties: [
      'of',
      'datePickerMonth',
      'alertDialogLabel',
      'tabSemanticsLabel'
    ],
    icon: CupertinoIcons.globe,
  ),
  extraWidget(
    id: 'cupertino_thumb_painter',
    name: 'CupertinoThumbPainter',
    categoryId: 'cupertino',
    subCategory: 'Stil',
    description: 'Cupertino kaydırıcısının yuvarlak tutamacını çizer.',
    snippet: r'''CustomPaint(
  painter: CupertinoThumbPainter(
    color: CupertinoColors.white,
  ),
)''',
    properties: ['color', 'shadows'],
    icon: CupertinoIcons.circle,
  ),
];
