import 'package:flutter/material.dart';

class PlaygroundIconOption {
  final IconData icon;
  final String label;

  const PlaygroundIconOption(this.icon, this.label);
}

const List<PlaygroundIconOption> playgroundIconOptions = [
  PlaygroundIconOption(Icons.favorite_rounded, 'Favori'),
  PlaygroundIconOption(Icons.star_rounded, 'Yıldız'),
  PlaygroundIconOption(Icons.rocket_launch_outlined, 'Roket'),
  PlaygroundIconOption(Icons.add_rounded, 'Ekle'),
  PlaygroundIconOption(Icons.mail_outline_rounded, 'E-posta'),
  PlaygroundIconOption(Icons.folder_outlined, 'Klasör'),
  PlaygroundIconOption(Icons.download_rounded, 'İndir'),
  PlaygroundIconOption(Icons.settings_outlined, 'Ayarlar'),
  PlaygroundIconOption(Icons.search_rounded, 'Ara'),
  PlaygroundIconOption(Icons.chevron_right_rounded, 'İleri'),
  PlaygroundIconOption(Icons.event_available_outlined, 'Takvim'),
  PlaygroundIconOption(Icons.verified_outlined, 'Onay'),
  PlaygroundIconOption(Icons.photo_album_outlined, 'Albüm'),
];
