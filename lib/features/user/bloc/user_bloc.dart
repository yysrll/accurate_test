import 'package:accurate_test/core/domain/model/user_model.dart';
import 'package:accurate_test/core/domain/use_case/user_use_case.dart';
import 'package:accurate_test/features/user/utils/debounce.dart';
import 'package:accurate_test/features/user/utils/user_sorter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(
    this._userUseCase,
    this._userSorter,
    this._debounce,
  ) : super(const UserState()) {
    on<UserFetched>(_onUserFetched);
    on<UserSorted>(_onUserSorted);
    on<UserSearched>(_onUserSearched);
    on<UserCreated>(_onUserCreated);
  }

  final UserUseCase _userUseCase;
  final UserSorter _userSorter;
  final Debounce _debounce;

  Future<void> _onUserFetched(
    UserFetched event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(
      status: UserStatus.loading,
      name: event.param?.name,
      city: event.param?.city,
    ));
    final result = await _userUseCase.execute(UserParamUseCase(
      name: state.name,
      city: state.city,
    ));
    result.fold(
      (failure) => emit(
        state.copyWith(
          status: UserStatus.failure,
          message: failure.message,
        ),
      ),
      (users) {
        final sortedUsers = _userSorter.sort(users, state.sort);
        emit(
          state.copyWith(
            status: UserStatus.success,
            temp: users,
            users: sortedUsers,
          ),
        );
      },
    );
  }

  Future<void> _onUserSorted(
    UserSorted event,
    Emitter<UserState> emit,
  ) async {
    final currentSort = state.sort == Sorting.asc
        ? Sorting.desc
        : state.sort == Sorting.desc
            ? Sorting.none
            : Sorting.asc;
    final sortedUsers = _userSorter.sort(List.from(state.temp), currentSort);
    emit(state.copyWith(
      sort: currentSort,
      users: sortedUsers,
    ));
  }

  Future<void> _onUserSearched(
    UserSearched event,
    Emitter<UserState> emit,
  ) async {
    _debounce.call(() {
      add(UserFetched(param: UserParamUseCase(name: event.name)));
    });
  }

  Future<void> _onUserCreated(
    UserCreated event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(
      temp: [event.user, ...state.temp],
      users: [event.user, ...state.users],
    ));
  }

  @override
  Future<void> close() {
    _debounce.cancel();
    return super.close();
  }
}
