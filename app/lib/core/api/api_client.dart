import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  final Dio _dio = Dio();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  ApiClient() {
    String baseUrl = const String.fromEnvironment('API_URL', defaultValue: '');
    if (baseUrl.isEmpty) {
      if (kIsWeb) {
        baseUrl = '/api/v1'; // Nginx handles routing
      } else {
        baseUrl = 'http://10.0.2.2:8000/api/v1'; // Default for Android emulator
      }
    }
    _dio.options.baseUrl = baseUrl;
    
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _storage.read(key: 'access_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (e, handler) async {
        if (e.response?.statusCode == 401) {
          // Handle token refresh logic here in a real app
        }
        return handler.next(e);
      },
    ));
  }

  Dio get dio => _dio;
}
