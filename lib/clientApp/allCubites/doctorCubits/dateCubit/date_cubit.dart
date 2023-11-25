import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'date_state.dart';

class DateCubit extends Cubit<DateState> {
  DateCubit() : super(DateInitial());
  static DateCubit get(context) => BlocProvider.of(context);

  int selectitem = -1;

  int changeItemColor(int index){
    selectitem = index;
    emit(changeIndex());
    return selectitem;
  }

  int selectdate = -1;

  int changedateColor(int index){
    selectdate = index;
    emit(changeIndexdate());
    return selectdate;
  }

}
