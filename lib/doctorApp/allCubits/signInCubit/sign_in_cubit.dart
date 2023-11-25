import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../servicesListAndCard/servicesListAndCard.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  
  static SignInCubit get(context) => BlocProvider.of(context);
  
  bool isVisible = false;
  void changeIconVisible(){
    isVisible = !isVisible;
    emit(changeVisibilityIcon());
  }

  String selectedImagePath = '';

  void selectimagefrGallery(context) async {
    selectedImagePath = await selectImageFromGallery();
    if (selectedImagePath != '') {
      emit(selectimagestate());
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('No Image Selected !')));
    }
  }
  void selectimagefrCamera(context) async {
    selectedImagePath = await selectImageFromCamera();
    if (selectedImagePath !='') {
      emit(selectimagestate());
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('No Image Captured !')));
    }
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  late String doctorLocation;
  String changeController(var long, var lat){
    doctorLocation = long + lat;
    emit(changeContollerToLocation());
    return doctorLocation;
  }

  List<String> bloodList = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  String bloodType = 'A+';
  void selectBloodType(value){
    bloodType = value;
    emit(chooseBloodType());
  }

  String selectDate(TextEditingController textEditingController, DateTime dateTime){
    String date = DateFormat.yMd().format(dateTime);
    textEditingController.text = date;
    return textEditingController.text;
  }

  List<String> gender = [
    'Male',
    'Female',
  ];

  String Gender = 'Male';
  void selectGenderType(value){
    Gender = value;
    emit(chooseGenderType());
  }

  List<String> specialization = [
    'Dentist',
    'Psychaitrist',
    'Surgeon',
    'Cardiologist',
    'General',
  ];

  String service = 'Dentist';
  void selectSpecializationType(value){
    service = value;
    emit(chooseSpecializationType());
  }

  List<Widget> doctorServicesList = [];

  void increaseServiceList(TextEditingController serviceController, TextEditingController priseController) {
    doctorServicesList.add(doctorService(
      serviceController: serviceController,
      priseController: priseController,
    ));
    emit(increaseServiceListState());
  }


  bool isPass = false;
  void changeVisibilityOfPass(){
    isPass = !isPass;
    emit(changeVisibility());
  }
  
}
