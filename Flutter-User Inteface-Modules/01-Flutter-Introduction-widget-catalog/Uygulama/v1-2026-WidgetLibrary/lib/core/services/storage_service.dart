import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

class StorageService {
  final SharedPreferences? _prefs;

  StorageService(this._prefs);

  static Future<StorageService> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return StorageService(prefs);
    } catch (_) {
      return StorageService(null);
    }
  }

  // Favorites
  List<String> getFavorites() {
    return _prefs?.getStringList(AppConstants.keyFavorites) ?? [];
  }

  Future<bool> saveFavorites(List<String> favorites) async {
    if (_prefs == null) return false;
    return await _prefs.setStringList(AppConstants.keyFavorites, favorites);
  }

  // Recently Viewed
  List<String> getRecentlyViewed() {
    return _prefs?.getStringList(AppConstants.keyRecentlyViewed) ?? [];
  }

  Future<bool> addRecentlyViewed(String widgetId) async {
    if (_prefs == null) return false;
    final list = getRecentlyViewed().toList();
    list.remove(widgetId);
    list.insert(0, widgetId);
    if (list.length > 20) {
      list.removeRange(20, list.length);
    }
    return await _prefs.setStringList(AppConstants.keyRecentlyViewed, list);
  }

  // Theme Mode
  String getThemeMode() {
    return _prefs?.getString(AppConstants.keyThemeMode) ?? 'system';
  }

  Future<bool> saveThemeMode(String mode) async {
    if (_prefs == null) return false;
    return await _prefs.setString(AppConstants.keyThemeMode, mode);
  }

}
