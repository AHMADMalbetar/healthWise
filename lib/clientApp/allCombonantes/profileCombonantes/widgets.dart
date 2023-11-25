import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/colours.dart';


Widget TextFormFieldSpecial({
  required String hint,
  IconData? suffIcon,
  required bool suffIconClickable,
  TextInputType? keyboard,
  Color backgroundColor = Colors.white12,
  required TextEditingController control,
  Color borderColor = Colors.transparent,
  Color focusedBorderColor = Colors.teal,
  bool visibility = false,
  Function()? onIconClick,
  Function()? onFieldTap,
  Function()? onValueChanged,
  bool readOnly = false,
  double height = 40,
  double width = double.infinity,
  double? sizeOfHint = 14,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        onEditingComplete: onValueChanged,
        onTap: onIconClick,
        readOnly: readOnly,
        controller: control,
        obscureText: visibility,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: onIconClick,
              icon: Icon(
                suffIcon,
                color: subTitleColor,
              ),
            ),
            label: Text(
                hint,
              style: TextStyle(
                color: subTitleColor,
                fontSize: sizeOfHint,
              ),
            ),
            filled: true,
            fillColor: backgroundColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide(color: borderColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: focusedBorderColor))),
        maxLines: 1,
      ),
    ),
  );
}

Widget TextNormalTitle({
  required String? text,
  required Color color,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: Text(
      '$text',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    ),
  );
}