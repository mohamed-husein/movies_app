import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/network/network_info.dart';
import 'package:movies_app/movies/data/data_source/movies_local_datasource.dart';
import 'package:movies_app/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies_app/movies/domain/entities/movies_details_entities.dart';
import 'package:movies_app/movies/domain/entities/movies_entities.dart';
import 'package:movies_app/movies/domain/entities/recommendation_entities.dart';
import 'package:movies_app/movies/domain/entities/video_entities.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/use_case/get_movies_details.dart';
import 'package:movies_app/movies/domain/use_case/get_recommendation_movies.dart';
import 'package:movies_app/movies/domain/use_case/get_youtube_video.dart';


class MoviesRepository extends BaseMoviesRepository{

  final BaseMoviesRemoteDateSource baseMoviesRemoteDateSource;
  final MoviesLocalDatasource moviesLocalDatasource;
  final NetworkInfo networkInfo;

  MoviesRepository(this.baseMoviesRemoteDateSource,this.moviesLocalDatasource,this.networkInfo);
  @override
  Future<Either<Failure,List<MoviesEntities>>> nowPlayingMovies()async {

   if(await networkInfo.isConnected)
   {
     try
     {
       final nowPlayingMoviesResult= await baseMoviesRemoteDateSource.nowPlaying();
       moviesLocalDatasource.cacheMovies(nowPlayingMoviesResult);
       return Right(nowPlayingMoviesResult);
     }
     on ServerException catch(failure)
     {
       return Left(ServerFailure(failure.errorMessageModel.statusMessage));
     }
   }
   else
   {
     try
     {
       final localNowPlayingMovies=await moviesLocalDatasource.getCached();
       return Right(localNowPlayingMovies);
     }
     on EmptyCacheFailure
     {
       throw const Left(EmptyCacheFailure);
     }
   }
  }

  @override
  Future<Either<Failure,List<MoviesEntities>>> popularMovies()async {

    if(await networkInfo.isConnected)
    {
      try
      {
        final popularMoviesResult= await baseMoviesRemoteDateSource.popularMovies();
        moviesLocalDatasource.cacheMovies(popularMoviesResult);
        return Right(popularMoviesResult);
      }
      on ServerException catch(failure)
      {
        return Left(ServerFailure(failure.errorMessageModel.statusMessage));
      }
    }
    else
    {
      try
      {
        final localPopularMovies=await moviesLocalDatasource.getCached();
        return Right(localPopularMovies);
      }
      on EmptyCacheFailure
      {
        throw const Left(EmptyCacheFailure);
      }
    }

  }

  @override
  Future<Either<Failure,List<MoviesEntities>>> topRatedMovies()async {

    if(await networkInfo.isConnected)
    {
      try
      {
        final result= await baseMoviesRemoteDateSource.topRatedMovies();
        moviesLocalDatasource.cacheMovies(result);
        return Right(result);
      }
      on ServerException catch(failure)
      {
        return Left(ServerFailure(failure.errorMessageModel.statusMessage));
      }
    }
    else
    {
      try
      {
        final localTopRatedMovies=await moviesLocalDatasource.getCached();
        return Right(localTopRatedMovies);
      }
      on EmptyCacheFailure
      {
        throw const Left(EmptyCacheFailure);
      }
    }
  }



  @override
  Future<Either<Failure, MoviesDetailsEntities>> moviesDetails(MoviesDetailsParameters parameters)async {
    final result= await baseMoviesRemoteDateSource.moviesDetails(parameters);
    try
    {
      return Right(result);
    }
    on ServerException catch(failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationEntities>>> recommendationMovies(RecommendationParameters parameters)async {
    final result= await baseMoviesRemoteDateSource.recommendationMovies(parameters);
    try
    {
      return Right(result);
    }
    on ServerException catch(failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<VideosEntities>>> youtubeVideo(YoutubeVideoParameters parameters)async {
    final result= await baseMoviesRemoteDateSource.youtubeVideo(parameters);
    try
    {
      return Right(result);
    }
    on ServerException catch(failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}