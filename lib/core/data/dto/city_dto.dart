import 'package:accurate_test/core/domain/model/city_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_dto.g.dart';

@JsonSerializable()
class CityDTO {
  final String id;
  final String name;

  CityDTO({
    this.id = '',
    this.name = '',
  });

  factory CityDTO.fromJson(Map<String, dynamic> json) =>
      _$CityDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CityDTOToJson(this);

  CityModel toModel() => CityModel(
        id: id,
        name: name,
      );
}
