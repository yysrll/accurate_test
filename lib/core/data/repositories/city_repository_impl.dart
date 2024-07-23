import 'package:accurate_test/core/data/data_sources/city_remote_data_source.dart';
import 'package:accurate_test/core/domain/model/city_model.dart';
import 'package:accurate_test/core/domain/repositories/city_repository.dart';
import 'package:accurate_test/network/failure/failure.dart';
import 'package:accurate_test/network/handler/error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CityRepository)
class CityRepositoryImpl implements CityRepository {
  final CityRemoteDataSource _remote;

  CityRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, List<CityModel>>> fetchCities() async {
    try {
      final response = await _remote.fetchCities();
      return Right(response.map((city) => city.toModel()).toList());
    } catch (e) {
      return Left(ErrorHandler.handler(e).failure);
    }
  }
}
