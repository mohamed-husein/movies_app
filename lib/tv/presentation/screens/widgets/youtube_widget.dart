import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/tv/presentation/controller/tv_details_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TvYoutubeWidget extends StatefulWidget {
  const TvYoutubeWidget({Key? key}) : super(key: key);

  @override
  State<TvYoutubeWidget> createState() => _TvYoutubeWidgetState();
}

class _TvYoutubeWidgetState extends State<TvYoutubeWidget> {

 late YoutubePlayerController youtubeController ;
  YoutubePlayerController controller(youtube) {
    return youtubeController = YoutubePlayerController(
        initialVideoId: youtube[0].key,
        flags: const YoutubePlayerFlags(autoPlay: false));
  }



  @override
  void dispose() {
    youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
      builder: (context, state) {
        final youtube = state.tvVideos;
        return YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: controller(youtube),
          ),
          builder: (p0, p1) => YoutubePlayer(
            controller: controller(youtube),
          ),
        );
      },
    );
  }
}
