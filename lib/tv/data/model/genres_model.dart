import 'package:movies_app/tv/domain/entities/genres.dart';

class GenresTvModel extends Genres {
  const GenresTvModel({
    required super.id,
    required super.name,
  });

  factory GenresTvModel.fromJson(Map<String, dynamic> json) {
    return GenresTvModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
