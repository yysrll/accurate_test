// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? 'Unknown',
      address: json['address'] as String? ?? 'Unknown',
      email: json['email'] as String? ?? '-',
      phoneNumber: json['phoneNumber'] as String? ?? '-',
      city: json['city'] as String? ?? 'Unknown',
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'city': instance.city,
    };
