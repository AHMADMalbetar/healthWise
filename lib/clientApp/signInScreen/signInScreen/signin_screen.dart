import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../doctorApp/logInScreen/logInScreen.dart';
import '../../allCombonantes/logInSignInCombonantes/component.dart';
import '../../allCubites/signinAndVerificationCubit/signinCubit/signin_cubit.dart';
import '../verifecationScreen/statement.dart';

class SigninScreen extends StatelessWidget {

  static var nameController = TextEditingController();
  static var emailController = TextEditingController();
  static var passwordController = TextEditingController();
  static var isCheckedController = TextEditingController();
  static var fromkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {},
      builder: (context, state) {
        var Cubit = SigninCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black,
                size: 40.0,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: fromkey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultFormfield(
                      controller: nameController,
                      type: TextInputType.name,
                      //  validator: send value donot do until send the key
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name is not empty ";
                        }
                        return null;
                      },
                      label: 'Enter your name',
                      prefix: Icons.person,
                      isChecked: null,
                    ),
                    const SizedBox(
                      height: 20.0,
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
                      height: 20.0,
                    ),
                    defaultFormfield(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      //  validator: send value donot do until send the key
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password is too short ";
                        }
                        return null;
                      },
                      label: 'Enter your Password',
                      prefix: Icons.lock,
                      suffix: Cubit.ispassword ? Icons.visibility_off : Icons
                          .visibility,
                      isPassword: Cubit.ispassword,
                      suffixPressed: () {
                        Cubit.changePassword();
                      },
                      isChecked: null,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.teal,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Transform.scale(
                            scale: 1.0, // زيادة حجم الـ checkbox
                            child: Checkbox(
                              activeColor: Colors.white,
                              checkColor: Colors.teal,
                              value: Cubit.isCheck,
                              onChanged: (value) {
                                  Cubit.changeChick(value);
                              },
                              materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                              side: const BorderSide(color: Colors.white70),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'I agree to the medidqc',
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Terms of Service',
                                    style: TextStyle(
                                      color: Colors.teal,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'and',
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Privacy Policy',
                                style: TextStyle(
                                  color: Colors.teal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      child: Container(
                        child: defaultButton(
                          text: 'Sign up',
                          function: () {
                            // calling  the button to change  what i want
                            // if : onpressed on buttoun while contain true data
                            if (fromkey.currentState!.validate()) {
                              print(nameController.text);
                              print(emailController.text);
                              print(passwordController.text);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StatementScreen(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            width: 0,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => logInScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.teal, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
        );
      },
    );
  }
}
