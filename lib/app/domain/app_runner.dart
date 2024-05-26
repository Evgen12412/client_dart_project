
import 'package:client_dart_project/app/domain/app_builder.dart';

abstract class AppRunner {
  Future<void> preloadData();

  Future<void> run(AppBuilder appBuilder);
}