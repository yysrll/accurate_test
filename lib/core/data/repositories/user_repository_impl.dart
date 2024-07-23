import 'dart:developer';

import 'package:accurate_test/core/data/data_sources/user_remote_data_source.dart';
import 'package:accurate_test/core/domain/model/user_model.dart';
import 'package:accurate_test/core/domain/repositories/user_repository.dart';
import 'package:accurate_test/network/failure/failure.dart';
import 'package:accurate_test/network/handler/error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remote;

  UserRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, List<UserModel>>> fetchUsers({String? name}) async {
    try {
      final response = await _remote.fetchUsers(name: name);
      return Right(response.map((user) => user.toModel()).toList());
    } catch (e) {
      log('errors: $e');
      return Left(ErrorHandler.handler(e).failure);
    }
  }
}
