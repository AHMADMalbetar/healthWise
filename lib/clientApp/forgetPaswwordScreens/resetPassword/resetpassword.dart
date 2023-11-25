import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../allCombonantes/forgetPasswordCombonantes/widget.dart';
import '../../allCubites/forgetPasswordCubit/cubit.dart';
import '../../allCubites/forgetPasswordCubit/states.dart';
import '../../constant/colours.dart';
import '../verficationToCreate/verficationcode.dart';

class ResetPassword extends StatelessWidget {
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  static var formkey = GlobalKey<FormState>();

  ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordcubit, ResetPasswordState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ResetPasswordcubit.get(context);
        return Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: formkey,
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
                      left: 30.0, top: 20, bottom: 5, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: text1(s: 'Forgot Your Password?'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text2(
                              s: 'Enter your email or your phone number,'),
                          const SizedBox(
                            height: 10,
                          ),
                          text2(
                              s: ' we will send you confirmation code'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(10, 173, 173, 173),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(130, 173, 173, 173)),
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  cubit.changeEmail();
                                },
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color:
                                        cubit.x == true ? greycolor : maincolor,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  cubit.changephne();
                                },
                                child: Text(
                                  'Phone',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: cubit.x != true
                                        ? greycolor
                                        : maincolor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Textformff(
                            controller: cubit.x != true
                                ? emailController
                                : phoneController,
                            keytype: cubit.x != true
                                ? TextInputType.emailAddress
                                : TextInputType.phone,
                            icon: cubit.x != true
                                ? Icons.email_outlined
                                : FontAwesomeIcons.phone,
                            validator: (value) {
                              if (value.isEmpty ||
                                  RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,5-``}')
                                      .hasMatch(value)) {
                                return "Can\'t be empty";
                              } else {
                                return null;
                              }
                            }),
                      ),
                      TextB(
                          check: () {
                            print(state);
                            if (formkey.currentState!.validate()) {
                              navigatTo(context, VerificationCode());
                            }
                          },
                          s: 'Reset Password',
                          n: 35)
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
