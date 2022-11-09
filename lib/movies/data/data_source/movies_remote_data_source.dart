import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utils/api_constants.dart';
import 'package:movies_app/movies/data/model/movies_details_model.dart';
import 'package:movies_app/movies/data/model/movies_model.dart';
import 'package:movies_app/movies/data/model/recommendation_model.dart';
import 'package:movies_app/movies/data/model/video_model.dart';
import 'package:movies_app/movies/domain/use_case/get_movies_details.dart';
import 'package:movies_app/movies/domain/use_case/get_recommendation_movies.dart';
import 'package:movies_app/movies/domain/use_case/get_youtube_video.dart';

abstract class BaseMoviesRemoteDateSource {
  Future<List<MoviesModel>> nowPlaying();

  Future<List<MoviesModel>> popularMovies();

  Future<List<MoviesModel>> topRatedMovies();

  Future<MoviesDetailsModels> moviesDetails(MoviesDetailsParameters parameters);

  Future<List<RecommendationModel>> recommendationMovies(
      RecommendationParameters parameters);

  Future<List<VideoModel>> youtubeVideo(YoutubeVideoParameters parameters);
}

class MoviesRemoteDateSource implements BaseMoviesRemoteDateSource {
  @override
  Future<List<MoviesModel>> nowPlaying() async {
    final response = await Dio().get(ApiConstants.nowPlayingPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map(
          (e) => MoviesModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> popularMovies() async {
    final response = await Dio().get(ApiConstants.popularPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map(
          (e) => MoviesModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> topRatedMovies() async {
    final response = await Dio().get(ApiConstants.topRatedPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map(
          (e) => MoviesModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MoviesDetailsModels> moviesDetails(
      MoviesDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.moviesId(parameters.moviesId));
    if (response.statusCode == 200) {
      return MoviesDetailsModels.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> recommendationMovies(
      RecommendationParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.recommendation(parameters.moviesId));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        (response.data['results'] as List).map(
          (e) => RecommendationModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<VideoModel>> youtubeVideo(
      YoutubeVideoParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.videoPath(parameters.moviesId));
    if (response.statusCode == 200) {
      return List<VideoModel>.from(
        (response.data['results'] as List).map(
          (e) => VideoModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
