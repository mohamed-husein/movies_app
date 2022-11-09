import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movies_details_entities.dart';
import 'package:movies_app/movies/domain/entities/movies_entities.dart';
import 'package:movies_app/movies/domain/entities/recommendation_entities.dart';
import 'package:movies_app/movies/domain/entities/video_entities.dart';
import 'package:movies_app/movies/domain/use_case/get_movies_details.dart';
import 'package:movies_app/movies/domain/use_case/get_recommendation_movies.dart';
import 'package:movies_app/movies/domain/use_case/get_youtube_video.dart';

abstract class BaseMoviesRepository
{
  Future<Either<Failure,List<MoviesEntities>>> nowPlayingMovies();
  Future<Either<Failure,List<MoviesEntities>>> popularMovies();
  Future<Either<Failure,List<MoviesEntities>>> topRatedMovies();
  Future<Either<Failure,MoviesDetailsEntities>> moviesDetails(MoviesDetailsParameters parameters);
  Future<Either<Failure,List<RecommendationEntities>>> recommendationMovies(RecommendationParameters parameters);
  Future<Either<Failure,List<VideosEntities>>> youtubeVideo(YoutubeVideoParameters parameters);

}