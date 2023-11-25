import '../../calenderScreens/canceledScreen/Canceled_Screen.dart';
import '../../calenderScreens/completedScreen/Completed_Screen.dart';
import '../../calenderScreens/upComingScreen/Upcoming_Screen.dart';
import '../../classes/doctorsInformation.dart';
import 'states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class calenderLayoutCubit extends Cubit<calenderLayoutState>{
  calenderLayoutCubit() : super (HomeLayoutInitialState());
  static calenderLayoutCubit get(context) =>
      BlocProvider.of(context);
  int index=0;
  List<Widget> screens=[
    const UpcomingScreen(),
    CompletedScreen(),
    CanceledScreen(),
  ];
  void changeIndex(int value){
    index=value;
    emit(ChangeBottomNavItemState());
  }




  int Index = 0;
  List<Widget> cardList = [];

  void addToCardList(nursesInformation docinfo, var docMon, var docHour, String docDay, var docYear, String docImage, String docName){
    cardList.add(BuildItem(
        docName: docName,
        docWork: docinfo.doctorWork,
        docDay: docDay,
        docHour: docHour,
        docImage: docImage,
        docYear: docYear,
        docMon: docMon,
        docCon: docinfo.doctorWork,
    ));
    Index++;
    emit(addCardToList());
  }

  void removeFromUpcommingList(){
    cardList.removeLast();
  }


  int completedIndex = 0;
  List<Widget> cardCompletedList = [];

  void addToCardCompletedList(nursesInformation docinfo, var docMon, var docHour, String docDay, var docYear, String docImage, String docName){
    cardCompletedList.add(BuildCompleteItem(
        docName: docName,
        docWork: docinfo.doctorWork,
        docDay: docDay,
        docHour: docHour,
        docImage: docImage,
        docYear: docYear,
        docMon: docMon,
        docCon: docinfo.doctorWork,
    ));
    completedIndex++;
    emit(addCardToCopletedList());
  }


  int canceledIndex = 0;
  List<Widget> cardcanceledList = [];

  void addToCardcanceledList(nursesInformation docinfo, var docMon, var docHour, String docDay, var docYear, String docImage, String docName){
    cardcanceledList.add(BuildCanceledItem
      (
        docName: docName,
        docWork: docinfo.doctorWork,
        docDay: docDay,
        docHour: docHour,
        docImage: docImage,
        docYear: docYear,
        docMon: docMon,
        docCon: docinfo.doctorWork,
    ));
    canceledIndex++;
    emit(addCardTocanceledList());
  }




}




