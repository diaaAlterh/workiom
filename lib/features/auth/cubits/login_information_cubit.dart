import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:workiom/core/app_cubit/base_state.dart';
import 'package:workiom/features/auth/models/login_information_model.dart';
import '../../../core/utils/general.dart';
import '../repository/auth_repository.dart';

@lazySingleton
class LoginInformationCubit extends Cubit<BaseState<LoginInformationModel>> {
  final AuthRepository _authRepository;

  LoginInformationCubit(this._authRepository) : super(const BaseState.initial());

  Future<void> getCurrentLoginInformation() async {
    emit(const BaseState.loading());
    final result = await _authRepository.getCurrentLoginInformation();

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
