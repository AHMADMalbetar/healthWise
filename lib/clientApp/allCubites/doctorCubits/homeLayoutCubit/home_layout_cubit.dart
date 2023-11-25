import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../calenderScreens/Schedule_layout.dart';
import '../../../constant/colours.dart';
import '../../../doctors_screans/homeScrean/homeScrean.dart';
import '../../../profileScreens/createProfileScreen/create_health_profile.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());
  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int checkIndex = 1;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
          Icons.home_rounded,
      ),
      label: '',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: '',
    ),
  ];

  List<Widget> Screan = [
    ScheduleLayout(),
    homeScrean(),
    CreateHealthProfile(),
  ];

  List<Widget> titlesOfScaffold = [
    Text(
      "Calender",
      style:
      TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: mainTitleColor,
      ),
    ),
    Text(
      'Be wise and find your Health solution',
      style: TextStyle(
        fontSize: 18,
        color: mainTitleColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  const Text(
      'My profile',
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ];

  List<Color> appBackgroundColor = [
    Colors.white,
    Colors.white,
    mainColour,
  ];

  List<Color> iconAppBarColor = [
    mainTitleColor,
    mainTitleColor,
    Colors.white,
  ];

  void changeBottomNavBar(index) {
    checkIndex = index;
    emit(NewsButtomNav());
  }


}
