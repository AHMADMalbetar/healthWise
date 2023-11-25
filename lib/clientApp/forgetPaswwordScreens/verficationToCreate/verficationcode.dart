import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../allCombonantes/forgetPasswordCombonantes/widget.dart';
import '../../allCubites/forgetPasswordCubit/cubit.dart';
import '../../allCubites/forgetPasswordCubit/states.dart';
import '../../constant/colours.dart';
import '../createNewPassword/Createnewpass.dart';


class VerificationCode extends StatelessWidget {
  VerificationCode({super.key});

  TextEditingController codeController1 = TextEditingController();
  TextEditingController codeController2 = TextEditingController();
  TextEditingController codeController3 = TextEditingController();
  TextEditingController codeController4 = TextEditingController();
  var formkey3 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordcubit, ResetPasswordState>(
        builder: (context, State) {
          return Form(
            key: formkey3,
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
                  child: Column(children: [
                    const SizedBox(
                      height: 45,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: text1(s: 'Enter Verification Code'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    text2(s: 'Enter code that we have sent to your number'),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25.0, 35, 5, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextformVerificationcode(
                              context: context,
                              controller: codeController1,
                              keytype: TextInputType.number,
                            ),
                          ),
                          Expanded(
                            child: TextformVerificationcode(
                              context: context,
                              controller: codeController2,
                              keytype: TextInputType.number,
                            ),
                          ),
                          Expanded(
                            child: TextformVerificationcode(
                              context: context,
                              controller: codeController3,
                              keytype: TextInputType.number,
                            ),
                          ),
                          Expanded(
                            child: TextformVerificationcode(
                              context: context,
                              controller: codeController4,
                              keytype: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextB(
                        check: () {
                          if (formkey3.currentState!.validate()) {
                            navigatTo(context, CreateNewPassword());
                          }
                        },
                        s: 'Verify',
                        n: 40),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Didn\'t recive the code?',
                            style: TextStyle(color: greycolor, fontSize: 18),
                          ),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.only(left: 3)),
                              child: Text(
                                'Resend',
                                style: TextStyle(
                                    color: Colors.teal.withOpacity(0.5),
                                    fontSize: 18),
                              ))
                        ],
                      ),
                    )
                  ]),
                )),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
