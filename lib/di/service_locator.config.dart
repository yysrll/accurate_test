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

import '../core/data/data_sources/city_remote_data_source.dart' as _i9;
import '../core/data/data_sources/user_remote_data_source.dart' as _i10;
import '../core/data/repositories/city_repository_impl.dart' as _i16;
import '../core/data/repositories/user_repository_impl.dart' as _i12;
import '../core/domain/repositories/city_repository.dart' as _i15;
import '../core/domain/repositories/user_repository.dart' as _i11;
import '../core/domain/use_case/city_use_case.dart' as _i17;
import '../core/domain/use_case/create_user_use_case.dart' as _i14;
import '../core/domain/use_case/user_use_case.dart' as _i13;
import '../features/city/utils/city_filter.dart' as _i6;
import '../features/user/utils/debounce.dart' as _i5;
import '../features/user/utils/user_sorter.dart' as _i4;
import '../network/api_client.dart' as _i7;
import '../network/dio_client.dart' as _i8;
import 'register_module.dart' as _i18;

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
    gh.factory<_i6.CityFilter>(() => _i6.CityFilter());
    gh.lazySingleton<_i7.ApiClient>(() => _i8.DioClient(dio: gh<_i3.Dio>()));
    gh.lazySingleton<_i9.CityRemoteDataSource>(
        () => _i9.CityRemoteDataSourceImpl(client: gh<_i7.ApiClient>()));
    gh.lazySingleton<_i10.UserRemoteDataSource>(
        () => _i10.UserRemoteDataSourceImpl(client: gh<_i7.ApiClient>()));
    gh.lazySingleton<_i11.UserRepository>(
        () => _i12.UserRepositoryImpl(gh<_i10.UserRemoteDataSource>()));
    gh.factory<_i13.UserUseCase>(
        () => _i13.UserUseCase(gh<_i11.UserRepository>()));
    gh.factory<_i14.CreateUserUseCase>(
        () => _i14.CreateUserUseCase(gh<_i11.UserRepository>()));
    gh.lazySingleton<_i15.CityRepository>(
        () => _i16.CityRepositoryImpl(gh<_i9.CityRemoteDataSource>()));
    gh.factory<_i17.CityUseCase>(
        () => _i17.CityUseCase(gh<_i15.CityRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i18.RegisterModule {}
