import 'package:movies_app/movies/domain/entities/recommendation_entities.dart';

class RecommendationModel extends RecommendationEntities {
  const RecommendationModel({required super.id,super.backdropPath});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
        id: json['id'], backdropPath: json['backdrop_path'] ?? "/5PnypKiSj2efSPqThNjTXz8jwOg.jpg");
  }
}
