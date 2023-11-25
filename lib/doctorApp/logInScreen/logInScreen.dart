import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../clientApp/allCombonantes/dialogCombonantes/dialog.dart';
import '../../clientApp/allCombonantes/logInSignInCombonantes/component.dart';
import '../../clientApp/allCombonantes/textFormFieldCombonantes/textFormFiled.dart';
import '../../clientApp/doctors_screans/homeLayoutScrean/homeLayout.dart';
import '../../clientApp/forgetPaswwordScreens/resetPassword/resetpassword.dart';
import '../allCubits/signInCubit/sign_in_cubit.dart';
import '../homeLayoutSignInScreen.dart';

class logInScreen extends StatelessWidget {


  var doctorNumberController = TextEditingController();
  var doctorPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {},
      builder: (context, state) {
        var Cubit = SignInCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Login',
              style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            elevation: 0,
            backgroundColor: Colors.teal,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    defTextFormField(
                      Controller: doctorNumberController,
                      save: false,
                      Label: 'Number',
                      pre: Icons.phone,
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    defTextFormField(
                        Controller: doctorPasswordController,
                        save: Cubit.isPass,
                        Label: 'Password',
                        pre: Icons.lock,
                        suf: Cubit.isPass ? Icons.visibility_off : Icons.visibility,
                        sufWork: () {
                          Cubit.changeVisibilityOfPass();
                        }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResetPassword(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forget Password',
                            style: TextStyle(color: Colors.teal, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      child: defaultButton(
                        text: 'Log in',
                        function: () {
                          defDialoge(
                              context: context,
                              nextScreen: homeLayoutScrean()
                          );
                        }
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: TextStyle(
                              color: Colors.grey.withOpacity(0.75),
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => homeLayoutDoctorScareen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(color: Colors.teal, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      children: [
                        Expanded(
                            child: Divider(
                              indent: 10,
                              endIndent: 10,
                              thickness: 2,
                            )),
                        Text(
                          'OR',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Expanded(
                            child: Divider(
                              indent: 10,
                              endIndent: 10,
                              thickness: 2,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      height: 70,
                      child: MaterialButton(
                        onPressed: () {

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: Image.asset(
                                'Images/google.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                              height: 200,
                            ),
                            const Expanded(
                              child: Text(
                                'Log in with Google',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      height: 70,
                      child: MaterialButton(
                        onPressed: () {

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: Image.asset(
                                'Images/face.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                              height: 20,
                            ),
                            const Expanded(
                              child: Text(
                                'Log in with Facebook',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
