import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../allCubites/doctorCubits/homeLayoutCubit/home_layout_cubit.dart';


class homeLayoutScrean extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var Cubit = HomeLayoutCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Cubit.appBackgroundColor[Cubit.checkIndex],
            title: Cubit.titlesOfScaffold[Cubit.checkIndex],
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications, color: Cubit.iconAppBarColor[Cubit.checkIndex],),
              ),
            ],
          ),
          body: Cubit.Screan[Cubit.checkIndex],
          bottomNavigationBar: BottomAppBar(
            notchMargin: 3,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: Cubit.bottomItems,
              currentIndex: Cubit.checkIndex,
              backgroundColor: Colors.white,
              elevation: 0,
              onTap: (int index) {
                Cubit.changeBottomNavBar(index);
              },
            ),
          ),
        );
      },
    );
  }
}
