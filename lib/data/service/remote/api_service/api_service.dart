import 'package:sayarti_mobile/data/model/remote/request/auth/biometric/enable_biometric_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/create_app_pin/create_app_pin_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/login/login_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/register_new_user_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/verification_email/email_verify_otp_token_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/verification_email/send_otp_via_email_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/idwise/get_identity_flow_details_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/idwise/selfie_check_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/idwise/validate_idwise_identity_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/otp/send_mobile_otp_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/otp/verify_mobile_otp_token_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/version/current_app_version_request_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

}
