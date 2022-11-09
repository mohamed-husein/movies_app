import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/tv/domain/entities/tv_videos.dart';
import 'package:movies_app/tv/domain/repository/tv_repository.dart';

class GetVideosTvShow extends BaseUseCase<List<Videos>, VideosParameters> {
  final TvRepository tvRepository;

  GetVideosTvShow({required this.tvRepository});

  @override
  Future<Either<Failure, List<Videos>>> call(
      VideosParameters parameters) async {
    return await tvRepository.getVideosTvShow(parameters);
  }
}

class VideosParameters extends Equatable {
  final int tvId;

  const VideosParameters({required this.tvId});

  @override
  List<Object> get props => [tvId];
}
