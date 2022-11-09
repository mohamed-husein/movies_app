import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';
import 'package:movies_app/tv/presentation/screens/tv_screen.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(const ChangeBottomNavBar(index: 0));
  static MainScreenCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [const MainMoviesScreen(), const MainTvShowScreen()];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/film.svg',color: Colors.white,), label: 'Movies'),
    BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/screen.svg',color: Colors.white,), label: 'Tv Shows'),
  ];
  int currentIndex = 0;

  void changeIndex(int index) {
     currentIndex=index;
    emit(ChangeBottomNavBar(index: index));
  }
}
