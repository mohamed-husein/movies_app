import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/movies/domain/entities/movies_details_entities.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetMoviesDetails extends BaseUseCase<MoviesDetailsEntities,MoviesDetailsParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesDetails(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MoviesDetailsEntities>> call(MoviesDetailsParameters parameters) async{
    return await baseMoviesRepository.moviesDetails(parameters);
  }
}

class MoviesDetailsParameters extends Equatable
{
  final int moviesId;

  const MoviesDetailsParameters({required this.moviesId});

  @override
  List<Object?> get props => [moviesId];
}