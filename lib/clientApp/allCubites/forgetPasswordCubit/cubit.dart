import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_wise/clientApp/allCubites/forgetPasswordCubit/states.dart';


class ResetPasswordcubit extends Cubit<ResetPasswordState> {
  ResetPasswordcubit() : super(ResetPasswordInitialstate());

  static ResetPasswordcubit get(context) => BlocProvider.of(context);
  bool x = false;
  bool obscuret = true;
  bool obscuret2 = true;
  IconData icon = Icons.visibility_off_outlined;
  IconData icon2 = Icons.visibility_off_outlined;

  void changephne() {
    x = true;
    emit(PhonebuttonState());
  }

  void changeEmail() {
    x = false;
    emit(Emailbuttonstate());
  }
  void emitt(error) {
    emit(Emailvalidateerrorstate(
      error.toString()
    ));
  }
  void emitt2() {
    emit(Emailvalidatesuccsesstate());
  }

  emailvalidate() {
    (value) {
      if (value.isEmpty ||
          RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,5-``}').hasMatch(value)) {
        return "Enter correct email";
      } else {
        return null;
      }
    };
  }

  phonevalidate() {
    (value) {
      if (value.isEmpty || RegExp(r'\d').hasMatch(value)) {
        return "Enter correct number";
      } else {
        return null;
      }
    };
  }

  void changeobscuretext() {
    if (obscuret == true) {
      obscuret = false;
      icon = Icons.visibility_outlined;
    } else {
      obscuret = true;
      icon = Icons.visibility_off_outlined;
    }
    emit(changeobscurestate());
  }

  void changeobscuretext2() {
    if (obscuret2 == true) {
      obscuret2 = false;
      icon2 = Icons.visibility_outlined;
    } else {
      obscuret2 = true;
      icon2 = Icons.visibility_off_outlined;
    }
    emit(changeobscurestate());
  }
}
