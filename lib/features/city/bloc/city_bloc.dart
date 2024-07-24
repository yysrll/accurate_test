import 'package:accurate_test/core/domain/model/city_model.dart';
import 'package:accurate_test/core/domain/use_case/city_use_case.dart';
import 'package:accurate_test/features/city/utils/city_filter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc(
    this._cityUseCase,
    this._cityFilter,
  ) : super(const CityState()) {
    on<CityFetched>(_onCityFetched);
    on<CitySearched>(_onCitySearched);
  }

  final CityUseCase _cityUseCase;
  final CityFilter _cityFilter;

  Future<void> _onCityFetched(
    CityFetched event,
    Emitter<CityState> emit,
  ) async {
    emit(state.copyWith(
      status: CityStatus.loading,
    ));
    final result = await _cityUseCase.execute(null);
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: CityStatus.failure,
          message: failure.message,
        ),
      ),
      (cities) {
        emit(
          state.copyWith(
            status: CityStatus.success,
            temp: cities,
            cities: cities,
          ),
        );
      },
    );
  }

  Future<void> _onCitySearched(
    CitySearched event,
    Emitter<CityState> emit,
  ) async {
    final filteredCities = _cityFilter.filter(
      List.from(state.temp),
      event.name,
    );
    emit(state.copyWith(
      name: event.name,
      cities: filteredCities,
    ));
  }
}
