part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class UserFetched extends UserEvent {
  const UserFetched({this.param});

  final UserParamUseCase? param;

  @override
  List<Object?> get props => [param];
}

class UserSorted extends UserEvent {
  const UserSorted();

  @override
  List<Object?> get props => [];
}

class UserSearched extends UserEvent {
  const UserSearched(this.name);

  final String name;

  @override
  List<Object?> get props => [name];
}

class UserCreated extends UserEvent {
  const UserCreated(this.user);

  final UserModel user;

  @override
  List<Object?> get props => [user];
}
