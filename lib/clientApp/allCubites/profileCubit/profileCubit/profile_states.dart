import '../../../classes/user_profile_model.dart';

abstract class ProfileStates{}

class ProfileInitialState extends ProfileStates{}

class ProfileLoadingState extends ProfileStates{}

class ProfileCreatedState extends ProfileStates{
  final UserProfileModel model;
  ProfileCreatedState(this.model);
}

class ProfileErrorState extends ProfileStates{
  final String error;
  ProfileErrorState(this.error);
}

class ProfileGetNameState extends ProfileStates{}



