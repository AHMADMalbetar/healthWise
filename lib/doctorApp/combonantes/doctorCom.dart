import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../clientApp/constant/colours.dart';

Widget DatesTextFormField({required bool IsChecked,Widget? time}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: SizedBox(
      height: 40,
      width: 60.r,
      child: TextFormField(
        decoration: InputDecoration(
            prefix:time,
            enabled: IsChecked,
            border: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: maincolor, width: .8)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: maincolor, width: 3)),
            disabledBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: greycolor))),
      ),
    ),
  );
}


Widget TextformVerificationcode(
    {required controller, required keytype, required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.only(right: 25.0),
    child: SizedBox(
      height: 100,
      width: 70,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Empty';
          } else {
            return null;
          }
        },
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }

          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        enabled: true,
        cursorColor: Colors.white70,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        controller: controller,
        keyboardType: keytype,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: const BorderSide(width: 2.3),
                borderRadius: BorderRadius.circular(15)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: maincolor, width: 2.3),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: maincolor, width: 2.3),
                borderRadius: BorderRadius.circular(15))),
      ),
    ),
  );
}
