import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/cubit/main_screen_cubit.dart';


class BottomNavItem {
  final String icon;

  BottomNavItem({
    required this.icon,
  });
}
class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final List<BottomNavItem> selectedItems = [
    BottomNavItem(
      icon: 'assets/icons/film.svg',
    ),
    BottomNavItem(
      icon: 'assets/icons/screen.svg',
    ),
  ];
  final List<BottomNavItem> unselectedItems = [
    BottomNavItem(
      icon: 'assets/icons/film.svg',
    ),
    BottomNavItem(
      icon: 'assets/icons/screen.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => MainScreenCubit(),
    child: BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (context, state) {
        final cubit=MainScreenCubit.get(context);
        return Scaffold(
          backgroundColor: const Color(0xff0A0D14),
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              cubit.screens[cubit.currentIndex],
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 16, left: 16),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:  const Color(0xff36323c)
                  ),
                  child: Center(
                    child: Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: List.generate(selectedItems.length, (index) {
                        return InkWell(
                          onTap: () {
                            cubit.changeIndex(index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 5,
                              height: 22,
                              child: SvgPicture.asset(
                                selectedItems[index].icon,

                                height: 20,
                                width: 20,
                                color: cubit.currentIndex == index
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              )
            ],
          ),

        );
      },
    ),);


  }
}
