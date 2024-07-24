// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/data/data_sources/city_remote_data_source.dart' as _i6;
import '../core/data/data_sources/user_remote_data_source.dart' as _i7;
import '../core/data/repositories/city_repository_impl.dart' as _i13;
import '../core/data/repositories/user_repository_impl.dart' as _i9;
import '../core/domain/repositories/city_repository.dart' as _i12;
import '../core/domain/repositories/user_repository.dart' as _i8;
import '../core/domain/use_case/city_use_case.dart' as _i14;
import '../core/domain/use_case/create_user_use_case.dart' as _i11;
import '../core/domain/use_case/user_use_case.dart' as _i10;
import '../network/api_client.dart' as _i4;
import '../network/dio_client.dart' as _i5;
import 'register_module.dart' as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i4.ApiClient>(() => _i5.DioClient(dio: gh<_i3.Dio>()));
    gh.lazySingleton<_i6.CityRemoteDataSource>(
        () => _i6.CityRemoteDataSourceImpl(client: gh<_i4.ApiClient>()));
    gh.lazySingleton<_i7.UserRemoteDataSource>(
        () => _i7.UserRemoteDataSourceImpl(client: gh<_i4.ApiClient>()));
    gh.lazySingleton<_i8.UserRepository>(
        () => _i9.UserRepositoryImpl(gh<_i7.UserRemoteDataSource>()));
    gh.factory<_i10.UserUseCase>(
        () => _i10.UserUseCase(gh<_i8.UserRepository>()));
    gh.factory<_i11.CreateUserUseCase>(
        () => _i11.CreateUserUseCase(gh<_i8.UserRepository>()));
    gh.lazySingleton<_i12.CityRepository>(
        () => _i13.CityRepositoryImpl(gh<_i6.CityRemoteDataSource>()));
    gh.factory<_i14.CityUseCase>(
        () => _i14.CityUseCase(gh<_i12.CityRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i15.RegisterModule {}
