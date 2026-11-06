import 'package:flutter/material.dart';

import '../domain/models/widget_item.dart';
import 'extra_widget_helper.dart';

/// Text and input widgets that are missing from the curated catalog.
final List<WidgetItem> catalogExtraTextInput = [
  extraWidget(
    id: 'default_text_style',
    name: 'DefaultTextStyle',
    categoryId: 'text',
    subCategory: 'Stil',
    description: 'Altındaki metinlere varsayılan yazı stili uygular.',
    snippet: r'''DefaultTextStyle(
  style: const TextStyle(
    fontSize: 18,
    color: Colors.indigo,
    fontWeight: FontWeight.w600,
  ),
  child: const Text('Varsayılan metin stili'),
)''',
    properties: ['style', 'textAlign', 'maxLines', 'overflow', 'child'],
    icon: Icons.format_size,
  ),
  extraWidget(
    id: 'autocomplete',
    name: 'Autocomplete',
    categoryId: 'input',
    subCategory: 'Metin girişi',
    description: 'Yazarken eşleşen seçenekleri öneren metin alanı oluşturur.',
    snippet: r'''Autocomplete<String>(
  optionsBuilder: (value) => const ['Flutter', 'Dart', 'Firebase']
      .where((option) =>
          option.toLowerCase().contains(value.text.toLowerCase())),
  onSelected: (value) {},
)''',
    properties: [
      'optionsBuilder',
      'onSelected',
      'fieldViewBuilder',
      'optionsViewBuilder'
    ],
    icon: Icons.auto_awesome,
  ),
  extraWidget(
    id: 'form',
    name: 'Form',
    categoryId: 'input',
    subCategory: 'Form',
    description:
        'Form alanlarını tek çatı altında toplar ve birlikte doğrular.',
    snippet: r'''final formKey = GlobalKey<FormState>();

Form(
  key: formKey,
  child: Column(
    children: [
      TextFormField(
        validator: (value) =>
            value == null || value.isEmpty ? 'Zorunlu alan' : null,
      ),
      FilledButton(
        onPressed: () => formKey.currentState!.validate(),
        child: const Text('Gönder'),
      ),
    ],
  ),
)''',
    properties: ['key', 'child', 'onChanged', 'autovalidateMode'],
    icon: Icons.assignment_outlined,
  ),
  extraWidget(
    id: 'form_field',
    name: 'FormField',
    categoryId: 'input',
    subCategory: 'Form',
    description: 'Özel bir alanı doğrulama ve durum yönetimine bağlar.',
    snippet: r'''FormField<String>(
  validator: (value) => value == null ? 'Bir değer seçin' : null,
  builder: (state) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(state.value ?? 'Seçim yapılmadı'),
      if (state.hasError)
        Text(state.errorText!, style: const TextStyle(color: Colors.red)),
    ],
  ),
)''',
    properties: ['validator', 'builder', 'initialValue', 'onSaved', 'enabled'],
    icon: Icons.rule,
  ),
  extraWidget(
    id: 'keyboard_listener',
    name: 'KeyboardListener',
    categoryId: 'input',
    subCategory: 'Girdi',
    description: 'Odaklandığında ham klavye olaylarını dinler.',
    snippet: r'''KeyboardListener(
  focusNode: FocusNode(),
  onKeyEvent: (event) {},
  child: const Text('Klavye olaylarını dinle'),
)''',
    properties: ['focusNode', 'onKeyEvent', 'child', 'autofocus'],
    icon: Icons.keyboard_outlined,
  ),
  extraWidget(
    id: 'text_form_field',
    name: 'TextFormField',
    categoryId: 'input',
    subCategory: 'Form',
    description: 'TextField ile Form doğrulamasını birleştiren metin alanı.',
    snippet: r'''TextFormField(
  decoration: const InputDecoration(
    labelText: 'E-posta',
    hintText: 'user@example.com',
  ),
  validator: (value) =>
      value != null && value.contains('@') ? null : 'Geçerli bir e-posta girin',
)''',
    properties: [
      'validator',
      'decoration',
      'controller',
      'onSaved',
      'autovalidateMode'
    ],
    icon: Icons.edit_note,
  ),
];
