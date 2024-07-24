import 'package:accurate_test/core/domain/model/city_model.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CityFilter {
  List<CityModel> filter(List<CityModel> cities, String? query) {
    if (query == null || query.isEmpty) {
      return cities;
    }
    return cities.where((city) => city.name.toLowerCase().contains(query.toLowerCase())).toList();
  }
}
