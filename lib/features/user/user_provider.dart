import 'dart:async';

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

  Timer? _debounceTimer;

  String? _name;
  String? get name => _name;
  set name(String? value) {
    _name = value;
    notifyListeners();
    fetchWithDebounce();
  }

  void fetchWithDebounce() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      fetchUsers();
    });
  }

  Future<void> fetchUsers() async {
    _state = Result.loading();
    notifyListeners();
    (await _userUseCase.execute(name)).fold(
      (failure) => _state = Result.failed(failure.message),
      (users) => _state = Result.success(users),
    );
    notifyListeners();
  }
}
