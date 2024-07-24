import 'package:accurate_test/core/domain/model/user_model.dart';
import 'package:accurate_test/network/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserModel>>> fetchUsers({
    String? name,
    String? city,
  });

  Future<Either<Failure, UserModel>> createUser({
    required UserModel user,
  });
}
