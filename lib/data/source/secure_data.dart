import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureData {
  final FlutterSecureStorage storage;

  SecureData(this.storage);

  Future<dynamic> getValue(String key) async {
    return storage.read(key: key);
  }

  Future<void> setString(String key, String value) async {
    storage.write(key: key, value: value);
  }

  Future<void> remove(String key) async {
    storage.delete(key: key);
  }
}
