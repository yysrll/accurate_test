import 'package:accurate_test/core/domain/model/user_model.dart';
import 'package:accurate_test/core/domain/use_case/create_user_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_user_event.dart';
part 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  CreateUserBloc(this._createUserUseCase) : super(CreateUserInitial()) {
    on<CreatedUser>(_onCreatedUser);
  }

  final CreateUserUseCase _createUserUseCase;

  Future<void> _onCreatedUser(
    CreatedUser event,
    Emitter<CreateUserState> emit,
  ) async {
    emit(CreateUserLoading());
    final result = await _createUserUseCase.execute(event.user);
    result.fold(
      (failure) => emit(CreateUserError(failure.message)),
      (user) => emit(CreateUserSuccess(user)),
    );
  }
}
