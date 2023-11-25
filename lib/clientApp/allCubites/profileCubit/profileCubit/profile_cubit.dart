
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:health_wise/clientApp/allCubites/profileCubit/profileCubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());
  static ProfileCubit get(context) => BlocProvider.of(context);

  String nameFromCubit = 'Name';
  bool nameIsNull = true;

  void gettingTheName(String name){
    nameFromCubit = name;
    emit(ProfileGetNameState());
  }
}
