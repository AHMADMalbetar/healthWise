import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../allCombonantes/forgetPasswordCombonantes/widget.dart';
import '../../allCubites/forgetPasswordCubit/cubit.dart';
import '../../allCubites/forgetPasswordCubit/states.dart';
import '../../constant/colours.dart';

class CreateNewPassword extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  var formkey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordcubit, ResetPasswordState>(
        builder: (context, state) {
          var cubit = ResetPasswordcubit.get(context);
          return Form(
            key: formkey2,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 37.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, top: 10, bottom: 5, right: 30),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 45,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: text1(s: 'Create New Password')),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: text2(s: 'Create your new pawssord to login'),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Createnewpass(
                            controller: passwordController,
                            keytype: TextInputType.visiblePassword,
                            icon: cubit.icon,
                            validator: (value) {
                              if (value.isEmpty) {
                                return '*Can\'t be empty';
                              } else {
                                return null;
                              }
                            },
                            obscure: cubit.obscuret,
                            ontap: () {
                              cubit.changeobscuretext();
                            },
                            hint: 'New Password',
                            color: maincolor),
                        const SizedBox(
                          height: 20,
                        ),
                        Createnewpass(
                            controller: passwordController2,
                            keytype: TextInputType.visiblePassword,
                            icon: cubit.icon2,
                            validator: (value) {
                              if (value.isEmpty ||
                                  passwordController2.value !=
                                      passwordController.value) {
                                if (passwordController2.value !=
                                    passwordController.value) {
                                  return '*The password you entered didn\'t match';
                                } else {
                                  return '*Can\'t be empty';
                                }
                              } else {
                                return null;
                              }
                            },
                            obscure: cubit.obscuret2,
                            ontap: () {
                              cubit.changeobscuretext2();
                            },
                            hint: 'Confirm Password',
                            color: greycolor),
                        const SizedBox(
                          height: 15,
                        ),
                        TextB(
                            s: 'Create Password',
                            n: 10,
                            check: () async {
                              if (formkey2.currentState!.validate()) {
                                QuickAlert.show(
                                  context: context,
                                  animType: QuickAlertAnimType.scale,
                                  type: QuickAlertType.success,
                                  titleColor: maintextcolor,
                                  width: 350,
                                  borderRadius: 30,
                                  textColor: greycolor,
                                  confirmBtnText: 'Login',
                                  confirmBtnColor: maincolor,
                                  text:
                                      ' You have successfully reset your password',
                                );
                              }
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
