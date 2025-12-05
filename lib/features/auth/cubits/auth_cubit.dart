import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workiom/features/auth/cubits/auth_state.dart';
import 'package:workiom/features/auth/cubits/editions_cubit.dart';
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

  final editionsCubit = getIt<EditionsCubit>();

  Future<void> authenticate() async {
    emit(const AuthState.loading());
    final result = await _authRepository.authenticate(
      request: AuthenticateRequest(
        userNameOrEmailAddress: controllerEmail.text,
        password: controllerPassword.text,
        tenantName: controllerWorkspace.text,
        rememberClient: false,
        singleSignIn: false,
        ianaTimeZone: (await FlutterTimezone.getLocalTimezone()).identifier,
      ),
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
      request: RegisterTenantRequest(
        adminEmailAddress: controllerEmail.text,
        adminFirstName: controllerFirstName.text,
        adminLastName: controllerLastName.text,
        adminPassword: controllerPassword.text,
        name: controllerWorkspace.text,
        tenancyName: controllerWorkspace.text,
        editionId: editionsCubit.editions.firstOrNull?.edition?.id.toString(),
      ),
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

  logout() async {
    await getIt<SharedPreferences>().clear();

    emit(const AuthState.initial());
  }
}
