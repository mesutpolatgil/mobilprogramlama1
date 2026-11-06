import '../domain/models/widget_item.dart';
import 'catalog_extra_animation.dart';
import 'catalog_extra_cupertino_controls.dart';
import 'catalog_extra_cupertino_dialogs.dart';
import 'catalog_extra_cupertino_navigation.dart';
import 'catalog_extra_cupertino_selection.dart';
import 'catalog_extra_cupertino_styling.dart';
import 'catalog_extra_interaction.dart';
import 'catalog_extra_layout.dart';
import 'catalog_extra_material.dart';
import 'catalog_extra_misc.dart';
import 'catalog_extra_scrolling.dart';
import 'catalog_extra_text_input.dart';

/// Widgets from the wider official catalog, kept separate from the
/// hand-curated playground entries.
class CatalogExtraData {
  static final List<WidgetItem> widgets = [
    ...catalogExtraMaterial,
    ...catalogExtraCupertinoNavigation,
    ...catalogExtraCupertinoControls,
    ...catalogExtraCupertinoDialogs,
    ...catalogExtraCupertinoSelection,
    ...catalogExtraCupertinoStyling,
    ...catalogExtraLayout,
    ...catalogExtraTextInput,
    ...catalogExtraInteraction,
    ...catalogExtraScrolling,
    ...catalogExtraAnimation,
    ...catalogExtraMisc,
  ];
}
