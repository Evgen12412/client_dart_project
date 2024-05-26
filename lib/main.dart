import 'package:client_dart_project/app/ui/main_app_builderImpl.dart';
import 'package:client_dart_project/app/ui/main_app_runnerImpl.dart';
import 'package:flutter/material.dart';

void main() {
  const env =  String.fromEnvironment("env", defaultValue: "test");
  const runner = MainAppRunnerImpl(env);
  final builder = MainAppBuilderImpl();

  runner.run(builder);
}


