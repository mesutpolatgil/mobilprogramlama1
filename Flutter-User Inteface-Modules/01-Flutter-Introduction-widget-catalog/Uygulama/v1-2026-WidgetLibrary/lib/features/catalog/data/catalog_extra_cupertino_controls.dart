import 'package:flutter/cupertino.dart';

import '../domain/models/widget_item.dart';
import 'extra_widget_helper.dart';

/// Cupertino controls, pickers, text fields, list rows and scroll helpers.
final List<WidgetItem> catalogExtraCupertinoControls = [
  extraWidget(
    id: 'cupertino_checkbox',
    name: 'CupertinoCheckbox',
    categoryId: 'cupertino',
    subCategory: 'Kontroller',
    description: 'macOS görünümünde işaretlenebilir kutu.',
    snippet: r'''CupertinoCheckbox(
  value: true,
  onChanged: (value) {},
)''',
    properties: ['value', 'onChanged', 'activeColor', 'tristate', 'shape'],
    icon: CupertinoIcons.check_mark,
  ),
  extraWidget(
    id: 'cupertino_radio',
    name: 'CupertinoRadio',
    categoryId: 'cupertino',
    subCategory: 'Kontroller',
    description: 'macOS görünümünde tek seçimli radyo düğmesi.',
    snippet: r'''CupertinoRadio<int>(
  value: 1,
  groupValue: 1,
  onChanged: (value) {},
)''',
    properties: ['value', 'groupValue', 'onChanged', 'activeColor'],
    icon: CupertinoIcons.circle,
  ),
  extraWidget(
    id: 'cupertino_slider',
    name: 'CupertinoSlider',
    categoryId: 'cupertino',
    subCategory: 'Kontroller',
    description: 'iOS görünümünde sürükleyerek değer seçtiren kaydırıcı.',
    snippet: r'''CupertinoSlider(
  value: 0.6,
  onChanged: (value) {},
)''',
    properties: [
      'value',
      'onChanged',
      'min',
      'max',
      'divisions',
      'activeColor'
    ],
    icon: CupertinoIcons.slider_horizontal_3,
  ),
  extraWidget(
    id: 'cupertino_sliding_segmented_control',
    name: 'CupertinoSlidingSegmentedControl',
    categoryId: 'cupertino',
    subCategory: 'Kontroller',
    description: 'Kayan bir seçim göstergesiyle çalışan iOS segment kontrolü.',
    snippet: r'''CupertinoSlidingSegmentedControl<int>(
  groupValue: 0,
  children: const {
    0: Text('Gün'),
    1: Text('Hafta'),
    2: Text('Ay'),
  },
  onValueChanged: (value) {},
)''',
    properties: [
      'groupValue',
      'children',
      'onValueChanged',
      'thumbColor',
      'backgroundColor'
    ],
    icon: CupertinoIcons.square_grid_2x2,
  ),
  extraWidget(
    id: 'cupertino_date_picker',
    name: 'CupertinoDatePicker',
    categoryId: 'cupertino',
    subCategory: 'Seçiciler',
    description: 'iOS tarzı tekerleklerle tarih ve saat seçtirir.',
    snippet: r'''CupertinoDatePicker(
  mode: CupertinoDatePickerMode.date,
  initialDateTime: DateTime.now(),
  onDateTimeChanged: (value) {},
)''',
    properties: [
      'mode',
      'initialDateTime',
      'minimumDate',
      'maximumDate',
      'onDateTimeChanged'
    ],
    icon: CupertinoIcons.calendar,
  ),
  extraWidget(
    id: 'cupertino_timer_picker',
    name: 'CupertinoTimerPicker',
    categoryId: 'cupertino',
    subCategory: 'Seçiciler',
    description: 'Saat, dakika ve saniye için iOS tarzı süre seçici.',
    snippet: r'''CupertinoTimerPicker(
  mode: CupertinoTimerPickerMode.hms,
  initialTimerDuration: const Duration(minutes: 5),
  onTimerDurationChanged: (value) {},
)''',
    properties: [
      'mode',
      'initialTimerDuration',
      'onTimerDurationChanged',
      'alignment'
    ],
    icon: CupertinoIcons.timer,
  ),
  extraWidget(
    id: 'cupertino_picker',
    name: 'CupertinoPicker',
    categoryId: 'cupertino',
    subCategory: 'Seçiciler',
    description: 'Kısa bir listeden tekerlek hareketiyle öğe seçtirir.',
    snippet: r'''CupertinoPicker(
  itemExtent: 40,
  onSelectedItemChanged: (index) {},
  children: const [
    Text('Küçük'),
    Text('Orta'),
    Text('Büyük'),
  ],
)''',
    properties: [
      'itemExtent',
      'children',
      'onSelectedItemChanged',
      'scrollController',
      'diameterRatio'
    ],
    icon: CupertinoIcons.list_bullet,
  ),
  extraWidget(
    id: 'cupertino_picker_default_selection_overlay',
    name: 'CupertinoPickerDefaultSelectionOverlay',
    categoryId: 'cupertino',
    subCategory: 'Seçiciler',
    description:
        'Cupertino seçicisinde seçili satırı vurgulayan varsayılan katman.',
    snippet: r'''CupertinoPicker(
  itemExtent: 40,
  selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(),
  onSelectedItemChanged: (index) {},
  children: const [Text('Birinci'), Text('İkinci')],
)''',
    properties: ['background', 'capStartEdge', 'capEndEdge', 'borderRadius'],
    icon: CupertinoIcons.viewfinder,
  ),
  extraWidget(
    id: 'cupertino_search_text_field',
    name: 'CupertinoSearchTextField',
    categoryId: 'cupertino',
    subCategory: 'Metin girişi',
    description: 'iOS görünümünde arama simgesi taşıyan metin alanı.',
    snippet: r'''CupertinoSearchTextField(
  placeholder: 'Ara',
  onChanged: (value) {},
)''',
    properties: [
      'placeholder',
      'onChanged',
      'onSubmitted',
      'controller',
      'style'
    ],
    icon: CupertinoIcons.search,
  ),
  extraWidget(
    id: 'cupertino_text_field',
    name: 'CupertinoTextField',
    categoryId: 'cupertino',
    subCategory: 'Metin girişi',
    description: 'iOS görünümünde metin giriş alanı oluşturur.',
    snippet: r'''CupertinoTextField(
  placeholder: 'Ad soyad',
  prefix: const Padding(
    padding: EdgeInsets.only(left: 8),
    child: Icon(CupertinoIcons.person),
  ),
  onChanged: (value) {},
)''',
    properties: [
      'placeholder',
      'controller',
      'prefix',
      'suffix',
      'keyboardType',
      'obscureText'
    ],
    icon: CupertinoIcons.pencil,
  ),
  extraWidget(
    id: 'cupertino_text_form_field_row',
    name: 'CupertinoTextFormFieldRow',
    categoryId: 'cupertino',
    subCategory: 'Metin girişi',
    description: 'Cupertino form satırı içinde doğrulanabilir metin alanı.',
    snippet: r'''CupertinoTextFormFieldRow(
  placeholder: 'E-posta',
  validator: (value) =>
      value == null || value.isEmpty ? 'Zorunlu alan' : null,
)''',
    properties: ['placeholder', 'validator', 'prefix', 'controller', 'onSaved'],
    icon: CupertinoIcons.mail,
  ),
  extraWidget(
    id: 'cupertino_list_section',
    name: 'CupertinoListSection',
    categoryId: 'cupertino',
    subCategory: 'Listeler',
    description: 'iOS tarzı listeleri başlıklı bölümlere ayırır.',
    snippet: r'''CupertinoListSection.insetGrouped(
  header: const Text('Ayarlar'),
  children: const [
    CupertinoListTile(title: Text('Bildirimler')),
    CupertinoListTile(title: Text('Gizlilik')),
  ],
)''',
    properties: ['children', 'header', 'footer', 'margin', 'backgroundColor'],
    icon: CupertinoIcons.list_bullet,
  ),
  extraWidget(
    id: 'cupertino_list_tile',
    name: 'CupertinoListTile',
    categoryId: 'cupertino',
    subCategory: 'Listeler',
    description:
        'iOS görünümünde başlık, simge ve ek içerik taşıyan liste satırı.',
    snippet: r'''CupertinoListTile(
  title: const Text('Profil'),
  leading: const Icon(CupertinoIcons.person),
  trailing: const CupertinoListTileChevron(),
  onTap: () {},
)''',
    properties: ['title', 'subtitle', 'leading', 'trailing', 'onTap'],
    icon: CupertinoIcons.list_bullet,
  ),
  extraWidget(
    id: 'cupertino_list_tile_chevron',
    name: 'CupertinoListTileChevron',
    categoryId: 'cupertino',
    subCategory: 'Listeler',
    description: 'Liste satırının devam ettiğini gösteren iOS ok işareti.',
    snippet: r'''CupertinoListTile(
  title: const Text('Ayrıntılar'),
  trailing: const CupertinoListTileChevron(),
  onTap: () {},
)''',
    properties: [],
    icon: CupertinoIcons.chevron_right,
  ),
  extraWidget(
    id: 'cupertino_form_row',
    name: 'CupertinoFormRow',
    categoryId: 'cupertino',
    subCategory: 'Listeler',
    description: 'Etiket ile form alanını iOS tarzı tek satırda birleştirir.',
    snippet: r'''CupertinoFormRow(
  prefix: const Text('Ad'),
  child: CupertinoTextField(placeholder: 'Ada Lovelace'),
)''',
    properties: ['prefix', 'child', 'helper', 'error', 'padding'],
    icon: CupertinoIcons.list_bullet,
  ),
  extraWidget(
    id: 'cupertino_form_section',
    name: 'CupertinoFormSection',
    categoryId: 'cupertino',
    subCategory: 'Listeler',
    description: 'Form satırlarını iOS tarzı gruplanmış bölümde toplar.',
    snippet: r'''CupertinoFormSection.insetGrouped(
  header: const Text('Hesap'),
  children: [
    CupertinoFormRow(
      prefix: const Text('E-posta'),
      child: CupertinoTextField(placeholder: 'user@example.com'),
    ),
  ],
)''',
    properties: ['children', 'header', 'footer', 'margin', 'backgroundColor'],
    icon: CupertinoIcons.list_bullet,
  ),
  extraWidget(
    id: 'cupertino_sliver_navigation_bar',
    name: 'CupertinoSliverNavigationBar',
    categoryId: 'cupertino',
    subCategory: 'Kaydırma',
    description: 'Kaydırmayla küçülen büyük başlıklı iOS gezinme çubuğu.',
    snippet: r'''CustomScrollView(
  slivers: [
    const CupertinoSliverNavigationBar(
      largeTitle: Text('Kitaplık'),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) =>
            CupertinoListTile(title: Text('Öğe $index')),
        childCount: 20,
      ),
    ),
  ],
)''',
    properties: [
      'largeTitle',
      'leading',
      'trailing',
      'border',
      'backgroundColor'
    ],
    icon: CupertinoIcons.chevron_up,
  ),
  extraWidget(
    id: 'cupertino_sliver_refresh_control',
    name: 'CupertinoSliverRefreshControl',
    categoryId: 'cupertino',
    subCategory: 'Kaydırma',
    description: 'Aşağı çekince yenilenen iOS tarzı sliver kontrolü.',
    snippet: r'''CustomScrollView(
  slivers: [
    const CupertinoSliverRefreshControl(),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(title: Text('Öğe $index')),
        childCount: 20,
      ),
    ),
  ],
)''',
    properties: [
      'onRefresh',
      'refreshTriggerPullDistance',
      'refreshIndicatorExtent',
      'builder'
    ],
    icon: CupertinoIcons.refresh,
  ),
  extraWidget(
    id: 'cupertino_scrollbar',
    name: 'CupertinoScrollbar',
    categoryId: 'cupertino',
    subCategory: 'Kaydırma',
    description: 'iOS görünümünde kaydırma konumunu gösteren ince çubuk.',
    snippet: r'''CupertinoScrollbar(
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
    icon: CupertinoIcons.arrow_up,
  ),
  extraWidget(
    id: 'cupertino_scroll_behavior',
    name: 'CupertinoScrollBehavior',
    categoryId: 'cupertino',
    subCategory: 'Kaydırma',
    description:
        'Cupertino uygulamalarında kaydırma ve aşırı kaydırma davranışını belirler.',
    snippet: r'''ScrollConfiguration(
  behavior: const CupertinoScrollBehavior(),
  child: ListView.builder(
    itemCount: 20,
    itemBuilder: (context, index) =>
        ListTile(title: Text('Öğe $index')),
  ),
)''',
    properties: [
      'getScrollPhysics',
      'buildScrollbar',
      'buildOverscrollIndicator'
    ],
    icon: CupertinoIcons.settings,
  ),
];
