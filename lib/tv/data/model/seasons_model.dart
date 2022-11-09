import 'package:movies_app/tv/domain/entities/seasons.dart';

class SeasonsModel extends Season {
  const SeasonsModel({
    required super.id,
    required super.name,
  });

  factory SeasonsModel.fromJson(Map<String, dynamic> json) {
    return SeasonsModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
