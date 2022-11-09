import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/movies/domain/entities/video_entities.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetYoutubeVideo extends BaseUseCase<List<VideosEntities>,YoutubeVideoParameters>
{
  final BaseMoviesRepository baseMoviesRepository;

  GetYoutubeVideo(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<VideosEntities>>> call(YoutubeVideoParameters parameters)async {
    return await baseMoviesRepository.youtubeVideo(parameters);
  }
}

class YoutubeVideoParameters extends Equatable
{
  final int moviesId;

  const YoutubeVideoParameters({required this.moviesId});

  @override
  List<Object?> get props => [moviesId];
}