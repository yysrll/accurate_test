import 'dart:ffi';

import 'package:accurate_test/common/result.dart';
import 'package:accurate_test/core/domain/model/user_model.dart';
import 'package:accurate_test/core/domain/use_case/user_use_case.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final UserUseCase _userUseCase;

  UserProvider(this._userUseCase) {
    fetchUsers();
  }

  Result<List<UserModel>> _state = Result.initial();
  Result<List<UserModel>> get state => _state;

  Future<void> fetchUsers() async {
    _state = Result.loading();
    notifyListeners();
    (await _userUseCase.execute(Void)).fold(
      (failure) => _state = Result.failed(failure.message),
      (users) => _state = Result.success(users),
    );
    notifyListeners();
  }
}
