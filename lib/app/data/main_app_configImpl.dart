import 'package:client_dart_project/app/domain/app_config.dart';
import 'package:injectable/injectable.dart';


@Singleton(as: AppConfig)
@prod
class ProdAppConfig implements AppConfig {
  @override
  String get baseUrl => "http://10.0.2.2";

  @override
  String get host => Environment.prod;

}

@Singleton(as: AppConfig)
@dev
class DevAppConfig implements AppConfig {
  @override
  String get baseUrl => "http://10.0.2.2";

  @override
  String get host => Environment.dev;

}

@Singleton(as: AppConfig)
@test
class TestAppConfig implements AppConfig {
  @override
  String get baseUrl => "_";

  @override
  String get host => Environment.test;

}