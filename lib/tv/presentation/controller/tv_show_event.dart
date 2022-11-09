import 'package:equatable/equatable.dart';

abstract class TvShowEvents extends Equatable {
  const TvShowEvents();
}

class OnTheAirTvShowEvent extends TvShowEvents{
  @override

  List<Object?> get props => [];
}

class PopularTvShowEvent extends TvShowEvents{
  @override

  List<Object?> get props => [];
}

class TheTopRatedTvShowEvent extends TvShowEvents{
  @override

  List<Object?> get props => [];
}