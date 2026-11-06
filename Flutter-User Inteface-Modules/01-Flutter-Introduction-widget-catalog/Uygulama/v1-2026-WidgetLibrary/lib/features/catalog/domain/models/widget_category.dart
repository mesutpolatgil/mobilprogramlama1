import 'package:flutter/material.dart';

class WidgetCategory {
  final String id;
  final String name;
  final String description;
  final IconData icon;
  final List<String> subCategories;

  const WidgetCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    this.subCategories = const [],
  });
}
