import 'package:sayarti_mobile/domain/entity/local/idwise/idwise_theme_entity.dart';

class IdwiseInitializeRequestModel {
  const IdwiseInitializeRequestModel({
    required this.clientKey,
    required this.theme,
  });

  final String clientKey;
  final IdwiseThemeEntity theme;
}
