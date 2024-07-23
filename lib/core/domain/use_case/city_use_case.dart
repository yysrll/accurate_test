import 'package:accurate_test/common/base_use_case.dart';
import 'package:accurate_test/core/domain/model/city_model.dart';
import 'package:accurate_test/core/domain/repositories/city_repository.dart';
import 'package:accurate_test/network/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CityUseCase implements BaseUseCase<Object, List<CityModel>> {
  final CityRepository _repository;

  CityUseCase(this._repository);

  @override
  Future<Either<Failure, List<CityModel>>> execute(Object? input) async {
    return await _repository.fetchCities();
  }
}
