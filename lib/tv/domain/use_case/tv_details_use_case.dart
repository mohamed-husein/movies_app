import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/tv/domain/entities/tv_details.dart';
import 'package:movies_app/tv/domain/repository/tv_repository.dart';

class GetDetailsTvShow extends BaseUseCase<TvDetails,TvDetailsParameters >{

  final TvRepository tvRepository;

  GetDetailsTvShow({required this.tvRepository});
  @override
  Future<Either<Failure, TvDetails>> call(TvDetailsParameters parameters)async {
    return await tvRepository.getDetailsTvShow(parameters);
  }

}


class TvDetailsParameters extends Equatable {
  final int tvId;

  const TvDetailsParameters({required this.tvId});

  @override
  List<Object> get props => [tvId];
}