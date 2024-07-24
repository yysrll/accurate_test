import 'package:accurate_test/core/data/dto/user_dto.dart';
import 'package:accurate_test/network/api_client.dart';
import 'package:injectable/injectable.dart';

abstract class UserRemoteDataSource {
  Future<List<UserDTO>> fetchUsers({
    String? name,
    String? city,
  });
  Future<UserDTO> createUser({
    required UserDTO user,
  });
}

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiClient client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserDTO>> fetchUsers({
    String? name,
    String? city,
  }) async {
    final List<dynamic> response = await client.get(
      '/user',
      queryParameters: {
        'name': name,
        'city': city,
      },
    );
    return response.map((json) => UserDTO.fromJson(json)).toList();
  }

  @override
  Future<UserDTO> createUser({
    required UserDTO user,
  }) async {
    final response = await client.post(
      '/user',
      data: user.toJson(),
    );

    return UserDTO.fromJson(response);
  }
}
