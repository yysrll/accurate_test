import 'dart:ffi';

import 'package:accurate_test/common/result.dart';
import 'package:accurate_test/core/domain/model/city_model.dart';
import 'package:accurate_test/core/domain/use_case/city_use_case.dart';
import 'package:flutter/material.dart';

class CityProvider extends ChangeNotifier {
  final CityUseCase _cityUseCase;

  CityProvider(this._cityUseCase) {
    fetchCities();
  }

  Result<List<CityModel>> _state = Result.initial();
  Result<List<CityModel>> get state => _state;

  List<CityModel> _temp = [];
  String? _city;
  String? get city => _city;
  set city(String? value) {
    _city = value;
    if (_city?.isEmpty ?? true) {
      _state = Result.success(_temp);
    } else {
      _state = Result.success(
        _temp
            .where(
              (element) =>
                  element.name.toLowerCase().contains(_city!.toLowerCase()),
            )
            .toList(),
      );
    }
    notifyListeners();
  }

  Future<void> fetchCities() async {
    _state = Result.loading();
    notifyListeners();
    (await _cityUseCase.execute(Void)).fold(
      (failure) => _state = Result.failed(failure.message),
      (cities) {
        _temp = cities;
        _state = Result.success(cities);
      },
    );
    notifyListeners();
  }
}
