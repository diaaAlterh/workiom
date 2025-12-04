import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workiom/core/app_cubit/base_state.dart';
import 'package:workiom/features/auth/models/auth_model.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/utils/constants.dart';
import '../../../core/utils/general.dart';
import '../repository/auth_repository.dart';

@lazySingleton
class AuthCubit extends Cubit<BaseState<AuthModel>> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(const BaseState.initial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controllerEmail=TextEditingController();
  TextEditingController controllerPassword=TextEditingController();

  User? user;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(const BaseState.loading());
    final result = await _authRepository.signIn(
      email: email,
      password: password,
    );

    result.fold((l) {
      showToast(message: l.statusMessage);
      emit(BaseState.error(l));
    }, (result) {
      emit(BaseState.loaded(result));
    });
  }

  Future<void> profile() async {
    emit(const BaseState.loading());
    final result = await _authRepository.profile();
    result.fold((l) {
      showToast(message: l.statusMessage);
      emit(BaseState.error(l));
    }, (result) {
      emit(BaseState.loaded(AuthModel(user: result)));
    });
  }

  String? getToken() {
    final token = getIt<SharedPreferences>().getString(Constants.tokenKey);
    return token;
  }

  String? getRefreshToken() {
    final token =
        getIt<SharedPreferences>().getString(Constants.refreshTokenKey);
    return token;
  }
}
