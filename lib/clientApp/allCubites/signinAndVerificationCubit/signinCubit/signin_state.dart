part of 'signin_cubit.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}

class changeSignVisibility extends SigninState{}

class changeCheckBox extends SigninState{}
