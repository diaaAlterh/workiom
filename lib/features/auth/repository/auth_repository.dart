import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../core/di/injection_container.dart';
import '../../../core/core_models/error_handler.dart';
import '../../../core/core_models/failure.dart';
import '../../../core/utils/constants.dart';
import '../models/auth_model.dart';
import '../services/auth_services.dart';

@Singleton()
class AuthRepository {
  final AuthServices _authServices;

  AuthRepository(
    this._authServices,
  );

  Future<Either<Failure, AuthModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authServices.signIn(
        email: email,
        password: password,
      );
      _saveUser(response);
      return Right(response);
    } on DioException catch (error) {
      return Left(ErrorHandler.handleDioError(error));
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }

  Future<Either<Failure, User>> profile() async {
    try {
      final response = await _authServices.profile();
      return Right(response);
    } on DioException catch (error) {
      return Left(ErrorHandler.handleDioError(error));
    } catch (error) {
      return Left(ErrorHandler.handle(error));
    }
  }

  _saveUser(AuthModel model) async {
    if (model.access?.isNotEmpty ?? false) {
      getIt<SharedPreferences>()
          .setString(Constants.tokenKey, model.access ?? '');
      getIt<SharedPreferences>()
          .setString(Constants.refreshTokenKey, model.refresh ?? '');
    }
  }
}
