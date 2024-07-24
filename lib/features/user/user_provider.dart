import 'dart:async';

import 'package:accurate_test/common/result.dart';
import 'package:accurate_test/core/domain/model/city_model.dart';
import 'package:accurate_test/core/domain/model/user_model.dart';
import 'package:accurate_test/core/domain/use_case/user_use_case.dart';
import 'package:accurate_test/features/user/utils/debounce.dart';
import 'package:accurate_test/features/user/utils/user_sorter.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final UserUseCase _userUseCase;
  final UserSorter _userSorter;
  final Debounce _debounce;

  UserProvider(
    this._userUseCase,
    this._userSorter,
    this._debounce,
  ) {
    fetchUsers();
  }

  Result<List<UserModel>> _state = Result.initial();
  Result<List<UserModel>> get state => _state;

  CityModel? _location;
  CityModel? get location => _location;
  set location(CityModel? value) {
    _location = value;
    notifyListeners();
    fetchUsers();
  }

  String? _name;
  String? get name => _name;
  set name(String? value) {
    _name = value;
    notifyListeners();
    _debounce(() {
      fetchUsers();
    });
  }

  Future<void> fetchUsers() async {
    _state = Result.loading();
    notifyListeners();
    (await _userUseCase.execute(UserParamUseCase(
      name: name,
      city: location?.name,
    )))
        .fold(
      (failure) => _state = Result.failed(failure.message),
      (users) {
        final sortedUsers = _userSorter.sort(users, _sorting);
        _state = Result.success(sortedUsers);
      },
    );
    notifyListeners();
  }

  Sorting _sorting = Sorting.none;
  Sorting get sorting => _sorting;
  void changeSorting() {
    _sorting = _sorting == Sorting.asc ? Sorting.desc : Sorting.asc;
    notifyListeners();
    sortUsers();
  }

  void sortUsers() {
    if (_state is Success<List<UserModel>>) {
      final users = (_state as Success<List<UserModel>>).data;
      final sortedUsers = _userSorter.sort(users, _sorting);
      _state = Result.success(sortedUsers);
      notifyListeners();
    }
  }
}
