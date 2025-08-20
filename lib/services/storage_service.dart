import 'package:fireshop/utils/storage_key.dart';
import 'package:get_storage/get_storage.dart';

class StorageService {
  static final _box = GetStorage();

  /// Save user session (login)
  static void saveSession(dynamic sessionData) {
    _box.write(StorageKey.userSession, sessionData);
  }

  /// Get user session (check if logged in)
  static dynamic get userSession => _box.read(StorageKey.userSession);

  /// Clear user session (logout)
  static void clearSession() {
    _box.remove(StorageKey.userSession);
  }
}
