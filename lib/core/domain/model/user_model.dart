import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.city,
  });

  final String id;
  final String name;
  final String address;
  final String email;
  final String phoneNumber;
  final String city;

  String avatar() {
    late String params;
    String name = this.name;
    String address = this.address;

    if (name.trim().isEmpty) {
      name = 'Unknown';
    }
    if (address.trim().isEmpty) {
      address = 'Unknown';
    }

    params = '$name $address';
    return 'https://ui-avatars.com/api/?name=$params';
  }

  @override
  List<Object?> get props => [id, name, address, email, phoneNumber, city];
}
