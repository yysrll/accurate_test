part of 'create_user_bloc.dart';

abstract class CreateUserState extends Equatable {
  const CreateUserState();

  @override
  List<Object> get props => [];
}

class CreateUserInitial extends CreateUserState {}
class CreateUserLoading extends CreateUserState {}

class CreateUserSuccess extends CreateUserState {
  final UserModel user;

  const CreateUserSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class CreateUserError extends CreateUserState {
  final String message;

  const CreateUserError(this.message);

  @override
  List<Object> get props => [message];
}