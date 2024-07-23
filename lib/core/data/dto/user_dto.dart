import 'package:accurate_test/core/domain/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDTO {
  final String id;
  final String name;
  final String address;
  final String email;
  final String phoneNumber;
  final String city;

  UserDTO({
    this.id = '',
    this.name = 'Unknown',
    this.address = 'Unknown',
    this.email = '-',
    this.phoneNumber = '-',
    this.city = 'Unknown',
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

  UserModel toModel() => UserModel(
        id: id,
        name: name,
        address: address,
        email: email,
        phoneNumber: phoneNumber,
        city: city,
      );
}
