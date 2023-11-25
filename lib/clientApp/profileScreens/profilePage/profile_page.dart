import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../../next_screen.dart';
import '../../allCubites/profileCubit/profileCubit/profile_cubit.dart';
import '../../allCubites/profileCubit/profileCubit/profile_states.dart';
import '../../constant/colours.dart';
import '../../constant/custom_icons_icons.dart';




class Model {
  final IconData? icon;
  final String? itemName;
  final dynamic nextPage;

  Model(this.icon, this.itemName, this.nextPage);
}

class ProfilePage extends StatelessWidget {
  String? name;

  ProfilePage({required this.name});

  List<Model> modelList = [
    Model(CustomIcons.heart, 'My saved', NextScreen),
    Model(CustomIcons.document, 'Appointment', NextScreen),
    Model(CustomIcons.chat, 'FAQs', NextScreen),
    Model(CustomIcons.danger_circle, 'Logout', NextScreen),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
          builder: (context, state) {
            var cubit = ProfileCubit.get(context);
            if (name == null) {
              cubit.nameIsNull = true;
            } else {}
            cubit.nameIsNull = false;
            cubit.gettingTheName(name!);
            return Container(
              decoration:  const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [mainColour, Colors.white])),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  actions: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
                  ],
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50.h, bottom: 50.h),
                        child: Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 60.r,
                              child: Image.asset(
                                'assets/images/default_profile_picture_black.png',
                              ),
                            ),
                            const Positioned(
                              right: 0,
                              bottom: 0,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: mainColour,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 50.h),
                        child: Text(
                          cubit.nameIsNull ? 'YourName' : cubit.nameFromCubit,
                          style: TextStyle(
                            color: mainTitleColor,
                              fontSize: 18, fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.r),
                                topRight: Radius.circular(50.r)),
                            color: Colors.white),
                        height: 400.h,
                        width: double.infinity,
                        child: ListView.separated(
                            clipBehavior: Clip.antiAlias,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (index == 3) {
                                return buildingDifferentItem(modelList[index]);
                              } else {
                                return buildingAnItem(modelList[index]);
                              }
                            },
                            separatorBuilder: (context, index) => Divider(
                                  color: Colors.grey,
                                  endIndent: 30.w,
                                  indent: 30.w,
                                ),
                            itemCount: modelList.length),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {}),
    );
  }

  Widget buildingAnItem(Model m) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => m.nextPage));
      // },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: 85.h,
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(
                  m.icon,
                  color: mainColour,
                ),
              ),
            ),
            SizedBox(
              width: 25.w,
            ),
            Text(
              '${m.itemName}',
              style: TextStyle(
                  color: mainTitleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 30.w),
              child: const Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }

  Widget buildingDifferentItem(Model m) {
    return InkWell(
      onTap: () {
        // AwesomeDialog(
        //     context: context,
        //     dialogType:
        //     DialogType
        //         .infoReverse,
        //     width: 300,
        //     dismissOnTouchOutside:
        //     true,
        //     title: 'Alert',
        //     desc:
        //     'Are you sure to log out of your account',
        //     headerAnimationLoop:
        //     true,
        //     showCloseIcon: true,
        //     animType: AnimType
        //         .bottomSlide,
        //     btnOkOnPress: () {},
        //     btnCancelOnPress:
        //         () {},
        //     btnOkColor:
        //     mainColour,
        //     btnCancelColor:
        //     Colors.white,
        //     buttonsTextStyle:
        //     TextStyle(
        //         color: Colors
        //             .black),
        //     barrierColor:
        //     Colors.black38)
        //     .show();
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: 85.h,
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(
                  m.icon,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(
              width: 25.w,
            ),
            Text(
              '${m.itemName}',
              style: const TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 30.w),
              child: const Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
