import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future defDialoge({
  required BuildContext context,
  required Widget nextScreen,
}) => AwesomeDialog(
  barrierColor: Colors.teal,
  btnOkColor: Colors.teal,
  context: context,
  animType: AnimType.scale,
  headerAnimationLoop: false,
  dialogType: DialogType.success,
  showCloseIcon: false,
  title: 'Welcome Back !',
  desc: 'Once again you login successfully into \n \n HEALTH WISE',
  btnOkOnPress: () {
    debugPrint('OnClcik');
  },
  btnOkIcon: Icons.check_circle,
  onDismissCallback: (type) {
    debugPrint('Dialog Dissmiss from callback $type');
  },
  btnOk: Padding(
    padding: const EdgeInsets.all(10.0),
    child: InkWell(
      onTap: (){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => nextScreen,
          ),
              (route) => false,
        );
      },
      child: Container(
        height: 40.r,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.teal
        ),
        child: const Center(
          child: Text(
            'Go to home',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16
            ),
          ),
        ),
      ),
    ),
  ),
).show();