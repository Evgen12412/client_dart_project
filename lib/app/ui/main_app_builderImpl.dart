import 'package:client_dart_project/app/di/init_di.dart';
import 'package:client_dart_project/app/domain/app_builder.dart';
import 'package:client_dart_project/app/ui/root_screen.dart';
import 'package:client_dart_project/feature/auth/domain/auth_repository.dart';
import 'package:client_dart_project/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAppBuilderImpl implements AppBuilder {
  @override
  Widget buildApp() {
    return const _GlobalProviders(
      child: MaterialApp(
        home: RootScreen(),
        ),
    );
  }
}

class _GlobalProviders extends StatelessWidget {
  const _GlobalProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => locator.get<AuthCubit>(),
      )
    ], child: child);
  }
}
