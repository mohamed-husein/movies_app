import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_details_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeWidget extends StatefulWidget {
  const YoutubeWidget({Key? key}) : super(key: key);

  @override
  State<YoutubeWidget> createState() => _YoutubeWidgetState();
}

class _YoutubeWidgetState extends State<YoutubeWidget> {
  YoutubePlayerController controller(youtube){
    return YoutubePlayerController(
        initialVideoId: youtube[1].key,
        flags: const YoutubePlayerFlags(autoPlay: false));
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsBloc, MoviesDetailsState>(
        builder: (context, state) {
      final youtube = state.youtubeMovies;
      return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller(youtube),
        ),
        builder: (p0, p1) => YoutubePlayer(
          controller: controller(youtube),
        ),
      );
    });
  }
}
