import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'nurseDate_state.dart';


class nurseDateCubit extends Cubit<nurseDateState> {
  nurseDateCubit() : super(nurseDateInitial());
  static nurseDateCubit get(context) => BlocProvider.of(context);

  int selectitem = -1;

  int changeItemColor(int index){
    selectitem = index;
    emit(changeNurseIndex());
    return selectitem;
  }

  int selectdate = -1;

  int changedateColor(int index){
    selectdate = index;
    emit(changeNurseIndexdate());
    return selectdate;
  }

}
