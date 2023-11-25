import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_wise/doctorApp/allCubits/doctorDateCubit/states.dart';


class CheckBoxcubit extends Cubit<CheckBoxState> {
  CheckBoxcubit() : super(CheckBoxInitialState());

  static CheckBoxcubit get(context) => BlocProvider.of(context);

  bool isChecked1 = true;
  bool isChecked2 = true;
  bool isChecked3 = true;
  bool isChecked4 = true;
  bool isChecked5 = true;
  bool isChecked6 = true;
  bool isChecked7 = true;
  String dropdownvalue ='am';

  void changeCheckBox1() {
    isChecked1 = !isChecked1;
    emit(TrueCheckboxState());
  }

  void changeCheckBox2() {
    isChecked2 = !isChecked2;
    emit(TrueCheckboxState());
  }

  void changeCheckBox3() {
    isChecked3 = !isChecked3;
    emit(TrueCheckboxState());
  }

  void changeCheckBox4() {
    isChecked4 = !isChecked4;
    emit(TrueCheckboxState());
  }

  void changeCheckBox5() {
    isChecked5 = !isChecked5;
    emit(TrueCheckboxState());
  }

  void changeCheckBox6() {
    isChecked6 = !isChecked6;
    emit(TrueCheckboxState());
  }

  void changeCheckBox7() {
    isChecked7 = !isChecked7;
    emit(TrueCheckboxState());
  }
}
