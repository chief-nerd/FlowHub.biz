import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/api/api_client.dart';

class AuthRepository {
  final ApiClient _apiClient;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthRepository(this._apiClient);

  Future<void> login(String email, String password) async {
    final response = await _apiClient.dio.post('/auth/login', data: {
      'email': email,
      'password': password,
      'full_name': 'Placeholder', // Backend register/login logic mismatch fix
    });
    
    final accessToken = response.data['access_token'];
    final refreshToken = response.data['refresh_token'];
    
    await _storage.write(key: 'access_token', value: accessToken);
    await _storage.write(key: 'refresh_token', value: refreshToken);
  }

  Future<void> register(String email, String password, String fullName) async {
    await _apiClient.dio.post('/auth/register', data: {
      'email': email,
      'password': password,
      'full_name': fullName,
    });
  }

  Future<void> logout() async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');
  }

  Future<bool> isAuthenticated() async {
    final token = await _storage.read(key: 'access_token');
    return token != null;
  }
}
