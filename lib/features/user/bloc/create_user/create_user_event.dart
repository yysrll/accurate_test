part of 'create_user_bloc.dart';

sealed class CreateUserEvent extends Equatable {
  const CreateUserEvent();

  @override
  List<Object?> get props => [];
}
class CreatedUser extends CreateUserEvent {
  const CreatedUser(this.user);

  final UserModel user;

  @override
  List<Object?> get props => [user];
}
