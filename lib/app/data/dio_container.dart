import 'package:client_dart_project/app/domain/app_config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class DioContainer {
  late final Dio dio;

  DioContainer(AppConfig appConfig) {
    final options = BaseOptions(
      baseUrl: appConfig.baseUrl,
      connectTimeout: const Duration(seconds: 15),
    );
    dio = Dio(options);
  }
  void addInterceptor (Interceptor interceptor) {
    if (dio.interceptors.contains(interceptor)) {
      dio.interceptors.remove(interceptor);
    }
    deleteInterceptor(interceptor.runtimeType);
    dio.interceptors.add(interceptor);
  }

  void deleteInterceptor (Type type) {
    dio.interceptors.removeWhere((el) => el.runtimeType == type);
  }
}