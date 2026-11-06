import 'package:flutter/material.dart';

import 'playground_config.dart';

abstract final class PlaygroundDefaults {
  static const PlaygroundConfig base = PlaygroundConfig();

  static PlaygroundConfig forWidget(String widgetId) {
    switch (widgetId) {
      case 'text_widget':
        return base.copyWith(
          text: 'Tasarım, görünür kılınmış zekâdır.',
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          lineHeight: 1.3,
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        );
      case 'rich_text':
        return base.copyWith(
          text: 'Flutter ile ',
          richAccentWord: 'arayüzler',
          secondaryText: ' yeniden canlanır.',
          fontSize: 22,
          richAccentColor: const Color(0xFF3B5BDB),
          textAlign: TextAlign.center,
        );
      case 'animated_container':
        return base.copyWith(
          width: 170,
          height: 190,
          borderRadius: 24,
          primaryColor: const Color(0xFF3B5BDB),
          animationDurationMs: 500,
          curve: AnimationCurveOption.easeInOut,
          animationExpanded: false,
          text: 'Albüm kapağı',
        );
      case 'animated_opacity':
        return base.copyWith(
          targetOpacity: 1,
          opacity: 1,
          animationDurationMs: 400,
          curve: AnimationCurveOption.easeInOut,
          width: 220,
          height: 190,
          borderRadius: 22,
          text: 'Şimdi çal',
        );
      case 'row':
        return base.copyWith(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          spacing: 12,
          childCount: 3,
        );
      case 'column':
        return base.copyWith(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          spacing: 12,
          childCount: 3,
        );
      case 'wrap':
        return base.copyWith(
          spacing: 8,
          runSpacing: 8,
          direction: Axis.horizontal,
          wrapAlignment: WrapAlignment.start,
        );
      case 'stack':
        return base.copyWith(
          alignment: Alignment.center,
          stackFit: StackFit.loose,
          clipBehavior: Clip.antiAlias,
        );
      case 'align':
        return base.copyWith(
          alignment: Alignment.bottomRight,
          widthFactor: 1,
          heightFactor: 1,
        );
      case 'padding':
        return base.copyWith(
          padding: 24,
          width: 200,
          height: 120,
          primaryColor: const Color(0xFF3B5BDB),
        );
      case 'container':
        return base.copyWith(
          width: 210,
          height: 180,
          padding: 16,
          borderRadius: 22,
          primaryColor: const Color(0xFF3B5BDB),
          alignment: Alignment.bottomLeft,
          showShadow: true,
          elevation: 8,
          text: 'Şehri keşfet',
        );
      case 'card':
        return base.copyWith(
          elevation: 2,
          borderRadius: 20,
          padding: 16,
          primaryColor: const Color(0xFFF5F6F8),
          text: 'Şehirde bir gün',
          secondaryText: 'İstanbul · 12 fotoğraf',
        );
      case 'elevated_button':
        return base.copyWith(
          text: 'Rezervasyon yap',
          icon: Icons.event_available_outlined,
          elevation: 1,
          borderRadius: 14,
          padding: 22,
        );
      case 'floating_action_button':
        return base.copyWith(
          text: 'Yeni not',
          icon: Icons.add_rounded,
          extended: true,
          elevation: 2,
        );
      case 'chip':
        return base.copyWith(
          text: 'Yeni sezon',
          icon: Icons.verified_outlined,
          showAvatar: true,
          showDeleteIcon: true,
          borderRadius: 12,
        );
      case 'list_tile':
        return base.copyWith(
          text: 'Seyahat albümü',
          secondaryText: '12 fotoğraf · Dün güncellendi',
          icon: Icons.photo_album_outlined,
          trailingIcon: Icons.chevron_right_rounded,
          dense: false,
        );
      case 'cupertino_button':
        return base.copyWith(
          text: 'Devam et',
          filled: true,
          borderRadius: 14,
          primaryColor: const Color(0xFF3B5BDB),
        );
      case 'cupertino_switch':
        return base.copyWith(
          isSelected: true,
          primaryColor: const Color(0xFF34C759),
          secondaryColor: const Color(0xFFE5E5EA),
        );
      case 'cupertino_activity_indicator':
        return base.copyWith(
          padding: 16,
          animating: true,
          primaryColor: const Color(0xFF8E8E93),
        );
      case 'text_field':
        return base.copyWith(
          text: 'E-posta adresi',
          secondaryText: 'ornek@mail.com',
          icon: Icons.mail_outline_rounded,
          obscureText: false,
          maxLines: 1,
          showPrefixIcon: true,
          borderRadius: 14,
        );
      case 'slider':
        return base.copyWith(
          sliderValue: 65,
          minValue: 0,
          maxValue: 100,
          divisions: 10,
        );
      case 'switch_widget':
        return base.copyWith(
          isSelected: true,
          showThumbIcon: false,
          primaryColor: const Color(0xFF3B5BDB),
        );
      case 'gesture_detector':
        return base.copyWith(
          text: 'Karta dokun, çift dokun veya basılı tut',
          enableTap: true,
          enableDoubleTap: true,
          enableLongPress: true,
        );
      case 'ink_well':
        return base.copyWith(
          text: 'Detayları görmek için dokun',
          borderRadius: 16,
          primaryColor: const Color(0xFF3B5BDB),
        );
      case 'list_view':
        return base.copyWith(
          itemCount: 6,
          showSeparator: true,
          direction: Axis.vertical,
          height: 64,
        );
      case 'grid_view':
        return base.copyWith(
          crossAxisCount: 2,
          itemCount: 6,
          spacing: 8,
          childAspectRatio: 1,
        );
      case 'clip_rrect':
        return base.copyWith(
          borderRadius: 24,
          width: 190,
          height: 190,
          primaryColor: const Color(0xFF3B5BDB),
          clipBehavior: Clip.antiAlias,
        );
      case 'opacity_widget':
        return base.copyWith(
          opacity: 0.62,
          width: 210,
          height: 160,
          borderRadius: 20,
          primaryColor: const Color(0xFF3B5BDB),
          alwaysIncludeSemantics: false,
        );
      case 'icon_widget':
        return base.copyWith(
          icon: Icons.favorite_rounded,
          fontSize: 48,
          primaryColor: const Color(0xFF3B5BDB),
          text: 'Favori',
        );
      case 'tooltip':
        return base.copyWith(
          tooltipMessage: 'Fotoğrafı indir',
          tooltipWaitMs: 500,
          tooltipShowMs: 1500,
          tooltipTapTrigger: false,
          icon: Icons.download_rounded,
        );
      case 'flutter_logo':
        return base.copyWith(
          width: 120,
          logoStyle: FlutterLogoStyle.markOnly,
        );
      case 'placeholder':
        return base.copyWith(
          width: 160,
          height: 100,
          primaryColor: const Color(0xFF8A8D95),
          padding: 2,
        );
      default:
        return base;
    }
  }
}
