import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'stepper_state.dart';

class StepperCubit extends Cubit<StepperState> {
  StepperCubit() : super(StepperInitial());

  static StepperCubit get(context) => BlocProvider.of(context);

  int selectIndex = 0;
  void changeSelectedIndex(index){
    selectIndex = index;
    emit(changeselectIndexState());
  }

  void increaseStep(){
    selectIndex++;
    emit(increaseSteps());
  }
  void decreaseStep(){
    selectIndex--;
    emit(decreaseSteps());
  }

}
