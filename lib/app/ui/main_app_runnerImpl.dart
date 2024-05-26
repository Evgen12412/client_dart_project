import 'package:client_dart_project/app/domain/app_builder.dart';
import 'package:client_dart_project/app/domain/app_runner.dart';
import 'package:flutter/cupertino.dart';

class MainAppRunnerImpl implements AppRunner {
  @override
  Future<void> preloadData() async {
    WidgetsFlutterBinding.ensureInitialized();
    // init app
    // init di
    // init config
  }

  @override
  Future<void> run(AppBuilder appBuilder) async {
    await preloadData();
    runApp(appBuilder.buildApp());
  }
  
}