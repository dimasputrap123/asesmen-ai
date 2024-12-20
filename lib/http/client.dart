import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Add your token here
        String? token = _getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        options.baseUrl = "http://127.0.0.1:8000/api";
        options.headers['Accept'] = 'application/json';
        return handler.next(options); // Continue the request
      },
      onResponse: (response, handler) {
        // Handle the response
        return handler.next(response); // Continue the response
      },
      onError: (DioException error, handler) async {
        return handler.next(error); // Continue with the error
      },
    ));
  }

  String? _getToken() {
    final box = GetStorage();
    final token = box.read('token');
    return token;
  }

  Dio get dio => _dio;
}
