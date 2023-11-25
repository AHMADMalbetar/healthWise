import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../allCubites/calenderCubit/cubit.dart';
import '../../allCubites/calenderCubit/states.dart';
import '../../classes/doctorsInformation.dart';
import '../../constant/color.dart';


class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<calenderLayoutCubit, calenderLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var Cubit = calenderLayoutCubit.get(context);
        return Scaffold(
          body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              int reversedIndex = Cubit.cardList.length - 1 - index;
              return Cubit.cardList[reversedIndex];
            },
            itemCount: Cubit.cardList.length,
          ),
        );
      },
    );
  }
}


Widget BuildItem({
  required String docName,
  required String docWork,
  required String docDay,
  required String docHour,
  required String docImage,
  required String docYear,
  required String docMon,
  required String docCon,
}) {
  return BlocConsumer<calenderLayoutCubit, calenderLayoutState>(
    listener: (context, state) {},
    builder: (context, state) {
      var Cubit = calenderLayoutCubit.get(context);
      return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            height: 220,
            width: 600,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                docName,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                docWork,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 30,
                            child: Image(
                              image: AssetImage(docImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.calendar_month_outlined, size: 18,),
                              const SizedBox(
                                width: 3,
                              ),
                              Text('$docDay/$docMon/$docYear'),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.access_time, size: 18,),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(docHour),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: Colors.green,
                                size: 10,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text('Upcoming'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: lightColor,
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Cubit.addToCardcanceledList(
                                  docInfo[Cubit.canceledIndex],
                                  docMon,
                                  docHour,
                                  docDay,
                                  docYear,
                                  docImage,
                                  docName,
                                );
                                Cubit.removeFromUpcommingList();
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.3),),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.teal
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                Cubit.addToCardCompletedList(
                                  docInfo[Cubit.completedIndex],
                                  docMon,
                                  docHour,
                                  docDay,
                                  docYear,
                                  docImage,
                                  docName,
                                );
                                Cubit.removeFromUpcommingList();
                              },
                              child: const Text('Completed',
                                style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}