import 'package:accurate_test/common/base_use_case.dart';
import 'package:accurate_test/core/domain/model/user_model.dart';
import 'package:accurate_test/core/domain/repositories/user_repository.dart';
import 'package:accurate_test/network/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CreateUserUseCase implements BaseUseCase<UserModel, UserModel> {
  final UserRepository _repository;

  CreateUserUseCase(this._repository);

  @override
  Future<Either<Failure, UserModel>> execute(
    UserModel param,
  ) async {
    return await _repository.createUser(user: param);
  }
}
