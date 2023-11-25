
import 'package:flutter/material.dart';

import '../../../doctorApp/combonantes/doctorCom.dart';
import '../../allCombonantes/dialogCombonantes/dialog.dart';
import '../../allCombonantes/logInSignInCombonantes/component.dart';
import '../../doctors_screans/homeLayoutScrean/homeLayout.dart';

class StatementScreen extends StatelessWidget {

  static var fromkey = GlobalKey<FormState>() ;

  static TextEditingController codeController1 = TextEditingController();
  static TextEditingController codeController2 = TextEditingController();
  static TextEditingController codeController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
            size: 40.0,
            weight: 20.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key:fromkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20.0,
                left: 20.0,
                right: 20.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                const Text(
                  'Enter Verification Code',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Enter code that we havve sent to your',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey,
                  ),
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textBaseline: TextBaseline.alphabetic,
                  children:[
                    Text(

                      'number',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '',

                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
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
                  ],
                ),


                const SizedBox(
                  height: 25.0,
                ),
                SingleChildScrollView(
                  child: defaultButton(
                    text: 'Verify',
                    function: () {
                      print("Verify Button Pressed");
                      if(fromkey.currentState!.validate()) {
                        defDialoge(
                          context: context,
                          nextScreen: homeLayoutScrean(),
                        );
                      }
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB
                    (
                    60.0,
                    15.0,
                    50.0,
                    100.0,
                  ),
                  child: Row(

                    children: [
                      const Text(
                        "Didn't receive the code?",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: (){},
                        child: const Text(
                          'Resend',
                          style:TextStyle(
                            color: Colors.teal,
                          ),
                        ),

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
