import 'package:accurate_test/common/result.dart';
import 'package:accurate_test/core/domain/model/user_model.dart';
import 'package:accurate_test/core/domain/use_case/create_user_use_case.dart';
import 'package:flutter/material.dart';

class CreateUserProvider extends ChangeNotifier {
  final CreateUserUseCase _createUserUseCase;

  CreateUserProvider(this._createUserUseCase);

  Result<UserModel> _state = Result.initial();
  Result<UserModel> get state => _state;
  
  Future<void> createUser(UserModel user) async {
    _state = Result.loading();
    notifyListeners();
    (await _createUserUseCase.execute(user)).fold(
      (failure) => _state = Result.failed(failure.message),
      (user) {
        _state = Result.success(user);
      },
    );
    notifyListeners();
  }
}
