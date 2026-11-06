import 'package:flutter/cupertino.dart';

import '../domain/models/widget_item.dart';
import 'extra_widget_helper.dart';

/// Cupertino dialogs, action sheets and context menus.
final List<WidgetItem> catalogExtraCupertinoDialogs = [
  extraWidget(
    id: 'cupertino_alert_dialog',
    name: 'CupertinoAlertDialog',
    categoryId: 'cupertino',
    subCategory: 'Diyaloglar',
    description:
        'iOS görünümünde başlık, içerik ve eylemlerden oluşan uyarı penceresi.',
    snippet: r'''showCupertinoDialog<void>(
  context: context,
  builder: (context) => CupertinoAlertDialog(
    title: const Text('Kaydı sil?'),
    content: const Text('Bu işlem geri alınamaz.'),
    actions: [
      CupertinoDialogAction(
        onPressed: () {},
        child: const Text('Vazgeç'),
      ),
      CupertinoDialogAction(
        isDestructiveAction: true,
        onPressed: () {},
        child: const Text('Sil'),
      ),
    ],
  ),
)''',
    properties: [
      'title',
      'content',
      'actions',
      'scrollController',
      'insetAnimationDuration'
    ],
    icon: CupertinoIcons.chat_bubble,
  ),
  extraWidget(
    id: 'cupertino_dialog_action',
    name: 'CupertinoDialogAction',
    categoryId: 'cupertino',
    subCategory: 'Diyaloglar',
    description: 'Cupertino uyarı penceresindeki eylem butonu.',
    snippet: r'''CupertinoDialogAction(
  isDestructiveAction: true,
  onPressed: () {},
  child: const Text('Sil'),
)''',
    properties: [
      'onPressed',
      'child',
      'isDefaultAction',
      'isDestructiveAction'
    ],
    icon: CupertinoIcons.check_mark,
  ),
  extraWidget(
    id: 'cupertino_context_menu',
    name: 'CupertinoContextMenu',
    categoryId: 'cupertino',
    subCategory: 'Diyaloglar',
    description: 'Uzun basınca iOS tarzı eylem menüsü açan sarmalayıcı.',
    snippet: r'''CupertinoContextMenu(
  actions: [
    CupertinoContextMenuAction(
      onPressed: () {},
      child: const Text('Paylaş'),
    ),
  ],
  child: const Card(
    child: SizedBox(width: 160, height: 120),
  ),
)''',
    properties: ['actions', 'child', 'previewBuilder', 'enabled'],
    icon: CupertinoIcons.hand_point_left,
  ),
  extraWidget(
    id: 'cupertino_context_menu_action',
    name: 'CupertinoContextMenuAction',
    categoryId: 'cupertino',
    subCategory: 'Diyaloglar',
    description: 'iOS bağlam menüsünde yer alan eylem satırı.',
    snippet: r'''CupertinoContextMenuAction(
  isDestructiveAction: true,
  onPressed: () {},
  child: const Text('Sil'),
)''',
    properties: [
      'onPressed',
      'child',
      'isDestructiveAction',
      'isDefaultAction',
      'trailingIcon'
    ],
    icon: CupertinoIcons.check_mark,
  ),
  extraWidget(
    id: 'cupertino_action_sheet',
    name: 'CupertinoActionSheet',
    categoryId: 'cupertino',
    subCategory: 'Diyaloglar',
    description: 'Alt kenardan açılan iOS tarzı seçenek sayfası.',
    snippet: r'''showCupertinoModalPopup<void>(
  context: context,
  builder: (context) => CupertinoActionSheet(
    title: const Text('Fotoğraf seç'),
    actions: [
      CupertinoActionSheetAction(
        onPressed: () {},
        child: const Text('Kamera'),
      ),
    ],
    cancelButton: CupertinoActionSheetAction(
      onPressed: () {},
      child: const Text('Vazgeç'),
    ),
  ),
)''',
    properties: ['title', 'message', 'actions', 'cancelButton'],
    icon: CupertinoIcons.arrow_up,
  ),
  extraWidget(
    id: 'cupertino_action_sheet_action',
    name: 'CupertinoActionSheetAction',
    categoryId: 'cupertino',
    subCategory: 'Diyaloglar',
    description: 'Cupertino eylem sayfasındaki seçenek butonu.',
    snippet: r'''CupertinoActionSheetAction(
  isDestructiveAction: true,
  onPressed: () {},
  child: const Text('Sil'),
)''',
    properties: [
      'onPressed',
      'child',
      'isDefaultAction',
      'isDestructiveAction'
    ],
    icon: CupertinoIcons.check_mark,
  ),
  extraWidget(
    id: 'cupertino_popup_surface',
    name: 'CupertinoPopupSurface',
    categoryId: 'cupertino',
    subCategory: 'Diyaloglar',
    description:
        'Uyarı ve eylem sayfalarında kullanılan yuvarlatılmış iOS yüzeyi.',
    snippet: r'''CupertinoPopupSurface(
  child: const Padding(
    padding: EdgeInsets.all(24),
    child: Text('iOS açılır yüzeyi'),
  ),
)''',
    properties: ['child', 'isSurfacePainted'],
    icon: CupertinoIcons.square_on_square,
  ),
];
