import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workiom/features/auth/models/authenticate_model.dart';
import 'package:workiom/features/auth/models/editions_model.dart';
import 'package:workiom/features/auth/models/login_information_model.dart';
import 'package:workiom/features/auth/models/password_complexity_model.dart';
import 'package:workiom/features/auth/models/register_tenant_model.dart';
import 'package:workiom/features/auth/models/requests/authenticate_request.dart';
import 'package:workiom/features/auth/models/requests/is_tenant_available_request.dart';
import 'package:workiom/features/auth/models/requests/register_tenant_request.dart';
import 'package:workiom/features/auth/models/tenant_available_model.dart';

import '../../../core/di/injection_container.dart';
import '../../../core/core_models/error_handler.dart';
import '../../../core/core_models/failure.dart';
import '../../../core/utils/constants.dart';
import '../services/auth_services.dart';

@Singleton()
class AuthRepository {
  final AuthServices _authServices;

  AuthRepository(this._authServices);

  Future<Either<Failure, LoginInformationModel>>
  getCurrentLoginInformation() async {
    try {
      final response = await _authServices.getCurrentLoginInformation();
      return Right(response);
    } on DioException catch (error) {
      return Left(ErrorHandler.handleDioError(error));
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }

  Future<Either<Failure, EditionsModel>> getEditions() async {
    try {
      final response = await _authServices.getEditions();
      return Right(response);
    } on DioException catch (error) {
      return Left(ErrorHandler.handleDioError(error));
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }

  Future<Either<Failure, PasswordComplexityModel>> getPasswordComplexity() async {
    try {
      final response = await _authServices.getPasswordComplexity();
      return Right(response);
    } on DioException catch (error) {
      return Left(ErrorHandler.handleDioError(error));
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }

  Future<Either<Failure, TenantAvailableModel>> isTenantAvailable({
    required IsTenantAvailableRequest request,
  }) async {
    try {
      final response = await _authServices.isTenantAvailable(body: request);
      return Right(response);
    } on DioException catch (error) {
      return Left(ErrorHandler.handleDioError(error));
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }

  Future<Either<Failure, RegisterTenantModel>> registerTenant({
    required RegisterTenantRequest request,
  }) async {
    try {
      final response = await _authServices.registerTenant(body: request);
      return Right(response);
    } on DioException catch (error) {
      return Left(ErrorHandler.handleDioError(error));
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }

  Future<Either<Failure, AuthenticateModel>> authenticate({
    required AuthenticateRequest request,
  }) async {
    try {
      final response = await _authServices.authenticate(body: request);
      _saveUser(response);
      return Right(response);
    } on DioException catch (error) {
      return Left(ErrorHandler.handleDioError(error));
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }

  _saveUser(AuthenticateModel model) async {
    if (model.result?.accessToken?.isNotEmpty ?? false) {
      getIt<SharedPreferences>().setString(
        Constants.tokenKey,
        model.result?.accessToken ?? '',
      );

      getIt<SharedPreferences>().setString(
        Constants.refreshTokenKey,
        model.result?.refreshToken ?? '',
      );
    }
  }
}
