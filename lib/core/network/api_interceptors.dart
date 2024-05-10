import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ApiInterceptors extends InterceptorsWrapper {
  ApiInterceptors({required this.dio});

  final Dio dio;
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    const token = 'xxx';
    //SharedPreferencesHelper.getApiTokenKey();

    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
      // options.headers['Content-Type'] = 'application/json';

      debugPrint('Bearer $token');
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // final context = navigatorKey.currentState!.context;
    if (!await InternetConnectionChecker().hasConnection) {
      super.onError(err, handler);
      // LoadingDialog.instance.hide();
      //TODO: show toast
    } else {
      if (err.response?.statusCode == 401) {
        //TODO: clear data local
        // navigator login
        // // Routes.router.navigateTo(context, '/', clearStack: true)
      } else {
        super.onError(err, handler);
        try {
          handler.resolve(err.response!);
        } catch (error) {
          handler.next(err);
        }
      }

      // _showNotification(
      //     title: S.of(navigatorKey.currentState!.context)?.server_interrupted ??
      //         '');
    }
  }
}
