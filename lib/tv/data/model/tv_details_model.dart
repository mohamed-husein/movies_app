import 'package:movies_app/tv/data/model/genres_model.dart';
import 'package:movies_app/tv/data/model/seasons_model.dart';
import 'package:movies_app/tv/domain/entities/tv_details.dart';

class TvDetailsModel extends TvDetails {
  const TvDetailsModel({
    required super.id,
    required super.backdropPath,
    required super.name,
    required super.overview,
    required super.voteAverage,
    required super.firstAirDate,
    required super.genres,
    required super.season,
    required super.runtime,
  });

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) {
    return TvDetailsModel(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      name: json['name'],
      overview: json['overview'],
      voteAverage: json['vote_average'],
      runtime: json['runtime'] ?? 0,
      firstAirDate: json['first_air_date'],
      genres: List<GenresTvModel>.from((json['genres'] as List).map(
        (e) => GenresTvModel.fromJson(e),
      )),
      season: List<SeasonsModel>.from(
          json['seasons'].map((e) => SeasonsModel.fromJson(e))),
    );
  }
}
