part of 'city_bloc.dart';

sealed class CityEvent extends Equatable {
  const CityEvent();

  @override
  List<Object?> get props => [];
}

class CityFetched extends CityEvent {
  const CityFetched();

  @override
  List<Object?> get props => [];
}

class CitySearched extends CityEvent {
  const CitySearched(this.name);

  final String name;

  @override
  List<Object?> get props => [name];
}
