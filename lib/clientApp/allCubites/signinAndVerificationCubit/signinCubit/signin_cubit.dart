import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

  static SigninCubit get(context) => BlocProvider.of(context);

  bool ispassword = false;

  void changePassword(){
    ispassword = !ispassword;
    emit(changeSignVisibility());
  }

  bool isCheck = false;
  void changeChick(val){
    isCheck = val;
    emit(changeCheckBox());
  }

}
