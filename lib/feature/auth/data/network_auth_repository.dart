import 'package:client_dart_project/app/data/dio_container.dart';
import 'package:client_dart_project/feature/auth/data/dto/user_dto.dart';
import 'package:client_dart_project/feature/auth/domain/auth_repository.dart';
import 'package:client_dart_project/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
@prod
class NetworkAuthRepository implements AuthRepository {
  final DioContainer dioContainer;

  NetworkAuthRepository(this.dioContainer);

  @override
  Future getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future passwordUpdate(
      {required String oldPassword, required String newPassword}) {
    // TODO: implement passwordUpdate
    throw UnimplementedError();
  }

  @override
  Future refreshToken({String? refreshToken}) async {
    try {
      final response = await dioContainer.dio.post("/auth/token/$refreshToken",);
      return UserDto.fromJson(response.data["data"]).toEntity();
    } catch (_) {
      rethrow;
    }
  }
  // после создание метода нужно запустить кодогенерацию
  @override
  Future<UserEntity> signIn(
      {required String password, required String username}) async {
    try {
      final response = await dioContainer.dio.post("/auth/token",
      data: {
        "username" : username,
        "password" : password
      });
      return UserDto.fromJson(response.data["data"]).toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future signUp(
      {required String password,
      required String username,
      required String email}) async {
    try {
      final response = await dioContainer.dio.put("/auth/token",
          data: {
            "username" : username,
            "password" : password,
            "email" : email
          });
      return UserDto.fromJson(response.data["data"]).toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future userUpdate({String? username, String? email}) {
    // TODO: implement userUpdate
    throw UnimplementedError();
  }
}
