import 'package:sayarti_mobile/data/networking/api_result/api_result.dart';
import 'package:sayarti_mobile/domain/base/entity/base_response_entity.dart';
import 'package:sayarti_mobile/domain/base/usecase/base_usecase_params.dart';

abstract class BaseRemoteUsecase<Response, Request extends BaseUsecaseParams> {
  const BaseRemoteUsecase();
  Future<ApiResult<BaseResponseEntity<Response>>> call(Request params);
}

abstract class BaseLocalUsecase<Response, Request extends BaseUsecaseParams> {
  const BaseLocalUsecase();
  Future<ApiResult<Response>> call(Request params);
}
