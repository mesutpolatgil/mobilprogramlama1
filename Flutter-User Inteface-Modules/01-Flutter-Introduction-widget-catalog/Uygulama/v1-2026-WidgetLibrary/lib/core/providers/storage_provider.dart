import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/storage_service.dart';

/// Provides the initialized [StorageService].
///
/// It is overridden in `main.dart` after `StorageService.init()` completes,
/// and in tests with an in-memory instance.
final storageServiceProvider = Provider<StorageService>((ref) {
  throw UnimplementedError(
    'storageServiceProvider must be overridden in ProviderScope',
  );
});
