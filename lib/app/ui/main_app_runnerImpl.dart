import 'package:client_dart_project/app/di/init_di.dart';
import 'package:client_dart_project/app/domain/app_builder.dart';
import 'package:client_dart_project/app/domain/app_runner.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

class MainAppRunnerImpl implements AppRunner {
  final String env;

  const MainAppRunnerImpl(this.env);

  @override
  Future<void> preloadData() async {
    // init app
    // init di
    initDi(env);
    // init config
  }

  @override
  Future<void> run(AppBuilder appBuilder) async {
    final storage = await HydratedStorage.build(
        storageDirectory: await getApplicationDocumentsDirectory());
    HydratedBlocOverrides.runZoned(
      () async {
        await preloadData();
        runApp(appBuilder.buildApp());
      },
      storage: storage,
    );
  }
}
