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

import '../core/data/data_sources/city_remote_data_source.dart' as _i8;
import '../core/data/data_sources/user_remote_data_source.dart' as _i9;
import '../core/data/repositories/city_repository_impl.dart' as _i15;
import '../core/data/repositories/user_repository_impl.dart' as _i11;
import '../core/domain/repositories/city_repository.dart' as _i14;
import '../core/domain/repositories/user_repository.dart' as _i10;
import '../core/domain/use_case/city_use_case.dart' as _i16;
import '../core/domain/use_case/create_user_use_case.dart' as _i13;
import '../core/domain/use_case/user_use_case.dart' as _i12;
import '../features/user/utils/debounce.dart' as _i5;
import '../features/user/utils/user_sorter.dart' as _i4;
import '../network/api_client.dart' as _i6;
import '../network/dio_client.dart' as _i7;
import 'register_module.dart' as _i17;

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
    gh.factory<_i4.UserSorter>(() => _i4.UserSorter());
    gh.factory<_i5.Debounce>(() => _i5.Debounce());
    gh.lazySingleton<_i6.ApiClient>(() => _i7.DioClient(dio: gh<_i3.Dio>()));
    gh.lazySingleton<_i8.CityRemoteDataSource>(
        () => _i8.CityRemoteDataSourceImpl(client: gh<_i6.ApiClient>()));
    gh.lazySingleton<_i9.UserRemoteDataSource>(
        () => _i9.UserRemoteDataSourceImpl(client: gh<_i6.ApiClient>()));
    gh.lazySingleton<_i10.UserRepository>(
        () => _i11.UserRepositoryImpl(gh<_i9.UserRemoteDataSource>()));
    gh.factory<_i12.UserUseCase>(
        () => _i12.UserUseCase(gh<_i10.UserRepository>()));
    gh.factory<_i13.CreateUserUseCase>(
        () => _i13.CreateUserUseCase(gh<_i10.UserRepository>()));
    gh.lazySingleton<_i14.CityRepository>(
        () => _i15.CityRepositoryImpl(gh<_i8.CityRemoteDataSource>()));
    gh.factory<_i16.CityUseCase>(
        () => _i16.CityUseCase(gh<_i14.CityRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i17.RegisterModule {}
