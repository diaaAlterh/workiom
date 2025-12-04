import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workiom/core/app_cubit/base_state.dart';
import 'package:workiom/features/auth/cubits/auth_state.dart';
import 'package:workiom/features/auth/models/login_information_model.dart';
import 'package:workiom/features/auth/models/requests/authenticate_request.dart';
import 'package:workiom/features/auth/models/requests/is_tenant_available_request.dart';
import 'package:workiom/features/auth/models/requests/register_tenant_request.dart';
import 'package:workiom/features/auth/models/tenant_available_model.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/utils/constants.dart';
import '../../../core/utils/general.dart';
import '../repository/auth_repository.dart';

@lazySingleton
class TenantAvailableCubit extends Cubit<BaseState<TenantAvailableModel>> {
  final AuthRepository _authRepository;

  TenantAvailableCubit(this._authRepository) : super(const BaseState.initial());

  Future<void> isTenantAvailable() async {
    emit(const BaseState.loading());
    final result = await _authRepository.isTenantAvailable(
      request: IsTenantAvailableRequest(),
    );

    result.fold(
      (l) {
        showToast(message: l.statusMessage);
        emit(BaseState.error(l));
      },
      (result) {
        emit(BaseState.loaded(result));
      },
    );
  }
}
