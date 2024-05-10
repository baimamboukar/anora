import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  factory SecureStorageHelper() {
    return singleton;
  }

  factory SecureStorageHelper.getInstance() {
    return singleton;
  }

  SecureStorageHelper._internal(this._storage);
  static const _apiTokenKey = '_apiTokenKey';

  final FlutterSecureStorage _storage;

  static final SecureStorageHelper singleton =
      SecureStorageHelper._internal(const FlutterSecureStorage());

  Future<void> saveToken(String accessToken, String refreshToken) async {
    await _storage.write(
      key: _apiTokenKey,
      value: jsonEncode(
        {
          'accessToken': accessToken,
          'refreshToken': refreshToken,
        },
      ),
    );
  }

  Future<String?> getString({
    required String key,
  }) async {
    final data = await _storage.read(
      key: key,
    );
    return data;
  }

  Future<void> deleteAllData() async {
    await _storage.deleteAll();
  }

  Future<void> removeToken() async {
    await _storage.delete(key: _apiTokenKey);
  }

  Future<Map<String, dynamic>?> getToken() async {
    try {
      final tokenEncoded = await _storage.read(key: _apiTokenKey);
      if (tokenEncoded == null) {
        return null;
      } else {
        return jsonDecode(tokenEncoded) as Map<String, dynamic>;
      }
    } catch (e) {
      return null;
    }
  }
}
