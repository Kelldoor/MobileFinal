import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalDataService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<void> saveCredentials(Map<String, String> credentials) async {
    await _storage.write(key: 'username', value: credentials['username']!);
    await _storage.write(key: 'password', value: credentials['password']!);
  }

  Future<Map<String, String>?> getCredentials() async {
    final username = await _storage.read(key: 'username');
    final password = await _storage.read(key: 'password');

    if (username != null && password != null) {
      return {'username': username, 'password': password};
    }

    return null;
  }
}
