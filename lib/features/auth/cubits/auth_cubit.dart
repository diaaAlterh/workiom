import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workiom/features/auth/cubits/auth_state.dart';
import 'package:workiom/features/auth/models/requests/authenticate_request.dart';
import 'package:workiom/features/auth/models/requests/register_tenant_request.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/utils/constants.dart';
import '../../../core/utils/general.dart';
import '../repository/auth_repository.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(const AuthState.initial());

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerWorkspace = TextEditingController();
  TextEditingController controllerFirstName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();

  Future<void> authenticate() async {
    emit(const AuthState.loading());
    final result = await _authRepository.authenticate(
      request: AuthenticateRequest(),
    );

    result.fold(
      (l) {
        showToast(message: l.statusMessage);
        emit(AuthState.error(l));
      },
      (result) {
        emit(AuthState.authenticate(result));
      },
    );
  }

  Future<void> registerTenant() async {
    emit(const AuthState.loading());
    final result = await _authRepository.registerTenant(
      request: RegisterTenantRequest(),
    );
    result.fold(
      (l) {
        showToast(message: l.statusMessage);
        emit(AuthState.error(l));
      },
      (result) {
        emit(AuthState.register(result));
      },
    );
  }

  String? getToken() {
    final token = getIt<SharedPreferences>().getString(Constants.tokenKey);
    return token;
  }

  String? getRefreshToken() {
    final token = getIt<SharedPreferences>().getString(
      Constants.refreshTokenKey,
    );
    return token;
  }
}
