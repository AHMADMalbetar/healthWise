import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

import '../../google_map_location.dart';
import '../allCombonantes/dayCard/dayCard.dart';
import '../allCombonantes/doctorCard/doctorCard.dart';
import '../allCubites/nurseCubit/nurseDate_cubit.dart';
import '../allCubites/nurseCubit/nurseDate_state.dart';
import '../classes/doctorClass.dart';
import 'orderTheNurse.dart';


class nurseProfile extends StatelessWidget {

  nurseProfile
      (this.docName,
      this.docWork,
      this.docRate,
      this.docLocation,
      this.docImage,
      );


  final String docName;
  final String docWork;
  final double docRate;
  final String docLocation;
  final String docImage;
  int index1=-1;
  int index2=-1;

  int selectitem = -1;
  int selectdate = -1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<nurseDateCubit, nurseDateState>(
      listener: (context, state) {},
      builder: (context, state) {
        var Cubit = nurseDateCubit.get(context);
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
              'Nurs Detail',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  doctorCard(
                    docRate: docRate,
                    docLocation: docLocation,
                    docName: docName,
                    docWork: docWork,
                    docImage: docImage,
                    inwork: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderTrackingPage(),
                        ),
                      );
                    }
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'About',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ReadMoreText(
                    'the Doctorthe Doctorthe Doctorthe Doctorthe Doctorthe Doctorthe Doctorthe Doctorthe Doctorthe Doctorthe Doctorthe Doctorthe Doctor',
                    trimCollapsedText: 'show less',
                    trimExpandedText: 'show more',
                    colorClickableText: Colors.tealAccent,
                    style: TextStyle(color: Colors.black),
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 75,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          dayAndHisDay(
                            Index: index,
                            inWork: (){
                              selectitem = Cubit.changeItemColor(index);
                              index1 =index;

                        },
                              dayColor: selectitem == index ? Colors.teal : Colors.white,
                              numOfDay: numOfDay[index],
                              theDay: days[index % 7],
                              numDayColor: selectitem == index ? Colors.white : Colors.black,
                          ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(
                            width: 10,
                          ),
                      itemCount: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    indent: 10,
                    endIndent: 10,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 9,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) {
                        return theTimeInThisDay(
                          timeColor: selectdate == index ? Colors.white : Colors.black,
                          cardColors: selectdate == index ? Colors.teal : Colors.white,
                          inWork: (){

                            selectdate = Cubit.changedateColor(index);
                            index2=index;
                          },
                          eveningOrMorning: doctorTimeWork[index],
                          theTime: 'Pm',
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.teal,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          if(index1==-1||index2==-1){
                            AwesomeDialog(
                              btnOkColor: Colors.teal,
                              context: context,
                              animType: AnimType.scale,
                              headerAnimationLoop: false,
                              dialogType: DialogType.error,
                              showCloseIcon: false,
                              title: 'error',
                              desc: 'You must select day and  time ',
                              btnOkOnPress: () {
                                debugPrint('OnClcik');
                              },
                              btnOkIcon: Icons.check_circle,
                              onDismissCallback: (type) {
                                debugPrint('Dialog Dissmiss from callback $type');
                              },
                            ).show();
                          }else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => orderTheNurse(
                                    docName,
                                    docWork,
                                    docRate,
                                    docLocation,
                                    docImage,
                                    index1,
                                    index2
                                  ),
                              ),
                          );
                          }
                        },
                        child: const Center(
                          child: Text(
                            'Book Appointment',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
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
          backgroundColor: Colors.white,
        );
      },
    );
  }
}


