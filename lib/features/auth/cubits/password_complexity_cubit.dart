import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:workiom/core/app_cubit/base_state.dart';
import 'package:workiom/core/utils/validators.dart';
import 'package:workiom/features/auth/models/password_complexity_model.dart';
import '../../../core/utils/general.dart';
import '../repository/auth_repository.dart';

@lazySingleton
class PasswordComplexityCubit
    extends Cubit<BaseState<List<PasswordRuleResult>>> {
  final AuthRepository _authRepository;

  PasswordComplexityCubit(this._authRepository)
    : super(const BaseState.initial()) {
    getPasswordComplexity();
  }

  Setting? passwordSettings;
  List<PasswordRuleResult> rules=[];

  Future<void> getPasswordComplexity() async {
    emit(const BaseState.loading());
    final result = await _authRepository.getPasswordComplexity();

    result.fold(
      (l) {
        showToast(message: l.statusMessage);
        emit(BaseState.error(l));
      },
      (data) {
        passwordSettings = data.result?.setting;
        validate('s');
      },
    );
  }

  validate(String password) {
    rules = passwordSettings?.validatePassword(password) ?? [];
    emit(BaseState.loaded(rules));
  }
}
