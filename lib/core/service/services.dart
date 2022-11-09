import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movies_app/core/network/network_info.dart';
import 'package:movies_app/movies/data/data_source/movies_local_datasource.dart';
import 'package:movies_app/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/use_case/get_movies_details.dart';
import 'package:movies_app/movies/domain/use_case/get_now_playing.dart';
import 'package:movies_app/movies/domain/use_case/get_popular_movies.dart';
import 'package:movies_app/movies/domain/use_case/get_recommendation_movies.dart';
import 'package:movies_app/movies/domain/use_case/get_top_rated_movies.dart';
import 'package:movies_app/movies/domain/use_case/get_youtube_video.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_details_bloc.dart';
import 'package:movies_app/tv/data/data_source/tv_remote_datasource.dart';
import 'package:movies_app/tv/data/repository/tv_repository_impl.dart';
import 'package:movies_app/tv/domain/repository/tv_repository.dart';
import 'package:movies_app/tv/domain/use_case/episode_tv_use_case.dart';
import 'package:movies_app/tv/domain/use_case/on_the_air_use_case.dart';
import 'package:movies_app/tv/domain/use_case/popular_tv_use_case.dart';
import 'package:movies_app/tv/domain/use_case/recommendations_tv_use_case.dart';
import 'package:movies_app/tv/domain/use_case/top_rated_tv_use_case.dart';
import 'package:movies_app/tv/domain/use_case/tv_details_use_case.dart';
import 'package:movies_app/tv/domain/use_case/videos_tv_use_case.dart';
import 'package:movies_app/tv/presentation/controller/tv_details_bloc.dart';
import 'package:movies_app/tv/presentation/controller/tv_show_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    sl.registerLazySingleton<BaseMoviesRemoteDateSource>(
        () => MoviesRemoteDateSource());
    sl.registerLazySingleton<MoviesLocalDatasource>(
        () => MoviesLocalDatasourceImpl(sharedPreferences: sl()));
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl(), sl(), sl()));
    sl.registerLazySingleton<NetworkInfo>(
        () => NetworkChecker(connectionChecker: sl()));

    sl.registerLazySingleton(() => GetNowPlaying(sl()));
    sl.registerLazySingleton(() => GetPopularMovies(sl()));
    sl.registerLazySingleton(() => GetTopRatedMovies(sl()));
    sl.registerLazySingleton(() => GetMoviesDetails(sl()));
    sl.registerLazySingleton(() => GetRecommendationMovies(sl()));
    sl.registerLazySingleton(() => GetYoutubeVideo(sl()));
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);

    sl.registerLazySingleton(() => InternetConnectionChecker());

    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MoviesDetailsBloc(sl(), sl(), sl()));

    /// Tv Services Locator
    ///  Use Case
    sl.registerLazySingleton(() => GetOnTheAirTvShow(tvRepository: sl()));
    sl.registerLazySingleton(() => GetPopularTvUseCase(tvRepository: sl()));
    sl.registerLazySingleton(() => GetTopRatedTvUseCase(tvRepository: sl()));
    sl.registerLazySingleton(() => GetDetailsTvShow(tvRepository: sl()));
    sl.registerLazySingleton(
        () => GetRecommendationsTvShow(tvRepository: sl()));
    sl.registerLazySingleton(() => GetVideosTvShow(tvRepository: sl()));
    sl.registerLazySingleton(() => GetEpisodesTvShow(tvRepository: sl()));

    ///  Repository
    sl.registerLazySingleton<TvRepository>(
        () => TvRepositoryImpl(tvRemoteDataSource: sl()));

    ///  Datasource
    sl.registerLazySingleton<TvRemoteDataSource>(
        () => TvRemoteDataSourceImpl());

    /// Bloc
    sl.registerFactory(() => TvShowBloc(
        getOnTheAirTvShow: sl(),
        getTopRatedTvUseCase: sl(),
        getPopularTvUseCase: sl()));

    sl.registerFactory(() => TvDetailsBloc(
        getEpisodesTvShow: sl(),
        getVideosTvShow: sl(),
        getRecommendationsTvShow: sl(),
        getDetailsTvShow: sl()));
  }
}
