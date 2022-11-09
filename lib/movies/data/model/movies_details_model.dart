import 'package:movies_app/movies/data/model/genres_model.dart';
import 'package:movies_app/movies/domain/entities/movies_details_entities.dart';

class MoviesDetailsModels extends MoviesDetailsEntities {
  const MoviesDetailsModels({
    required super.id,
    required super.backdropPath,
    required super.overView,
    required super.releaseData,
    required super.runtime,
    required super.title,
    required super.voteAverage,
    required super.genres,
  });

  factory MoviesDetailsModels.fromJson(Map<String, dynamic> json) {
    return MoviesDetailsModels(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      overView: json['overview'],
      releaseData: json['release_date'],
      runtime: json['runtime'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
      genres: List<GenresModel>.from(
        json['genres'].map(
          (e) => GenresModel.fromJson(e),
        ),
      ),
    );
  }
}
