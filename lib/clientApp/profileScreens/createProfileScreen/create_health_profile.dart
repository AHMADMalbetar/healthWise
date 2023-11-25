import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../allCombonantes/profileCombonantes/widgets.dart';
import '../../allCubites/profileCubit/createProfileCubite/create_profile_cubit.dart';
import '../../allCubites/profileCubit/createProfileCubite/create_profile_states.dart';
import '../../constant/colours.dart';
import '../profilePage/profile_page.dart';


class CreateHealthProfile extends StatelessWidget {
  CreateHealthProfile({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController bloodTypeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateProfileCubit, CreateProfileStates>(
        builder: (context, state) {
          var cubit = CreateProfileCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
                  color: Colors.white,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Container(
                  height: 400.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50.r),
                          bottomLeft: Radius.circular(50.r)),
                      gradient: const LinearGradient(
                          colors: [mainColour, Colors.tealAccent],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Text(
                          'Create a health profile',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp,
                              color: Colors.white),
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              height: 650.h,
                              width: double.infinity,
                            ),
                            Positioned(
                              top: 50.h,
                              left: 6,
                              child: Material(
                                elevation: 20,
                                borderRadius: BorderRadius.circular(20.r),
                                child: Container(
                                  height: 600.h,
                                  width: 350.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(20.r)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 100.h,
                                        right: 30.w,
                                        left: 30.w),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        TextNormalTitle(
                                            text: 'First name & last name',
                                          color: mainTitleColor,
                                        ),
                                        TextFormFieldSpecial(
                                            control: nameController,
                                            hint: 'Full name',
                                            suffIconClickable: false
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextNormalTitle(
                                                    text: 'Gender',
                                                  color: mainTitleColor,
                                                ),
                                                TextFormFieldSpecial(
                                                    control:
                                                    genderController,
                                                    width: 125.w,
                                                    hint: 'Male/Female',
                                                    suffIconClickable: false,
                                                  sizeOfHint: 10
                                                )
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextNormalTitle(
                                                    text: 'Blood type',
                                                  color: mainTitleColor,
                                                ),
                                                TextFormFieldSpecial(
                                                    control:
                                                    bloodTypeController,
                                                    width: 125.w,
                                                    hint: 'A/B',
                                                    suffIconClickable: false,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        TextNormalTitle(
                                            text: 'Date',
                                          color: mainTitleColor,
                                        ),
                                        TextFormFieldSpecial(
                                          hint: 'Date',
                                          suffIconClickable: true,
                                          control: dateController,
                                          suffIcon:
                                          Icons.calendar_month_outlined,
                                          onIconClick: () async {
                                            final DateTime? returnedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate:
                                                DateTime.now(),
                                                firstDate:
                                                DateTime(1920),
                                                lastDate:
                                                DateTime(3000));
                                            cubit.changeDate(returnedDate!);
                                            dateController.text =
                                            cubit.dateControllerText!;
                                          },
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextNormalTitle(
                                                    text: 'Weight',
                                                  color: mainTitleColor,
                                                ),
                                                TextFormFieldSpecial(
                                                    control:
                                                    weightController,
                                                    width: 125.w,
                                                    hint: '70kg',
                                                    suffIconClickable:
                                                    false)
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextNormalTitle(
                                                    text: 'Height',
                                                  color: mainTitleColor,
                                                ),
                                                TextFormFieldSpecial(
                                                  control: heightController,
                                                  width: 125.w,
                                                  hint: '170cm',
                                                  suffIconClickable: false,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30.w,
                                              vertical: 10.h),
                                          child: SizedBox(
                                            height: 50,
                                            width: 300.w,
                                            child: MaterialButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (
                                                            context) =>
                                                            ProfilePage(
                                                                name: cubit
                                                                    .nameControllerText
                                                              // nameController?.text
                                                            )));
                                              },
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      20.r)),
                                              color: mainColour,
                                              child: TextNormalTitle(
                                                  text: 'Create profile',
                                                  color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 60.r,
                                child: Image.asset(
                                  'assets/images/default_profile_picture_black.png',
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {}
    );
  }
}
