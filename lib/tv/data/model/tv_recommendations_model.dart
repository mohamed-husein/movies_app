import 'package:movies_app/tv/domain/entities/tv_recommendations.dart';

class TvRecommendationsModel extends TvRecommendations {
  const TvRecommendationsModel({
    required super.id,
    required super.posterPath,
  });

  factory TvRecommendationsModel.fromJson(Map<String, dynamic> json) {
    return TvRecommendationsModel(
      id: json['id'],
      posterPath: json['poster_path'],
    );
  }
}
