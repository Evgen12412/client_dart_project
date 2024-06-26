//часть будующего сгенереруемого класса
import 'package:client_dart_project/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final dynamic id;
  final dynamic username;
  final dynamic email;
  final dynamic accessToken;
  final dynamic refreshToken;

  UserDto(
      {this.id,
      this.username,
      this.email,
      this.accessToken,
      this.refreshToken});

  // обязательная фабрики для генерации класса
  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  // после запуск команды кодагенерации
// flutter packages pub run build_runner build --delete-conflicting-outputs

  UserEntity toEntity() {
    return UserEntity(
        email: email.toString(),
        username: username.toString(),
        id: id.toString(),
        accessToken: accessToken,
        refreshToken: refreshToken);
  }
}
