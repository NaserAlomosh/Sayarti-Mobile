import 'package:sayarti_mobile/domain/entity/remote/auth/user_entity.dart';

class LoginContentEntity {
  const LoginContentEntity({
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
  final UserEntity user;
  final String? requiredAction;
}
