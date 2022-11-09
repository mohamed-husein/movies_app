import 'package:movies_app/movies/domain/entities/movies_entities.dart';

class MoviesModel extends MoviesEntities {
  const MoviesModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.posterPath,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json)
  {
    return MoviesModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        genreIds: List<int>.from(json['genre_ids'].map((e)=>e)),
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date'],
      posterPath: json['poster_path']
    );
  }

  Map<String,dynamic> toJson()
  {
    return{
      'id':id,
      'title':title,
      'backdrop_path':backdropPath,
      'genre_ids':genreIds,
      'overview':overview,
      'vote_average':voteAverage,
      'release_date':releaseDate,
      'poster_path':posterPath
    };
  }
}
