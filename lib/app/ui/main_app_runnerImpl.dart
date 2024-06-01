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
    WidgetsFlutterBinding.ensureInitialized();
    // init app
    // init di
    initDi(env);
    // init config
  }

  @override
  Future<void> run(AppBuilder appBuilder) async {
    await preloadData();
    final storages = await HydratedStorage.build(
        storageDirectory: await getApplicationDocumentsDirectory());
    HydratedBlocOverrides.runZoned(
      () => runApp(appBuilder.buildApp()),
      storage: storages,
    );
  }
}
