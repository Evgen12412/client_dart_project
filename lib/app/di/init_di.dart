

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'init_di.config.dart';

final locator = GetIt.instance;
@InjectableInit()
void initDi(String env) {
  $initGetIt(locator, environment: env);
}

// flutter packages pub run build_runner build --delete-conflicting-outputs