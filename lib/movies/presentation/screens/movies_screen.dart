import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/service/services.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc/movies_state.dart';
import 'package:movies_app/movies/presentation/screens/see_more_screen.dart';
import 'package:movies_app/movies/presentation/widgets/now_playing_widget.dart';
import 'package:movies_app/movies/presentation/widgets/popular_widget.dart';
import 'package:movies_app/movies/presentation/widgets/top_rated_widget.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return MoviesBloc(sl(),sl(),sl())
          ..add(NowPlayingMoviesEvent())
          ..add(PopularMoviesEvent())
          ..add(TopRatedMoviesEvent());
      },
      child: Scaffold(
        backgroundColor: const Color(0xff0A0D14),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingWidget(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    BlocBuilder<MoviesBloc,MoviesState>(
                      builder:(context, state) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> SeeMore(movies: state.popularMovies,count:state.popularMovies.length,isPopular: true),),);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Text(
                                  'See More',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const PopularWidget(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Rated",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    BlocBuilder<MoviesBloc,MoviesState>(
                      builder:(context, state) =>  InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SeeMore(movies: state.topRatedMovies,count:state.topRatedMovies.length,isPopular: false),),);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Text(
                                'See More',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 16.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedWidget(),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
