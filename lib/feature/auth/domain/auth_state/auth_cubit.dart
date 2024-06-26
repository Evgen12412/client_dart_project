import 'package:client_dart_project/feature/auth/domain/auth_repository.dart';
import 'package:client_dart_project/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';
part 'auth_cubit.g.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit(this.authRepository):super(AuthState.notAuthorized());

  final AuthRepository authRepository;

  Future<void> signIn({
    required String username,
    required String password,
  }) async {
    emit(AuthState.waiting());
    try {
      final UserEntity userEntity = await authRepository.signIn(
          password: password, username: username);
      emit(AuthState.authorized(userEntity));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    emit(AuthState.waiting());
    try {
      final UserEntity userEntity = await authRepository.signUp(
          password: password, username: username, email: email);
      emit(AuthState.authorized(userEntity));
    }  catch (error, st) {
      addError(error, st);
    }
  }
  Future<void> refreshToken() async {
    final refreshToken =
    state.whenOrNull(authorized: (userEntity) => userEntity.refreshToken);
    try {
      final UserEntity userEntity = await authRepository.refreshToken(
          refreshToken: refreshToken
      );
      emit(AuthState.authorized(userEntity));
    } catch (e) {
      emit(AuthState.error(e));
      rethrow;
    }
  }

  void logOut() => emit(AuthState.notAuthorized());


  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    final state = AuthState.fromJson(json);
    return state.whenOrNull(
      authorized: (userEntity) => AuthState.authorized(userEntity),
    );
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.whenOrNull(
      authorized: (userEntity) => AuthState.authorized(userEntity),
    )?.toJson()?? AuthState.notAuthorized().toJson();
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(AuthState.error(error));
    super.addError(error, stackTrace);
  }
}