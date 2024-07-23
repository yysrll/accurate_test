import 'package:accurate_test/core/domain/model/city_model.dart';
import 'package:accurate_test/network/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CityRepository {
  Future<Either<Failure, List<CityModel>>> fetchCities();
}
