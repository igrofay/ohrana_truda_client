// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../data/repository/authentication_impl.dart' as _i9;
import '../data/repository/profile_impl.dart' as _i11;
import '../data/repository/token_impl.dart' as _i7;
import '../domain/repository/authentication.dart' as _i8;
import '../domain/repository/profile.dart' as _i10;
import '../domain/repository/token.dart' as _i6;
import '../domain/store/app/core_app.dart' as _i3;
import '../domain/store/session/restore.dart' as _i12;
import 'register_module.dart' as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final regModule = _$RegModule();
  gh.singleton<_i3.CoreApp>(_i3.CoreApp());
  gh.singleton<_i4.Dio>(regModule.getDio());
  await gh.factoryAsync<_i5.SharedPreferences>(() => regModule.prefs,
      preResolve: true);
  gh.singleton<_i6.TokenRepository>(
      _i7.TokenRepositoryImpl(get<_i5.SharedPreferences>()));
  gh.factory<_i8.AuthenticationRepository>(
      () => _i9.AuthenticationRepositoryImpl(get<_i4.Dio>()));
  gh.factory<_i10.ProfileRepository>(() =>
      _i11.ProfileRepositoryImpl(get<_i4.Dio>(), get<_i6.TokenRepository>()));
  gh.singleton<_i12.Restore>(
      _i12.Restore(get<_i6.TokenRepository>(), get<_i3.CoreApp>()));
  return get;
}

class _$RegModule extends _i13.RegModule {}
