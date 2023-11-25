import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import 'create_profile_states.dart';

class CreateProfileCubit extends Cubit<CreateProfileStates> {
  CreateProfileCubit() : super(CreateProfileInitialState());

  static CreateProfileCubit get(context) => BlocProvider.of(context);
  DateTime date = DateTime.now();
  String dateTxt = 'Date';
  String? nameControllerText = 'StaticName';
  String? genderControllerText;
  String? bloodTypeControllerText;
  String? dateControllerText;
  String? weightControllerText;
  String? heightControllerText;

  void changeDate(DateTime time) {
    date = time;
    dateControllerText = '${date.year}-${date.month}-${date.day}';
    dateTxt = '${date.year}-${date.month}-${date.day}';
    emit(CreateProfileCalendarChangeState());
  }

  String? settingProfileName(String profileName){
    nameControllerText = profileName;
    emit(CreateProfileNameState());
  }
}
