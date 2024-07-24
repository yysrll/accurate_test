part of 'city_bloc.dart';

enum CityStatus { initial, loading, success, failure }

extension CityStatusExtension on CityStatus {
  bool get isInitial => this == CityStatus.initial;
  bool get isLoading => this == CityStatus.loading;
  bool get isSuccess => this == CityStatus.success;
  bool get isFailure => this == CityStatus.failure;
}

class CityState extends Equatable {
  const CityState({
    this.status = CityStatus.initial,
    this.temp = const <CityModel>[],
    this.cities = const <CityModel>[],
    this.name,
    this.message,
  });

  final CityStatus status;
  final List<CityModel> temp;
  final List<CityModel> cities;
  final String? name;
  final String? message;

  CityState copyWith({
    CityStatus? status,
    List<CityModel>? temp,
    List<CityModel>? cities,
    String? name,
    String? message,
  }) {
    return CityState(
      status: status ?? this.status,
      temp: temp ?? this.temp,
      cities: cities ?? this.cities,
      name: name ?? this.name,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, temp, cities, name, message];
}
