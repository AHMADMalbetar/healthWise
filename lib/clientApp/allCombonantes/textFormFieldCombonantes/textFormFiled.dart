import 'package:flutter/material.dart';

Widget defTextFormField({
  IconData? pre,
  IconData? suf,
  required var Controller,
  required bool save,
  required String Label,
  Function()? sufWork,
  Function()? onFiledSubmet,
  Function()? validate,
  Function()? ttfTap,
  Color? defColor = Colors.teal,
}) =>
    SizedBox(
      height: 40,
      child: TextFormField(
        onTap: ttfTap,
        obscureText: save,
        controller: Controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          prefixIcon: Icon(
            pre,
            color: defColor,
          ),
          suffixIcon: IconButton(
            onPressed: sufWork,
            icon: Icon(suf, color: defColor),
          ),
          labelText: Label,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        onFieldSubmitted: (onFiledSubmet) {},
        validator: (validator){},
      ),
    );




Widget defTextFormFieldMultiLine({
  IconData? pre,
  IconData? suf,
  required var Controller,
  required bool save,
  required String Label,
  Function()? sufWork,
  Function()? onFiledSubmet,
  Function()? validate,
  Function()? ttfTap,
  Color? defColor = Colors.teal,
}) =>
    SizedBox(
      height: 100,
      child: TextFormField(
        maxLines: 10,
        minLines: 3,
        onTap: ttfTap,
        obscureText: save,
        controller: Controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          prefixIcon: Icon(
            pre,
            color: defColor,
          ),
          suffixIcon: IconButton(
            onPressed: sufWork,
            icon: Icon(suf, color: defColor),
          ),
          labelText: Label,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        onFieldSubmitted: (onFiledSubmet) {},
        validator: (validator){},
      ),
    );