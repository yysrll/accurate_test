part of 'user_bloc.dart';

enum UserStatus { initial, loading, success, failure }

extension UserStatusExtension on UserStatus {
  bool get isInitial => this == UserStatus.initial;
  bool get isLoading => this == UserStatus.loading;
  bool get isSuccess => this == UserStatus.success;
  bool get isFailure => this == UserStatus.failure;
}

class UserState extends Equatable {
  const UserState({
    this.status = UserStatus.initial,
    this.temp = const <UserModel>[],
    this.users = const <UserModel>[],
    this.sort = Sorting.none,
    this.name,
    this.city,
    this.message,
  });

  final UserStatus status;
  final List<UserModel> temp;
  final List<UserModel> users;
  final Sorting sort;
  final String? name;
  final String? city;
  final String? message;

  UserState copyWith({
    UserStatus? status,
    List<UserModel>? temp,
    List<UserModel>? users,
    Sorting? sort,
    String? name,
    String? city,
    String? message,
  }) {
    return UserState(
      status: status ?? this.status,
      temp: temp ?? this.temp,
      users: users ?? this.users,
      sort: sort ?? this.sort,
      name: name ?? this.name,
      city: city ?? this.city,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, temp, users, sort, name, city, message];
}
