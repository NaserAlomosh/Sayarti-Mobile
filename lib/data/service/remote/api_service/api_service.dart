import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/login/login_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/register_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/resend_verification_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/request/auth/register/verify_email_request_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/login/login_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/register/register_response_model.dart';
import 'package:sayarti_mobile/data/model/remote/response/auth/register/resend_verification_response_model.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST('v1/auth/login')
  Future<HttpResponse<LoginResponseModel>> login(
    @Body() LoginRequestModel request,
  );

  @POST('v1/auth/register')
  Future<HttpResponse<RegisterResponseModel>> register(
    @Body() RegisterRequestModel request,
  );

  @POST('v1/auth/verify-email')
  Future<HttpResponse<LoginResponseModel>> verifyEmail(
    @Body() VerifyEmailRequestModel request,
  );

  @POST('v1/auth/resend-verification')
  Future<HttpResponse<ResendVerificationResponseModel>> resendVerification(
    @Body() ResendVerificationRequestModel request,
  );
}
