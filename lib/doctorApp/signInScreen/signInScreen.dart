import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import '../../clientApp/allCombonantes/textFormFieldCombonantes/textFormFiled.dart';
import '../../clientApp/constant/colours.dart';
import '../allCubits/signInCubit/sign_in_cubit.dart';

class doctorSignInScreen extends StatelessWidget {
  var doctorNameController = TextEditingController();
  var doctorCityController = TextEditingController();
  var doctorStreetController = TextEditingController();
  var doctorLocationController = TextEditingController();
  var doctorNumberController = TextEditingController();
  var doctorPasswordController = TextEditingController();
  var doctorNeighbourhoodController = TextEditingController();

  static var scafKey = GlobalKey();
  late String long;
  late String lot;

  Location location = Location();
  late bool servisesEnable;
  late LocationData locationData;
  late PermissionStatus permissionGranted;

  Future<dynamic> getLocation() async {
    servisesEnable = await location.serviceEnabled();
    if (!servisesEnable) servisesEnable = await location.requestService();
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied)
      permissionGranted = await location.requestPermission();

    locationData = await location.getLocation();
    return locationData;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {},
      builder: (context, state) {
        var Cubit = SignInCubit.get(context);
        return Form(
          key: scafKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 30),
                  child: Text(
                    'Welcome To Your Health community',
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Center(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      ClipOval(
                        child: Cubit.selectedImagePath == ''
                            ? Image.asset(
                                'Images/im.jpg',
                                fit: BoxFit.cover,
                                height: 150,
                                width: 150,
                              )
                            : Image.file(
                                File(Cubit.selectedImagePath),
                                fit: BoxFit.cover,
                                height: 150,
                                width: 150,
                              ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                          ),
                          IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor:
                                      Colors.black.withOpacity(0.4),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: double.infinity,
                                        child: InkWell(
                                          onTap: () async {
                                            Cubit.selectimagefrCamera(context);
                                          },
                                          child: const Text(
                                            'Camera',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Divider(
                                        color: Colors.white,
                                      ),
                                      Container(
                                        height: 30,
                                        width: double.infinity,
                                        child: InkWell(
                                          onTap: () async {
                                            Cubit.selectimagefrGallery(context);
                                          },
                                          child: const Text(
                                            'Gallery',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.camera,
                              color: Colors.teal,
                              size: 30,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Text(
                  'Full Name',
                  style: TextStyle(
                    color: mainTitleColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                defTextFormField(
                  Controller: doctorNameController,
                  save: false,
                  Label: '',
                  defColor: Colors.teal,
                  pre: Icons.person_outline,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'City',
                            style: TextStyle(
                              color: mainTitleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          defTextFormFieldMultiLine(
                            Controller: doctorCityController,
                            save: false,
                            Label: 'City',
                            pre: Icons.location_city_outlined,
                            defColor: Colors.teal,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Street',
                            style: TextStyle(
                              color: mainTitleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          defTextFormFieldMultiLine(
                            Controller: doctorStreetController,
                            save: false,
                            Label: 'Street',
                            defColor: Colors.teal,
                            pre: Icons.ramp_left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                              color: mainTitleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          defTextFormFieldMultiLine(
                            Controller: doctorLocationController,
                            save: false,
                            Label: 'Location',
                            defColor: Colors.teal,
                            pre: Icons.location_on_outlined,
                            ttfTap: () {
                              getLocation().then((value) {
                                long = value.longitude.toString();
                                lot = value.latitude.toString();
                                Cubit.changeController(long, lot);
                                doctorLocationController.text =
                                    Cubit.doctorLocation;
                              }).catchError((error) {
                                print(error.toString());
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Neighbourhood',
                            style: TextStyle(
                              color: mainTitleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          defTextFormFieldMultiLine(
                            Controller: doctorNeighbourhoodController,
                            save: false,
                            Label: 'Neighbourhood',
                            defColor: Colors.teal,
                            pre: Icons.home_rounded,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Phone',
                  style: TextStyle(
                      color: mainTitleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                defTextFormField(
                  Controller: doctorNumberController,
                  save: false,
                  Label: '',
                  pre: Icons.phone,
                  defColor: Colors.teal,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                      color: mainTitleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                defTextFormField(
                  Controller: doctorPasswordController,
                  save: Cubit.isVisible,
                  Label: 'Password',
                  pre: Icons.lock,
                  suf:
                      Cubit.isVisible ? Icons.visibility_off : Icons.visibility,
                  sufWork: () {
                    Cubit.changeIconVisible();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
