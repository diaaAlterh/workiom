import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:workiom/core/app_cubit/base_state.dart';
import 'package:workiom/features/auth/models/editions_model.dart';
import '../../../core/utils/general.dart';
import '../repository/auth_repository.dart';

@lazySingleton
class EditionsCubit extends Cubit<BaseState<EditionsModel>> {
  final AuthRepository _authRepository;

  EditionsCubit(this._authRepository) : super(const BaseState.initial()) {
    getEditions();
  }

  List<EditionsWithFeatures> editions = [];

  Future<void> getEditions() async {
    emit(const BaseState.loading());
    final result = await _authRepository.getEditions();

    result.fold(
      (l) {
        showToast(message: l.statusMessage);
        emit(BaseState.error(l));
      },
      (data) {
        editions = data.result?.editionsWithFeatures ?? [];
        emit(BaseState.loaded(data));
      },
    );
  }
}
