import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/movies/domain/entities/recommendation_entities.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetRecommendationMovies extends BaseUseCase<List<RecommendationEntities>,RecommendationParameters>
{

  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationMovies(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<RecommendationEntities>>> call(RecommendationParameters parameters)async {
    return await baseMoviesRepository.recommendationMovies(parameters);
  }

}

class RecommendationParameters extends Equatable
{
  final int moviesId;

  const RecommendationParameters({required this.moviesId});

  @override
  List<Object?> get props => [moviesId];
}