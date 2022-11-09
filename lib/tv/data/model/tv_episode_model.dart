import 'package:movies_app/tv/domain/entities/tv_episode.dart';

class TvEpisodeModel extends TvEpisodes {
  const TvEpisodeModel({
    required super.id,
    required super.stillPath,
    required super.name,
    required super.overview,
    required super.firstAirDate,
  });

  factory TvEpisodeModel.fromJson(Map<String, dynamic> json) {
    return TvEpisodeModel(
      id: json['id'],
      stillPath: json['still_path'],
      name: json['name'],
      overview: json['overview'],
      firstAirDate: json['air_date'],
    );
  }
}
