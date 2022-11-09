part of 'main_screen_cubit.dart';

abstract class MainScreenState extends Equatable {
  const MainScreenState();
}


class ChangeBottomNavBar extends MainScreenState {
  final int index;

  const ChangeBottomNavBar({required this.index});
  @override
  List<Object> get props => [index];
}
