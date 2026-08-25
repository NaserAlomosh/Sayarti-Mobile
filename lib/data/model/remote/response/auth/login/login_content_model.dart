import 'package:sayarti_mobile/data/base/base_transform_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/login/user_model.dart';
import 'package:sayarti_mobile/domain/entity/remote/auth/login_content_entity.dart';


class LoginContentModel extends BaseTransformResponseModel<LoginContentEntity> {
  const LoginContentModel({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user,
    required this.requiredAction,
  });

  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;
  final UserModel user;
  final String? requiredAction;

  factory LoginContentModel.fromJson(Map<String, dynamic> json) => LoginContentModel(
    accessToken: json['accessToken'] as String, refreshToken: json['refreshToken'] as String,
    tokenType: json['tokenType'] as String, expiresIn: (json['expiresIn'] as num).toInt(),
    user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    requiredAction: json['requiredAction'] as String?,
  );

  @override
  LoginContentEntity toEntity() => LoginContentEntity(
    accessToken: accessToken,
    refreshToken: refreshToken,
    tokenType: tokenType,
    expiresIn: expiresIn,
    user: user.toEntity(),
    requiredAction: requiredAction,
  );
}
