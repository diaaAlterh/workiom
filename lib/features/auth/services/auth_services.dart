import 'package:dio/dio.dart' hide Headers;
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:workiom/features/auth/models/authenticate_model.dart';
import 'package:workiom/features/auth/models/editions_model.dart';
import 'package:workiom/features/auth/models/login_information_model.dart';
import 'package:workiom/features/auth/models/password_complexity_model.dart';
import 'package:workiom/features/auth/models/register_tenant_model.dart';
import 'package:workiom/features/auth/models/requests/authenticate_request.dart';
import 'package:workiom/features/auth/models/requests/is_tenant_available_request.dart';
import 'package:workiom/features/auth/models/requests/register_tenant_request.dart';
import 'package:workiom/features/auth/models/tenant_available_model.dart';

part 'auth_services.g.dart';

@RestApi()
@LazySingleton()
abstract class AuthServices {
  @factoryMethod
  factory AuthServices(Dio dio) = _AuthServices;

  @GET("/services/app/Session/GetCurrentLoginInformations")
  Future<LoginInformationModel> getCurrentLoginInformation();

  @GET("/services/app/TenantRegistration/GetEditionsForSelect")
  Future<EditionsModel> getEditions();

  @GET("/services/app/Profile/GetPasswordComplexitySetting")
  Future<PasswordComplexityModel> getPasswordComplexity();

  @POST("/services/app/Account/IsTenantAvailable")
  Future<TenantAvailableModel> isTenantAvailable(
      {@Body() required IsTenantAvailableRequest body});

  @POST("/services/app/TenantRegistration/RegisterTenant")
  Future<RegisterTenantModel> registerTenant(
      {@Body() required RegisterTenantRequest body});

  @POST("/TokenAuth/Authenticate")
  Future<AuthenticateModel> authenticate(
      {@Body() required AuthenticateRequest body});
}
