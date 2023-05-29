import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageLocalDataSource {
  SharedPreferences? _storage;

  StorageLocalDataSource() {
    initStorage();
  }

  initStorage() async {
    _storage = await SharedPreferences.getInstance();
  }

  @protected
  Future<void> write({required String key, required String value}) async {
    await _ensureStorageIsInitialized();
    await _storage!.setString(key, value);
  }

  @protected
  Future<String?> read({required String key}) async {
    await _ensureStorageIsInitialized();
    return _storage!.getString(key);
  }

  @protected
  Future<void> delete({required String key}) async {
    await _ensureStorageIsInitialized();
    await _storage!.remove(key);
  }

  _ensureStorageIsInitialized() async {
    if (_storage == null) {
      await initStorage();
    }
  }
}
