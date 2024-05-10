import 'package:anora/core/network/api_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkCallManager {
  NetworkCallManager();
  static Dio initApiService({String? apiEndpoint}) {
    final dio = Dio();
    if (apiEndpoint != null) {
      dio.options.baseUrl = apiEndpoint;
    }
    dio.interceptors.add(ApiInterceptors(dio: dio));
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.headers['Content-Type'] = 'application/json';

    dio.options.headers['Accept'] = 'text/json';
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    );

    return dio;
  }

  static NetworkCallManager getApiClient() {
    final apiClient = NetworkCallManager();
    return apiClient;
  }
}
