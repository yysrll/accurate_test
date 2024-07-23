import 'package:accurate_test/core/data/dto/city_dto.dart';
import 'package:accurate_test/network/api_client.dart';
import 'package:injectable/injectable.dart';

abstract class CityRemoteDataSource {
  Future<List<CityDTO>> fetchCities();
}

@LazySingleton(as: CityRemoteDataSource)
class CityRemoteDataSourceImpl implements CityRemoteDataSource {
  final ApiClient client;

  CityRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CityDTO>> fetchCities() async {
    final List<dynamic> response = await client.get('/city');
    return response.map((json) => CityDTO.fromJson(json)).toList();
  }
}
