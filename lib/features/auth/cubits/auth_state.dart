import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workiom/features/auth/models/authenticate_model.dart';
import 'package:workiom/features/auth/models/register_tenant_model.dart';
import '../../../../core/core_models/failure.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;

  const factory AuthState.loading() = Loading;

  const factory AuthState.authenticate(AuthenticateModel data) = Authenticate;

  const factory AuthState.register(RegisterTenantModel data) = Register;

  const factory AuthState.error(Failure error) = Error;
}
