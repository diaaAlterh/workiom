// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:workiom/core/app_cubit/theme_cubit.dart' as _i639;
import 'package:workiom/core/di/app_module.dart' as _i727;
import 'package:workiom/features/auth/cubits/auth_cubit.dart' as _i71;
import 'package:workiom/features/auth/cubits/editions_cubit.dart' as _i362;
import 'package:workiom/features/auth/cubits/login_information_cubit.dart'
    as _i356;
import 'package:workiom/features/auth/cubits/password_complexity_cubit.dart'
    as _i219;
import 'package:workiom/features/auth/cubits/tenant_available_cubit.dart'
    as _i146;
import 'package:workiom/features/auth/repository/auth_repository.dart' as _i51;
import 'package:workiom/features/auth/services/auth_services.dart' as _i742;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i639.ThemeCubit>(() => _i639.ThemeCubit());
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i742.AuthServices>(
        () => _i742.AuthServices(gh<_i361.Dio>()));
    gh.singleton<_i51.AuthRepository>(
        () => _i51.AuthRepository(gh<_i742.AuthServices>()));
    gh.lazySingleton<_i71.AuthCubit>(
        () => _i71.AuthCubit(gh<_i51.AuthRepository>()));
    gh.lazySingleton<_i356.LoginInformationCubit>(
        () => _i356.LoginInformationCubit(gh<_i51.AuthRepository>()));
    gh.lazySingleton<_i362.EditionsCubit>(
        () => _i362.EditionsCubit(gh<_i51.AuthRepository>()));
    gh.lazySingleton<_i219.PasswordComplexityCubit>(
        () => _i219.PasswordComplexityCubit(gh<_i51.AuthRepository>()));
    gh.lazySingleton<_i146.TenantAvailableCubit>(
        () => _i146.TenantAvailableCubit(gh<_i51.AuthRepository>()));
    return this;
  }
}

class _$AppModule extends _i727.AppModule {}
