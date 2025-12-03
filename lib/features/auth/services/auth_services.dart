import 'package:dio/dio.dart' hide Headers;
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../models/auth_model.dart';

part 'auth_services.g.dart';

@RestApi()
@LazySingleton()
abstract class AuthServices {
  @factoryMethod
  factory AuthServices(Dio dio) = _AuthServices;

  @POST("/sign_in/")
  @MultiPart()
  Future<AuthModel> signIn({
    @Part(name: 'email') required String email,
    @Part(name: 'password') required String password,
  });

  @GET("/profile/")
  Future<User> profile();
}
