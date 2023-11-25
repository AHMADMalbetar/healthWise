import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../allCombonantes/dateAndReasoneGotoDoctor/dateAndReasoneToGo.dart';
import '../allCombonantes/doctorCard/doctorCard.dart';
import '../allCubites/calenderCubit/cubit.dart';
import '../allCubites/calenderCubit/states.dart';
import '../classes/doctorsInformation.dart';

class orderTheNurse extends StatelessWidget {
  orderTheNurse(
    this.docNAme,
    this.docWOrk,
    this.docRAte,
    this.docLOcation,
    this.docIMage,
    this.index,
    this.index1,
  );

  final String docNAme;
  final String docWOrk;
  final double docRAte;
  final String docLOcation;
  final String docIMage;
  final int index;
  final int index1;

  // final String nameOfDay;
  //final String time;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<calenderLayoutCubit, calenderLayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        var calCubit = calenderLayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              'Appointment',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                doctorCard(
                  docRate: docRAte,
                  docLocation: docLOcation,
                  docName: docNAme,
                  docWork: docWOrk,
                  docImage: docIMage,
                ),
                const SizedBox(
                  height: 30,
                ),
                date(
                    iconKind: Icons.calendar_month,
                    typText: 'Date',
                    index: index,
                    index1: index1),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  endIndent: 10,
                  indent: 10,
                  thickness: 2,
                ),
                reason(
                  iconKind: Icons.edit_note_sharp,
                  typText: 'Reason',
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  endIndent: 10,
                  indent: 10,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Payment Detail',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                prisOfOneThing(),
                const SizedBox(
                  height: 20,
                ),
                prisOfOneThing(),
                const SizedBox(
                  height: 20,
                ),
                prisOfOneThing(),
                const SizedBox(
                  height: 30,
                ),
                totalPrise(),
                const SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: () {
                    calCubit.addToCardList(
                        nurseInfo[calCubit.Index],
                        '${DateTime.now().month}',
                        timeWork[index1].toString(),
                        '${(index1 % 30) + 1}',
                        '${DateTime.now().year}',
                        docIMage,
                        docNAme,
                    );
                    AwesomeDialog(
                      btnOkColor: Colors.teal,
                      context: context,
                      animType: AnimType.scale,
                      headerAnimationLoop: false,
                      dialogType: DialogType.success,
                      showCloseIcon: false,
                      title: 'Success',
                      desc: 'You have successfully booked an appointment',
                      btnOkOnPress: () {
                        debugPrint('OnClick');
                      },
                      btnOkIcon: Icons.check_circle,
                      onDismissCallback: (type) {
                        debugPrint('Dialog Dismiss from callback $type');
                      },
                    ).show();
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.teal),
                    child: const Center(
                      child: Text(
                        'Confrime Appointment',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget prisOfOneThing() => Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      'Consultation',
      style: TextStyle(color: Colors.grey.withOpacity(0.5), fontSize: 14),
    ),
    const Text(
      '25000 SYP',
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
    ),
  ],
);

Widget date(
    {required String typText,
    required IconData iconKind,
    int index = 0,
    int index1 = 0}) {
  var month = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  List<String> timeWork = [
    '6:00',
    '6:30',
    '7:00',
    '7:30',
    '8:00',
    '8:30',
    '9:00',
    '9:30',
    '10:00',
  ];
  var dayNames = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        typText,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconKind,
            color: Colors.teal,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            '${dayNames[index % 7]}, ${month[DateTime.now().month - 1]} ${index + 1}, ${DateTime.now().year} | ${timeWork[index1]}  pm',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget reason({
  required String typText,
  required IconData iconKind,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        typText,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconKind,
            color: Colors.teal,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Reason ',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget totalPrise() => const Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      'Total',
      style: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    ),
    Text(
      '25000 SYP',
      style: TextStyle(
        color: Colors.teal,
        fontSize: 14,
      ),
    ),
  ],
);
