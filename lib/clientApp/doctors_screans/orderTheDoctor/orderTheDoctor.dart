import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../google_map_doctor_locatoin.dart';
import '../../allCombonantes/dateAndReasoneGotoDoctor/dateAndReasoneToGo.dart';
import '../../allCombonantes/doctorCard/doctorCard.dart';
import '../../allCubites/calenderCubit/cubit.dart';
import '../../allCubites/calenderCubit/states.dart';
import '../../classes/doctorsInformation.dart';
import '../../constant/colours.dart';


class orderTheDoctor extends StatelessWidget {
  orderTheDoctor(
    this.docNAme,
    this.docWOrk,
    this.docRAte,
    this.docLOcation,
    this.docIMage,
    this.index1,
    this.index2,
  );

  final String docNAme;
  final String docWOrk;
  final double docRAte;
  final String docLOcation;
  final String docIMage;
  final int index1;
  final int index2;

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
            title: Text(
              'Appointment',
              style: TextStyle(color: mainTitleColor, fontSize: 18),
            ),
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  doctorCard(
                      docRate: docRAte,
                      docLocation: docLOcation,
                      docName: docNAme,
                      docWork: docWOrk,
                      docImage: docIMage,
                      inwork: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DoctorOrderTrackingPage(),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  date(
                    typText: 'Date',
                    iconKind: Icons.calendar_month,
                    index1: index1,
                    index: index2,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    endIndent: 0,
                    indent: 0,
                    thickness: 1,
                  ),
                  dateAndREasoneToGo(
                    iconKind: Icons.edit_note_sharp,
                    typText: 'Reason',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Payment Detail',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                    height: 20,
                  ),
                  totalPrise(),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(
                    endIndent: 0,
                    indent: 0,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      calCubit.addToCardList(
                          docInfo[calCubit.Index],
                          '${DateTime.now().month}',
                          timeWork[index2].toString(),
                          '${(index1 % 30) + 1}',
                          '${DateTime.now().year}',
                          docIMage,
                          docNAme,
                      );
                      print(calCubit.cardList);
                      AwesomeDialog(
                        barrierColor: Colors.teal,
                        btnOkColor: Colors.teal,
                        context: context,
                        animType: AnimType.scale,
                        headerAnimationLoop: false,
                        dialogType: DialogType.success,
                        showCloseIcon: false,
                        title: 'Succes',
                        desc: 'You have successfully booked \n an appointment',
                        btnOkOnPress: () {
                          debugPrint('OnClcik');
                        },
                        btnOk: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            width: double.infinity,
                            height: 50,
                            child: const Center(
                              child: Text(
                                'OK',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        onDismissCallback: (type) {
                          debugPrint('Dialog Dissmiss from callback $type');
                        },
                      ).show();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.teal),
                        child: const Center(
                          child: Text(
                            'Confrime Appointment',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
