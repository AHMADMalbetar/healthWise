import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../allCubites/calenderCubit/cubit.dart';
import '../allCubites/calenderCubit/states.dart';
import '../constant/color.dart';



class ScheduleLayout extends StatelessWidget {
  bool isSelected = false;

  ScheduleLayout({Key? key}) : super(key: key);

  Expanded buildSectionMBtn(calenderLayoutCubit cubit, int dx, String txt) {
    return Expanded(
        child: InkWell(
          onTap: () {
          cubit.changeIndex(dx);
          },
          child: Container(
          padding: const EdgeInsets.all(13),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (cubit.index == dx) ? darkColor : lightColor),
          child: Center(
            child: Text(
              txt,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: (cubit.index == dx) ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
        ),
          ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<calenderLayoutCubit, calenderLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = calenderLayoutCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildSectionMBtn(cubit, 0, 'Upcoming'),
                        buildSectionMBtn(cubit, 1, 'Completed'),
                        buildSectionMBtn(cubit, 2, 'Canceled'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(child: cubit.screens[cubit.index]),
              ],
            ),
          ),
        );
      },
    );
  }
}
