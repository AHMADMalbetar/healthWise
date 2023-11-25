import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/colours.dart';




void navigatTo(context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigatAndFinishTo(context, Widget widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

Widget TextformVerificationcode({
  required TextEditingController controller,
  required keytype,
  required BuildContext context,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 25.0),
    child: SizedBox(
      height: 100.r,
      width: 100.r,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Empty';
          }
          else{return null;}
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
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        controller: controller,
        keyboardType: keytype,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
            border: OutlineInputBorder(
            borderSide: const BorderSide( width: 2.3),
            borderRadius: BorderRadius.circular(15)) ,
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: maincolor, width: 2.3),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: maincolor, width: 2.3),
                borderRadius: BorderRadius.circular(15))
        ),
      ),
    ),
  );
}

Widget TextB({required String s, required double n, required check}) {
  return Padding(
    padding: EdgeInsets.only(top: n),
    child: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
      onPressed: check,
      height: 63.r,
      minWidth: 500,
      color: maincolor,
      child: Text(
        s,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  );
}

Widget Createnewpass({required controller,
  required keytype,
  required IconData? icon,
  required validator,
  required obscure,
  required Color color,
  required ontap,
  required String hint}) {
  return TextFormField(
    keyboardType: TextInputType.visiblePassword,
    controller: controller,
    obscureText: obscure,
    validator: validator,
    style: const TextStyle(fontSize: 23),
    cursorColor: const Color.fromARGB(10, 173, 173, 173),
    decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 20, right: 13),
          child: Icon(Icons.lock_outline_rounded, size: 30, color: color),
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: greycolor, fontSize: 18),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 7.0),
          child: GestureDetector(
              onTap: ontap,
              child: Icon(
                icon,
                color: color,
              )),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28)),
        enabledBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(color: Color.fromARGB(130, 173, 173, 173)),
            borderRadius: BorderRadius.circular(28)),
        focusedBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(color: Color.fromARGB(130, 173, 173, 173)),
            borderRadius: BorderRadius.circular(28))),
  );
}

Widget Textformff({
  required var controller,
  required var keytype,
  required IconData? icon,
  required validator,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keytype,
    validator: validator,
    cursorColor: const Color.fromARGB(10, 173, 173, 173),
    decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 30, right: 13),
          child: Icon(icon, color: maincolor),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(27)),
        enabledBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(color: Color.fromARGB(130, 173, 173, 173)),
            borderRadius: BorderRadius.circular(27)),
        focusedBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(color: Color.fromARGB(130, 173, 173, 173)),
            borderRadius: BorderRadius.circular(27))),
  );
}

Widget text1({required String s}) {
  return Text(
    s,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 27,
      color: maintextcolor,
    ),
    textAlign: TextAlign.start,
  );
}

Widget text2({required String s}) {
  return Text(
    s,
    style: const TextStyle(
        fontWeight: FontWeight.w400, fontSize: 17.3, color: greycolor,
    ),
  );
}
