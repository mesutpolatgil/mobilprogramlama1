import 'package:flutter/cupertino.dart';

import '../domain/models/widget_item.dart';
import 'extra_widget_helper.dart';

/// Cupertino text selection toolbars, controls and magnifiers.
final List<WidgetItem> catalogExtraCupertinoSelection = [
  extraWidget(
    id: 'cupertino_adaptive_text_selection_toolbar',
    name: 'CupertinoAdaptiveTextSelectionToolbar',
    categoryId: 'cupertino',
    subCategory: 'Metin Seçimi',
    description: 'Platforma uygun metin seçimi araç çubuğunu gösterir.',
    snippet: r'''CupertinoAdaptiveTextSelectionToolbar(
  anchors: const TextSelectionToolbarAnchors(
    primaryAnchor: Offset(120, 240),
  ),
  children: const [
    CupertinoTextSelectionToolbarButton(
      child: Text('Kopyala'),
    ),
  ],
)''',
    properties: ['anchors', 'children'],
    icon: CupertinoIcons.textbox,
  ),
  extraWidget(
    id: 'cupertino_desktop_text_selection_controls',
    name: 'CupertinoDesktopTextSelectionControls',
    categoryId: 'cupertino',
    subCategory: 'Metin Seçimi',
    description:
        'Masaüstünde Cupertino görünümlü metin seçimi kontrolleri sağlar.',
    snippet: r'''TextField(
  selectionControls: const CupertinoDesktopTextSelectionControls(),
)''',
    properties: ['buildHandle', 'buildToolbar', 'handleSize', 'toolbarHeight'],
    icon: CupertinoIcons.macwindow,
  ),
  extraWidget(
    id: 'cupertino_desktop_text_selection_toolbar',
    name: 'CupertinoDesktopTextSelectionToolbar',
    categoryId: 'cupertino',
    subCategory: 'Metin Seçimi',
    description: 'macOS görünümünde metin seçimi araç çubuğu çizer.',
    snippet: r'''CupertinoDesktopTextSelectionToolbar(
  anchors: const TextSelectionToolbarAnchors(
    primaryAnchor: Offset(120, 240),
  ),
  children: const [
    CupertinoTextSelectionToolbarButton(child: Text('Kes')),
    CupertinoTextSelectionToolbarButton(child: Text('Kopyala')),
  ],
)''',
    properties: ['anchors', 'children'],
    icon: CupertinoIcons.macwindow,
  ),
  extraWidget(
    id: 'cupertino_desktop_text_selection_toolbar_button',
    name: 'CupertinoDesktopTextSelectionToolbarButton',
    categoryId: 'cupertino',
    subCategory: 'Metin Seçimi',
    description: 'macOS metin seçimi araç çubuğundaki buton.',
    snippet: r'''CupertinoDesktopTextSelectionToolbarButton(
  onPressed: () {},
  child: const Text('Kopyala'),
)''',
    properties: ['onPressed', 'child'],
    icon: CupertinoIcons.check_mark,
  ),
  extraWidget(
    id: 'cupertino_magnifier',
    name: 'CupertinoMagnifier',
    categoryId: 'cupertino',
    subCategory: 'Metin Seçimi',
    description: 'Metin seçerken parmağın altındaki alanı büyüten mercek.',
    snippet: r'''CupertinoMagnifier(
  size: const Size(80, 80),
  child: const Text('Büyütülecek içerik'),
)''',
    properties: ['size', 'magnification', 'child'],
    icon: CupertinoIcons.search,
  ),
  extraWidget(
    id: 'cupertino_spell_check_suggestions_toolbar',
    name: 'CupertinoSpellCheckSuggestionsToolbar',
    categoryId: 'cupertino',
    subCategory: 'Metin Seçimi',
    description: 'Yazım hatası için iOS tarzı düzeltme önerileri gösterir.',
    snippet: r'''CupertinoSpellCheckSuggestionsToolbar(
  anchors: const TextSelectionToolbarAnchors(
    primaryAnchor: Offset(100, 200),
  ),
  buttonItems: const [
    CupertinoTextSelectionToolbarButton(child: Text('Düzelt')),
  ],
)''',
    properties: ['anchors', 'buttonItems'],
    icon: CupertinoIcons.check_mark,
  ),
  extraWidget(
    id: 'cupertino_text_magnifier',
    name: 'CupertinoTextMagnifier',
    categoryId: 'cupertino',
    subCategory: 'Metin Seçimi',
    description: 'iOS metin seçiminde kullanılan büyüteç görünümü.',
    snippet: r'''CupertinoTextMagnifier(
  controller: magnifierController,
)''',
    properties: ['controller', 'magnifierInfo'],
    icon: CupertinoIcons.search,
  ),
  extraWidget(
    id: 'cupertino_text_selection_controls',
    name: 'CupertinoTextSelectionControls',
    categoryId: 'cupertino',
    subCategory: 'Metin Seçimi',
    description:
        'iOS görünümlü metin seçimi tutamaçları ve araç çubuğu sağlar.',
    snippet: r'''TextField(
  selectionControls: const CupertinoTextSelectionControls(),
)''',
    properties: ['buildHandle', 'buildToolbar', 'handleSize', 'toolbarHeight'],
    icon: CupertinoIcons.textbox,
  ),
  extraWidget(
    id: 'cupertino_text_selection_toolbar',
    name: 'CupertinoTextSelectionToolbar',
    categoryId: 'cupertino',
    subCategory: 'Metin Seçimi',
    description: 'Seçili metin için iOS tarzı işlem araç çubuğu çizer.',
    snippet: r'''CupertinoTextSelectionToolbar(
  anchors: const TextSelectionToolbarAnchors(
    primaryAnchor: Offset(120, 240),
  ),
  children: const [
    CupertinoTextSelectionToolbarButton(child: Text('Kopyala')),
  ],
)''',
    properties: ['anchors', 'children', 'toolbarPosition'],
    icon: CupertinoIcons.textbox,
  ),
  extraWidget(
    id: 'cupertino_text_selection_toolbar_button',
    name: 'CupertinoTextSelectionToolbarButton',
    categoryId: 'cupertino',
    subCategory: 'Metin Seçimi',
    description: 'iOS metin seçimi araç çubuğundaki işlem butonu.',
    snippet: r'''CupertinoTextSelectionToolbarButton(
  onPressed: () {},
  child: const Text('Yapıştır'),
)''',
    properties: ['onPressed', 'child'],
    icon: CupertinoIcons.check_mark,
  ),
];
