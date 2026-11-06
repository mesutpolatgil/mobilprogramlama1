import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_ui_catalog/features/catalog/presentation/screens/category_detail_screen.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/screens/favorites_screen.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/screens/home_dashboard_screen.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/screens/settings_screen.dart';
import 'package:flutter_ui_catalog/features/playground/presentation/screens/widget_playground_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeDashboardScreen(),
    ),
    GoRoute(
      path: '/category/:id',
      name: 'category_detail',
      builder: (BuildContext context, GoRouterState state) {
        final id = state.pathParameters['id'] ?? '';
        return CategoryDetailScreen(categoryId: id);
      },
    ),
    GoRoute(
      path: '/playground/:widgetId',
      name: 'playground',
      builder: (BuildContext context, GoRouterState state) {
        final widgetId = state.pathParameters['widgetId'] ?? '';
        return WidgetPlaygroundScreen(widgetId: widgetId);
      },
    ),
    GoRoute(
      path: '/favorites',
      name: 'favorites',
      builder: (BuildContext context, GoRouterState state) =>
          const FavoritesScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (BuildContext context, GoRouterState state) =>
          const SettingsScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Sayfa bulunamadı')),
    body: Center(
      child: Text('Bu adres için bir sayfa tanımlı değil: ${state.uri.path}'),
    ),
  ),
);
