import 'package:client_dart_project/app/ui/main_app_builderImpl.dart';
import 'package:client_dart_project/app/ui/main_app_runnerImpl.dart';
import 'package:flutter/material.dart';

void main() {
  final runner = MainAppRunnerImpl();
  final builder = MainAppBuilderImpl();

  runner.run(builder);
}


