import 'package:client_dart_project/app/domain/app_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainAppBuilderImpl implements AppBuilder {
  @override
  Widget buildApp() {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Hello"),
        ),
      ),
    );
  }

}