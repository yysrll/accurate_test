import 'dart:async';

import 'package:accurate_test/common/result.dart';
import 'package:accurate_test/core/domain/model/city_model.dart';
import 'package:accurate_test/core/domain/model/user_model.dart';
import 'package:accurate_test/core/domain/use_case/user_use_case.dart';
import 'package:flutter/material.dart';

enum Sorting {
  asc,
  desc,
  none,
}

class UserProvider extends ChangeNotifier {
  final UserUseCase _userUseCase;

  UserProvider(this._userUseCase) {
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
    (await _userUseCase.execute(UserParamUseCase(
      name: name,
      city: location?.name,
    )))
        .fold(
      (failure) => _state = Result.failed(failure.message),
      (users) {
        _state = Result.success(users);
        sortUsers();
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
    if (_sorting == Sorting.none) return;
    final List<UserModel> users = (_state as Success).data;
    if (_sorting == Sorting.asc) {
      _state = Result.success(users
        ..sort(
          (a, b) => a.name.compareTo(b.name),
        ));
    }
    if (_sorting == Sorting.desc) {
      _state = Result.success(users
        ..sort(
          (a, b) => b.name.compareTo(a.name),
        ));
    }
  }
}
