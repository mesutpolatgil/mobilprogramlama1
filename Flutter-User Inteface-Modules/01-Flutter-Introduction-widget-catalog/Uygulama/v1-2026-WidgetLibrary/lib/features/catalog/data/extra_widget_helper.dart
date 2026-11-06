import 'package:flutter/material.dart';

import '../domain/models/widget_item.dart';

/// Builds a reference-only catalog entry for widgets that are listed in the
/// official Flutter catalog but do not have a hand-tuned playground yet.
WidgetItem extraWidget({
  required String id,
  required String name,
  required String categoryId,
  required String subCategory,
  required String description,
  required String snippet,
  required List<String> properties,
  required IconData icon,
  String? docsUrl,
  List<String> extraTags = const [],
}) {
  final words = name
      .replaceAllMapped(
        RegExp(r'([a-z0-9])([A-Z])'),
        (match) => '${match[1]} ${match[2]}',
      )
      .toLowerCase();

  return WidgetItem(
    id: id,
    name: name,
    categoryId: categoryId,
    subCategory: subCategory,
    description: description,
    docsUrl: docsUrl ?? 'https://docs.flutter.dev/ui/widgets/$categoryId',
    isPlaygroundReady: false,
    tags: [categoryId, ...words.split(' '), ...extraTags],
    defaultCodeSnippet: snippet,
    keyProperties: properties,
    icon: icon,
  );
}
