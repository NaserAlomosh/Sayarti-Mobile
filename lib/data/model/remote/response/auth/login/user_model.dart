import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/user_entity.dart';

part 'user_model.g.dart';
@JsonSerializable()
class UserModel extends BaseTransformResponseModel<UserEntity> {
  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerified,
    required this.authProvider,
    required this.countryCode,
    required this.defaultCurrencyCode,
    required this.preferredLanguage,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final bool? emailVerified;
  final String? authProvider;
  final String? countryCode;
  final String? defaultCurrencyCode;
  final String? preferredLanguage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

    factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  UserEntity toEntity() => UserEntity(
    id: id,
    firstName: firstName,
    lastName: lastName,
    email: email,
    emailVerified: emailVerified,
    authProvider: authProvider,
    countryCode: countryCode,
    defaultCurrencyCode: defaultCurrencyCode,
    preferredLanguage: preferredLanguage,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
