import 'package:accurate_test/common/base_use_case.dart';
import 'package:accurate_test/core/domain/model/user_model.dart';
import 'package:accurate_test/core/domain/repositories/user_repository.dart';
import 'package:accurate_test/network/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

class UserParamUseCase {
  final String? name;
  final String? city;

  UserParamUseCase({
    this.name,
    this.city,
  });
}

@Injectable()
class UserUseCase implements BaseUseCase<UserParamUseCase, List<UserModel>> {
  final UserRepository _repository;

  UserUseCase(this._repository);

  @override
  Future<Either<Failure, List<UserModel>>> execute(
    UserParamUseCase? param,
  ) async {
    return await _repository.fetchUsers(
      name: param?.name,
      city: param?.city,
    );
  }
}
