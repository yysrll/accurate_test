import 'package:equatable/equatable.dart';

class CityModel extends Equatable {
  const CityModel({required this.id, required this.name});

  final String id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}
