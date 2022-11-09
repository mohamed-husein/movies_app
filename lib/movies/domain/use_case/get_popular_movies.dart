import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/movies/domain/entities/movies_entities.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetPopularMovies extends BaseUseCase<List<MoviesEntities>,NoParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMovies(this.baseMoviesRepository);

  @override
  Future<Either<Failure,List<MoviesEntities>>> call(NoParameters parameters)async{
    return await baseMoviesRepository.popularMovies();
  }
}