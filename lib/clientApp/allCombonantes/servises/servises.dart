import 'package:flutter/material.dart';

import '../../constant/colours.dart';


Widget whatDoYouWant({
  required String serImage,
  required String serType,
  Function()? inkwellWork,
}) =>
    InkWell(
      onTap: inkwellWork,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                serImage,
                fit: BoxFit.fill,
                width: 50,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                serType,
                style: TextStyle(
                  color: subTitleColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
