part of 'sign_in_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class changeVisibilityIcon extends SignInState{}

class selectimagestate extends SignInState{}

class changeContollerToLocation extends SignInState{}

class toggleBetweenSteps extends SignInState{}

class chooseBloodType extends SignInState{}

class chooseGenderType extends SignInState{}

class chooseSpecializationType extends SignInState{}

class increaseServiceListState extends SignInState{}

class changeVisibility extends SignInState{}
