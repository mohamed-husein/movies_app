import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/tv/domain/entities/tv_show.dart';
import 'package:movies_app/tv/domain/repository/tv_repository.dart';

class GetPopularTvUseCase extends BaseUseCase<List<TvShow>,NoParameters>{
  final TvRepository tvRepository;

  GetPopularTvUseCase({required this.tvRepository});
  @override
  Future<Either<Failure, List<TvShow>>> call(NoParameters parameters)async {
    return await tvRepository.getPopularTvShow();
  }
}