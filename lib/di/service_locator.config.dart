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

import '../core/data/data_sources/user_remote_data_source.dart' as _i6;
import '../core/data/repositories/user_repository_impl.dart' as _i8;
import '../core/domain/repositories/user_repository.dart' as _i7;
import '../core/domain/use_case/user_use_case.dart' as _i9;
import '../network/api_client.dart' as _i4;
import '../network/dio_client.dart' as _i5;
import 'register_module.dart' as _i10;

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
    gh.lazySingleton<_i6.UserRemoteDataSource>(
        () => _i6.UserRemoteDataSourceImpl(client: gh<_i4.ApiClient>()));
    gh.lazySingleton<_i7.UserRepository>(
        () => _i8.UserRepositoryImpl(gh<_i6.UserRemoteDataSource>()));
    gh.factory<_i9.UserUseCase>(
        () => _i9.UserUseCase(gh<_i7.UserRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i10.RegisterModule {}
