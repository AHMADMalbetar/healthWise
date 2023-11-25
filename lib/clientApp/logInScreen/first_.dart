import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../allCombonantes/dialogCombonantes/dialog.dart';
import '../allCombonantes/logInSignInCombonantes/component.dart';
import '../allCubites/loginCubit/login_cubit.dart';
import '../doctors_screans/homeLayoutScrean/homeLayout.dart';
import '../forgetPaswwordScreens/resetPassword/resetpassword.dart';
import '../signInScreen/signInScreen/signin_screen.dart';


class logInScreen extends StatelessWidget {
 
  
  static var nameController = TextEditingController();
  static var emailController = TextEditingController();
  static var passwordController = TextEditingController();
  static var isCheckedController = TextEditingController();
  static var fromkey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {},
  builder: (context, state) {
    var Cubit = LoginCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: fromkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  defaultFormfield(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    //  validator: send value donot do until send the key
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "email must not be empty ";
                      }
                      return null;
                    },
                    label: 'Enter your email',
                    prefix: Icons.email,
                    isChecked: null,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  defaultFormfield(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    //  validator: send value donot do until send the key
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "password must not be empty ";
                      }
                      return null;
                    },
                    label: 'Enter your Password',
                    prefix: Icons.lock,
                    suffix:
                        Cubit.isPassword ? Icons.visibility_off : Icons.visibility,
                    isPassword: Cubit.isPassword,
                    isChecked: null,
                    suffixPressed: () {
                        Cubit.changePassword();
                    },
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
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 50,
                      child: defaultButton(
                        text: 'Log in',
                        function: () {
                          if (fromkey.currentState!.validate()) {
                            defDialoge(
                              context: context,
                              nextScreen: homeLayoutScrean(),
                            );
                          }
                        },
                      ),
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
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SigninScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(color: Colors.teal, fontSize: 20),
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
                        print(emailController.text);
                        print(passwordController.text);
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
                              'Sign in with Google',
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
                        print(emailController.text);
                        print(passwordController.text);
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
                              'Sign in with Facebook',
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
      ),
    );
  },
);
  }
}
